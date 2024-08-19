import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/presentation/typologie_screen/typologie_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExposeComplainteScreen extends StatelessWidget {
  ExposeComplainteScreen({super.key});

  final TextEditingController _exposeController = TextEditingController();
  final TextEditingController _suiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 32),
              _buildBackArrow(),
              const SizedBox(height: 20),
              _buildTitle(),
              const SizedBox(height: 19),
              _buildExposeField(),
              const SizedBox(height: 14),
              _buildSuiteField(),
              const SizedBox(height: 14),
              _buildVoiceRecordSection(),
              const SizedBox(height: 51),
              _buildNextButton(context),
              const SizedBox(height: 5),
              _buildPageIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackArrow() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: SvgPicture.asset(
          "assets/images/img_arrow_3.svg",
          height: 24,
          width: 24,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          "Exposer une Complainte",
          style: TextStyle(
            color: textColor,
            fontSize: 28,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Détails",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildExposeField() {
    return _buildTextFormField(
      controller: _exposeController,
      hintText: "Décrivez la plainte",
      title: "Exposé",
    );
  }

  Widget _buildSuiteField() {
    return _buildTextFormField(
      controller: _suiteController,
      hintText: "Décrivez la suite",
      title: "Suite",
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: textColor,
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            child: TextFormField(
              controller: controller,
              maxLines: 4,
              style: const TextStyle(
                color: hintColor,
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: hintColor,
                  fontSize: 16,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: secondaryColor,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceRecordSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enregistrement Vocal",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              // Implémentez la logique d'enregistrement vocal ici
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.mic, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Enregistrer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        onPressed: () {
          Navigator.pushNamed(context,
              AppRoutes.complainteScreen); // Remplacez par la route souhaitée
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/img_logo.svg", // Remplacez par le chemin de votre logo
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            const Center(
              child: Text(
                "Suivant",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return const SizedBox(
      height: 13,
      child: AnimatedSmoothIndicator(
        activeIndex: 2,
        count: 4,
        effect: ScrollingDotsEffect(
          spacing: 9,
          activeDotColor: primaryColor,
          dotColor: Color(0XFFD9D9D9),
          activeDotScale: 1.3,
          dotHeight: 10,
          dotWidth: 10,
        ),
      ),
    );
  }
}
