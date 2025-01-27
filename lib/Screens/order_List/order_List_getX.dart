import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_test/Models/order_report_model.dart';
import 'package:get_test/Screens/order_List/order_List_repo.dart';

class OrderReportController extends GetxController {
  final isLoading = false.obs;
  final isFetchingMore = false.obs;
  final orderList = <OrderReportDataModel>[].obs;
  var currentPage = 1.obs;
  var hasMoreData = true.obs;
  final int pageSize = 10;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchOrderReport();
  }

  Future<void> fetchOrderReport({bool isPagination = false}) async {
    if (isPagination) {
      isFetchingMore.value = true;
    } else {
      isLoading.value = true;
    }

    try {
      final model = await createOrderReport.getOrderReport('ERPDEMO101', '7',
        page: currentPage.value,
        pageSize: pageSize,
      );

      if (model.statusCode == 200 && model.data.isNotEmpty) {
        if (isPagination) {
          orderList.addAll(model.data);
        } else {
          orderList.value = model.data;
        }
        if (model.data.length < pageSize) {
          hasMoreData.value = false;
        }
      } else {
        hasMoreData.value = false;
      }
    } catch (e) {
      debugPrint("Error fetching order report: $e");
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }


  Future<void> loadMoreOrders() async {
    if (hasMoreData.value && !isFetchingMore.value) {
      currentPage.value++;
      await fetchOrderReport(isPagination: true);
    }
  }
}