import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/custom_text_style.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

/// `CustomDropDown` est un widget réutilisable pour créer des listes déroulantes personnalisées.
/// Il permet de configurer l'apparence et le comportement des listes déroulantes dans votre application.
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
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged, required BoxDecoration decoration,
  });

  final Alignment? alignment; // Alignement du widget dans son parent.
  final double? width; // Largeur du widget.
  final FocusNode? focusNode; // Gère le focus du widget.
  final Widget? icon; // Icône personnalisée pour la liste déroulante.
  final bool
      autofocus; // Si `true`, la liste déroulante est automatiquement focalisée.
  final TextStyle? textStyle; // Style du texte sélectionné.
  final List<String>?
      items; // Liste des éléments à afficher dans la liste déroulante.
  final String?
      hintText; // Texte indicatif à afficher lorsque rien n'est sélectionné.
  final TextStyle? hintStyle; // Style du texte indicatif.
  final Widget? prefix; // Icône ou widget à afficher avant le texte.
  final BoxConstraints?
      prefixConstraints; // Contraintes pour le widget `prefix`.
  final Widget? suffix; // Icône ou widget à afficher après le texte.
  final BoxConstraints?
      suffixConstraints; // Contraintes pour le widget `suffix`.
  final EdgeInsets? contentPadding; // Espacement interne du contenu.
  final InputBorder? borderDecoration; // Décoration de la bordure.
  final Color? fillColor; // Couleur de fond du champ.
  final bool filled; // Si `true`, le champ est rempli de couleur de fond.
  final FormFieldValidator<String>? validator; // Fonction de validation.
  final ValueChanged<String?>?
      onChanged; // Callback appelé lors d'une modification de sélection.

  @override
  Widget build(BuildContext context) {
    // Si un alignement est défini, envelopper le widget dans un Align.
    return alignment != null
        ? Align(alignment: alignment!, child: dropDownWidget)
        : dropDownWidget;
  }

  /// Crée le widget `DropdownButtonFormField` avec les propriétés définies.
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
          decoration: decoration,
          validator: validator,
          onChanged: onChanged,
        ),
      );

  /// Définit la décoration du champ de la liste déroulante.
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: textStyle ?? CustomTextStyles.bodyLargeGray400,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding:
            contentPadding ?? EdgeInsets.fromLTRB(13.h, 13.v, 13.h, 14.v),
        fillColor: fillColor ?? appTheme.gray50,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide.none,
            ),
      );
}
