import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
  }) =>
      [enText, hiText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hx587isl': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
    'lcf0pycj': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕಿ Kannada',
    },
    'tizj4b2k': {
      'en': 'Highly Recommended',
      'hi': 'बाली, इंडोनेशिया',
      'kn': 'ಬಾಲಿ - ಇಂಡೋನೇಷ್ಯಾ',
    },
    'qioj61u6': {
      'en': 'What are you waiting for?',
      'hi': 'कौन देख रहा है?',
      'kn': 'ಯಾರು ನೋಡುತ್ತಿದ್ದಾರೆ?',
    },
    'g2q6frsz': {
      'en': 'Buy Now',
      'hi': 'अभी अन्वेषण करें',
      'kn': 'ಈಗ ಅನ್ವೇಷಿಸಿ',
    },
    'l3723hv8': {
      'en': 'What else is popular',
      'hi': 'और क्या लोकप्रिय है',
      'kn': 'ಇನ್ನೇನು ಜನಪ್ರಿಯವಾಗಿದೆ',
    },
    'gmkqj824': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    '8klgio8l': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    'yoy1nhit': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    'liezc14x': {
      'en': 'Share to Win',
      'hi': 'अन्य ठहराव',
      'kn': 'ಇತರ ತಂಗುವಿಕೆಗಳು',
    },
    'p7fvttbf': {
      'en': 'Share your experience to earn rewards!',
      'hi':
          'मैं कुछ अलग-अलग प्रस्तावों पर काम करूंगा, सप्ताहांत से पहले जब आपके पास उन पर विचार करने का समय हो तो मुझे बताएं।',
      'kn':
          'ನಾನು ಕೆಲವು ವಿಭಿನ್ನ ಪ್ರಸ್ತಾವನೆಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದೇನೆ, ವಾರಾಂತ್ಯದ ಮೊದಲು ಅವುಗಳನ್ನು ಪರಿಶೀಲಿಸಲು ನಿಮಗೆ ಸಮಯ ಸಿಕ್ಕಾಗ ನನಗೆ ತಿಳಿಸಿ.',
    },
    'zrjp1w2k': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕಿ Kannada',
    },
    'jmghhidu': {
      'en': 'Best',
      'hi': 'श्रेष्ठ',
      'kn': 'ಅತ್ಯುತ್ತಮ',
    },
    'd2km4bku': {
      'en': 'Recomendations',
      'hi': 'सिफारिशों',
      'kn': 'ಶಿಫಾರಸುಗಳು',
    },
    'u2k62ejn': {
      'en': 'All Others',
      'hi': 'बाकी सब',
      'kn': 'ಎಲ್ಲಾ ಇತರೆ',
    },
    'md6kua23': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'kn': 'ಪ್ರೊಫೈಲ್',
    },
    'd2g1d8dx': {
      'en': 'Total Purchases',
      'hi': 'कुल खरीद',
      'kn': 'ಒಟ್ಟು ಖರೀದಿಗಳು',
    },
    'rl64abzy': {
      'en': 'Edit Preferences',
      'hi': 'संपत्तियां खरीदें',
      'kn': 'ಸ್ವತ್ತುಗಳನ್ನು ಖರೀದಿಸಿ',
    },
    'nv39hmmy': {
      'en': 'Account Settings',
      'hi': 'अकाउंट सेटिंग',
      'kn': 'ಖಾತೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
    },
    'jbggu3gy': {
      'en': 'History',
      'hi': '',
      'kn': '',
    },
    'etz8a683': {
      'en': 'Recent Searches',
      'hi': 'हालिया आदेश',
      'kn': 'ಇತ್ತೀಚಿನ ಆದೇಶಗಳು',
    },
    'mtql0rnd': {
      'en': 'Below are your most recent searches',
      'hi': 'नीचे आपके सबसे हाल के ऑर्डर हैं',
      'kn': 'ನಿಮ್ಮ ತೀರಾ ಇತ್ತೀಚಿನ ಆರ್ಡರ್‌ಗಳು ಕೆಳಗಿವೆ',
    },
    'owalketc': {
      'en': 'Search Key',
      'hi': 'क्रम संख्या',
      'kn': 'ಆದೇಶ ಸಂಖ್ಯೆ',
    },
    '5xji7sgy': {
      'en': '',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    '4990vdet': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    'dh662i6w': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    'o8eu4iok': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    'hfuhg7lc': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'yblu2wav': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    'cxpb52ng': {
      'en': '\$11.42',
      'hi': '\$11.42',
      'kn': '\$11.42',
    },
    '2knnd24p': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    '0ityxt2k': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    'og4zdryp': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    '7euaclex': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    'qa5yk6ko': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'ev6xx35a': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'x9lila3l': {
      'en': '\$56.89',
      'hi': '\$56.89',
      'kn': '\$56.89',
    },
    'z7dyfa1t': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'onse6zcn': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    'u7lvmia0': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    'q5408g3o': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    '4fk787nf': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'cl0x9g3y': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'af87mrks': {
      'en': '\$15.12',
      'hi': '\$15.12',
      'kn': '\$15.12',
    },
    '304lgi1q': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'cji46a9q': {
      'en': 'Rewards',
      'hi': 'पुरस्कार',
      'kn': 'ಪ್ರತಿಫಲಗಳು',
    },
    '86xfjif6': {
      'en': 'US',
      'hi': '',
      'kn': '',
    },
    '9qsrwvze': {
      'en': 'EU',
      'hi': '',
      'kn': '',
    },
    'pp6mjzt0': {
      'en': 'IN',
      'hi': '',
      'kn': '',
    },
    'rc4ilvjw': {
      'en': 'Region',
      'hi': '',
      'kn': '',
    },
    'vym7bxk5': {
      'en': 'Search for an item...',
      'hi': '',
      'kn': '',
    },
    'ikcsrjre': {
      'en': 'Theme',
      'hi': 'विषय',
      'kn': 'ಥೀಮ್',
    },
    '3r2mx5cc': {
      'en': 'Light/Dark',
      'hi': 'हल्का गहरा',
      'kn': 'ಬೆಳಕು/ಕತ್ತಲು',
    },
    'lnmnn8qe': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    '8wtgg63s': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // UserLogin
  {
    '8apfgoiw': {
      'en': 'Deal Sense',
      'hi': 'डील सेंस',
      'kn': 'ಡೀಲ್ ಸೆನ್ಸ್',
    },
    'homb9m6j': {
      'en': 'Login.',
      'hi': 'लॉग इन करें।',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ.',
    },
    'lmcl4lwz': {
      'en': 'LogIn to your account.',
      'hi': 'अपने अकाउंट में लॉग इन करें।',
      'kn': 'ನಿಮ್ಮ ಖಾತೆಗೆ ಲಾಗಿನ್ ಆಗಿ.',
    },
    'q4renhb1': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    '81j63d31': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    '2ql12ztx': {
      'en': 'LogIn',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'ja2cyhtj': {
      'en': 'Don\'t have an account ',
      'hi': 'कोई खाता नहीं है',
      'kn': 'ಖಾತೆಯನ್ನು ಹೊಂದಿಲ್ಲ',
    },
    'be0z8brl': {
      'en': 'Sign Up !',
      'hi': 'साइन अप करें !',
      'kn': 'ಸೈನ್ ಅಪ್ ಮಾಡಿ!',
    },
    'v7tvvnhu': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // UserSignUp
  {
    'z7uasmqq': {
      'en': 'Deal Sense',
      'hi': 'डील सेंस',
      'kn': 'ಡೀಲ್ ಸೆನ್ಸ್',
    },
    'xydwvhb3': {
      'en': 'SignUp.',
      'hi': 'साइन अप करें।',
      'kn': 'ಸೈನ್ ಅಪ್.',
    },
    'cx1gwi1i': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
    },
    'ciwdspzd': {
      'en': 'Name',
      'hi': 'नाम',
      'kn': 'ಹೆಸರು',
    },
    '1xagi0na': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    '2ddw8ihe': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'w2ab1kis': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    'k6pfqorr': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
    },
    '3c38f1bs': {
      'en': 'Already have an account? ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆ ಹೊಂದಿದ್ದೀರ?',
    },
    '9l70bqc4': {
      'en': ' Sign In here',
      'hi': 'यहां साइन इन करो',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ',
    },
    'm8qbbomx': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // history
  {
    'y5x9u5q8': {
      'en': 'check.io',
      'hi': 'check.io',
      'kn': 'check.io',
    },
    '2u2xjuwh': {
      'en': 'Platform Navigation',
      'hi': 'प्लेटफ़ॉर्म नेविगेशन',
      'kn': 'ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ನ್ಯಾವಿಗೇಷನ್',
    },
    '5hvmlqpj': {
      'en': 'Dashboard',
      'hi': 'डैशबोर्ड',
      'kn': 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
    },
    '303gepzm': {
      'en': 'Chats',
      'hi': 'चैट',
      'kn': 'ಚಾಟ್‌ಗಳು',
    },
    'ivapdg79': {
      'en': 'Projects',
      'hi': 'परियोजनाओं',
      'kn': 'ಯೋಜನೆಗಳು',
    },
    'm9iaqupd': {
      'en': 'Recent Orders',
      'hi': 'हालिया आदेश',
      'kn': 'ಇತ್ತೀಚಿನ ಆದೇಶಗಳು',
    },
    'h8sd24nf': {
      'en': '12',
      'hi': '12',
      'kn': '12',
    },
    '5j5mbmut': {
      'en': 'Settings',
      'hi': 'समायोजन',
      'kn': 'ಸಂಯೋಜನೆಗಳು',
    },
    '9koaxshq': {
      'en': 'Billing',
      'hi': 'बिलिंग',
      'kn': 'ಬಿಲ್ಲಿಂಗ್',
    },
    '91agze6j': {
      'en': 'Explore',
      'hi': 'अन्वेषण करना',
      'kn': 'ಅನ್ವೇಷಿಸಿ',
    },
    'iki0a861': {
      'en': 'Light Mode',
      'hi': 'लाइट मोड',
      'kn': 'ಲೈಟ್ ಮೋಡ್',
    },
    'tthjc6tz': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
    },
    '0g3d8fym': {
      'en': 'Andrew D.',
      'hi': 'एंड्रयू डी.',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಡಿ.',
    },
    'hg7g5eii': {
      'en': 'admin@gmail.com',
      'hi': 'admin@gmail.com',
      'kn': 'admin@gmail.com',
    },
    'q6dg1w0v': {
      'en': 'Recent Orders',
      'hi': 'हालिया आदेश',
      'kn': 'ಇತ್ತೀಚಿನ ಆದೇಶಗಳು',
    },
    'hxsk50es': {
      'en': 'Below are your most recent orders',
      'hi': 'नीचे आपके सबसे हाल के ऑर्डर हैं',
      'kn': 'ನಿಮ್ಮ ತೀರಾ ಇತ್ತೀಚಿನ ಆರ್ಡರ್‌ಗಳು ಕೆಳಗಿವೆ',
    },
    'de1p76ds': {
      'en': 'Order Number',
      'hi': 'क्रम संख्या',
      'kn': 'ಆದೇಶ ಸಂಖ್ಯೆ',
    },
    't6v9kpvz': {
      'en': 'Weight',
      'hi': 'वज़न',
      'kn': 'ತೂಕ',
    },
    'wjrp86gj': {
      'en': 'Status',
      'hi': 'स्थिति',
      'kn': 'ಸ್ಥಿತಿ',
    },
    'p7ad11s7': {
      'en': 'Amount',
      'hi': 'मात्रा',
      'kn': 'ಮೊತ್ತ',
    },
    'n1ak1zga': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    'ej5fla7g': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    '07bd2xlu': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    'a9wr6kry': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'fbtl27lg': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    'phjmb6ge': {
      'en': '\$1.50',
      'hi': '\$1.50',
      'kn': '\$1.50',
    },
    'ku8xv502': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    '6db7tbdt': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    '9ngfocv1': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    '34ebipwp': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    '32jpbo0v': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'sajdmdca': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    '39ylppti': {
      'en': '\$11.42',
      'hi': '\$11.42',
      'kn': '\$11.42',
    },
    '0rry05np': {
      'en': 'Shipped',
      'hi': 'लादा गया',
      'kn': 'ರವಾನಿಸಲಾಗಿದೆ',
    },
    'awwt3832': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    'teuhfdb7': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    '5wd5qyz3': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    'emvdnavy': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'r8mz3yab': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'ky2r5zms': {
      'en': '\$56.89',
      'hi': '\$56.89',
      'kn': '\$56.89',
    },
    'nypuepl8': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    '4y2yzady': {
      'en': 'Order #: ',
      'hi': 'आदेश #:',
      'kn': 'ಆದೇಶ #:',
    },
    '5qqdlp3v': {
      'en': '429242424',
      'hi': '429242424',
      'kn': '429242424',
    },
    '7sf8teib': {
      'en': 'Mon. July 3rd',
      'hi': 'सोमवार। 3 जुलाई',
      'kn': 'ಸೋಮ. ಜುಲೈ 3',
    },
    'ge19rsdv': {
      'en': '2.5 lbs',
      'hi': '2.5 पौंड',
      'kn': '2.5 ಪೌಂಡ್',
    },
    'oprinoj9': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    '8qmarq8g': {
      'en': '\$15.12',
      'hi': '\$15.12',
      'kn': '\$15.12',
    },
    '2ghh4mhk': {
      'en': 'Accepted',
      'hi': 'स्वीकृत',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    '866x1bue': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // onboard
  {
    'of9b4ww8': {
      'en': 'Mobile Phones',
      'hi': 'इलेक्ट्रानिक्स',
      'kn': 'ಎಲೆಕ್ಟ್ರಾನಿಕ್ಸ್',
    },
    '5w1hxk1e': {
      'en': 'Travel',
      'hi': 'यात्रा',
      'kn': 'ಪ್ರಯಾಣ',
    },
    'otppouhr': {
      'en': 'Grocery',
      'hi': 'किराना',
      'kn': 'ದಿನಸಿ',
    },
    '73owzkgz': {
      'en': 'Fashion',
      'hi': 'पहनावा',
      'kn': 'ಫ್ಯಾಷನ್',
    },
    'coc7d437': {
      'en': 'Toys',
      'hi': 'खिलौने',
      'kn': 'ಆಟಿಕೆಗಳು',
    },
    'qwak444z': {
      'en': 'Books',
      'hi': 'पुस्तकें',
      'kn': 'ಪುಸ್ತಕಗಳು',
    },
    'xltrsuly': {
      'en': 'Kitchen',
      'hi': '',
      'kn': '',
    },
    'xmq1oxbh': {
      'en': 'Health',
      'hi': '',
      'kn': '',
    },
    '4cs1lhyy': {
      'en': 'Beauty',
      'hi': '',
      'kn': '',
    },
    'nbjbnqxz': {
      'en': 'Sports',
      'hi': '',
      'kn': '',
    },
    'j86qh2ab': {
      'en': 'Hardware Tools',
      'hi': '',
      'kn': '',
    },
    '9tqkptwv': {
      'en': 'Audio',
      'hi': '',
      'kn': '',
    },
    'eqx5mnjy': {
      'en': 'Personalized Product discovery',
      'hi': 'वैयक्तिकृत उत्पाद खोज',
      'kn': 'ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಉತ್ಪನ್ನ ಅನ್ವೇಷಣೆ',
    },
    'qwg9xrsi': {
      'en': 'Next',
      'hi': 'अगला',
      'kn': 'ಮುಂದೆ',
    },
    '7xilfo0i': {
      'en': 'Skip',
      'hi': 'छोडना',
      'kn': 'ಬಿಟ್ಟುಬಿಡಿ',
    },
    '5tztgwp9': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // HomePageCopy
  {
    'ai26xhdz': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
    'ql68pvni': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕಿ Kannada',
    },
    '9bx8zwd5': {
      'en': 'Highly Recommended',
      'hi': 'बाली, इंडोनेशिया',
      'kn': 'ಬಾಲಿ - ಇಂಡೋನೇಷ್ಯಾ',
    },
    'd5a8hn44': {
      'en': 'What are you waiting for?',
      'hi': 'कौन देख रहा है?',
      'kn': 'ಯಾರು ನೋಡುತ್ತಿದ್ದಾರೆ?',
    },
    '0eozs5f0': {
      'en': 'Buy Now',
      'hi': 'अभी अन्वेषण करें',
      'kn': 'ಈಗ ಅನ್ವೇಷಿಸಿ',
    },
    '26igz290': {
      'en': 'What else is popular',
      'hi': 'और क्या लोकप्रिय है',
      'kn': 'ಇನ್ನೇನು ಜನಪ್ರಿಯವಾಗಿದೆ',
    },
    'g4faw1ka': {
      'en': 'Product Name',
      'hi': 'चट्टानें',
      'kn': 'ದಿ ರೀಫ್ಸ್',
    },
    '6rlsmhgg': {
      'en': '4.9 Stars',
      'hi': '4.9 सितारे',
      'kn': '4.9 ನಕ್ಷತ್ರಗಳು',
    },
    'nqcrpo4b': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    'e3ga22ay': {
      'en': 'Devils Cove',
      'hi': 'डेविल्स कोव',
      'kn': 'ಡೆವಿಲ್ಸ್ ಕೋವ್',
    },
    'o5fqnyx8': {
      'en': '4.7 Stars',
      'hi': '4.7 सितारे',
      'kn': '4.7 ನಕ್ಷತ್ರಗಳು',
    },
    'cfyb03zw': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    'gt5gizgw': {
      'en': 'Juniper Beach',
      'hi': 'जुनिपर बीच',
      'kn': 'ಜುನಿಪರ್ ಬೀಚ್',
    },
    'uevh1btd': {
      'en': '4.5 Stars',
      'hi': '4.5 सितारे',
      'kn': '4.5 ನಕ್ಷತ್ರಗಳು',
    },
    '139o85ao': {
      'en': 'View Now',
      'hi': 'अभी देखें',
      'kn': 'ಈಗ ವೀಕ್ಷಿಸಿ',
    },
    '91ya32d6': {
      'en': 'Share to Win',
      'hi': 'अन्य ठहराव',
      'kn': 'ಇತರ ತಂಗುವಿಕೆಗಳು',
    },
    'jdss4fx1': {
      'en': 'Share your experience to earn rewards!',
      'hi':
          'मैं कुछ अलग-अलग प्रस्तावों पर काम करूंगा, सप्ताहांत से पहले जब आपके पास उन पर विचार करने का समय हो तो मुझे बताएं।',
      'kn':
          'ನಾನು ಕೆಲವು ವಿಭಿನ್ನ ಪ್ರಸ್ತಾವನೆಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದೇನೆ, ವಾರಾಂತ್ಯದ ಮೊದಲು ಅವುಗಳನ್ನು ಪರಿಶೀಲಿಸಲು ನಿಮಗೆ ಸಮಯ ಸಿಕ್ಕಾಗ ನನಗೆ ತಿಳಿಸಿ.',
    },
    'v4gqx2oy': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕಿ Kannada',
    },
    '5h1yolj5': {
      'en': 'Best',
      'hi': 'श्रेष्ठ',
      'kn': 'ಅತ್ಯುತ್ತಮ',
    },
    'u7uopq5u': {
      'en': 'Product Name',
      'hi': 'नई रिलीज',
      'kn': 'ಹೊಸ ಬಿಡುಗಡೆ',
    },
    'e8ie89f1': {
      'en': '\$126.20',
      'hi': '',
      'kn': '',
    },
    'j2q4sn2z': {
      'en': 'Ordered on Feb 15, 2022',
      'hi': '15 फरवरी, 2022 को आदेश दिया गया',
      'kn': 'ಫೆಬ್ರವರಿ 15, 2022 ರಂದು ಆದೇಶಿಸಲಾಗಿದೆ',
    },
    'hgmskazr': {
      'en': 'Recomendations',
      'hi': 'सिफारिशों',
      'kn': 'ಶಿಫಾರಸುಗಳು',
    },
    't399xvvm': {
      'en': 'New Release',
      'hi': 'नई रिलीज',
      'kn': 'ಹೊಸ ಬಿಡುಗಡೆ',
    },
    'yxiz78kl': {
      'en': 'Feb 15, 2022',
      'hi': 'फ़रवरी 15, 2022',
      'kn': 'ಫೆಬ್ರವರಿ 15, 2022',
    },
    'xgz8bwhp': {
      'en': '\$126.20',
      'hi': '\$126.20',
      'kn': '\$126.20',
    },
    'i87baaht': {
      'en': 'Nike Airmax 90',
      'hi': 'नाइके एयरमैक्स 90',
      'kn': 'Nike Airmax 90',
    },
    'c7pa51i0': {
      'en': 'Feb 15, 2022',
      'hi': 'फ़रवरी 15, 2022',
      'kn': 'ಫೆಬ್ರವರಿ 15, 2022',
    },
    '5i9w0nbr': {
      'en': '\$222.50',
      'hi': '\$222.50',
      'kn': '\$222.50',
    },
    'u59e18r9': {
      'en': 'All Others',
      'hi': 'बाकी सब',
      'kn': 'ಎಲ್ಲಾ ಇತರೆ',
    },
    '29t8z3gs': {
      'en': 'Air Force 1',
      'hi': 'वायु सेना 1',
      'kn': 'ವಾಯುಪಡೆ 1',
    },
    'cjm1pg1m': {
      'en': 'Feb 15, 2022',
      'hi': 'फ़रवरी 15, 2022',
      'kn': 'ಫೆಬ್ರವರಿ 15, 2022',
    },
    'bauus3vl': {
      'en': '\$552.20',
      'hi': '\$552.20',
      'kn': '\$552.20',
    },
    'm78ynt23': {
      'en': 'Lebron 19',
      'hi': 'लेब्रोन 19',
      'kn': 'ಲೆಬ್ರಾನ್ 19',
    },
    '3ch6x59t': {
      'en': 'Feb 15, 2022',
      'hi': 'फ़रवरी 15, 2022',
      'kn': 'ಫೆಬ್ರವರಿ 15, 2022',
    },
    'fvxuq5xm': {
      'en': '\$59.20',
      'hi': '\$59.20',
      'kn': '\$59.20',
    },
    '35j2klpw': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'kn': 'ಪ್ರೊಫೈಲ್',
    },
    'ryw0q8sf': {
      'en': 'Total Purchases',
      'hi': 'कुल खरीद',
      'kn': 'ಒಟ್ಟು ಖರೀದಿಗಳು',
    },
    '9dhwb4yo': {
      'en': 'Trade Assets',
      'hi': 'व्यापार संपत्ति',
      'kn': 'ವ್ಯಾಪಾರ ಸ್ವತ್ತುಗಳು',
    },
    '0m6hbj03': {
      'en': 'Buy Assets',
      'hi': 'संपत्तियां खरीदें',
      'kn': 'ಸ್ವತ್ತುಗಳನ್ನು ಖರೀದಿಸಿ',
    },
    '98yvwx79': {
      'en': 'Account Settings',
      'hi': 'अकाउंट सेटिंग',
      'kn': 'ಖಾತೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
    },
    '97hdiwvk': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    'pldctkiy': {
      'en': 'Rewards',
      'hi': 'पुरस्कार',
      'kn': 'ಪ್ರತಿಫಲಗಳು',
    },
    'ay47uq9x': {
      'en': 'Theme',
      'hi': 'विषय',
      'kn': 'ಥೀಮ್',
    },
    '2u7ywqpa': {
      'en': 'Light/Dark',
      'hi': 'हल्का गहरा',
      'kn': 'ಬೆಳಕು/ಕತ್ತಲು',
    },
    'i8505tvr': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    'n1sg8rom': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮುಖಪುಟ',
    },
  },
  // UpdatePreferences
  {
    'z5pjcv89': {
      'en': 'Books',
      'hi': '',
      'kn': '',
    },
    '60hxnqsw': {
      'en': 'Travel',
      'hi': '',
      'kn': '',
    },
    '0vhays57': {
      'en': 'Toys',
      'hi': '',
      'kn': '',
    },
    'vqz6ty30': {
      'en': 'Grocery',
      'hi': '',
      'kn': '',
    },
    'zixmdnxw': {
      'en': 'Fashion',
      'hi': '',
      'kn': '',
    },
    '96acrkps': {
      'en': 'Mobile Phones',
      'hi': '',
      'kn': '',
    },
    'lc7vu0v0': {
      'en': 'Kitchen',
      'hi': '',
      'kn': '',
    },
    '8tiruphi': {
      'en': 'Health',
      'hi': '',
      'kn': '',
    },
    'wtnsaria': {
      'en': 'Beauty',
      'hi': '',
      'kn': '',
    },
    'mhwv78rj': {
      'en': 'Sports',
      'hi': '',
      'kn': '',
    },
    'kb6ph2t9': {
      'en': 'Audio',
      'hi': '',
      'kn': '',
    },
    'ytrit0qu': {
      'en': 'Add your preferences:',
      'hi': '',
      'kn': '',
    },
    'ygnbunp0': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // Search1
  {
    '6osaiqru': {
      'en': 'Best',
      'hi': 'श्रेष्ठ',
      'kn': 'ಅತ್ಯುತ್ತಮ',
    },
    'qo086mez': {
      'en': 'Recomendations',
      'hi': 'सिफारिशों',
      'kn': 'ಶಿಫಾರಸುಗಳು',
    },
    'v7hqvyes': {
      'en': 'All Others',
      'hi': 'बाकी सब',
      'kn': 'ಎಲ್ಲಾ ಇತರೆ',
    },
    '5g6rdgrx': {
      'en': 'Search Results',
      'hi': '',
      'kn': '',
    },
    'j062pndp': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // AIChatbot
  {
    '1pr9rwe2': {
      'en': 'DealMaker',
      'hi': '',
      'kn': '',
    },
    'xxff5y76': {
      'en': 'Life is Enjoy',
      'hi': '',
      'kn': '',
    },
    'uvtaw8z0': {
      'en': 'How can I help you today ...',
      'hi': '',
      'kn': '',
    },
    '5ifgw87y': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // Miscellaneous
  {
    'a1m6pajl': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'dct4vdjy': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'tlirmn8c': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '043gsqmj': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'v2uhegi8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'tirq15jp': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'fincx3a5': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'y8bt9w3i': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '22doy2wo': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7do5hhv8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5wmiaoj5': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5y3bxvs1': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '3ufi03kr': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ga9k3akh': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '1w4n4yxx': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7klm5sdy': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'mwfj4kdt': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'y1mhlami': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ktito5f1': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'dxf7fg9w': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'fc3hhwgu': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'bnov6wkd': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'c8in2p0k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5p20len1': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7hw1y07b': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
