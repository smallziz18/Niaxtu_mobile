import 'package:flutter/material.dart';
import 'package:niaxtumobile/theme/custom_text_style.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.autofocus = false,
    this.textStyle,
    this.items,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderColor = Colors.black, // Couleur de bordure par défaut noire
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  });

  final Alignment? alignment;
  final double? width;
  final FocusNode? focusNode;
  final Widget? icon;
  final bool autofocus;
  final TextStyle? textStyle;
  final List<String>? items;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final Color borderColor; // Couleur de la bordure
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: dropDownWidget)
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: DropdownButtonFormField<String>(
          focusNode: focusNode,
          icon: icon,
          autofocus: autofocus,
          style: textStyle ?? CustomTextStyles.bodyLargeGray400,
          items: items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ?? CustomTextStyles.bodyLargeGray400,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: hintStyle ?? CustomTextStyles.bodyLargeGray400,
            prefixIcon: prefix,
            prefixIconConstraints: prefixConstraints,
            suffixIcon: suffix,
            suffixIconConstraints: suffixConstraints,
            isDense: true,
            contentPadding:
                contentPadding ?? const EdgeInsets.fromLTRB(13, 13, 13, 14),
            fillColor: fillColor ?? appTheme.gray50,
            filled: filled,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0), // Bordure rectangulaire
              borderSide: BorderSide(
                color: borderColor, // Couleur de la bordure
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0), // Bordure rectangulaire
              borderSide: BorderSide(
                color: borderColor, // Couleur de la bordure
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0), // Bordure rectangulaire
              borderSide: BorderSide(
                color: borderColor, // Couleur de la bordure
                width: 1.0,
              ),
            ),
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      );
}
