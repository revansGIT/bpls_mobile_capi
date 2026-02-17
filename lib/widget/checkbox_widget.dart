import 'package:flutter/material.dart';

/// A compact, wrap-capable checkbox list that allows multiple selection.
///
/// Generic over `T`. Provide a `labelBuilder` to render each item.
/// - `items`: the list of items to show
/// - `selectedValues`: the currently selected items (Set)
/// - `onChanged`: called with a new Set when user toggles an item
/// - `maxItemWidth` / `textAlign` / `spacing` / `runSpacing` are provided for layout control
/// - `isOthersItem`: function to identify if an item is the "Others" item
/// - `onOthersTextChanged`: callback when the "Others" text field value changes
/// - `othersTextValue`: current value of the "Others" text field
class DynamicCheckboxList<T> extends StatefulWidget {
  final List<T> items;
  final Set<T> selectedValues;
  final ValueChanged<Set<T>> onChanged;
  final String Function(T) labelBuilder;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double spacing;
  final double runSpacing;
  final double? maxItemWidth;
  final TextAlign textAlign;
  final bool Function(T)? isOthersItem;
  final ValueChanged<String>? onOthersTextChanged;
  final String? othersTextValue;

  const DynamicCheckboxList({
    super.key,
    required this.items,
    required this.selectedValues,
    required this.onChanged,
    required this.labelBuilder,
    this.padding,
    this.textStyle,
    this.spacing = 0,
    this.runSpacing = -1.0,
    this.maxItemWidth = 200,
    this.textAlign = TextAlign.left,
    this.isOthersItem,
    this.onOthersTextChanged,
    this.othersTextValue,
  });

  @override
  State<DynamicCheckboxList<T>> createState() => _DynamicCheckboxListState<T>();
}

class _DynamicCheckboxListState<T> extends State<DynamicCheckboxList<T>> {
  late TextEditingController _othersController;

  @override
  void initState() {
    super.initState();
    _othersController = TextEditingController(text: widget.othersTextValue ?? '');
  }

  @override
  void didUpdateWidget(DynamicCheckboxList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.othersTextValue != widget.othersTextValue) {
      _othersController.text = widget.othersTextValue ?? '';
    }
  }

  @override
  void dispose() {
    _othersController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final baseStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    // Find the others item from the list
    final othersItem = widget.isOthersItem != null
        ? widget.items.firstWhere((item) => widget.isOthersItem!(item), orElse: () => null as dynamic)
        : null;
    final isOthersSelected = othersItem != null && widget.selectedValues.contains(othersItem);

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: widget.spacing,
              runSpacing: widget.runSpacing,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              // Ensure items within a run align to the top so single-line and
              // multi-line labels don't appear offset relative to each other.
              crossAxisAlignment: WrapCrossAlignment.start,
              children: widget.items.map((item) {
                final bool checked = widget.selectedValues.contains(item);
                final itemStyle = baseStyle.copyWith(
                  color: checked ? Theme.of(context).colorScheme.primary : baseStyle.color,
                );

                void emitToggle(bool? newValue) {
                  final next = Set<T>.from(widget.selectedValues);
                  if (newValue == true) {
                    next.add(item);
                  } else {
                    next.remove(item);
                    // Clear others text field if others item is deselected
                    if (widget.isOthersItem?.call(item) ?? false) {
                      _othersController.clear();
                      widget.onOthersTextChanged?.call('');
                    }
                  }
                  widget.onChanged(next);
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  child: InkWell(
                    onTap: () => emitToggle(!checked),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: checked,
                              onChanged: emitToggle,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: widget.maxItemWidth ?? 200),
                          child: Text(
                            widget.labelBuilder(item),
                            style: itemStyle,
                            textAlign: widget.textAlign,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Show text field only if Others item is selected
          if (isOthersSelected)
            Padding(
              padding: const EdgeInsets.only(left: 36.0, top: 5.0,bottom: 15.0),
              child: TextField(
                controller: _othersController,
                onChanged: (value) {
                  widget.onOthersTextChanged?.call(value);
                },
                decoration: InputDecoration(
                  hintText: 'Please specify',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
