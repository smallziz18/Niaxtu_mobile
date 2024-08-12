import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';
import 'base_button.dart';

/// `CustomElevatedButton` est un widget personnalisé qui étend la classe de base `BaseButton`.
/// Il permet de créer un bouton avec une apparence et un comportement personnalisés.
class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.decoration, // Décoration du conteneur autour du bouton.
    this.leftIcon, // Icône à gauche du texte du bouton.
    this.rightIcon, // Icône à droite du texte du bouton.
    super.margin, // Marge autour du bouton.
    super.onPressed, // Fonction appelée lorsque le bouton est pressé.
    super.buttonStyle, // Style du bouton.
    super.alignment, // Alignement du bouton dans son conteneur.
    super.buttonTextStyle, // Style du texte du bouton.
    super.isDisabled = null, // Indique si le bouton est désactivé.
    super.height, // Hauteur du bouton.
    super.width, // Largeur du bouton.
    required super.text, // Texte affiché sur le bouton.
  });

  final BoxDecoration? decoration; // Décoration du conteneur du bouton.
  final Widget? leftIcon; // Widget affiché à gauche du texte du bouton.
  final Widget? rightIcon; // Widget affiché à droite du texte du bouton.

  @override
  Widget build(BuildContext context) {
    // Si un alignement est spécifié, envelopper le bouton dans un Align.
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  /// Crée le widget `ElevatedButton` avec la décoration et les icônes définies.
  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 48.v,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(), // Icône à gauche.
              Text(
                text,
                style: buttonTextStyle ??
                    theme.textTheme.titleLarge, // Texte du bouton.
              ),
              rightIcon ?? const SizedBox.shrink(), // Icône à droite.
            ],
          ),
        ),
      );
}
