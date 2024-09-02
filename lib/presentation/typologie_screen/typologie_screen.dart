import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:niaxtumobile/routes/app_routes.dart';

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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ajuste la hauteur du Column pour ne pas remplir l'écran
              children: [
                const SizedBox(height: 32),
                _buildBackArrow(),
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
          "Emission d’une Complainte",
          style: TextStyle(
            color: textColor,
            fontSize: 28,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Typologie",
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
            width: double.infinity,
            child: DropdownButtonFormField<String>(
              icon: Container(
                margin: const EdgeInsets.symmetric(horizontal: 19),
                child: SvgPicture.asset(
                  "assets/images/img_arrow_down.svg", // Remplacez par le bon chemin de l'icône
                  height: 12,
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
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: secondaryColor,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(19, 15, 19, 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: const BorderSide(
                    color: Colors.transparent, // Bordure transparente
                  ),
                ),
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
            hintText: "Nom de la structure privée",
          ),
          const SizedBox(height: 14),
          _buildTextFormField(
            controller: TextEditingController(),
            hintText: "Numero Telephone",
          ),
          const SizedBox(height: 14),
          _buildTextFormField(
            controller: TextEditingController(),
            hintText: "Email de la structure privée",
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      width: double.infinity,
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
            borderRadius: BorderRadius.circular(5), // Bordure rectangulaire
            borderSide: const BorderSide(
              color: Colors.black, // Bordure noire
              width: 1.0, // Épaisseur de la bordure
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5), // Bordure rectangulaire
            borderSide: const BorderSide(
              color: Colors.black, // Bordure noire
              width: 1.0, // Épaisseur de la bordure
            ),
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
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          elevation: 5, // Ajout d'une ombre au bouton
          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.exposeComplainteScreen);
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
