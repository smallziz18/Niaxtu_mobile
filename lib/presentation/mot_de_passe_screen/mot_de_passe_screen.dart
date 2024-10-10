import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:niaxtumobile/routes/app_routes.dart';

class MotDePasseScreen extends StatefulWidget {
  const MotDePasseScreen({super.key});

  @override
  _MotDePasseScreenState createState() => _MotDePasseScreenState();
}

class _MotDePasseScreenState extends State<MotDePasseScreen> {
  final TextEditingController reenterPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFCFC),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                _buildHeader(context),
                const SizedBox(height: 16),
                const Text(
                  "Création de mot de passe",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 26,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                _buildProfileImagePicker(), // Section ajoutée pour la photo de profil
                const SizedBox(height: 24),
                _buildPasswordCreationSection(),
                const SizedBox(height: 12),
                _buildConfirmPasswordSection(),
                const SizedBox(height: 24),
                _buildCreateButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Créer un compte",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Widget pour le sélecteur d'image de profil avec texte indicatif cliquable
  Widget _buildProfileImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        children: [
          ClipOval(
            // Pour découper les débordements à l'intérieur de l'avatar
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null
                  ? const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickImage,
            child: Text(
              _profileImage == null ? "Cliquez ici pour ajouter une photo" : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                decoration: TextDecoration
                    .underline, // Ajout d'une décoration pour indiquer un lien
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCreationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mot de passe",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: reenterPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xFF817C7C),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xFF29B6F6),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmPasswordSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Confirmer le mot de passe",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirmer votre mot de passe",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xFF817C7C),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xFF29B6F6),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF29B6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.connexionScreen);
        },
        child: const Text(
          "Créer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
