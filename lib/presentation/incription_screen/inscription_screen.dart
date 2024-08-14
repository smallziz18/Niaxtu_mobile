import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InscriptionScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  InscriptionScreen({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(right: 81),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 130),
                        child: SizedBox(
                          height: 40,
                          width: 30,
                          child: SvgPicture.asset(
                            "assets/images/img_vector_1.svg",
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/img_logo.png', // Assurez-vous de fournir le bon chemin d'accès
                        height: 147,
                        width: 171,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Inscription",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 26,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 249,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Veuillez indiquer le numéro de \ntéléphone associé à ce compte",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF817C7C),
                    fontSize: 18,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 44),
              _buildPhoneNumberSection(),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/informationScreen');
                  },
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
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 13,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 3,
                  effect: ScrollingDotsEffect(
                    spacing: 9,
                    activeDotColor: Color(0XFF29B6F6),
                    dotColor: Color(0XFFD9D9D9),
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

  Widget _buildPhoneNumberSection() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 11),
            child: Text(
              "Numéro de Téléphone",
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 18,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 7),
          Container(
            width: 315,
            margin: EdgeInsets.only(left: 10),
            child: TextFormField(
              controller: phoneController,
              autofocus: true,
              style: TextStyle(
                color: Color(0XFF817C7C),
                fontSize: 16,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Numéro de téléphone",
                hintStyle: TextStyle(
                  color: Color(0XFF817C7C),
                  fontSize: 16,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0XFFFDFBFB),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}