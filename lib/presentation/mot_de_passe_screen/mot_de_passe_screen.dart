import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MotDePasseScreen extends StatelessWidget {
  MotDePasseScreen({Key? key}) : super(key: key);

  final TextEditingController reenterPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFCFC),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          // Ajouté pour permettre le défilement
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
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
                            height: 147,
                            width: 171,
                            radius: BorderRadius.circular(71),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                const SizedBox(height: 8),
                const Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xFF817C7C),
                    fontSize: 20,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                _buildPasswordCreationSection(),
                const SizedBox(height: 12),
                _buildConfirmPasswordSection(),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF29B6F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.initialRoute);
                    },
                    child: const Text(
                      "Créer",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 13,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 1, // Ajuste selon la page active
                    count: 3,
                    effect: ScrollingDotsEffect(
                      spacing: 9,
                      activeDotColor: const Color(0xFF29B6F6),
                      dotColor: const Color(0xFFD9D9D9),
                      activeDotScale: 1.3,
                      dotHeight: 10,
                      dotWidth: 10,
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

  /// Password Creation Section Widget
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
            style: const TextStyle(
              color: Color(0xFF817C7C),
              fontSize: 16,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              hintStyle: const TextStyle(
                color: Color(0xFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
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
              filled: true,
              fillColor: const Color(0xFFFDFBFB),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/img_group_8.svg",
                  height: 24,
                  width: 27,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Confirm Password Section Widget
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
            style: const TextStyle(
              color: Color(0xFF817C7C),
              fontSize: 16,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirmer votre mot de passe",
              hintStyle: const TextStyle(
                color: Color(0xFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
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
              filled: true,
              fillColor: const Color(0xFFFDFBFB),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/img_group_8.svg",
                  height: 24,
                  width: 27,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
