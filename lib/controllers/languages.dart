import 'package:get/route_manager.dart';

class LanguageController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'language': 'English is being used as the app language.',
          'change': 'Language changed',
          'name': 'First Name',
          'email': 'Email Address',
          'phoneno': 'Phone Number',
          'username': 'User Name',
          'pin': 'Pin Code',
          'home': 'Home',
          'Bank Account': 'Bank Account',
          'Send Money': 'Send Money',
          'Change Language': 'Change Language',
          'Contact Us': 'Contact Us',
          'FAQs': 'FAQs',
          'About Us': 'Avout Us',
          'T&C': 'Terms And Conditions',
          'P&P': 'Privcay Policy',
          'Logout': 'Logout',
        },
        'fr_FR': {
          'language': "Le français est utilisé comme langue de l'application.",
          'change': 'Langue modifiée',
          'name': 'Prénom',
          'email': 'Adresse e-mail',
          'phoneno': "Numéro de téléphone",
          'username': "Nom d'utilisateur",
          'pin': 'Code PIN',
          'home': 'Domicile',
          'Bank Account': 'Compte bancaire',
          'Send Money': "Envoyer de l'argent",
          'Change Language': 'Changer de langue',
          'Contact Us': 'Nous contacter',
          'FAQs': 'FAQs',
          'About Us': 'À propos de nous',
          'T&C': 'Termes et conditions',
          'P&P': 'Politique de confidentialité',
          'Logout': "Se déconnecter",
        }
      };
}
