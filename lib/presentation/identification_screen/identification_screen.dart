import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Supposons que CustomImageView et ImageConstant sont définis quelque part dans votre projet.
class ImageConstant {
  static const String imgLogo = 'assets/images/logo.png'; // Exemple de chemin
}

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final BorderRadius radius;

  const CustomImageView({
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

  IdentificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFCFC),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 8),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 147,
                width: 171,
                radius: BorderRadius.circular(71),
              ),
              const SizedBox(height: 8),
              const Text(
                "Identification",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 26,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 11),
              SizedBox(
                width: 210,
                child: RichText(
                  text: TextSpan(
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
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 17),
              _buildTextInputSection(
                label: "Prénom(s)",
                controller: firstnamesController,
                isRequired: true,
              ),
              const SizedBox(height: 5),
              _buildTextInputSection(
                label: "Nom",
                controller: lastnameController,
                isRequired: true,
              ),
              const SizedBox(height: 5),
              _buildTextInputSection(
                label: "Pseudo",
                controller: nicknameController,
                isRequired: true,
              ),
              const SizedBox(height: 5),
              _buildTextInputSection(
                label: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 36),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '/motDePasseScreen'); // Modifiez selon vos routes
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
              const SizedBox(height: 15),
              const SizedBox(
                height: 13,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
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
              )
            ],
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
      margin: const EdgeInsets.symmetric(horizontal: 9),
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
                  )
              ],
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 9),
          Container(
            width: 315,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
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
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
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
          )
        ],
      ),
    );
  }
}
