import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/image_constant.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';
import 'package:niaxtumobile/widgets/custom_image_view.dart';

/// `CustomSearchView` est un widget de champ de recherche personnalisable.
/// Il fournit une interface utilisateur avec des options pour personnaliser l'apparence
/// et le comportement du champ de recherche, y compris les icônes préfixe et suffixe,
/// le style du texte, et la gestion des événements de saisie.
///
/// Les propriétés suivantes peuvent être configurées :
/// - [alignment] : Aligne le widget de recherche dans son conteneur parent.
/// - [width] : Largeur du widget de recherche.
/// - [scrollPadding] : Padding utilisé pour le défilement du champ.
/// - [controller] : Contrôleur pour gérer la saisie du texte.
/// - [focusNode] : Noeud de focus pour le champ de saisie.
/// - [autofocus] : Indique si le champ de saisie doit obtenir le focus au chargement.
/// - [textStyle] : Style du texte saisi.
/// - [textInputType] : Type de clavier pour le champ de saisie.
/// - [maxLines] : Nombre maximum de lignes pour le champ de saisie.
/// - [hintText] : Texte d'indice affiché lorsque le champ est vide.
/// - [hintStyle] : Style du texte d'indice.
/// - [prefix] : Widget affiché avant le texte dans le champ de saisie.
/// - [prefixConstraints] : Contraintes pour le widget préfixe.
/// - [suffix] : Widget affiché après le texte dans le champ de saisie.
/// - [suffixConstraints] : Contraintes pour le widget suffixe.
/// - [contentPadding] : Padding intérieur du champ de saisie.
/// - [borderDecoration] : Décoration pour les bordures du champ de saisie.
/// - [fillColor] : Couleur de fond du champ de saisie.
/// - [filled] : Indique si le champ de saisie doit être rempli.
/// - [validator] : Fonction de validation pour le champ de saisie.
/// - [onChanged] : Fonction appelée lorsque le texte dans le champ change.

class CustomSearchView extends StatelessWidget {
  /// Constructeur de `CustomSearchView`.
  ///
  /// [alignment] : Aligne le widget de recherche selon la valeur spécifiée.
  /// [width] : Largeur du widget de recherche. Utilise la largeur maximale si non spécifiée.
  /// [scrollPadding] : Padding pour le défilement du champ de saisie.
  /// [controller] : Contrôleur pour le champ de saisie.
  /// [focusNode] : Noeud de focus pour le champ de saisie.
  /// [autofocus] : Détermine si le champ de saisie doit être focalisé au chargement.
  /// [textStyle] : Style du texte affiché dans le champ de saisie.
  /// [textInputType] : Type de clavier à utiliser pour le champ de saisie.
  /// [maxLines] : Nombre maximal de lignes pour le champ de saisie.
  /// [hintText] : Texte d'indice à afficher lorsque le champ est vide.
  /// [hintStyle] : Style du texte d'indice.
  /// [prefix] : Widget à afficher avant le texte dans le champ de saisie.
  /// [prefixConstraints] : Contraintes pour le widget préfixe.
  /// [suffix] : Widget à afficher après le texte dans le champ de saisie.
  /// [suffixConstraints] : Contraintes pour le widget suffixe.
  /// [contentPadding] : Padding intérieur du champ de saisie.
  /// [borderDecoration] : Décoration pour les bordures du champ de saisie.
  /// [fillColor] : Couleur de fond du champ de saisie.
  /// [filled] : Indique si le champ de saisie doit être rempli.
  /// [validator] : Fonction de validation pour le champ de saisie.
  /// [onChanged] : Fonction appelée lorsque le texte dans le champ change.

  const CustomSearchView({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
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
    this.filled = true,
    this.validator,
    this.onChanged,
  });

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType textInputType;
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
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildSearchView(context),
          )
        : _buildSearchView(context);
  }

  Widget _buildSearchView(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        child: TextFormField(
          scrollPadding: scrollPadding ??
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            // Gère la perte de focus lorsque l'utilisateur touche en dehors du champ
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus,
          style: textStyle ?? theme.textTheme.bodyMedium,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: _buildDecoration(),
          validator: validator,
          onChanged: onChanged,
        ),
      );

  InputDecoration _buildDecoration() => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.h),
          child: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
        prefixIconConstraints:
            prefixConstraints ?? BoxConstraints(maxHeight: 35.v),
        suffix: suffix ??
            Container(
              margin: EdgeInsets.fromLTRB(30.h, 6.v, 18.h, 6.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgRewind,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
        suffixIconConstraints:
            suffixConstraints ?? BoxConstraints(maxHeight: 35.v),
        isDense: true,
        contentPadding:
            contentPadding ?? EdgeInsets.only(left: 9.h, top: 9.v, bottom: 9.v),
        fillColor: fillColor ?? appTheme.gray5002101,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.h),
              borderSide: BorderSide.none,
            ),
      );
}
