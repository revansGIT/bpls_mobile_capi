import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget get backButton => IconButton(
  onPressed: () => Get.back(),
  icon: Icon(Icons.arrow_circle_left_outlined, size: 26, color: AppTheme.listingButtonColor),
);

Widget buildTypeButton({required String label, required VoidCallback onTap, bool isSelect = false}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 82.h,
        decoration: BoxDecoration(
          color: isSelect ? AppTheme.listingButtonColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppTheme.listingButtonColor, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(label, style: natoSansStyle600SemiBold.copyWith(fontSize: 14, color: isSelect ? Colors.white : AppTheme.listingButtonColor)),
      ),
    ),
  );
}

class BuildInputFieldWidget extends StatefulWidget {
  const BuildInputFieldWidget(
    this.label,
    this.ctr, {
    super.key,
    this.isNumber = false,
    this.isNumberAndShowFraction = false,
    this.maxLines = 1,
    this.isEnable = true,
    this.hint,
    this.currentFocus,
    this.maximumAge = -1,
    this.nextFocus,
    this.onChanged,
    this.onFieldSubmitted,
    this.isShowColumnData = true,
    this.leftExpandedValue = 1,
    this.rightExpandedValue = 3,
    this.maxLength,
    this.externalErrorText,
    this.isMandatory = false,
    this.mandatoryMessage,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController ctr;
  final bool isNumber;
  final bool isNumberAndShowFraction;
  final int maxLines;
  final int maximumAge;
  final bool isEnable;
  final String? hint;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isShowColumnData;
  final int leftExpandedValue;
  final int rightExpandedValue;
  final int? maxLength;

  // External error text (if provided, it will be shown instead of internal validation error)
  final String? externalErrorText;
  final bool isMandatory;
  final String? mandatoryMessage;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<BuildInputFieldWidget> createState() => _buildInputField1State();
}

class _buildInputField1State extends State<BuildInputFieldWidget> {
  final List<TextInputFormatter> formatters = [];

  // Keep last valid text so we can revert if user enters a value > maximumAge
  String lastValidText = '';
  String? errorText;

  void updateFormatters() {
    formatters.clear();
    if (widget.isNumber) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (widget.isNumberAndShowFraction) {
      formatters.add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')));
    }
    if (widget.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }
    // Add custom input formatters if provided
    if (widget.inputFormatters != null) {
      formatters.addAll(widget.inputFormatters!);
    }
  }

  void _controllerListener() {
    final maxLen = widget.maxLength;

    final value = widget.ctr.value;
    // If composing (IME in-progress), don't truncate or validate to avoid breaking composition
    if (value.composing.isValid) return;

    var text = value.text;

    // Enforce maxLength if provided (respecting characters, not bytes)
    if (maxLen != null) {
      final chars = text.characters;
      if (chars.length > maxLen) {
        final truncated = chars.take(maxLen).toString();
        final baseOffset = truncated.length;
        widget.ctr.value = TextEditingValue(
          text: truncated,
          selection: TextSelection.collapsed(offset: baseOffset),
        );
        // update local text variable to the truncated value for subsequent validation
        text = truncated;
      }
    }

    // Age validation: if maximumAge is set (not -1) and field is numeric, validate entered value.
    if (widget.maximumAge != -1 && widget.isNumber) {
      if (text.isEmpty) {
        // empty is allowed; reset state
        if (errorText != null) setState(() => errorText = null);
        lastValidText = '';
        return;
      }

      final int? parsed = int.tryParse(text);
      if (parsed == null) {
        // not a valid integer (shouldn't normally happen due to digitsOnly formatter)
        setState(() => errorText = 'অবৈধ সংখ্যা'); // 'Invalid number' in Bangla
        return;
      }

      if (parsed > widget.maximumAge) {
        // revert to last valid text (if any) and show an error
        final revert = lastValidText;
        widget.ctr.value = TextEditingValue(
          text: revert,
          selection: TextSelection.collapsed(offset: revert.length),
        );
        setState(() => errorText = 'বয়স ${widget.maximumAge} থেকে বড় হতে পারবে না');
        return;
      }

      // valid number within range
      lastValidText = text;
      if (errorText != null) setState(() => errorText = null);
    }
  }

  @override
  void initState() {
    super.initState();
    updateFormatters();
    // initialize lastValidText from controller's current value
    lastValidText = widget.ctr.text;
    widget.ctr.addListener(_controllerListener);
  }

  @override
  void didUpdateWidget(covariant BuildInputFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If relevant properties changed, rebuild formatters and re-check text
    if (oldWidget.isNumber != widget.isNumber || oldWidget.isNumberAndShowFraction != widget.isNumberAndShowFraction || oldWidget.maxLength != widget.maxLength) {
      updateFormatters();
    }
    // If controller instance changed, remove listener from old and attach to new
    if (oldWidget.ctr != widget.ctr) {
      oldWidget.ctr.removeListener(_controllerListener);
      // update lastValidText for the new controller
      lastValidText = widget.ctr.text;
      widget.ctr.addListener(_controllerListener);
    }
  }

  @override
  void dispose() {
    widget.ctr.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: widget.isShowColumnData
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 12)),
                SizedBox(height: 8.h),
                // Prefer externally-provided error text if available, otherwise use internal validation message
                InputFieldWidget(
                  label: widget.label,
                  ctr: widget.ctr,
                  isNumber: widget.isNumber,
                  isNumberAndShowFraction: widget.isNumberAndShowFraction,
                  maxLines: widget.maxLines,
                  maximumAge: widget.maximumAge,
                  hint: widget.hint,
                  currentFocus: widget.currentFocus,
                  nextFocus: widget.nextFocus,
                  onFieldSubmitted: (value) {
                    widget.onFieldSubmitted?.call(value);
                    if (widget.externalErrorText == null && widget.isMandatory) {
                      if (value.trim().isEmpty) {
                        setState(() => errorText = widget.mandatoryMessage ?? 'এই ফিল্ডটি প্রয়োজন');
                      } else {
                        setState(() => errorText = null);
                      }
                    }
                  },
                  onChanged: (value) {
                    widget.onChanged?.call(value);
                    if (widget.externalErrorText == null && widget.isMandatory) {
                      if (value.trim().isEmpty) {
                        setState(() => errorText = 'এই ফিল্ডটি প্রয়োজন');
                      } else {
                        setState(() => errorText = null);
                      }
                    }
                  },
                  maxLength: widget.maxLength,
                  errorText: (widget.externalErrorText != null && widget.ctr.text.trim().isEmpty) ? widget.externalErrorText : errorText,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: widget.leftExpandedValue,
                  child: Text(widget.label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 12)),
                ),
                SizedBox(width: 20.h),
                Expanded(
                  flex: widget.rightExpandedValue,
                  child: InputFieldWidget(
                    label: widget.label,
                    ctr: widget.ctr,
                    isNumber: widget.isNumber,
                    isNumberAndShowFraction: widget.isNumberAndShowFraction,
                    maxLines: widget.maxLines,
                    hint: widget.hint,
                    currentFocus: widget.currentFocus,
                    nextFocus: widget.nextFocus,
                    onFieldSubmitted: (value) {
                      widget.onFieldSubmitted?.call(value);
                      if (widget.externalErrorText == null && widget.isMandatory) {
                        if (value.trim().isEmpty) {
                          setState(() => errorText = widget.mandatoryMessage ?? 'এই ফিল্ডটি প্রয়োজন');
                        } else {
                          setState(() => errorText = null);
                        }
                      }
                    },
                    onChanged: (value) {
                      widget.onChanged?.call(value);
                      if (widget.externalErrorText == null && widget.isMandatory) {
                        if (value.trim().isEmpty) {
                          setState(() => errorText = widget.mandatoryMessage ?? 'এই ফিল্ডটি প্রয়োজন');
                        } else {
                          setState(() => errorText = null);
                        }
                      }
                    },
                    maxLength: widget.maxLength,
                    maximumAge: widget.maximumAge,
                    isEnable: widget.isEnable,
                    // Prefer external error text when provided
                    errorText: (widget.externalErrorText != null && widget.ctr.text.trim().isEmpty) ? widget.externalErrorText : errorText,
                  ),
                ),
              ],
            ),
    );
  }
}

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({
    super.key,
    required this.label,
    required this.ctr,
    this.isNumber = false,
    this.isNumberAndShowFraction = false,
    this.maximumAge = -1,
    this.isEnable = true,
    this.maxLength,
    this.maxLines = 1,
    this.hint,
    this.currentFocus,
    this.nextFocus,
    this.onChanged,
    this.onFieldSubmitted,
    this.errorText,
    this.isShowSuffix = false,
    this.suffixIcon,
    this.onSuffixTap,
  });

  final String label;
  final TextEditingController ctr;
  final bool isNumber;
  final bool isNumberAndShowFraction;
  final int maximumAge;
  final bool isEnable;
  final int? maxLength;
  final int maxLines;
  final String? hint;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? errorText;
  final bool isShowSuffix;
  final IconData? suffixIcon;
  final GestureTapCallback? onSuffixTap;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  final List<TextInputFormatter> formatters = [];

  @override
  void initState() {
    super.initState();
    updateFormatters();
  }

  void updateFormatters() {
    formatters.clear();
    if (widget.isNumber) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (widget.isNumberAndShowFraction) {
      formatters.add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')));
    }
    if (widget.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }
  }

  @override
  void didUpdateWidget(covariant InputFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isNumber != widget.isNumber || oldWidget.isNumberAndShowFraction != widget.isNumberAndShowFraction || oldWidget.maxLength != widget.maxLength) {
      updateFormatters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ctr,
      maxLines: widget.maxLines,
      keyboardType: widget.isNumberAndShowFraction ? TextInputType.numberWithOptions(decimal: true) : widget.isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: formatters,
      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 16),
      focusNode: widget.currentFocus,
      onChanged: widget.onChanged,
      onFieldSubmitted: (String value) {
        if (widget.nextFocus != null) {
          FocusScope.of(Get.context!).requestFocus(widget.nextFocus);
        } else {
          widget.currentFocus?.unfocus();
        }
        widget.onFieldSubmitted?.call(value);
        // print('value onFieldSubmitted 1: $value');
        // if (widget.errorText == null && value.trim().isEmpty) {
        //   print('value onFieldSubmitted 2: $value');
        //   // Do nothing, errorText will be shown
        // } else {
        //   print('value onFieldSubmitted 3: $value');
        //   // errorText = null; // Cannot modify parameter
        // }
      },
      textInputAction: widget.nextFocus != null ? TextInputAction.next : TextInputAction.done,
      enabled: widget.isEnable,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLength != null ? MaxLengthEnforcement.enforced : null,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTheme.listingHintStyle,
        labelStyle: AppTheme.listingLabelStyle,
        suffix: widget.isShowSuffix == true
            ? GestureDetector(
                onTap: widget.onSuffixTap,
                child: Icon(widget.suffixIcon, size: 20, color: Colors.black),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppTheme.listingBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppTheme.listingBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppTheme.listingButtonColor, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        errorText: widget.errorText,
        errorMaxLines: widget.errorText == null ? null : (widget.errorText!.split('\n').length + 3),
      ),
    );
  }
}

Widget buildReadOnlyField(String label, String value, {bool isColumn = true}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: isColumn
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 12)),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F0F4),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppTheme.listingBorderColor),
                ),
                child: Text(
                  value,
                  style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 13, color: AppTheme.listingLabelColor.withOpacity(0.7)),
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 12))),
              SizedBox(width: 8.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F0F4),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppTheme.listingBorderColor),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 13, color: AppTheme.listingLabelColor.withOpacity(0.7)),
                  ),
                ),
              ),
            ],
          ),
  );
}

Widget buildNextButton(Function onPressed, {String title = "পরবর্তী ধাপ", Color btnColor = AppTheme.listingButtonColor, Color textColor = Colors.white}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: btnColor,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 12, color: textColor, fontWeight: FontWeight.w600),
    ),
  );
}

Widget customRadioButton(bool isSelected, String label, GestureTapCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          height: 28.r,
          width: 28.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.listingButtonColor, width: 2.w),
          ),
          child: Center(
            child: isSelected
                ? Container(
                    height: 14.r,
                    width: 14.r,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppTheme.listingButtonColor),
                  )
                : null,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          label,
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 18.sp, color: const Color(0xFF1D1B20), fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget labelText(String label, {bool isMandatory = false}) {
  if (isMandatory) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTheme.listingLabelStyle.copyWith(fontSize: 12),
        children: [
          TextSpan(
            text: ' *',
            style: AppTheme.listingLabelStyle.copyWith(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
  } else {
    return Text(label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 12));
  }
}
