import 'package:flutter/material.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // La flèche a été enlevée
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 147,
                      width: 171,
                      radius: BorderRadius.circular(71),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Modification de mot de passe",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 26,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Password",
                style: TextStyle(
                  color: Color(0XFF817C7C),
                  fontSize: 20,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 58),
              _buildPasswordSection(
                label: "Nouveau mot de passe",
                hintText: "Mot de passe",
                controller: currentPasswordController,
              ),
              const SizedBox(height: 9),
              _buildPasswordSection(
                label: "Confirmer le mot de passe",
                hintText: "Confirmer votre mot de passe",
                controller: confirmPasswordController,
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.initialRoute);
                  },
                  child: const Text(
                    "Modifier",
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
              // Removed the AnimatedSmoothIndicator
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordSection({
    required String label,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 315,
            child: TextFormField(
              autofocus: true,
              controller: controller,
              style: const TextStyle(
                color: Color(0XFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              obscureText: true,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0XFF817C7C),
                  fontSize: 16,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Color(0XFF29B6F6), // Change color to match your theme
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Color(0XFF29B6F6), // Change color to match your theme
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: const Color(0XFFFDFBFB),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
