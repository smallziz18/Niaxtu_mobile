import 'package:niaxtumobile/core/app_export.dart';
import 'package:niaxtumobile/presentation/accueil_screen/accueil_screen.dart';
import 'package:niaxtumobile/presentation/complainte_screen/complainte_screen.dart';
import 'package:niaxtumobile/presentation/connexion_screen/conexion_screen.dart';
import 'package:niaxtumobile/presentation/etape_one_screen/etape_one_screen.dart';
import 'package:niaxtumobile/presentation/etape_two_screen/etape_two_screen.dart';
import 'package:niaxtumobile/presentation/expose_screen/expose_complainte.dart';
import 'package:niaxtumobile/presentation/identification_screen/identification_screen.dart';
import 'package:niaxtumobile/presentation/incription_screen/inscription_screen.dart';
import 'package:niaxtumobile/presentation/mot_de_passe_screen/mot_de_passe_screen.dart';
import 'package:niaxtumobile/presentation/structure_cible_screen/structure_cible_screen.dart';
import 'package:niaxtumobile/presentation/typologie_screen/typologie_screen.dart';
import 'package:niaxtumobile/presentation/verification_screen/verification_screen.dart';
import 'package:niaxtumobile/presentation/forgot_password_screen/forgot_password_screen.dart';


class AppRoutes {
  static const String verificationScreen = '/verification_screen';
  static const String initialRoute = '/initialRoute';
  static const String structureCibleScreen = '/structure_cible_screen';
  static const String etapeOneScreen = '/etape_one_screen';
  static const String etapeTwoScreen = '/etape_two_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String menuScreen = '/menu_screen';
  static const String connexionScreen = '/connexion_screen';
  static const String inscriptionScreen =
      '/inscription_screen'; // Correction ici
  static const String informationScreen = '/identification_screen';
  static const String motDePasseScreen = '/mot_de_passe_screen';
  static const String accueilScreen = '/accueil_screen';
  static const String typologieScreen = '/typologie_screen';
  static const String complainteScreen = '/complainte_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String exposeComplainteScreen = '/expose_screen';

  static Map<String, WidgetBuilder> routes = {
    structureCibleScreen: (context) => StructureCibleScreen(),
    etapeOneScreen: (context) => const EtapeOneScreen(),
    etapeTwoScreen: (context) =>  EtapeTwoScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    accueilScreen: (context) => AccueilScreen(),
    menuScreen: (context) => const EtapeOneScreen(),
    connexionScreen: (context) => ConnexionScreen(),
    inscriptionScreen: (context) => InscriptionScreen(),
    verificationScreen: (context) => VerificationScreen(),
    informationScreen: (context) => IdentificationScreen(),
    motDePasseScreen: (context) => MotDePasseScreen(),
    typologieScreen: (context) => TypologieScreen(),
    complainteScreen: (context) => ComplainteScreen(),
    appNavigationScreen: (context) => const EtapeOneScreen(),
    exposeComplainteScreen: (context) => ExposeComplainteScreen(),
    initialRoute: (context) => ConnexionScreen(),
  };
}
