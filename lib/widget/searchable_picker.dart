// dart
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SearchMode { bottomSheet, popup, inline }

class SearchablePicker<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final VoidCallback? onClear;

  // optional customizations
  final ScrollPhysics? listPhysics;
  final double? popupHeight;
  final double? fontSize;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double? bottomSheetHeight;
  final double? inlineMaxHeight;
  final String hint;
  final String Function(T) itemAsString;
  final SearchMode mode;
  final bool searchable;
  final bool isOpenOptions;

  // optional trailing widget shown at the right side of the field.
  // Use either `trailing` for a static widget or `trailingBuilder` to build dynamically
  // based on context/value/expanded state. If both are provided, `trailingBuilder` wins.
  final Widget? trailing;
  final Widget Function(BuildContext context, T? value, bool expanded)?
  trailingBuilder;

  // optional callback to decide if to show custom field for the selected item
  final bool Function(T)? shouldShowCustomField;
  final ValueChanged<String>? onCustomTextChanged;
  final String? errorText;
  const SearchablePicker({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.onCustomTextChanged,
    this.onClear,
    this.listPhysics,
    this.popupHeight,
    this.bottomSheetHeight,
    this.inlineMaxHeight,
    this.leftPadding = 56,
    this.rightPadding = 56,
    this.topPadding = 8,
    this.bottomPadding = 0,
    this.fontSize = 16,
    required this.itemAsString,
    this.value,
    this.hint = 'Select',
    this.mode = SearchMode.inline,
    this.searchable = true,
    this.isOpenOptions = true,
    this.trailing,
    this.trailingBuilder,
    this.shouldShowCustomField,
    this.errorText,
  });

  @override
  State<SearchablePicker<T>> createState() => _SearchablePickerState<T>();
}

class _SearchablePickerState<T> extends State<SearchablePicker<T>>
    with WidgetsBindingObserver {
  bool _expanded = false;
  bool _overlayOpen = false; // true while dialog or bottom sheet is visible
  String _query = '';
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _inlineOverlay;
  bool _showCustomField = false;
  late final TextEditingController _customController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FocusManager.instance.addListener(_handleFocusChange);
    _controller = TextEditingController();
    _customController = TextEditingController();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.mode == SearchMode.inline) {
        Future.microtask(() {
          if (mounted) setState(() => _expanded = false);
        });
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    FocusManager.instance.removeListener(_handleFocusChange);
    _controller.dispose();
    _customController.dispose();
    _focusNode.dispose();
    _removeInlineOverlay();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // hide inline overlay if the app loses focus or is paused
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _removeInlineOverlay();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didUpdateWidget(covariant SearchablePicker<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && _showCustomField) {
      setState(() => _showCustomField = false);
    }
  }

  /// Public helper to tell whether the picker is currently showing search UI.
  bool isSearch() => _expanded || _overlayOpen;

  List<T> get _filtered {
    if (!widget.searchable) return widget.items;
    if (_query.isEmpty) return widget.items;
    return widget.items
        .where(
          (e) => widget
              .itemAsString(e)
              .toLowerCase()
              .contains(_query.toLowerCase()),
        )
        .toList();
  }

  void _openSearch(BuildContext context) async {
    if (widget.mode == SearchMode.inline) {
      // show overlay-based inline dropdown so outside taps close it
      if (_inlineOverlay != null) return; // already open
      _query = '';
      _controller.text = '';
      _showInlineOverlay();
      return;
    }

    if (widget.mode == SearchMode.popup) {
      setState(() => _overlayOpen = true);
      final result = await showDialog<T>(
        context: context,
        builder: (ctx) {
          String query = '';
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
            child: SizedBox(
              height: (widget.popupHeight ?? 340.h),
              child: Column(
                children: [
                  // show TextField only when searchable
                  if (widget.searchable)
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: StatefulBuilder(
                        builder: (c, setState) {
                          return TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'খুঁজুন...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              prefixIcon: const Icon(Icons.search),
                            ),
                            onChanged: (v) => setState(() => query = v),
                          );
                        },
                      ),
                    ),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (c, setState) {
                        final currentFiltered = widget.searchable
                            ? widget.items
                                  .where(
                                    (e) => widget
                                        .itemAsString(e)
                                        .toLowerCase()
                                        .contains(query.toLowerCase()),
                                  )
                                  .toList()
                            : widget.items;
                        return currentFiltered.isEmpty
                            ? Center(child: Text('কোনও ফলাফল নেই'))
                            : ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                physics: AlwaysScrollableScrollPhysics(
                                  parent:
                                      widget.listPhysics ??
                                      const BouncingScrollPhysics(),
                                ),
                                itemCount: currentFiltered.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 1),
                                itemBuilder: (_, idx) {
                                  final item = currentFiltered[idx];
                                  return ListTile(
                                    title: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(widget.itemAsString(item)),
                                    ),
                                    onTap: () {
                                      widget.onChanged(item);
                                      if (widget.shouldShowCustomField?.call(
                                            item,
                                          ) ??
                                          false) {
                                        setState(() => _showCustomField = true);
                                        _customController.clear();
                                      } else {
                                        setState(
                                          () => _showCustomField = false,
                                        );
                                      }
                                      Navigator.of(ctx).pop();
                                    },
                                  );
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      setState(() => _overlayOpen = false);
      if (result != null) widget.onChanged(result);
      return;
    }

    // bottomSheet
    setState(() => _overlayOpen = true);
    final result = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        String query = '';
        return StatefulBuilder(
          builder: (c, setState) {
            final filtered = widget.searchable
                ? widget.items
                      .where(
                        (e) => widget
                            .itemAsString(e)
                            .toLowerCase()
                            .contains(query.toLowerCase()),
                      )
                      .toList()
                : widget.items;
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: SizedBox(
                height: (widget.bottomSheetHeight ?? 420.h),
                child: Column(
                  children: [
                    if (widget.searchable)
                      Padding(
                        padding: EdgeInsets.all(12.r),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'খুঁজুন...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                          onChanged: (v) => setState(() => query = v),
                        ),
                      ),
                    Expanded(
                      child: filtered.isEmpty
                          ? Center(child: Text('কোনও ফলাফল নেই'))
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              physics: AlwaysScrollableScrollPhysics(
                                parent:
                                    widget.listPhysics ??
                                    const BouncingScrollPhysics(),
                              ),
                              itemCount: filtered.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 1),
                              itemBuilder: (_, idx) {
                                final item = filtered[idx];
                                return ListTile(
                                  title: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(widget.itemAsString(item)),
                                  ),
                                  onTap: () {
                                    widget.onChanged(item);
                                    if (widget.shouldShowCustomField?.call(
                                          item,
                                        ) ??
                                        false) {
                                      setState(() => _showCustomField = true);
                                      _customController.clear();
                                    } else {
                                      setState(() => _showCustomField = false);
                                    }
                                    Navigator.of(ctx).pop();
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    setState(() => _overlayOpen = false);
    if (result != null) widget.onChanged(result);
  }

  void _showInlineOverlay() {
    final fieldContext = _fieldKey.currentContext;
    if (fieldContext == null) return;
    final box = fieldContext.findRenderObject() as RenderBox;
    final topLeft = box.localToGlobal(Offset.zero);
    final width = box.size.width;

    _inlineOverlay = OverlayEntry(
      builder: (context) {
        // use a local StatefulBuilder so the overlay can rebuild as the user types
        return Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _removeInlineOverlay(),
            child: Stack(
              children: [
                Positioned(
                  left: topLeft.dx,
                  // place the overlay directly under the field (flush)
                  top: topLeft.dy + box.size.height,
                  width: width,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      // keep top padding 0 so the list sits flush under the field; the search field will insert its own spacing
                      padding: EdgeInsets.fromLTRB(8.r, 0, 8.r, 8.r),
                      constraints: BoxConstraints(
                        maxHeight: widget.inlineMaxHeight ?? 200.h,
                      ),
                      color: Colors.white,
                      child: StatefulBuilder(
                        builder: (ctx, setOverlayState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.searchable)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: TextField(
                                    controller: _controller,
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                      hintText: 'খুঁজুন...',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12.h,
                                        horizontal: 12.w,
                                      ),
                                    ),
                                    onChanged: (v) {
                                      // update local overlay state so the list rebuilds
                                      setOverlayState(() {});
                                    },
                                    autofocus: true,
                                  ),
                                ),
                              Expanded(
                                child: Builder(
                                  builder: (c) {
                                    final listSource = widget.searchable
                                        ? widget.items
                                              .where(
                                                (e) => widget
                                                    .itemAsString(e)
                                                    .toLowerCase()
                                                    .contains(
                                                      _controller.text
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .toList()
                                        : widget.items;
                                    if (listSource.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'কোনও ফলাফল নেই',
                                          style: TextStyle(
                                            color: const Color(0xFF6B6B6B),
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      );
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      physics: AlwaysScrollableScrollPhysics(
                                        parent:
                                            widget.listPhysics ??
                                            const BouncingScrollPhysics(),
                                      ),
                                      shrinkWrap: true,
                                      itemCount: listSource.length,
                                      separatorBuilder: (_, __) =>
                                          Divider(height: 1.h),
                                      itemBuilder: (_, idx) {
                                        final item = listSource[idx];
                                        return ListTile(
                                          title: Text(
                                            widget.itemAsString(item),
                                          ),
                                          onTap: () {
                                            widget.onChanged(item);
                                            if (widget.shouldShowCustomField
                                                    ?.call(item) ??
                                                false) {
                                              setState(
                                                () => _showCustomField = true,
                                              );
                                              _customController.clear();
                                            } else {
                                              setState(
                                                () => _showCustomField = false,
                                              );
                                            }
                                            _removeInlineOverlay();
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_inlineOverlay!);
    setState(() => _expanded = true);
    // give focus to the text field
    Future.delayed(Duration(milliseconds: 50), () => _focusNode.requestFocus());
  }

  void _removeInlineOverlay() {
    if (_inlineOverlay != null) {
      _inlineOverlay!.remove();
      _inlineOverlay = null;
    }
    _focusNode.unfocus();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _expanded = false;
            _query = '';
            try {
              _controller.clear();
            } catch (e) {}
          });
        }
      });
    }
  }

  void _handleFocusChange() {
    // if the app/window loses focus, primaryFocus becomes null — close overlay
    if (FocusManager.instance.primaryFocus == null) {
      _removeInlineOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hintStyle = TextStyle(color: const Color(0xFF6B6B6B), fontSize: 11);
    final valueStyle = TextStyle(
      fontSize: 15,
      color: Theme.of(context).primaryColor,
    );
    // resolve trailing widget: builder -> static trailing -> default behavior
    Widget resolveTrailing() {
      if (widget.trailingBuilder != null)
        return widget.trailingBuilder!(context, widget.value, _expanded);
      if (widget.trailing != null) return widget.trailing!;
      // default behavior: clear button when value exists, otherwise show inline arrow when in inline mode
      if (widget.value != null) {
        return Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: GestureDetector(
            onTap: () {
              if(!widget.isOpenOptions) return;
              try {
                widget.onClear?.call();
                widget.onChanged(null);
                _removeInlineOverlay();
                setState(() => _showCustomField = false);
              } catch (e) {
                print('Error in clearing selection: $e');
              }
            },
            child: Icon(Icons.close, size: 30.w, color: Colors.grey),
          ),
        );
      }
      if (widget.mode == SearchMode.inline) {
        return Icon(_expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down);
      }
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftPadding!,
        top: widget.topPadding!,
        right: widget.rightPadding!,
        bottom: widget.bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    GestureDetector(
                      key: _fieldKey,
                      onTap: widget.isOpenOptions ? () => _openSearch(context) : null,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.value == null
                                    ? widget.hint
                                    : widget.itemAsString(widget.value as T),
                                style: widget.value == null
                                    ? hintStyle
                                    : valueStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            resolveTrailing(),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: _showCustomField ? 8.h : 0),
                    if (_showCustomField)
                      TextField(
                        controller: _customController,
                        decoration: InputDecoration(
                          hintText: 'অন্যান্য উল্লেখ করুন',
                          hintStyle: AppTheme.listingHintStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: AppTheme.listingBorderColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: AppTheme.listingBorderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: AppTheme.listingButtonColor,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: (v) => widget.onCustomTextChanged?.call(v),
                      ),
                    SizedBox(height: _showCustomField ? 8.h : 0),
                    if (widget.errorText != null)
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          widget.errorText!,
                          style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Only render the inline-built dropdown when overlay is not used
          if (widget.mode == SearchMode.inline &&
              _expanded &&
              _inlineOverlay == null) ...[
            Container(
              // keep top padding 0 so the list sits flush under the field; search input adds its own spacing
              padding: EdgeInsets.fromLTRB(8.r, 0, 8.r, 8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFE0E0E0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  if (widget.searchable)
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'খুঁজুন...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 12.w,
                        ),
                      ),
                      onChanged: (v) => setState(() => _query = v),
                    ),
                  if (widget.searchable) SizedBox(height: 8.h),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: widget.inlineMaxHeight ?? 250.h,
                    ),
                    child:
                        (widget.searchable ? _filtered : widget.items).isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                              child: Text('কোনও ফলাফল নেই', style: hintStyle),
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            physics: AlwaysScrollableScrollPhysics(
                              parent:
                                  widget.listPhysics ??
                                  const BouncingScrollPhysics(),
                            ),
                            shrinkWrap: true,
                            itemCount:
                                (widget.searchable ? _filtered : widget.items)
                                    .length,
                            separatorBuilder: (_, __) => Divider(height: 1.h),
                            itemBuilder: (_, idx) {
                              final item = (widget.searchable
                                  ? _filtered
                                  : widget.items)[idx];
                              return ListTile(
                                title: Text(widget.itemAsString(item)),
                                onTap: () {
                                  widget.onChanged(item);
                                  if (widget.shouldShowCustomField?.call(
                                        item,
                                      ) ??
                                      false) {
                                    setState(() => _showCustomField = true);
                                    _customController.clear();
                                  } else {
                                    setState(() => _showCustomField = false);
                                  }
                                  setState(() {
                                    _expanded = false;
                                    _query = '';
                                    _controller.clear();
                                  });
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
