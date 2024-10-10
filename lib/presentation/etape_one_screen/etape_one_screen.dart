import 'package:flutter/material.dart';

class ImageConstant {
  static const String imgLogo = 'assets/images/logo.png';
  static const String backIcon = 'assets/icons/back_arrow.svg';
}

class EtapeOneScreen extends StatelessWidget {
  const EtapeOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFCFC),
        body: Column(
          children: [
            // Bouton de retour
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0XFF29B6F6),
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Retour à l'écran précédent
                  },
                ),
              ),
            ),
            // Logo circulaire au centre
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ClipOval(
                  child: Image.asset(
                    ImageConstant.imgLogo,
                    height: 147,
                    width: 147,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Contenu principal
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      "Réinitialiser le mot de passe",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 26,
                        fontFamily: 'Book Antiqua',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Entrez votre numéro de téléphone pour recevoir un code de vérification.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF817C7C),
                          fontSize: 18,
                          fontFamily: 'Book Antiqua',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildPhoneNumberField(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Bouton Suivant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {
                    // Navigue vers l'écran suivant
                    Navigator.pushNamed(context, '/etape_two_screen');
                  },
                  child: const Text(
                    "Suivant",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "Numéro de Téléphone",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Numéro de téléphone",
              hintStyle: const TextStyle(
                color: Color(0XFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0XFF817C7C),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0XFF29B6F6),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0XFFFDFBFB),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
