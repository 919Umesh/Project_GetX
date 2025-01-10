import 'package:get/get.dart';
import 'package:get_test/Screens/client/clientprofile/create_client.dart';
import 'package:get_test/Screens/create_product/create_product_screen.dart';
import 'package:get_test/Screens/flutter_quill/flutter_quill.dart';
import 'package:get_test/Screens/get_customer/get_customer_page.dart';
import 'package:get_test/Screens/homepage/home_page.dart';
import 'package:get_test/Screens/homepage/managerpages/inventory/create_inventory_page.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_report_detail.dart';
import 'package:get_test/Screens/homepage/managerpages/reports/create_report_page.dart';
import 'package:get_test/Screens/order_List/order_List_Screen.dart';
import 'package:get_test/Screens/project_homepage/project_homepage.dart';
import '../Screens/client/clienthome/client_home.dart';
import '../Screens/client/clienthome/client_profile.dart';
import '../Screens/create_customer/create_customer_page.dart';
import '../Screens/create_event/create_event_page.dart';
import '../Screens/events/events_screen.dart';
import '../Screens/homepage/managerpages/createproject/create_project_page.dart';
import '../Screens/homepage/managerpages/manager_profile.dart';
import '../Screens/login/login_screeb_admin.dart';
import '../Screens/login/login_screen.dart';
import '../Screens/on_boarding/on_boarding_screen.dart';
import '../Screens/project_homepage/create_project_local/create_project_local_page.dart';
import '../Screens/project_homepage/search_project/search_project_page.dart';

class Routes {
  Routes._();

  static const String homePageAdmin = '/homePageAdmin';
  static const String signin = '/signin';
  static const String signupadmin = '/signupadmin';
  static const String createProjectPage = '/createProjectPage';
  static const String projectDetailWrapper = '/projectDetailWrapper';
  static const String projectReportDetailPage = '/projectReportDetailPage';
  static const String createReport = '/createReport';
  static const String createInventory = '/createInventory';
  static const String managerProfile = '/managerProfile';
  static const String clientHome = '/clientHome';
  static const String clientProfile = '/clientProfile';
  static const String createClient = '/createClient';
  static const String orderReport = '/orderReport';
  static const String createProduct = '/createProduct';
  static const String createCustomer = '/createCustomer';
  static const String getCustomer = '/getCustomer';
  static const String getQuill = '/getQuill';
  static const String getProjectHomepageAdmin = '/getProjectHomepageAdmin';
  static const String createProjectLocal = '/createProjectLocal';
  static const String projectSearchPage = '/projectSearchPage';
  static const String onBoardingPage = '/onBoardingPage';
  static const String eventPage = '/eventPage';
  static const String createEventPage = '/createEventPage';

  static final routes = [
    GetPage(name: signin, page: () => const LoginScreen()),
    GetPage(name: signupadmin, page: () => const LoginScreenAdmin()),
    GetPage(name: homePageAdmin, page: () => const HomePageAdmin()),
    GetPage(name: createProjectPage, page: () => const CreateProjectPage()),
    GetPage(name: projectDetailWrapper, page: () => const ProjectDetailWrapper()),
    GetPage(name: projectReportDetailPage, page: () => const ProjectReportDetailPage()),
    GetPage(name: createReport, page: () => const CreateReportPage()),
    GetPage(name: createInventory, page: () => const CreateInventorytPage()),
    GetPage(name: managerProfile, page: () => const ManagerProfile()),
    GetPage(name: clientHome, page: () => const ClientHome()),
    GetPage(name: clientProfile, page: () => const ClientProfile()),
    GetPage(name: createClient, page: () => const CreateClientPage()),
    GetPage(name: orderReport, page: () => const OrderListScreen()),
    GetPage(name: createProduct, page: () =>  const CreateProductPage()),
    GetPage(name: createCustomer, page: () =>   const CreateCustomerPage()),
    GetPage(name: getCustomer, page: () =>  const GetCustomerPage()),
    GetPage(name: getQuill, page: () =>  SampleEditor()),
    GetPage(name: getProjectHomepageAdmin, page: () =>  const ProjectHomepageAdmin()),
    GetPage(name: createProjectLocal, page: () =>  const CreateProjectLocalPage()),
    GetPage(name: projectSearchPage, page: () =>  const ProjectSearchPage()),
    GetPage(name: onBoardingPage, page: () =>  const OnBoardingScreen()),
    GetPage(name: eventPage, page: () =>  const GetEventsPage()),
    GetPage(name: createEventPage, page: () =>  const CreateEventPage()),
  ];
}
