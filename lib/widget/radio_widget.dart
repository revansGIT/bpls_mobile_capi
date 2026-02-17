import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:flutter/material.dart';

class DynamicRadioList<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onValueChanged;
  final String Function(T) labelBuilder;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double spacing;
  final double runSpacing;
  final double? maxItemWidth; // optional configurable max width per item
  final TextAlign textAlign; // configurable text alignment
  final bool Function(T)? isOthersItem;
  final ValueChanged<String>? onOthersTextChanged;
  final String? othersTextValue;
  final String? othersHint;
  final String? errorText;
  final TextEditingController? othersController;

  const DynamicRadioList({
    super.key,
    required this.items,
    required this.value,
    required this.onValueChanged,
    required this.labelBuilder,
    this.padding,
    this.textStyle,
    this.spacing = 8.0,
    this.runSpacing = 8.0, // sensible default for vertical spacing
    this.maxItemWidth = 200,
    this.textAlign = TextAlign.justify,
    this.isOthersItem,
    this.onOthersTextChanged,
    this.othersTextValue,
    this.othersHint,
    this.errorText,
    this.othersController,
  });

  @override
  State<DynamicRadioList<T>> createState() => _DynamicRadioListState<T>();
}

class _DynamicRadioListState<T> extends State<DynamicRadioList<T>> {

  @override
  void initState() {
    super.initState();
    // _othersController = TextEditingController(text: widget.othersTextValue ?? '');
  }

  @override
  void didUpdateWidget(DynamicRadioList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.othersTextValue != widget.othersTextValue) {
      widget.othersController!.text = widget.othersTextValue ?? '';
    }
  }


  @override
  Widget build(BuildContext context) {
    final baseStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
    // Find the others item from the list
    T? othersItem;
    if (widget.isOthersItem != null) {
      try {
        othersItem = widget.items.firstWhere((item) => widget.isOthersItem!(item));
      } catch (e) {
        othersItem = null;
      }
    } else {
      othersItem = null;
    }
    final isOthersSelected = othersItem != null && widget.value == othersItem;
    return RadioGroup<T>(
      groupValue: widget.value,
      onChanged: widget.onValueChanged,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            // Use a single-column vertical list (Column) of full-width rows so each radio is top-aligned
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) {
                final bool selected = item == widget.value;
                final itemStyle = baseStyle.copyWith(color: selected ? Theme.of(context).colorScheme.primary : baseStyle.color);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
                  child: InkWell(
                    onTap: () => widget.onValueChanged(item),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // fixed-width slot for the radio sized to match a single text line height
                        SizedBox(
                          width: 36,
                          child: Builder(builder: (context) {
                            final TextStyle effectiveStyle = widget.textStyle ?? DefaultTextStyle.of(context).style;
                            // measure one-line height using TextPainter to get an accurate first-line height
                            final tp = TextPainter(
                              text: TextSpan(text: 'A', style: effectiveStyle),
                              textDirection: Directionality.of(context),
                              maxLines: 1,
                            )..layout();
                            final double lineHeight = tp.height;
                            return SizedBox(
                              height: lineHeight,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Radio<T>(
                                  value: item,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: const VisualDensity(vertical: -1),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        // label takes remaining width and wraps naturally, starting at top-left
                        Expanded(
                          child: Text(widget.labelBuilder(item), style: itemStyle, textAlign: widget.textAlign, softWrap: true),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            if (isOthersSelected)
              Padding(
                padding: const EdgeInsets.only(left: 36.0, top: 5.0, bottom: 15.0),
                child: TextField(
                  controller: widget.othersController!,
                  onChanged: (value) {
                    widget.onOthersTextChanged?.call(value);
                  },
                  decoration: InputDecoration(
                    hintText: widget.othersHint,
                    hintStyle: poppinsStyle400Regular.copyWith(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ),
            if (widget.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.errorText!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
