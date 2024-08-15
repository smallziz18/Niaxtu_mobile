import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/custom_text_style.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

/// Extension pour faciliter l'accès aux styles de `OutlineInputBorder`.
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePrimaryTL6 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.h), borderSide: BorderSide.none);

  static OutlineInputBorder get outlinePrimaryTL23 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(23.h), borderSide: BorderSide.none);
}

/// Widget personnalisé pour les champs de formulaire.
/// Ce widget permet de créer des champs de texte avec des options de
/// style, d'agencement et de validation facilement configurables.
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction,
    this.textInputType,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator,
    this.borderType, required InputDecoration decoration, // Ajout du paramètre pour la bordure
  });

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final OutlineInputBorder?
      borderType; // Paramètre pour choisir le type de bordure

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildTextFormField(context),
          )
        : _buildTextFormField(context);
  }

  Widget _buildTextFormField(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        child: TextFormField(
          scrollPadding: scrollPadding ??
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus,
          style: textStyle ?? CustomTextStyles.bodyLargeGray60001,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: _buildDecoration(),
          validator: validator,
        ),
      );

  InputDecoration _buildDecoration() => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeGray400,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(14.h),
        fillColor: fillColor ?? appTheme.gray50,
        filled: filled ?? true,
        border: borderType ??
            borderDecoration ?? // Utilisation de la bordure sélectionnée
            TextFormFieldStyleHelper.outlinePrimaryTL6,
        enabledBorder: borderType ??
            borderDecoration ??
            TextFormFieldStyleHelper.outlinePrimaryTL6,
        focusedBorder: borderType ??
            borderDecoration ??
            TextFormFieldStyleHelper.outlinePrimaryTL6,
      );
}
