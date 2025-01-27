import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_test/Models/order_report_model.dart';
import 'package:get_test/Screens/order_List/order_List_repo.dart';

class OrderReportController extends GetxController {
  final isLoading = false.obs; // Loading state for initial fetch
  final isFetchingMore = false.obs; // Loading state for pagination
  final orderList = <OrderReportDataModel>[].obs; // List of orders
  var currentPage = 1.obs; // Current page for pagination
  var hasMoreData = true.obs; // Flag to check if more data is available
  final int pageSize = 10; // Number of items per page

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchOrderReport(); // Fetch initial data
  }

  // Fetch order report data
  Future<void> fetchOrderReport({bool isPagination = false}) async {
    if (isPagination) {
      isFetchingMore.value = true; // Set fetching more state
    } else {
      isLoading.value = true; // Set initial loading state
    }

    try {
      // Fetch data from the repository
      final model = await createOrderReport.getOrderReport(
        'ERPDEMO101',
        '7',
        page: currentPage.value,
        pageSize: pageSize,
      );

      if (model.statusCode == 200 && model.data.isNotEmpty) {
        if (isPagination) {
          orderList.addAll(model.data); // Append data for pagination
        } else {
          orderList.value = model.data; // Replace data for initial fetch
        }

        // Check if more data is available
        if (model.data.length < pageSize) {
          hasMoreData.value = false;
        }
      } else {
        hasMoreData.value = false; // No more data available
      }
    } catch (e) {
      debugPrint("Error fetching order report: $e");
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }

  // Load more data for pagination
  Future<void> loadMoreOrders() async {
    if (hasMoreData.value && !isFetchingMore.value) {
      currentPage.value++; // Increment page number
      await fetchOrderReport(isPagination: true); // Fetch next page
    }
  }
}