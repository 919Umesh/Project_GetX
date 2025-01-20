import 'package:get/get.dart';
import 'package:get_test/Screens/create_customer/create_customer_getX.dart';
import 'package:get_test/Screens/create_product/create_product_getX.dart';
import 'package:get_test/Screens/get_customer/get_customer_getX.dart';
import 'package:get_test/Screens/homepage/homepage_controller.dart';
import 'package:get_test/Screens/homepage/managerpages/inventory/create_inventory_getx.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/manager_pages_getx.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import 'package:get_test/Screens/homepage/managerpages/reports/create_report_getx.dart';
import 'package:get_test/Screens/login/login_getx.dart';
import 'package:get_test/Screens/on_boarding/on_boarding_getX.dart';
import 'package:get_test/Screens/order_List/order_List_getX.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_controller.dart';
import '../../Screens/client/clienthome/client_home_getx.dart';
import '../../Screens/client/clientprofile/create_client_getx.dart';
import '../../Screens/create_event/create_event_getX.dart';
import '../../Screens/create_product/create_product_repo.dart';
import '../../Screens/events/events_getX.dart';
import '../../Screens/get_product/get_product_getx.dart';
import '../../Screens/homepage/managerpages/createproject/create_project_getx.dart';
import '../../Screens/loginLocal/login_getX.dart';
import '../../Screens/project_homepage/create_project_local/create_project_local_getX.dart';
import '../../Screens/project_homepage/project_homepage_pages/project_homepage_wrapper_getX.dart';
import '../../Screens/project_homepage/search_project/search_project_getX.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageAdminController>(() => HomePageAdminController(),
        fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<OrderReportController>(() => OrderReportController(), fenix: true);
    Get.lazyPut<ManagerPagesGetx>(() => ManagerPagesGetx(), fenix: true);
    Get.lazyPut<CreateClientGetx>(() => CreateClientGetx(), fenix: true);
    Get.lazyPut<CreateProjectGetx>(() => CreateProjectGetx(), fenix: true);
    Get.lazyPut<ProjectDetailWrapperGetx>(() => ProjectDetailWrapperGetx(), fenix: true);
    Get.lazyPut<CreateReportGetx>(() => CreateReportGetx(), fenix: true);
    Get.lazyPut<CreateInventorytGetx>(() => CreateInventorytGetx(), fenix: true);
    Get.lazyPut<ClientHomeGetx>(() => ClientHomeGetx(), fenix: true);
    Get.lazyPut<CreateCustomerController>(() => CreateCustomerController(), fenix: true);
    Get.lazyPut<GetCustomerController>(() => GetCustomerController(), fenix: true);
    Get.lazyPut<ProjectHomepageController>(() => ProjectHomepageController(), fenix: true);
    Get.lazyPut<ProjectHomepageWrapperGetX>(() => ProjectHomepageWrapperGetX(), fenix: true);
    Get.lazyPut<CreateProjectLocalGetX>(() => CreateProjectLocalGetX(), fenix: true);
    Get.lazyPut<ProjectSearchController>(() => ProjectSearchController(), fenix: true);
    Get.lazyPut<OnBoardingController>(() => OnBoardingController(), fenix: true);
    Get.lazyPut<GetEventsController>(() => GetEventsController(), fenix: true);
    Get.lazyPut<CreateEventController>(() => CreateEventController(), fenix: true);
    Get.lazyPut<CreateProductController>(() => CreateProductController(), fenix: true);
    Get.lazyPut<GetProductController>(() => GetProductController(), fenix: true);
    Get.lazyPut<LoginLocalController>(() => LoginLocalController(), fenix: true);
  }
}
