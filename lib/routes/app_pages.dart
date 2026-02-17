import 'package:bpls_mobile/features/dashboard/presentation/help_screen.dart';
import 'package:bpls_mobile/features/dashboard/controller/dashboard_controller.dart';
import 'package:bpls_mobile/features/listing_form/controller/household_form_controller.dart';
import 'package:bpls_mobile/features/listing_form/controller/institution_form_controller.dart';
import 'package:bpls_mobile/features/listing_form/controller/listing_form_start_controller.dart';
import 'package:bpls_mobile/features/listing_form/presentation/household_agri_step_screen.dart';
import 'package:bpls_mobile/features/listing_form/presentation/household_form_step1.dart';
import 'package:bpls_mobile/features/listing_form/presentation/institution_detail_step_screen.dart';
import 'package:bpls_mobile/features/listing_form/presentation/institution_form_step1.dart';
import 'package:bpls_mobile/features/listing_form/presentation/listing_confirmation_screen.dart';
import 'package:bpls_mobile/features/listing_form/presentation/listing_form_start_screen.dart';
import 'package:bpls_mobile/features/listing_form/presentation/listing_success_screen.dart';
import 'package:bpls_mobile/features/section_4/alu_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/aus_dhan_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/boro_dhan_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/amon_dhan_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/cal_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/carp_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/cingri_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/cow_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/dhan_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/hen_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/mango_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/mosur_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/peyaj_food_loss_screen.dart';
import 'package:bpls_mobile/features/section_4/sorisha_food_loss_screen.dart';
import 'package:bpls_mobile/features/survey/module_3_4_screen.dart';
import 'package:bpls_mobile/features/survey/second_screen_khana.dart';
import 'package:bpls_mobile/features/survey/second_screen_khana_part_two.dart';
import 'package:bpls_mobile/features/survey/second_screen_orgination.dart';
import 'package:bpls_mobile/features/survey/survey_screen.dart';
import 'package:bpls_mobile/features/survey/view_save_survey_data.dart';
import 'package:get/get.dart';
import 'package:bpls_mobile/features/home/presentation/splash_screen.dart';
import 'package:bpls_mobile/features/auth/presentation/login_screen.dart';
import 'package:bpls_mobile/features/dashboard/presentation/dashboard_screen.dart';
import 'package:bpls_mobile/features/dashboard/presentation/profile_summary_screen.dart';
import 'package:bpls_mobile/features/survey/payload_detail_screen.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const screenFoodLoss1 = '/food_loss_screen1';
  static const screenFoodLoss2 = '/food_loss_screen2';
  static const screenFoodLoss3 = '/food_loss_screen3';
  static const screenFoodLoss4 = '/food_loss_screen4';
  static const screenFoodLoss5 = '/food_loss_screen5';
  static const screenFoodLoss6 = '/food_loss_screen6';
  static const screenFoodLoss7 = '/food_loss_screen7';
  static const screenFoodLoss8 = '/food_loss_screen8';
  static const screenFoodLoss9 = '/food_loss_screen9';
  static const screenFoodLoss10 = '/food_loss_screen10';
  static const screenFoodLoss11 = '/food_loss_screen11';
  static const screenFoodLoss12 = '/food_loss_screen12';
  static const screenFoodLoss13 = '/food_loss_screen13';
  static const screenFoodLoss14 = '/food_loss_screen14';





  static const screenAmonDhan = '/amon_dhan_screen';
  static const screenBoroDhan = '/amon_boro_screen';
  static const screenAusDhan = '/amon_aus_screen';
  static const screenDhan = '/dhan_screen';
  static const screenCal = '/cal_screen';
  static const screenMosur = '/mosur_screen';
  static const screenSorisha = '/sorisha_screen';
  static const profileSummary = '/profile-summary';
  static const survey = '/survey';
  static const secondScreenKhana = '/secondKhana';
  static const secondScreenKhanaPartTwo = '/secondKhanaPartTwo';
  static const secondScreenOrganitation = '/SecondScreenOrganitation';
  static const module34Screen = '/module34Screen';
  static const module3PartOne = '/module3-part-one';
  static const module4Screen = '/module4Screen';
  static const viewSurveySaveData = '/view_survey_save_data';
  static const camera = '/camera';
  static const help = '/help';

  // Listing Section Routes
  static const detailsView = '/details-view';
  static const totalListing = '/total-listing';
  static const listingSadharon = '/listing-sadharon';
  static const listingPrathisthanik = '/listing-prathisthanik';
  static const listingServerePrerito = '/listing-servere-prerito';
  static const listingRejected = '/listing-rejected';
  static const listingAngshikShongrokkhito = '/listing-angshik-shongrokkhito';
  static const listingCompletedEconomic = '/listing-completed-economic';

  // Listing Form Routes
  static const listingFormStart = '/listing-form-start';
  static const householdAgriStep = '/household-agri-step';
  static const householdFormStep1 = '/household-form-step1';
  static const institutionFormStep1 = '/institution-form-step1';
  static const institutionDetailStep = '/institution-detail-step';
  static const listingConfirmation = '/listing-confirmation';
  static const listingSuccess = '/listing-success';
  static const payloadDetails = '/payload-details';
}

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    // GetPage(name: AppRoutes.splash, page: () => const Test2Screen()),
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.screenFoodLoss1, page: () => AmonDhanFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss2, page: () => BoroDhanFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss3, page: () => AusDhanFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss4, page: () => DhanFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss5, page: () => CalFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss6, page: () => MosurFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss7, page: () => MangoFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss8, page: () => PeyajFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss9, page: () => AluFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss10, page: () => SorishaFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss11, page: () => CarpFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss12, page: () => CingriFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss13, page: () => CowFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.screenFoodLoss14, page: () => HenFoodLossScreen(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),




    GetPage(
      name: AppRoutes.secondScreenOrganitation,
      page: () => const SecondScreenOrganitation(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    // GetPage(name: AppRoutes.module34Screen, page: () => const Module34Screen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: AppRoutes.viewSurveySaveData, page: () => ViewSaveSurveyData(data: Get.arguments['data'],isFromKhana: Get.arguments['isFromKhana'],), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: AppRoutes.secondScreenKhanaPartTwo,
      page: () => const SecondScreenKhanaPartTwo(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: AppRoutes.secondScreenKhana, page: () => const SecondScreenKhana(), transition: Transition.rightToLeftWithFade),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController(), fenix: true);
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(name: AppRoutes.survey, page: () => const SurveyScreen(), transition: Transition.fadeIn),
    GetPage(
      name: AppRoutes.profileSummary,
      page: () => const ProfileSummaryScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: AppRoutes.help, page: () => const HelpScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 300)),

    // Listing Form Pages
    GetPage(
      name: AppRoutes.listingFormStart,
      page: () => const ListingFormStartScreen(),
      binding: BindingsBuilder(() {
        // We use fenix: true or Get.put to ensure it's available
        // for the subsequent household/institution steps
        Get.lazyPut(() => ListingFormStartController(), fenix: true);
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.householdAgriStep,
      page: () => const HouseholdAgriStepScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HouseholdFormController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.householdFormStep1,
      page: () => const HouseholdFormStep1(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HouseholdFormController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.institutionFormStep1,
      page: () => const InstitutionFormStep1(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => InstitutionFormController());
      }),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.institutionDetailStep,
      page: () => const InstitutionDetailStepScreen(), // We will create this next
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.listingConfirmation,
      page: () => const ListingConfirmationScreen(), // Create this screen to show confirmation
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.listingSuccess,
      page: () => const ListingSuccessScreen(), // Create this screen to show success message
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.payloadDetails,
      page: () => const PayloadDetailScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
