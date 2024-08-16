import 'package:flutter/material.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:niaxtumobile/widgets/custom_drop_down.dart';
import 'package:niaxtumobile/widgets/custom_search_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:niaxtumobile/theme/theme_helper.dart'; // Assurez-vous que ce fichier contient la classe ThemeHelper

class StructureCibleScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final List<String> dropdownItemList = ["Option 1", "Option 2"];
  final List<String> dropdownItemList1 = ["Option A", "Option B"];
  final List<String> dropdownItemList2 = ["Service 1", "Service 2"];

  StructureCibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHelper().themeData();
    final appTheme = ThemeHelper().themeColor();

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 147,
                  width: 171,
                  radius: BorderRadius.circular(73),
                ),
                const SizedBox(height: 22),
                Text(
                  "Emission d'une Plainte",
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 102),
                    child: Text(
                      "Structure cible",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomSearchView(
                    width: double.infinity,
                    controller: searchController,
                    hintText: "Recherche...",
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Bordure noire
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                _buildMinistreSection(context),
                const SizedBox(height: 7),
                _buildDirectionSection(context),
                const SizedBox(height: 8),
                _buildServiceSection(context),
                const SizedBox(height: 99),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.typologieScreen);
                  },
                  child: const Text(
                    "Suivant",
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 13,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 4,
                    effect: ScrollingDotsEffect(
                      spacing: 7,
                      activeDotColor: appTheme.lightBlue400,
                      dotColor: appTheme.gray400,
                      activeDotScale: 1.3,
                      dotHeight: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMinistreSection(BuildContext context) {
    final theme = Theme.of(context);
    String? selectedMinistere;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ministere",
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 9),
          CustomDropDown(
            icon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 19),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 7,
                width: 12,
                radius: BorderRadius.circular(73),
              ),
            ),
            hintText: "Veuillez choisir le ministere",
            items: dropdownItemList,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Bordure noire
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onChanged: (value) {
              selectedMinistere = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionSection(BuildContext context) {
    final theme = Theme.of(context);
    String? selectedDirection;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Direction",
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 9),
          CustomDropDown(
            icon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 19),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 7,
                width: 12,
                radius: BorderRadius.circular(73),
              ),
            ),
            hintText: "Veuillez choisir la Direction",
            items: dropdownItemList1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Bordure noire
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onChanged: (value) {
              selectedDirection = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection(BuildContext context) {
    final theme = Theme.of(context);
    String? selectedService;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Service",
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 9),
          CustomDropDown(
            icon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 19),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 7,
                width: 12,
                radius: BorderRadius.circular(73),
              ),
            ),
            hintText: "Veuillez choisir le service",
            items: dropdownItemList2,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Bordure noire
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onChanged: (value) {
              selectedService = value;
            },
          ),
        ],
      ),
    );
  }
}
