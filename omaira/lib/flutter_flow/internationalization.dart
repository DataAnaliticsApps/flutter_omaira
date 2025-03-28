import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'de'];

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
    String? esText = '',
    String? enText = '',
    String? deText = '',
  }) =>
      [esText, enText, deText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'es': 'Welcome back',
      'de': '',
      'en': '',
    },
    'fzxvw3mu': {
      'es': 'Login to access your account below.',
      'de': '',
      'en': '',
    },
    'a9j78va9': {
      'es': 'Email Address',
      'de': '',
      'en': '',
    },
    'i7f18cve': {
      'es': 'Enter your email...',
      'de': '',
      'en': '',
    },
    'wztjmbn8': {
      'es': 'Password',
      'de': '',
      'en': '',
    },
    'lw1jpm1f': {
      'es': 'Enter your password...',
      'de': '',
      'en': '',
    },
    'm2xyjvuf': {
      'es': 'Forgot Password?',
      'de': '',
      'en': '',
    },
    'qbmoi1av': {
      'es': 'Login',
      'de': '',
      'en': '',
    },
    'cjqb8ial': {
      'es': 'Don\'t have an account?',
      'de': '',
      'en': '',
    },
    'a0iimirx': {
      'es': 'Create',
      'de': '',
      'en': '',
    },
    '2bb3vct7': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'es': 'Get Started',
      'de': '',
      'en': '',
    },
    'oitrrwgg': {
      'es': 'Create your account below.',
      'de': '',
      'en': '',
    },
    'gcwdqm4g': {
      'es': 'Email Address',
      'de': '',
      'en': '',
    },
    'iam0xgwx': {
      'es': 'Enter your email...',
      'de': '',
      'en': '',
    },
    'bqv15dcf': {
      'es': 'Password',
      'de': '',
      'en': '',
    },
    'joih97mn': {
      'es': 'Enter your password...',
      'de': '',
      'en': '',
    },
    'rzpiwq9p': {
      'es': 'Confirm Password',
      'de': '',
      'en': '',
    },
    'eyfkffka': {
      'es': 'Enter your password...',
      'de': '',
      'en': '',
    },
    '5kmjfwsk': {
      'es': 'Create Account',
      'de': '',
      'en': '',
    },
    '3twynvfz': {
      'es': 'Login',
      'de': '',
      'en': '',
    },
    '9ssznj0g': {
      'es': 'Already have an account?',
      'de': '',
      'en': '',
    },
    'momge5oj': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'es': 'Complete Profile',
      'de': '',
      'en': '',
    },
    'r6npjsue': {
      'es': 'Upload a photo for us to easily identify you.',
      'de': '',
      'en': '',
    },
    'sdptn7dd': {
      'es': 'Your Name',
      'de': '',
      'en': '',
    },
    'n636qnrx': {
      'es': 'Your Age',
      'de': '',
      'en': '',
    },
    's7yvjzbs': {
      'es': 'i.e. 34',
      'de': '',
      'en': '',
    },
    '72ii0waq': {
      'es': 'Your Title',
      'de': '',
      'en': '',
    },
    'pf8glhkg': {
      'es': 'What is your position?',
      'de': '',
      'en': '',
    },
    'hbhd3bdt': {
      'es': 'Complete Profile',
      'de': '',
      'en': '',
    },
    'w75dikic': {
      'es': 'Skip for Now',
      'de': '',
      'en': '',
    },
    '1eac148w': {
      'es': 'Field is required',
      'de': '',
      'en': '',
    },
    'ew7dbn3s': {
      'es': 'Field is required',
      'de': '',
      'en': '',
    },
    'jhhlgzk5': {
      'es': 'Field is required',
      'de': '',
      'en': '',
    },
    '4k3jnl38': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'es': 'Forgot Password',
      'de': '',
      'en': '',
    },
    'xaiad71o': {
      'es':
          'Enter the email associated with your account and we will send you a verification code.',
      'de': '',
      'en': '',
    },
    'u4nuk910': {
      'es': 'Email Address',
      'de': '',
      'en': '',
    },
    '37kotxi0': {
      'es': 'Enter your email...',
      'de': '',
      'en': '',
    },
    'hiwpaze1': {
      'es': 'Send Reset Link',
      'de': '',
      'en': '',
    },
    '598b8d3m': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'es': 'Agrega tu primer producto',
      'de': '',
      'en': '',
    },
    'hxtwax0y': {
      'es':
          'Agrega tu primer producto para que puedas empezar a registrar ventas y tener control de tu inventario',
      'de': '',
      'en': '',
    },
    'mjy3ljln': {
      'es': 'Keep Track of Spending',
      'de': '',
      'en': '',
    },
    'uf9k1spp': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'de': '',
      'en': '',
    },
    '9c4outzf': {
      'es': 'Budget Analysis',
      'de': '',
      'en': '',
    },
    'q30ina4f': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'de': '',
      'en': '',
    },
    'ypt7b97g': {
      'es': 'Agregar Producto',
      'de': '',
      'en': '',
    },
    'sqd5w8h6': {
      'es': 'Skip',
      'de': '',
      'en': '',
    },
    'oo0kk9qe': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'es': 'Agregar Producto',
      'de': '',
      'en': '',
    },
    'qk15nsmc': {
      'es': 'Nombre del producto',
      'de': '',
      'en': '',
    },
    'hllqlv4m': {
      'es': 'Cantidad Inicial',
      'de': '',
      'en': '',
    },
    'ti84p4xt': {
      'es': 'Codigo del producto',
      'de': '',
      'en': '',
    },
    'zvj0b1cr': {
      'es': 'Valor venta del producto',
      'de': '',
      'en': '',
    },
    'v2shqq3z': {
      'es': 'Agregar Producto',
      'de': '',
      'en': '',
    },
    'knu0nxbp': {
      'es': 'Tap above to complete request',
      'de': '',
      'en': '',
    },
    '79au6dyg': {
      'es': 'Please enter an amount',
      'de': '',
      'en': '',
    },
    'cs1cy7tg': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // MY_Budgets
  {
    'hfwbiivj': {
      'es': 'Income',
      'de': '',
      'en': '',
    },
    'jjj3ydb1': {
      'es': '+\$12,402',
      'de': '',
      'en': '',
    },
    'ns4vt604': {
      'es': '4.5% ',
      'de': '',
      'en': '',
    },
    'wcsc04wg': {
      'es': 'Spending',
      'de': '',
      'en': '',
    },
    'a5zzlh8f': {
      'es': '-\$8,392',
      'de': '',
      'en': '',
    },
    '8xnbsdnb': {
      'es': '4.5% ',
      'de': '',
      'en': '',
    },
    'd9vk6vfm': {
      'es': 'TextField',
      'de': '',
      'en': '',
    },
    'loiabauk': {
      'es': 'Buscar  porducto',
      'de': '',
      'en': '',
    },
    '6zjktmvo': {
      'es': 'UPC Code',
      'de': '',
      'en': '',
    },
    '0sr384qd': {
      'es': 'Total Inventario',
      'de': '',
      'en': '',
    },
    'f4ic1jjh': {
      'es': 'Total Vendido',
      'de': '',
      'en': '',
    },
    '5v4v8l1x': {
      'es': 'Valor',
      'de': '',
      'en': '',
    },
    '8ulcl848': {
      'es': 'Venta',
      'de': '',
      'en': '',
    },
    'm6ipb3u4': {
      'es': 'Venta',
      'de': '',
      'en': '',
    },
    'k1yq8fjr': {
      'es': '',
      'de': '',
      'en': '',
    },
    'ah4t7cpx': {
      'es': 'Advertising Budget',
      'de': '',
      'en': '',
    },
    '0tsohlub': {
      'es': '\$3,000',
      'de': '',
      'en': '',
    },
    '5y1u9kxg': {
      'es': '4 Days Left',
      'de': '',
      'en': '',
    },
    '4jknsif6': {
      'es': 'Total Spent',
      'de': '',
      'en': '',
    },
    'o9rmbnd7': {
      'es': '\$2,502',
      'de': '',
      'en': '',
    },
    'fn6kvat8': {
      'es': 'Advertising Budget',
      'de': '',
      'en': '',
    },
    '6uht91yb': {
      'es': '\$3,000',
      'de': '',
      'en': '',
    },
    '1qm6rhod': {
      'es': '4 Days Left',
      'de': '',
      'en': '',
    },
    '65tvvjcw': {
      'es': 'Total Spent',
      'de': '',
      'en': '',
    },
    'c03678eq': {
      'es': '\$2,502',
      'de': '',
      'en': '',
    },
    'seg39bqk': {
      'es': 'Inventario',
      'de': '',
      'en': '',
    },
    'ofz2zvlc': {
      'es': '•',
      'de': '',
      'en': '',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'es': 'My Account',
      'de': '',
      'en': '',
    },
    'i61y9ibx': {
      'es': 'Edit Profile',
      'de': '',
      'en': '',
    },
    '03k0vw86': {
      'es': 'Change Password',
      'de': '',
      'en': '',
    },
    '6w6wv95p': {
      'es': 'Notification Settings',
      'de': '',
      'en': '',
    },
    '9aogde79': {
      'es': 'Tutorial',
      'de': '',
      'en': '',
    },
    'eojlfs66': {
      'es': 'Privacy Policy',
      'de': '',
      'en': '',
    },
    '2ll42t1u': {
      'es': 'Dark Mode',
      'de': '',
      'en': '',
    },
    '8d386226': {
      'es': 'Light Mode',
      'de': '',
      'en': '',
    },
    '8srr2k0j': {
      'es': '•',
      'de': '',
      'en': '',
    },
  },
  // Nueva_venta
  {
    'qywon4k1': {
      'es': 'Venta Nueva',
      'de': '',
      'en': '',
    },
    'oz79nf1a': {
      'es': 'Cantidad',
      'de': '',
      'en': '',
    },
    'kh6qycqj': {
      'es': 'Agregar Venta',
      'de': '',
      'en': '',
    },
    'gzhmf1t6': {
      'es': 'Please enter an amount',
      'de': '',
      'en': '',
    },
    '7trcsuiu': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'es': 'Editar Producto',
      'de': '',
      'en': '',
    },
    '5xgwlwjj': {
      'es': 'Amount',
      'de': '',
      'en': '',
    },
    '6f0ktewz': {
      'es': 'Nombre del producto',
      'de': '',
      'en': '',
    },
    '0w7xoq5w': {
      'es': 'TextField',
      'de': '',
      'en': '',
    },
    'awqzljy1': {
      'es': ' ',
      'de': '',
      'en': '',
    },
    'apy73mx7': {
      'es': 'Valor del Producto',
      'de': '',
      'en': '',
    },
    '5t88wpsg': {
      'es': 'TextField',
      'de': '',
      'en': '',
    },
    '2zt0clrm': {
      'es': ' ',
      'de': '',
      'en': '',
    },
    '3eftlbxd': {
      'es': 'Editar Producto',
      'de': '',
      'en': '',
    },
    '4atjd0yh': {
      'es': 'Tap above to save your changes.',
      'de': '',
      'en': '',
    },
    'pg18rcyu': {
      'es': 'Please enter an amount',
      'de': '',
      'en': '',
    },
    '12if11ss': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // editProfile
  {
    'zoxan2gi': {
      'es': 'Change Photo',
      'de': '',
      'en': '',
    },
    '3p9y21e2': {
      'es': 'Your Name',
      'de': '',
      'en': '',
    },
    'dw9gmjdc': {
      'es': 'Please enter a valid number...',
      'de': '',
      'en': '',
    },
    'z4fstn5l': {
      'es': 'Email Address',
      'de': '',
      'en': '',
    },
    'jozgvwyg': {
      'es': 'Your email',
      'de': '',
      'en': '',
    },
    '8h1cjk5a': {
      'es': 'Your Age',
      'de': '',
      'en': '',
    },
    '5v21r6gb': {
      'es': 'i.e. 34',
      'de': '',
      'en': '',
    },
    'zvymbfia': {
      'es': 'Your Title',
      'de': '',
      'en': '',
    },
    'i6edcl52': {
      'es': 'Save Changes',
      'de': '',
      'en': '',
    },
    'x95ni8g6': {
      'es': 'Edit Profile',
      'de': '',
      'en': '',
    },
    '59naq8ur': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'es': 'Change Password',
      'de': '',
      'en': '',
    },
    '2b97u8y5': {
      'es':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'de': '',
      'en': '',
    },
    'ajy1c3r9': {
      'es': 'Email Address',
      'de': '',
      'en': '',
    },
    'hsqfoxya': {
      'es': 'Enter your email...',
      'de': '',
      'en': '',
    },
    'if4pz6lm': {
      'es': 'Send Reset Link',
      'de': '',
      'en': '',
    },
    '5tvk9lv0': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'es': 'Notifications',
      'de': '',
      'en': '',
    },
    'r72zvrv5': {
      'es':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'de': '',
      'en': '',
    },
    'gjygkr0n': {
      'es': 'Push Notifications',
      'de': '',
      'en': '',
    },
    '3y3yhxbk': {
      'es':
          'Receive Push notifications from our application on a semi regular basis.',
      'de': '',
      'en': '',
    },
    '1ytebj35': {
      'es': 'Email Notifications',
      'de': '',
      'en': '',
    },
    '9lvh5nst': {
      'es':
          'Receive email notifications from our marketing team about new features.',
      'de': '',
      'en': '',
    },
    '69d2j74u': {
      'es': 'Location Services',
      'de': '',
      'en': '',
    },
    '3k8cuv0d': {
      'es':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'de': '',
      'en': '',
    },
    'isgrgbfs': {
      'es': 'Save Changes',
      'de': '',
      'en': '',
    },
    'a96mlyeh': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'es': 'Privacy Policy',
      'de': '',
      'en': '',
    },
    'fvsfg5on': {
      'es': 'How we use your data',
      'de': '',
      'en': '',
    },
    'nbiyrnzl': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'de': '',
      'en': '',
    },
    'oks4x95o': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'es': 'Tutorial',
      'de': '',
      'en': '',
    },
    'o6prpb1q': {
      'es': 'Crea Tu Inventario',
      'de': '',
      'en': '',
    },
    '292pbdw7': {
      'es': 'Crea tu inventario para tu negocio escaneando solo el codigo',
      'de': '',
      'en': '',
    },
    'b10xvuf9': {
      'es': 'Keep Track of Spending',
      'de': '',
      'en': '',
    },
    't6k1smsm': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'de': '',
      'en': '',
    },
    'u8xxj427': {
      'es': 'Budget Analysis',
      'de': '',
      'en': '',
    },
    'iqi0pkmb': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'de': '',
      'en': '',
    },
    'uydm0fnm': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'es': 'Welcome,',
      'de': '',
      'en': '',
    },
    'izgc0c6r': {
      'es': 'Andrew',
      'de': '',
      'en': '',
    },
    '30kx6e5v': {
      'es': 'Your latest updates are below.',
      'de': '',
      'en': '',
    },
    'y7zomzzp': {
      'es': 'Quick Service',
      'de': '',
      'en': '',
    },
    'rfozud9v': {
      'es': 'Leer QR',
      'de': '',
      'en': '',
    },
    '3hh32od3': {
      'es': 'Cancel',
      'de': '',
      'en': '',
    },
    'pcrarg0a': {
      'es': 'Agregar Prod',
      'de': '',
      'en': '',
    },
    'zmjsfzgg': {
      'es': 'Inventario',
      'de': '',
      'en': '',
    },
    'iqt6zgqt': {
      'es': 'Total Income',
      'de': '',
      'en': '',
    },
    'e3vxso88': {
      'es': '\$25,202',
      'de': '',
      'en': '',
    },
    'dfjtbkbo': {
      'es': 'Top Ventas ultimos 7 dias',
      'de': '',
      'en': '',
    },
    'g7t9krj7': {
      'es': 'Go Far Rewards',
      'de': '',
      'en': '',
    },
    'vupu5y5p': {
      'es': 'Income',
      'de': '',
      'en': '',
    },
    'bj5qnrj5': {
      'es': '\$50.00',
      'de': '',
      'en': '',
    },
    'd1n5mbq7': {
      'es': 'Hello World',
      'de': '',
      'en': '',
    },
    '2thn73jc': {
      'es': 'Go Far Rewards',
      'de': '',
      'en': '',
    },
    '1fjdiibo': {
      'es': 'Income',
      'de': '',
      'en': '',
    },
    'ld7s2fpn': {
      'es': '\$50.00',
      'de': '',
      'en': '',
    },
    'ft8bu1we': {
      'es': 'Hello World',
      'de': '',
      'en': '',
    },
    '8t6ddwco': {
      'es': 'Go Far Rewards',
      'de': '',
      'en': '',
    },
    'td15kjsa': {
      'es': 'Income',
      'de': '',
      'en': '',
    },
    'qmjqp9a6': {
      'es': '\$50.00',
      'de': '',
      'en': '',
    },
    '9qc797et': {
      'es': 'Hello World',
      'de': '',
      'en': '',
    },
    '8pdmehj2': {
      'es': 'Go Far Rewards',
      'de': '',
      'en': '',
    },
    'krrhjgc4': {
      'es': 'Income',
      'de': '',
      'en': '',
    },
    '53m2u0s2': {
      'es': '\$50.00',
      'de': '',
      'en': '',
    },
    'aks5zz4f': {
      'es': 'Hello World',
      'de': '',
      'en': '',
    },
    'f3hxl69y': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // budget_DELETE
  {
    'pozov0xz': {
      'es': 'Eliminar Producto',
      'de': '',
      'en': '',
    },
    'aptjmof0': {
      'es': 'Si eliminas el producto se perdera el historial de ventas',
      'de': '',
      'en': '',
    },
    '9l7pbjcj': {
      'es': 'Eliminar Producto',
      'de': '',
      'en': '',
    },
    'u0kr38at': {
      'es': 'Tap above to remove this bude',
      'de': '',
      'en': '',
    },
    'b1xp801p': {
      'es': 'Home',
      'de': '',
      'en': '',
    },
  },
  // dash
  {
    'mqurx32n': {
      'es': 'Numero de Ventas',
      'de': '',
      'en': '',
    },
    '1nojyrgq': {
      'es': '255',
      'de': '',
      'en': '',
    },
    '1v7rbbif': {
      'es': '32.2%',
      'de': '',
      'en': '',
    },
    'plgp80m0': {
      'es': 'Numero de producto',
      'de': '',
      'en': '',
    },
    'wzrlvjly': {
      'es': '67',
      'de': '',
      'en': '',
    },
    'ir8kbmaa': {
      'es': '45.5%',
      'de': '',
      'en': '',
    },
    '5zn0abzg': {
      'es': 'Recent Activity',
      'de': '',
      'en': '',
    },
    'aqr66p1y': {
      'es': 'Below is an overview of tasks & activity completed.',
      'de': '',
      'en': '',
    },
    'czsjr69f': {
      'es': 'Unidades',
      'de': '',
      'en': '',
    },
    'qw35b28c': {
      'es': 'Ingresos',
      'de': '',
      'en': '',
    },
    'v7w4jh4f': {
      'es': 'Top 5 mas vendidos',
      'de': '',
      'en': '',
    },
    '0sv3lqa4': {
      'es': 'Below are some of the upcoming tasks for your team.',
      'de': '',
      'en': '',
    },
    '2hdd1hyz': {
      'es': 'Add New',
      'de': '',
      'en': '',
    },
    '2xqh2urh': {
      'es': 'Producto',
      'de': '',
      'en': '',
    },
    'dbcd7g4c': {
      'es': '# Vendidos',
      'de': '',
      'en': '',
    },
    'xm55vdji': {
      'es': '# Restantes',
      'de': '',
      'en': '',
    },
    'rj5qe1e8': {
      'es': 'Edit Column 1',
      'de': '',
      'en': '',
    },
    'n05ynvs0': {
      'es': 'Edit Column 2',
      'de': '',
      'en': '',
    },
    'bnh5o4g5': {
      'es': 'Edit Column 3',
      'de': '',
      'en': '',
    },
    '3wsqnb5d': {
      'es': 'Transacciones',
      'de': '',
      'en': '',
    },
    'ehl95fyp': {
      'es': 'Productos vendidos recientemente',
      'de': '',
      'en': '',
    },
    'nugs5inq': {
      'es': 'Rudy Fernandez',
      'de': '',
      'en': '',
    },
    '2z7tmye5': {
      'es': '4m ago',
      'de': '',
      'en': '',
    },
    'xbb8mrra': {
      'es': 'Completed ',
      'de': '',
      'en': '',
    },
    '1bvxs99n': {
      'es': 'Marketing Plan',
      'de': '',
      'en': '',
    },
    'ma8iymau': {
      'es': 'Rudy Fernandez',
      'de': '',
      'en': '',
    },
    'iwxznb6v': {
      'es': '4m ago',
      'de': '',
      'en': '',
    },
    'p91tj3g6': {
      'es': 'Started ',
      'de': '',
      'en': '',
    },
    'v86myg7d': {
      'es': 'Marketing Plan',
      'de': '',
      'en': '',
    },
    '1cwt8pv9': {
      'es': 'Abigail Rojas',
      'de': '',
      'en': '',
    },
    'efeedbab': {
      'es': '4m ago',
      'de': '',
      'en': '',
    },
    'oyrsan8t': {
      'es': 'Assigned  ',
      'de': '',
      'en': '',
    },
    '5fom6b4y': {
      'es': 'Rudy Fernandez ',
      'de': '',
      'en': '',
    },
    'soxp4bvt': {
      'es': 'to ',
      'de': '',
      'en': '',
    },
    'if6po9jv': {
      'es': 'Marketing Plan',
      'de': '',
      'en': '',
    },
    'sexmw0rx': {
      'es': 'Abigail Rojas',
      'de': '',
      'en': '',
    },
    'iyjfu7xl': {
      'es': '4m ago',
      'de': '',
      'en': '',
    },
    '17503alx': {
      'es': 'Created a project: ',
      'de': '',
      'en': '',
    },
    'gf0sd3m8': {
      'es': 'Marketing Plan',
      'de': '',
      'en': '',
    },
    'j5dv5yqr': {
      'es': 'Liz Ambridge',
      'de': '',
      'en': '',
    },
    '0de9hskd': {
      'es': '4m ago',
      'de': '',
      'en': '',
    },
    'j6ji6d3v': {
      'es': 'Sent a plan update for ',
      'de': '',
      'en': '',
    },
    'zsn6jxt5': {
      'es': 'Marketing Plan',
      'de': '',
      'en': '',
    },
    '3lszu2un': {
      'es': 'Project Started',
      'de': '',
      'en': '',
    },
    '1u2z0ooa': {
      'es': '12d ago',
      'de': '',
      'en': '',
    },
    '4uqgzrg8': {
      'es': 'DashBoard',
      'de': '',
      'en': '',
    },
    'uol8971e': {
      'es': 'Stats',
      'de': '',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'es': '',
      'de': '',
      'en': '',
    },
    'kx9cdks4': {
      'es': '',
      'de': '',
      'en': '',
    },
    'efvtwj7k': {
      'es': '',
      'de': '',
      'en': '',
    },
    'ec5hfa1e': {
      'es': '',
      'de': '',
      'en': '',
    },
    'q5ljwvfo': {
      'es': '',
      'de': '',
      'en': '',
    },
    'j4rmwb3h': {
      'es': '',
      'de': '',
      'en': '',
    },
    '6ah1b18f': {
      'es': '',
      'de': '',
      'en': '',
    },
    '2kos1hen': {
      'es': '',
      'de': '',
      'en': '',
    },
    'qysgjupk': {
      'es': '',
      'de': '',
      'en': '',
    },
    'pwql5lcu': {
      'es': '',
      'de': '',
      'en': '',
    },
    '81mpehl8': {
      'es': '',
      'de': '',
      'en': '',
    },
    'xesxcdyq': {
      'es': '',
      'de': '',
      'en': '',
    },
    '8tdtwqxx': {
      'es': '',
      'de': '',
      'en': '',
    },
    'aox3s4fb': {
      'es': '',
      'de': '',
      'en': '',
    },
    'l8hv5a7z': {
      'es': '',
      'de': '',
      'en': '',
    },
    '4pjwb70a': {
      'es': '',
      'de': '',
      'en': '',
    },
    '0xlokf4y': {
      'es': '',
      'de': '',
      'en': '',
    },
    '8twlwiwt': {
      'es': '',
      'de': '',
      'en': '',
    },
    '9dho9spu': {
      'es': '',
      'de': '',
      'en': '',
    },
    'o2e9z6em': {
      'es': '',
      'de': '',
      'en': '',
    },
    'nw3lzic6': {
      'es': '',
      'de': '',
      'en': '',
    },
    '9q0nc9w3': {
      'es': '',
      'de': '',
      'en': '',
    },
    'emdwlli8': {
      'es': '',
      'de': '',
      'en': '',
    },
    '0usi8lck': {
      'es': '',
      'de': '',
      'en': '',
    },
    't4xzlq9q': {
      'es': '',
      'de': '',
      'en': '',
    },
    '513nj4m0': {
      'es': '',
      'de': '',
      'en': '',
    },
    'a1jxfgju': {
      'es': '',
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
