import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFCFC),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 84),
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
              SizedBox(height: 12),
              Text(
                "Modification de mot de passe",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 26,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Password",
                style: TextStyle(
                  color: Color(0XFF817C7C),
                  fontSize: 20,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 58),
              _buildPasswordSection(
                label: "Nouveau mot de passe",
                hintText: "Mot de passe",
                controller: currentPasswordController,
              ),
              SizedBox(height: 9),
              _buildPasswordSection(
                label: "Confirmer le mot de passe",
                hintText: "Confirmer votre mot de passe",
                controller: confirmPasswordController,
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: EdgeInsets.symmetric(horizontal: 23),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.initialRoute);
                  },
                  child: Text(
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
              SizedBox(height: 15),
              SizedBox(
                height: 13,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 2,
                  effect: ScrollingDotsEffect(
                    activeDotColor: Color(0XFF29B6F6),
                    dotHeight: 13,
                    dotWidth: 13,
                  ),
                ),
              ),
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
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 315,
            child: TextFormField(
              autofocus: true,
              controller: controller,
              style: TextStyle(
                color: Color(0XFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              obscureText: true,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
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
                filled: true,
                fillColor: Color(0XFFFDFBFB),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
