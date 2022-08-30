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
          'pin': 'Pin Code'
        },
        'fr_FR': {
          'language': "Le français est utilisé comme langue de l'application.",
          'change': 'Langue modifiée',
          'name': 'Prénom',
          'email': 'Adresse e-mail',
          'phoneno': "Numéro de téléphone",
          'username': "Nom d'utilisateur",
          'pin': 'Code PIN'
        }
      };
}
