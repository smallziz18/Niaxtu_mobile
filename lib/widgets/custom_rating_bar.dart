import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

/// `CustomRatingBar` est un widget personnalisable pour afficher une barre de notation
/// avec des étoiles. Il permet à l'utilisateur de sélectionner une note et offre des
/// options pour personnaliser l'apparence et le comportement du widget.
///
/// Les propriétés suivantes peuvent être configurées :
/// - [alignment] : Détermine l'alignement du widget dans son conteneur parent.
/// - [ignoreGestures] : Indique si les interactions de l'utilisateur doivent être ignorées.
/// - [initialRating] : Note initiale affichée lorsque le widget est chargé.
/// - [itemSize] : Taille des icônes d'étoile.
/// - [itemCount] : Nombre total d'étoiles affichées dans la barre.
/// - [color] : Couleur des étoiles sélectionnées.
/// - [unselectedColor] : Couleur des étoiles non sélectionnées. Non utilisé dans cette version.
/// - [onRatingUpdate] : Fonction appelée chaque fois que la note est modifiée par l'utilisateur.

class CustomRatingBar extends StatelessWidget {
  /// Constructeur de `CustomRatingBar`.
  ///
  /// [alignment] : Aligne le widget de la barre de notation selon la valeur spécifiée.
  /// [ignoreGestures] : Permet de désactiver les interactions utilisateur avec la barre.
  /// [initialRating] : Note initiale à afficher au chargement du widget.
  /// [itemSize] : Taille des étoiles en pixels.
  /// [itemCount] : Nombre total d'étoiles à afficher.
  /// [color] : Couleur des étoiles sélectionnées.
  /// [unselectedColor] : Couleur des étoiles non sélectionnées (non utilisée ici).
  /// [onRatingUpdate] : Fonction appelée à chaque mise à jour de la note.
  const CustomRatingBar({
    super.key,
    this.alignment,
    this.ignoreGestures = false,
    this.initialRating = 0.0,
    this.itemSize,
    this.itemCount = 5,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate,
  });

  final Alignment? alignment;
  final bool ignoreGestures;
  final double initialRating;
  final double? itemSize;
  final int itemCount;
  final Color? color;
  final Color? unselectedColor;
  final ValueChanged<double>? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildRatingBar(),
          )
        : _buildRatingBar();
  }

  Widget _buildRatingBar() {
    return RatingBar.builder(
      ignoreGestures: ignoreGestures,
      initialRating: initialRating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: itemSize ?? 24.0, // Taille par défaut si non spécifiée
      itemCount: itemCount,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: color ?? appTheme.greenA400,
      ),
      onRatingUpdate: onRatingUpdate ?? (rating) {},
    );
  }
}
