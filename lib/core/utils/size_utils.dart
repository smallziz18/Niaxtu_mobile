import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const num FIGMA_DESIGN_WIDTH = 375; // Largeur de conception Figma
// ignore: constant_identifier_names
const num FIGMA_DESIGN_HEIGHT = 812; // Hauteur de conception Figma
// ignore: constant_identifier_names
const num FIGMA_DESIGN_STATUS_BAR = 0; // Hauteur de la barre d'état (si applicable)

// Extension pour gérer les dimensions réactives en fonction de la conception Figma
extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  // Calcul de la largeur adaptée en fonction de la largeur de l'écran
  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);

  // Calcul de la hauteur adaptée en fonction de la hauteur de l'écran
  double get v =>
      ((this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));

  // Calcul de la taille adaptée en prenant la plus petite valeur entre largeur et hauteur
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  // Taille de police adaptée
  double get fSize => adaptSize;
}

// Extension pour le formatage des valeurs double
extension FormatExtension on double {
  // Conversion en double avec un nombre fixe de décimales
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  // Vérifie si la valeur est non nulle, sinon renvoie une valeur par défaut
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0.0 ? this : defaultValue.toDouble();
  }
}

// Enumération pour le type de périphérique (mobile ou tablette)
enum DeviceType { mobile, tablet }

// Définition d'un constructeur de widgets réactifs en fonction du contexte et de l'orientation
typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

// Widget pour gérer la taille réactive de l'écran
class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        // Mise à jour de la taille de l'écran et de l'orientation
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

// Classe utilitaire pour gérer les tailles d'écran et l'orientation
class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  // Méthode pour définir la taille de l'écran et l'orientation
  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      // Portrait : largeur et hauteur de l'écran
      width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_HEIGHT);
    } else {
      // Paysage : largeur et hauteur inversées
      width = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_HEIGHT);
    }

    // Définir le type de périphérique (mobile pour l'instant)
    deviceType = DeviceType.mobile; // Modifier si vous avez besoin de différencier mobile et tablette
  }
}
