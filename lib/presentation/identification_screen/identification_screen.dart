import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assure-toi d'avoir ce package dans pubspec.yaml
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageConstant {
  static const String imgLogo = 'assets/images/logo.png'; // Exemple de chemin
  static const String backIcon =
      'assets/icons/back_arrow.svg'; // Chemin vers l'icône SVG
}

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final BorderRadius radius;

  const CustomImageView({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class IdentificationScreen extends StatelessWidget {
  final TextEditingController firstnamesController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  IdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFCFC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/img_vector_1.svg",
                        height: 24,
                        width: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Retour à l'écran précédent
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.45,
                          radius: BorderRadius.circular(71),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    "Identification",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 26,
                      fontFamily: 'Book Antiqua',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Veuillez vous identifier\n",
                            style: TextStyle(
                              color: Color(0XFF817C7C),
                              fontSize: 18,
                              fontFamily: 'Book Antiqua',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Seul le pseudo sera visible",
                            style: TextStyle(
                              color: Color(0XFFEA4335),
                              fontSize: 18,
                              fontFamily: 'Book Antiqua',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextInputSection(
                  label: "Prénom(s)",
                  controller: firstnamesController,
                  isRequired: true,
                ),
                const SizedBox(height: 12),
                _buildTextInputSection(
                  label: "Nom",
                  controller: lastnameController,
                  isRequired: true,
                ),
                const SizedBox(height: 12),
                _buildTextInputSection(
                  label: "Pseudo",
                  controller: nicknameController,
                  isRequired: true,
                ),
                const SizedBox(height: 12),
                _buildTextInputSection(
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF29B6F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mot_de_passe_screen');
                      },
                      child: const Text(
                        "Suivant",
                        style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: SizedBox(
                    height: 13,
                    child: AnimatedSmoothIndicator(
                      activeIndex: 1,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        spacing: 9,
                        activeDotColor: Color(0XFF29B6F6),
                        dotColor: Color(0XFFD9D9D9),
                        activeDotScale: 1.3,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputSection({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 18,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (isRequired)
                  const TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: Color(0XFFEA4335),
                      fontSize: 18,
                      fontFamily: 'Book Antiqua',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 9),
          TextFormField(
            controller: controller,
            style: const TextStyle(
              color: Color(0XFF817C7C),
              fontSize: 16,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: label,
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
