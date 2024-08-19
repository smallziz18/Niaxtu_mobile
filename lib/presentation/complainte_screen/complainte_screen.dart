import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ComplainteScreen extends StatelessWidget {
  ComplainteScreen({super.key});

  TextEditingController edittextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLogo,
                    height: 147,
                    width: 171,
                    radius: BorderRadius.circular(71),
                  ),
                ),
                const SizedBox(height: 54),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Émission d’une Complainte",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 28,
                      fontFamily: 'Book Antiqua',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "Veuillez joindre la localisation et les fichiers",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 18,
                        fontFamily: 'Book Antiqua',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "GPS",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 18,
                      fontFamily: 'Book Antiqua',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0XFF29B6F6),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0X3F000000),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: SizedBox(
                          height: 27,
                          width: 31,
                          child: SvgPicture.asset(
                            "assets/images/img_vector.svg",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, right: 4, bottom: 1),
                        child: Text(
                          "localisation...",
                          style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                _buildDescriptionSection(context),
                const SizedBox(height: 11),
                _buildFileAttachmentSection(context),
                const SizedBox(height: 45),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 26),
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
                          vertical: 9,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.accueilScreen);
                      },
                      child: const Text(
                        "Enregistrer",
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
                const SizedBox(height: 18),
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 13,
                    child: AnimatedSmoothIndicator(
                      activeIndex: 4,
                      count: 4,
                      effect: ScrollingDotsEffect(
                        spacing: 10,
                        activeDotColor: Color(0XFF29B6F6),
                        dotColor: Color(0XFFD9D9D9),
                        activeDotScale: 1.3,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Description localisation",
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
            width: double.infinity,
            margin: const EdgeInsets.only(left: 14),
            child: TextFormField(
              controller: edittextController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0XFFFDFBFB),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileAttachmentSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 1),
            child: Text(
              "Fichier",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 9),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
            decoration: BoxDecoration(
              color: const Color(0XFFFDFBFB),
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Color(0X3F000000),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Text(
              "Joindre des fichiers......",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
