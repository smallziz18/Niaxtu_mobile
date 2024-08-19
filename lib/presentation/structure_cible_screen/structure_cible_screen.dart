import 'package:flutter/material.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/presentation/typologie_screen/typologie_screen.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:niaxtumobile/widgets/custom_drop_down.dart';
import 'package:niaxtumobile/widgets/custom_search_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 22),
                _buildTitle(theme),
                const SizedBox(height: 12),
                _buildStructureCibleLabel(theme),
                const SizedBox(height: 12),
                _buildSearchField(),
                const SizedBox(height: 19),
                _buildMinistreSection(context),
                const SizedBox(height: 7),
                _buildDirectionSection(context),
                const SizedBox(height: 8),
                _buildServiceSection(context),
                const SizedBox(height: 99),
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

  Widget _buildLogo() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4), // décalage de l'ombre
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(73),
        child: Image.asset(
          ImageConstant.imgLogo,
          height: 147,
          width: 171,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Text(
      "Emission d'une Plainte",
      style: theme.textTheme.headlineMedium?.copyWith(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: appTheme.black90001,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildStructureCibleLabel(ThemeData theme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 102),
        child: Text(
          "Structure cible",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: appTheme.black90001,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomSearchView(
        width: double.infinity,
        controller: searchController,
        hintText: "Recherche...",
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildMinistreSection(BuildContext context) {
    final theme = Theme.of(context);

    return _buildDropdownSection(
      context: context,
      label: "Ministere",
      hintText: "Veuillez choisir le ministere",
      items: dropdownItemList,
      theme: theme,
    );
  }

  Widget _buildDirectionSection(BuildContext context) {
    final theme = Theme.of(context);

    return _buildDropdownSection(
      context: context,
      label: "Direction",
      hintText: "Veuillez choisir la Direction",
      items: dropdownItemList1,
      theme: theme,
    );
  }

  Widget _buildServiceSection(BuildContext context) {
    final theme = Theme.of(context);

    return _buildDropdownSection(
      context: context,
      label: "Service",
      hintText: "Veuillez choisir le service",
      items: dropdownItemList2,
      theme: theme,
    );
  }

  Widget _buildDropdownSection({
    required BuildContext context,
    required String label,
    required String hintText,
    required List<String> items,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: appTheme.black90001,
            ),
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
            hintText: hintText,
            items: items,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.7),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onChanged: (value) {
              // Gestion de la sélection
            },
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
          elevation: 5, // Ajout d'une ombre au bouton
          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.typologieScreen);
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
    return SizedBox(
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
    );
  }
}
