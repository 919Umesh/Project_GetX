import 'package:get/get.dart';
import 'package:get_test/Screens/create_customer/create_customer_getX.dart';
import 'package:get_test/Screens/create_product/create_product_getX.dart';
import 'package:get_test/Screens/get_customer/get_customer_getX.dart';
import 'package:get_test/Screens/on_boarding/on_boarding_getX.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_controller.dart';
import '../../Screens/create_event/create_event_getX.dart';
import '../../Screens/events/events_getX.dart';
import '../../Screens/get_product/get_product_getx.dart';
import '../../Screens/loginLocal/login_getX.dart';
import '../../Screens/order_List/order_List_getX.dart';
import '../../Screens/project_homepage/create_project_local/create_project_local_getX.dart';
import '../../Screens/project_homepage/project_homepage_pages/project_homepage_wrapper_getX.dart';
import '../../Screens/project_homepage/search_project/search_project_getX.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCustomerController>(() => CreateCustomerController(), fenix: true);
    Get.lazyPut<OrderReportController>(() => OrderReportController(), fenix: true);
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
