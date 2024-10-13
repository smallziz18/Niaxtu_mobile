import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/routes/app_routes.dart';

class AccueilScreen extends StatelessWidget {
  AccueilScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFCFC),
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildProfileImage(),
                const SizedBox(height: 13),
                _buildGreetingText(),
                const SizedBox(height: 10),
                _buildComplaintsTitle(),
                const SizedBox(height: 10),
                _buildComplaintsList(context), // Passer le contexte ici
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildNewComplaintButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 44,
      leading: Padding(
        padding: const EdgeInsets.only(left: 11, top: 16, bottom: 15),
        child: SvgPicture.asset(
          "assets/images/img_vector.svg",
          height: 24,
          width: 33,
        ),
      ),
      title: _buildSearchField(),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: searchController,
      style: const TextStyle(
        color: Color(0XFF030303),
        fontSize: 14,
        fontFamily: 'Book Antiqua',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Recherche...",
        hintStyle: const TextStyle(
          color: Color(0XFF757575),
          fontSize: 14,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xff757575)),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/images/img_vector_ff000000.svg",
            height: 20,
            width: 20,
          ),
        ),
        filled: true,
        fillColor: const Color(0X21938F8F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(42),
      child: Image.asset(
        "assets/images/img_ellipse_6.png",
        height: 84,
        width: 95,
      ),
    );
  }

  Widget _buildGreetingText() {
    return const Text(
      "Bonjour pseudo",
      style: TextStyle(
        color: Color(0XFF000000),
        fontSize: 25,
        fontFamily: 'Book Antiqua',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildComplaintsTitle() {
    return const Text(
      "Liste de vos complaintes",
      style: TextStyle(
        color: Color(0XFF000000),
        fontSize: 20,
        fontFamily: 'Book Antiqua',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildComplaintsList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return ComplaintsListItemWidget(onTap: () {
          _showComplaintDetails(context, index);
        });
      },
    );
  }

 void _showComplaintDetails(BuildContext context, int index) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6, // Hauteur max à 60% de l'écran
        ),
        child: Column(
          children: [
            Text(
              "Détails de la plainte $index", // Détails à personnaliser
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: const Text(
                  "Description de la plainte ici...", // Détails à personnaliser
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Fermer"),
            ),
          ],
        ),
      );
    },
  );
}




  /// Section Widget
  Widget _buildNewComplaintButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 30),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF29F656),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            elevation: 5,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.structureCibleScreen);
          },
          child: const Text(
            "Nouvelle complainte",
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ComplaintsListItemWidget extends StatelessWidget {
  final VoidCallback onTap; // Ajout d'un gestionnaire de tap
  const ComplaintsListItemWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Appeler le gestionnaire de tap
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ComplaintsDetails(),
            ComplaintRating(),
          ],
        ),
      ),
    );
  }
}

class ComplaintsDetails extends StatelessWidget {
  const ComplaintsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "date",
          style: TextStyle(
            color: Color(0XFF030303),
            fontSize: 14,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Structure cible",
          style: TextStyle(
            color: Color(0XFF030303),
            fontSize: 14,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class ComplaintRating extends StatelessWidget {
  const ComplaintRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "type de complainte",
          style: TextStyle(
            color: Color(0XFF030303),
            fontSize: 14,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        RatingBar.builder(
          initialRating: 3,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemSize: 15,
          itemCount: 5,
          updateOnDrag: true,
          onRatingUpdate: (rating) {},
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color(0XFF29F656),
          ),
        ),
      ],
    );
  }
}
