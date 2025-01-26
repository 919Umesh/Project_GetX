import 'package:get/get.dart';
import 'package:get_test/Screens/create_product/create_product_screen.dart';
import 'package:get_test/Screens/get_customer/get_customer_page.dart';
import 'package:get_test/Screens/order_List/order_List_Screen.dart';
import 'package:get_test/Screens/project_homepage/project_homepage.dart';
import '../Screens/chat/chat_screen.dart';
import '../Screens/create_customer/create_customer_page.dart';
import '../Screens/create_event/create_event_page.dart';
import '../Screens/events/events_screen.dart';
import '../Screens/get_product/get_product_page.dart';
import '../Screens/loginLocal/login_screen.dart';
import '../Screens/on_boarding/on_boarding_screen.dart';
import '../Screens/project_homepage/create_project_local/create_project_local_page.dart';
import '../Screens/project_homepage/search_project/search_project_page.dart';

class Routes {
  Routes._();
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
  static const String chatScreen = '/chatScreen';
  static const String createProductLocal = '/createProductLocal';
  static const String getProductPage = '/getProductPage';
  static const String loginLocal = '/loginLocal';

  static final routes = [

    GetPage(name: orderReport, page: () => const OrderListScreen()),
    GetPage(name: createCustomer, page: () =>   const CreateCustomerPage()),
    GetPage(name: getCustomer, page: () =>  const GetCustomerPage()),
    GetPage(name: getProjectHomepageAdmin, page: () =>  const ProjectHomepageAdmin()),
    GetPage(name: createProjectLocal, page: () =>  const CreateProjectLocalPage()),
    GetPage(name: projectSearchPage, page: () =>  const ProjectSearchPage()),
    GetPage(name: onBoardingPage, page: () =>  const OnBoardingScreen()),
    GetPage(name: eventPage, page: () =>  const GetEventsPage()),
    GetPage(name: createEventPage, page: () =>  const CreateEventPage()),
    GetPage(name: chatScreen, page: () =>  const ChatScreen()),
    GetPage(name: createProductLocal, page: () =>  CreateProductPage()),
    GetPage(name: getProductPage, page: () =>  const GetProductPage()),
    GetPage(name: loginLocal, page: () =>  const LoginLocalPage()),
  ];
}
