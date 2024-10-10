import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';

class ImageConstant {
  static const String imgLogo = 'assets/images/logo.png';
  static const String backIcon = 'assets/icons/back_arrow.svg';
}

class EtapeTwoScreen extends StatelessWidget {
  final TextEditingController pinController = TextEditingController();

  EtapeTwoScreen({super.key});

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
                  icon: SvgPicture.asset(
                    ImageConstant.backIcon,
                    color: const Color(0XFF29B6F6),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Retour à l'écran précédent
                  },
                ),
              ),
            ),
            // Contenu principal
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Center(
                      child: CustomImageView(
                        imagePath: ImageConstant.imgLogo,
                        height: 147,
                        width: 171,
                        radius: BorderRadius.circular(71),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Vérification du Code",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 26,
                        fontFamily: 'Book Antiqua',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 249,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        "Veuillez entrer le code à 4 chiffres que vous avez reçu par SMS.",
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
                    _buildPinCodeSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // Barre de progression et bouton Valider
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF29B6F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed: () {
                      // Logique de validation du code PIN ici
                      Navigator.pushNamed(context, '/forgot_password_screen');
                    },
                    child: const Text(
                      "Valider",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const LinearProgressIndicator(
                  color: Color(0XFF29B6F6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 11),
            child: Text(
              "Code PIN",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Container(
            width: 315,
            margin: const EdgeInsets.only(left: 10),
            child: TextFormField(
              controller: pinController,
              maxLength: 4, // Limite de 4 chiffres
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0XFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Entrer votre code PIN",
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
          ),
        ],
      ),
    );
  }
}
