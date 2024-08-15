import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niaxtumobile/routes/app_routes.dart';

class AccueilScreen extends StatelessWidget {
  AccueilScreen({Key? key})
      : super(
          key: key,
        );

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFCFC),
        appBar: _buildAppBar(context),
        body: Container(
          width: 375,
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 23,
          ),
          child: Column(
            children: [
              SizedBox(height: 77),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  42,
                ),
                child: Image.asset(
                  "assets/images/img_ellipse_6.png",
                  height: 84,
                  width: 95,
                ),
              ),
              SizedBox(height: 13),
              Text(
                "Bonjour pseudo",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 25,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Liste de vos complaintes",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontFamily: 'Book Antiqua',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              _buildComplaintsList(context)
            ],
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
      toolbarHeight: 65,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 44,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 11,
          top: 16,
          bottom: 15,
        ),
        child: SizedBox(
          height: 24,
          width: 33,
          child: SvgPicture.asset(
            "assets/images/img_vector.svg",
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 96),
        child: SizedBox(
          width: 224,
          child: TextFormField(
            focusNode: FocusNode(),
            autofocus: true,
            controller: searchController,
            style: TextStyle(
              color: Color(0XFF030303),
              fontSize: 14,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: "Recherche...",
              hintStyle: TextStyle(
                color: Color(0XFF030303),
                fontSize: 14,
                fontFamily: 'Book Antiqua',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(
                  15,
                ),
                child: Icon(
                  Icons.search,
                  color: Color(0xff757575),
                ),
              ),
              suffixIcon: Container(
                margin: EdgeInsets.fromLTRB(30, 6, 18, 6),
                child: SvgPicture.asset(
                  "assets/images/img_vector_ff000000.svg",
                  height: 20,
                  width: 20,
                ),
              ),
              filled: true,
              fillColor: Color(0X21938F8F),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildComplaintsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return ComplaintslistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildNewComplaintButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 39,
      margin: EdgeInsets.only(
        left: 58,
        right: 57,
        bottom: 30,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF29F656),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              19,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.structureCibleScreen);
        },
        child: Text(
          "Nouvelle complainte",
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 18,
            fontFamily: 'Book Antiqua',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ComplaintslistItemWidget extends StatelessWidget {
  const ComplaintslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1),
            child: Column(
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
                  "Stucture cible",
                  style: TextStyle(
                    color: Color(0XFF030303),
                    fontSize: 14,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 1,
              bottom: 1,
            ),
            child: Column(
              children: [
                Text(
                  "type de complainte",
                  style: TextStyle(
                    color: Color(0XFF030303),
                    fontSize: 14,
                    fontFamily: 'Book Antiqua',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 15,
                  itemCount: 5,
                  updateOnDrag: true,
                  onRatingUpdate: (rating) {},
                  itemBuilder: (context, _) {
                    return Icon(
                      Icons.star,
                      color: Color(0XFF29F656),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
