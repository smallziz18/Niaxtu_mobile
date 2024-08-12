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
  /// Constructeur de `CustomTextFormField` avec plusieurs paramètres facultatifs.
  ///
  /// [alignment] : Aligne le widget de champ de texte dans son conteneur parent.
  /// [width] : Largeur du widget de champ de texte.
  /// [scrollPadding] : Padding pour le défilement du champ.
  /// [controller] : Contrôleur pour gérer la saisie du texte.
  /// [focusNode] : Noeud de focus pour le champ de saisie.
  /// [autofocus] : Définit si le champ de saisie doit obtenir le focus automatiquement.
  /// [textStyle] : Style du texte affiché dans le champ de saisie.
  /// [obscureText] : Définit si le texte est masqué (utile pour les mots de passe).
  /// [textInputAction] : Action du clavier.
  /// [textInputType] : Type de clavier à utiliser (numérique, texte, etc.).
  /// [maxLines] : Nombre maximal de lignes pour le champ de saisie.
  /// [hintText] : Texte d'indice affiché lorsque le champ est vide.
  /// [hintStyle] : Style du texte d'indice.
  /// [prefix] : Widget affiché avant le texte dans le champ de saisie.
  /// [prefixConstraints] : Contraintes pour le widget préfixe.
  /// [suffix] : Widget affiché après le texte dans le champ de saisie.
  /// [suffixConstraints] : Contraintes pour le widget suffixe.
  /// [contentPadding] : Padding intérieur du champ de saisie.
  /// [borderDecoration] : Décoration pour les bordures du champ de saisie.
  /// [fillColor] : Couleur de fond du champ de saisie.
  /// [filled] : Indique si le champ de saisie doit être rempli.
  /// [validator] : Fonction de validation pour le champ de saisie.

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

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildTextFormField(context),
          )
        : _buildTextFormField(context);
  }

  /// Widget encapsulant le `TextFormField` avec les propriétés configurées.
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

  /// Renvoie la décoration de l'InputField avec les styles et configurations applicables.
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
        border: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.h),
                borderSide: BorderSide.none),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.h),
                borderSide: BorderSide.none),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.h),
                borderSide: BorderSide.none),
      );
}
