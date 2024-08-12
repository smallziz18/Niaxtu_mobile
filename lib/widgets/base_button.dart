import 'package:flutter/material.dart';

/// `BaseButton` est un widget personnalisable pour les boutons dans votre application.
/// Ce widget permet de créer des boutons avec différentes options de style,
/// de texte, d'alignement, et de gestion d'état (activé/désactivé).
class BaseButton extends StatelessWidget {
  /// Constructeur du `BaseButton` avec des paramètres personnalisables.
  /// - [text] : Le texte affiché sur le bouton.
  /// - [onPressed] : La fonction callback appelée lorsque le bouton est pressé.
  /// - [buttonStyle] : Le style du bouton (couleur, forme, etc.).
  /// - [buttonTextStyle] : Le style du texte du bouton.
  /// - [isDisabled] : Si `true`, désactive le bouton.
  /// - [height] : La hauteur du bouton.
  /// - [width] : La largeur du bouton.
  /// - [margin] : Les marges autour du bouton.
  /// - [alignment] : L'alignement du bouton dans son parent.
  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled = false, // Défaut à false pour que le bouton soit activé.
    this.height,
    this.width,
    this.margin,
    this.alignment,
  });

  final String text; // Le texte affiché sur le bouton.
  final VoidCallback?
      onPressed; // Fonction appelée lors de l'appui sur le bouton.
  final ButtonStyle? buttonStyle; // Le style du bouton.
  final TextStyle? buttonTextStyle; // Le style du texte du bouton.
  final bool? isDisabled; // Si vrai, le bouton est désactivé.
  final double? height; // Hauteur du bouton.
  final double? width; // Largeur du bouton.
  final EdgeInsets? margin; // Marges autour du bouton.
  final Alignment? alignment; // Alignement du bouton dans son parent.

  @override
  Widget build(BuildContext context) {
    // Si l'alignement est défini, enveloppe le bouton avec Align.
    Widget button = alignment != null
        ? Align(
            alignment: alignment!,
            child: buildButton(context),
          )
        : buildButton(context);

    // Si les marges sont définies, enveloppe le bouton avec Padding.
    return margin != null ? Padding(padding: margin!, child: button) : button;
  }

  /// Crée le widget bouton avec les propriétés configurées.
  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: height, // Hauteur du bouton.
      width: width, // Largeur du bouton.
      child: ElevatedButton(
        onPressed: isDisabled!
            ? null
            : onPressed, // Désactive le bouton si isDisabled est true.
        style: buttonStyle,
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
