import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Extension sur `String` pour déterminer le type d'image en fonction du chemin.
extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network; // Image provenant d'une URL.
    } else if (endsWith('.svg')) {
      return ImageType.svg; // Image au format SVG.
    } else if (startsWith('file://') || File(this).existsSync()) {
      return ImageType.file; // Image locale.
    } else {
      return ImageType.png; // Image par défaut (PNG).
    }
  }
}

/// Enumération des types d'images possibles.
enum ImageType { svg, png, network, file, unknown }

class CustomImageView extends StatelessWidget {
  /// Constructeur de `CustomImageView` avec toutes les propriétés.
  const CustomImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    // Alignement de l'image si `alignment` est fourni, sinon affichage direct.
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: radius != null ? _buildCircleImage() : _buildImageWithBorder(),
      ),
    );
  }

  Widget _buildCircleImage() {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: _buildImageWithBorder(),
    );
  }

  Widget _buildImageWithBorder() {
    return Container(
      decoration: border != null
          ? BoxDecoration(border: border, borderRadius: radius)
          : null,
      child: _buildImageView(),
    );
  }

  Widget _buildImageView() {
    if (imagePath == null || imagePath!.isEmpty) {
      return _buildPlaceholderImage();
    }

    switch (imagePath!.imageType) {
      case ImageType.svg:
        return _buildSvgImage();
      case ImageType.file:
        return _buildFileImage();
      case ImageType.network:
        return _buildNetworkImage();
      case ImageType.png:
      default:
        return _buildAssetImage();
    }
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      imagePath!,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      color: color, // Utilisez 'color' pour appliquer un filtre de couleur
    );
  }

  Widget _buildFileImage() {
    return Image.file(
      File(imagePath!),
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: fit,
      imageUrl: imagePath!,
      color: color,
      placeholder: (context, url) => _buildLoadingIndicator(),
      errorWidget: (context, url, error) => _buildPlaceholderImage(),
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      imagePath!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(),
    );
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      placeHolder,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      height: 30,
      width: 30,
      child: CircularProgressIndicator(),
    );
  }
}
