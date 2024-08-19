import 'package:flutter/material.dart';
import 'package:niaxtumobile/routes/app_routes.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';
import 'package:niaxtumobile/widgets/custom_elevated_button.dart';
import 'package:niaxtumobile/widgets/custom_text_form_field.dart';
import 'package:niaxtumobile/widgets/custom_image_view.dart';
import 'package:niaxtumobile/core/utils/image_constant.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/custom_text_style.dart';

class ConnexionScreen extends StatelessWidget {
  ConnexionScreen({super.key});

  final TextEditingController _numeroPseudoController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formkey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 147.v,
                      width: 171.h,
                      radius: BorderRadius.circular(71.h),
                    ),
                    SizedBox(height: 10.v),
                    Text(
                      "Bienvenue",
                      style: CustomTextStyles.titleLargeBookAntiquaGray60001,
                    ),
                    SizedBox(height: 15.v),
                    _buildColumnNumeropse(context),
                    SizedBox(height: 15.v),
                    _buildColumnMotDePasse(context),
                    SizedBox(height: 15.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtMotdepasseone(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 6.h),
                          child: Text(
                            "Mot de passe oublié?",
                            style: CustomTextStyles.bodyLargeRed500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.v),
                    CustomElevatedButton(
                      text: "Connexion",
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Couleur du bouton
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.h), // Bordure du bouton
                        ),
                      ),
                      onPressed: () {
                        onTapBtnConnexion(context);
                      },
                    ),
                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pas de compte?",
                            style: CustomTextStyles
                                .titleMediumBookAntiquaOnPrimaryContainer,
                          ),
                          GestureDetector(
                            onTap: () {
                              onTapTxtCreercompte(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "Créer un compte",
                                style: CustomTextStyles
                                    .titleMediumBookAntiquaGray50001,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnNumeropse(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Numero/Pseudo",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 20.v),
        CustomTextFormField(
          controller: _numeroPseudoController,
          hintText: "Veuillez saisir votre numero",
          borderType: TextFormFieldStyleHelper.outlinePrimaryTL6,
          fillColor: appTheme.whiteA700,
          obscureText: false,
          decoration: InputDecoration(
            hintText: "Veuillez saisir votre numero",
            border: TextFormFieldStyleHelper.outlinePrimaryTL6,
            enabledBorder: TextFormFieldStyleHelper.outlinePrimaryTL6,
            focusedBorder: TextFormFieldStyleHelper.outlinePrimaryTL6,
          ),
        ),
      ],
    );
  }

  Widget _buildColumnMotDePasse(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "Mot de passe",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 18,
              fontFamily: 'Book Antiqua',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 7.v),
        CustomTextFormField(
          controller: _motDePasseController,
          hintText: "Mot de passe",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 12.v, 14.h, 12.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup8Gray60001,
              height: 24.h,
              width: 27.h,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 48.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(left: 30.h, top: 14.v, bottom: 14.v),
          borderType: TextFormFieldStyleHelper.outlinePrimaryTL6,
          fillColor: appTheme.whiteA700,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            border: TextFormFieldStyleHelper.outlinePrimaryTL6,
            enabledBorder: TextFormFieldStyleHelper.outlinePrimaryTL6,
            focusedBorder: TextFormFieldStyleHelper.outlinePrimaryTL6,
            suffixIcon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 14.h, 12.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup8Gray60001,
                height: 24.h,
                width: 27.h,
              ),
            ),
          ),
        )
      ],
    );
  }

  void onTapTxtMotdepasseone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  void onTapBtnConnexion(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accueilScreen);
  }

  void onTapTxtCreercompte(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.inscriptionScreen);
  }
}
