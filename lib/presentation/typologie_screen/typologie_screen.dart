import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Constantes pour les couleurs et styles
const Color primaryColor = Color(0XFF29B6F6);
const Color secondaryColor = Color(0XFFFDFBFB);
const Color textColor = Color(0XFF000000);
const Color hintColor = Color(0XFFC4C4C4);

class TypologieScreen extends StatelessWidget {
  TypologieScreen({super.key});

  final List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  final List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset:
            true, // Permet d'ajuster la taille du corps de l'écran lorsque le clavier est affiché
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: SizedBox(
                    height: 5,
                    width: 20,
                    child: SvgPicture.asset(
                      "assets/images/img_arrow_3.svg",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTitle(),
              const SizedBox(height: 19),
              _buildComplaintTypeSection(),
              const SizedBox(height: 10),
              _buildTargetTypeSection(),
              const SizedBox(height: 22),
              _buildPrivateStructureSection(),
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

  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          "Emission d’une Complainte",
          style: TextStyle(
            color: textColor,
            fontSize: 28,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Typologie",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildComplaintTypeSection() {
    return _buildDropdownSection(
      title: "Type de plainte",
      hintText: "Veuillez choisir le type de plainte",
      items: dropdownItemList,
    );
  }

  Widget _buildTargetTypeSection() {
    return _buildDropdownSection(
      title: "Type de cible",
      hintText: "Veuillez choisir le type de cible",
      items: dropdownItemList1,
    );
  }

  Widget _buildDropdownSection({
    required String title,
    required String hintText,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
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
          const SizedBox(height: 7),
          SizedBox(
            width: double
                .infinity, // Ajuster la largeur en fonction de l'espace disponible
            child: DropdownButtonFormField<String>(
              icon: Container(
                margin: const EdgeInsets.symmetric(horizontal: 19),
                child: SvgPicture.asset(
                  "assets/images/img_arrowdown.svg",
                  height: 7,
                  width: 12,
                ),
              ),
              style: const TextStyle(
                color: hintColor,
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              onChanged: (value) {},
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: hintColor,
                  fontSize: 16,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: secondaryColor,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(19, 15, 19, 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivateStructureSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Structure Privée",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          _buildTextFormField(
              controller: TextEditingController(),
              hintText: "Nom de la structure privée"),
          const SizedBox(height: 14),
          _buildTextFormField(
              controller: TextEditingController(),
              hintText: "Numero Telephone"),
          const SizedBox(height: 14),
          _buildTextFormField(
              controller: TextEditingController(),
              hintText: "Email de la structure privée"),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      width: double
          .infinity, // Ajuster la largeur en fonction de l'espace disponible
      margin: const EdgeInsets.only(left: 27, right: 1),
      child: TextFormField(
        controller: controller,
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
              const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.complainteScreen);
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
    );
  }

  Widget _buildPageIndicator() {
    return const SizedBox(
      height: 13,
      child: AnimatedSmoothIndicator(
        activeIndex: 1,
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
