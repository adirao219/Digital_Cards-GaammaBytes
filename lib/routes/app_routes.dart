import 'package:digitalcards_gaammabytes/presentation/home_onboarding_screen/home_onboarding_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/forgot_passwordone_screen/forgot_passwordone_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/forgot_passwordone_one_screen/forgot_passwordone_one_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/forgot_passwordtwo_screen/forgot_passwordtwo_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/regiter_page_screen/regiter_page_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/verifiaction_page_screen/verifiaction_page_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/signup_page_screen/signup_page_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/home_page_screen/home_page_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/select_template_screen/select_template_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/my_digital_cards_screen/my_digital_cards_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/my_e_greeting_cards_screen/my_e_greeting_cards_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/make_payment_screen/make_payment_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/change_password_screen/change_password_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/search_popupone_screen/search_popupone_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/search_popuptwo_screen/search_popuptwo_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/image_modify_screen/image_modify_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/basic_card_entry_one_screen/basic_card_entry_one_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/card_entryone_screen/card_entryone_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/card_entrytwo_screen/card_entrytwo_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/customizationone_screen/customizationone_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/e_greeting_card_options_screen/e_greeting_card_options_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/customization_screen/customization_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/digital_card_options_screen/digital_card_options_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/basic_card_entry_screen/basic_card_entry_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/basic_greeting_entry_screen/basic_greeting_entry_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/card_preview_screen/card_preview_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/helpone_screen/helpone_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/footer_screen/footer_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/icon_group_screen/icon_group_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/link_screen/link_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/advanced_screen/advanced_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/share_screen/share_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/bands_screen/bands_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/bands_one_screen/bands_one_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_link_screen/band_link_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_note_screen/band_note_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_map_screen/band_map_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_video_screen/band_video_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_picture_screen/band_picture_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_contactband_screen/band_contactband_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_icongroup_screen/band_icongroup_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_banka_cdetails_screen/band_banka_cdetails_screen.dart';
import 'package:digitalcards_gaammabytes/presentation/band_upicard_screen/band_upicard_screen.dart';

import 'package:digitalcards_gaammabytes/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:get/get.dart';

import '../presentation/location_selection/location_selection.dart';
import '../presentation/html_editing_screen/html_editing_screen.dart';

class AppRoutes {
  static const String homeOnboardingScreen = '/home_onboarding_screen';

  static const String forgotPasswordoneScreen = '/forgot_passwordone_screen';

  static const String forgotPasswordoneOneScreen =
      '/forgot_passwordone_one_screen';

  static const String forgotPasswordtwoScreen = '/forgot_passwordtwo_screen';

  static const String selectTemplateScreen = '/select_template_screen';

  static const String regiterPageScreen = '/regiter_page_screen';

  static const String verifiactionPageScreen = '/verifiaction_page_screen';

  static const String signupPageScreen = '/signup_page_screen';

  static const String homePageScreen = '/home_page_screen';

  static const String locationselection = '/location_selection';

  static const String myProfileScreen = '/my_profile_screen';

  static const String myDigitalCardsScreen = '/my_digital_cards_screen';

  static const String myEGreetingCardsScreen = '/my_e_greeting_cards_screen';

  static const String makePaymentScreen = '/make_payment_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String searchPopuponeScreen = '/search_popupone_screen';

  static const String searchPopuptwoScreen = '/search_popuptwo_screen';

  static const String imageModifyScreen = '/image_modify_screen';

  static const String basicCardEntryOneScreen = '/basic_card_entry_one_screen';

  static const String cardEntryoneScreen = '/card_entryone_screen';

  static const String cardEntrytwoScreen = '/card_entrytwo_screen';

  static const String customizationoneScreen = '/customizationone_screen';

  static const String eGreetingCardOptionsScreen =
      '/e_greeting_card_options_screen';

  static const String htmlEditor = '/html_editing_screen';
  static const String customizationScreen = '/customization_screen';

  static const String digitalCardOptionsScreen = '/digital_card_options_screen';

  static const String basicCardEntryScreen = '/basic_card_entry_screen';

  static const String basicGreetingEntryScreen = '/basic_greeting_entry_screen';

  static const String cardPreviewScreen = '/card_preview_screen';

  static const String helponeScreen = '/helpone_screen';

  static const String footerScreen = '/footer_screen';

  static const String iconGroupScreen = '/icon_group_screen';

  static const String linkScreen = '/link_screen';

  static const String advancedScreen = '/advanced_screen';

  static const String shareScreen = '/share_screen';

  static const String bandsScreen = '/bands_screen';

  static const String bandsOneScreen = '/bands_one_screen';

  static const String bandLinkScreen = '/band_link_screen';

  static const String bandNoteScreen = '/band_note_screen';

  static const String bandMapScreen = '/band_map_screen';

  static const String bandVideoScreen = '/band_video_screen';

  static const String bandPictureScreen = '/band_picture_screen';

  static const String bandContactbandScreen = '/band_contactband_screen';

  static const String bandIcongroupScreen = '/band_icongroup_screen';

  static const String bandBankaCdetailsScreen = '/band_banka_cdetails_screen';

  static const String bandUpicardScreen = '/band_upicard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homeOnboardingScreen,
      page: () => HomeOnboardingScreen(),
    ),
    GetPage(
      name: forgotPasswordoneScreen,
      page: () => ForgotPasswordoneScreen(),
    ),
    GetPage(
      name: forgotPasswordoneOneScreen,
      page: () => ForgotPasswordoneOneScreen(),
    ),
    GetPage(
      name: forgotPasswordtwoScreen,
      page: () => ForgotPasswordtwoScreen(),
    ),
    GetPage(
      name: regiterPageScreen,
      page: () => RegiterPageScreen(),
    ),
    GetPage(
      name: verifiactionPageScreen,
      page: () => VerifiactionPageScreen(),
    ),
    GetPage(
      name: signupPageScreen,
      page: () => SignupPageScreen(),
    ),
    GetPage(
      name: homePageScreen,
      page: () => HomePageScreen(),
    ),
    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
    ),
    GetPage(
      name: myDigitalCardsScreen,
      page: () => MyDigitalCardsScreen(),
    ),
    GetPage(
      name: myEGreetingCardsScreen,
      page: () => MyEGreetingCardsScreen(),
    ),
    GetPage(
      name: makePaymentScreen,
      page: () => MakePaymentScreen(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: searchPopuponeScreen,
      page: () => SearchPopuponeScreen(),
    ),
    GetPage(
      name: searchPopuptwoScreen,
      page: () => SearchPopuptwoScreen(),
    ),
    GetPage(
      name: imageModifyScreen,
      page: () => ImageModifyScreen(),
    ),
    GetPage(
      name: basicCardEntryOneScreen,
      page: () => BasicCardEntryOneScreen(),
    ),
    GetPage(
      name: cardEntryoneScreen,
      page: () => CardEntryoneScreen(),
    ),
    GetPage(
      name: cardEntrytwoScreen,
      page: () => CardEntrytwoScreen(),
    ),
    GetPage(
      name: customizationoneScreen,
      page: () => CustomizationoneScreen(),
    ),
    GetPage(
      name: eGreetingCardOptionsScreen,
      page: () => EGreetingCardOptionsScreen(),
    ),
    GetPage(
        name: htmlEditor,
        page: () => HtmlEditorScreen()),
    GetPage(
      name: customizationScreen,
      page: () => CustomizationScreen(),
    ),
    GetPage(
      name: digitalCardOptionsScreen,
      page: () => DigitalCardOptionsScreen(),
    ),
    GetPage(
      name: basicCardEntryScreen,
      page: () => BasicCardEntryScreen(),
    ),
    GetPage(
      name: basicGreetingEntryScreen,
      page: () => BasicGreetingEntryScreen(),
    ),
    GetPage(
      name: cardPreviewScreen,
      page: () => CardPreviewScreen(),
    ),
    GetPage(
      name: selectTemplateScreen,
      page: () => SelectTemplateScreen(),
    ),
    GetPage(
      name: helponeScreen,
      page: () => HelponeScreen(),
    ),
    GetPage(
      name: footerScreen,
      page: () => FooterScreen(),
    ),
    GetPage(
      name: iconGroupScreen,
      page: () => IconGroupScreen(),
    ),
    GetPage(
      name: linkScreen,
      page: () => LinkScreen(),
    ),
    GetPage(
      name: advancedScreen,
      page: () => AdvancedScreen(),
    ),
    GetPage(
      name: shareScreen,
      page: () => ShareScreen(),
    ),
    GetPage(
      name: locationselection,
      page: () => LocationSelectionScreen(),
    ),
    GetPage(
      name: bandsScreen,
      page: () => BandsScreen(),
    ),
    GetPage(
      name: bandsOneScreen,
      page: () => BandsOneScreen(),
    ),
    GetPage(
      name: bandLinkScreen,
      page: () => BandLinkScreen(),
    ),
    GetPage(
      name: bandNoteScreen,
      page: () => BandNoteScreen(),
    ),
    GetPage(
      name: bandMapScreen,
      page: () => BandMapScreen(),
    ),
    GetPage(
      name: bandVideoScreen,
      page: () => BandVideoScreen(),
    ),
    GetPage(
      name: bandPictureScreen,
      page: () => BandPictureScreen(),
    ),
    GetPage(
      name: bandContactbandScreen,
      page: () => BandContactbandScreen(),
    ),
    GetPage(
      name: bandIcongroupScreen,
      page: () => BandIcongroupScreen(),
    ),
    GetPage(
      name: bandBankaCdetailsScreen,
      page: () => BandBankaCdetailsScreen(),
    ),
    GetPage(
      name: bandUpicardScreen,
      page: () => BandUpicardScreen(),
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeOnboardingScreen(),
    )
  ];
}
