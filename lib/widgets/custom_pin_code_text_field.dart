import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// `CustomPinCodeTextField` est un widget personnalisé basé sur `PinCodeTextField`
/// qui permet de saisir un code PIN à 4 chiffres avec des options de style et de validation.
/// Ce widget permet également d'aligner le champ de texte et de définir des actions sur
/// le changement de valeur.
///
/// [context] : Le contexte de l'application nécessaire pour le widget.
/// [onChanged] : Fonction appelée chaque fois que la valeur du champ de texte change.
/// [alignment] : Permet d'aligner le champ de texte selon l'alignement spécifié.
/// [controller] : Un contrôleur pour manipuler et accéder au texte du champ de saisie.
/// [textStyle] : Style appliqué au texte saisi.
/// [hintStyle] : Style appliqué au texte indicatif (placeholder) du champ.
/// [validator] : Fonction de validation pour valider la saisie de l'utilisateur.
class CustomPinCodeTextField extends StatelessWidget {
  /// Constructeur de la classe `CustomPinCodeTextField`.
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.hintStyle,
    this.textStyle,
    this.validator,
  });

  /// Aligne le champ de texte selon la valeur spécifiée.
  final Alignment? alignment;

  /// Contexte de l'application, nécessaire pour le `PinCodeTextField`.
  final BuildContext context;

  /// Contrôleur pour gérer le texte saisi dans le champ.
  final TextEditingController? controller;

  /// Style appliqué au texte saisi.
  final TextStyle? textStyle;

  /// Style appliqué au texte indicatif (placeholder) du champ.
  final TextStyle? hintStyle;

  /// Fonction appelée chaque fois que la valeur du champ de texte change.
  final void Function(String) onChanged;

  /// Fonction de validation pour vérifier la saisie de l'utilisateur.
  final FormFieldValidator<String>? validator;

  /// Construit le widget avec l'alignement spécifié si présent,
  /// sinon retourne le widget sans alignement.
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildPinCodeTextField())
        : _buildPinCodeTextField();
  }

  /// Construit le `PinCodeTextField` avec les propriétés définies.
  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 4,
      keyboardType: TextInputType.number,
      textStyle: textStyle,
      hintStyle: hintStyle,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      enableActiveFill: true,
      validator: validator,
      pinTheme: _buildPinTheme(),
    );
  }

  /// Définit le thème du champ de saisie PIN, incluant les couleurs,
  /// la forme des cases, et les bordures.
  PinTheme _buildPinTheme() {
    return PinTheme(
      fieldHeight: 52.h,
      fieldWidth: 52.h,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(6.h),
      inactiveFillColor: appTheme.gray300,
      activeFillColor: appTheme.gray300,
      inactiveColor: Colors.transparent,
      activeColor: Colors.transparent,
      selectedColor: Colors.transparent,
      selectedFillColor: appTheme.gray300,
    );
  }
}
