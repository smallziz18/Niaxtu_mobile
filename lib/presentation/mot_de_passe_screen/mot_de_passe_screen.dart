import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtu/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MotDePasseScreen extends StatelessWidget {
  MotDePasseScreen({Key? key}) : super(key: key);

  final TextEditingController reenterPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFCFC),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 81),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 130),
                        child: SizedBox(
                          height: 40,
                          width: 30,
                          child: SvgPicture.asset(
                            "assets/images/img_vector_1.svg",
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgLogo,
                        height: 147,
                        width: 171,
                        radius: BorderRadius.circular(71),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 55),
              _buildPasswordCreationSection(),
              const SizedBox(height: 9),
              _buildConfirmPasswordSection(),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29B6F6),
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
                  activeIndex: 0,
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
            ],
          ),
        ),
      ),
    );
  }

  /// Password Creation Section Widget
  Widget _buildPasswordCreationSection() {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 17),
            child: Text(
              "Mot de passe",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 315,
            margin: const EdgeInsets.only(left: 9),
            child: TextFormField(
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
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFFDFBFB),
                isDense: true,
                contentPadding: const EdgeInsets.only(
                  left: 25,
                  top: 14,
                  bottom: 14,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.fromLTRB(30, 12, 18, 12),
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
          ),
        ],
      ),
    );
  }

  /// Confirm Password Section Widget
  Widget _buildConfirmPasswordSection() {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Confirmer le mot de passe",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 315,
            margin: const EdgeInsets.only(left: 9),
            child: TextFormField(
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
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFFDFBFB),
                isDense: true,
                contentPadding: const EdgeInsets.only(
                  left: 30,
                  top: 14,
                  bottom: 14,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.fromLTRB(25, 12, 18, 12),
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
          ),
        ],
      ),
    );
  }
}