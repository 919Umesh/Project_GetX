import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/order_List/order_List_getX.dart';

class OrderListScreen extends GetView<OrderReportController> {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Add scroll listener for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          controller.hasMoreData.value) {
        controller.loadMoreOrders(); // Load more data when scrolled to the bottom
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.createProduct); // Navigate to create product screen
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(), // Show loading indicator
          );
        } else if (controller.orderList.isEmpty) {
          return const Center(
            child: Text('No orders available'), // Show empty state
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.orderList.length + 1, // +1 for loading indicator
                  itemBuilder: (context, index) {
                    if (index < controller.orderList.length) {
                      final order = controller.orderList[index];
                      return InkWell(
                        onTap: () {
                          // Handle order item tap
                        },
                        child: ListTile(
                          title: Text('GLCode: ${order.glcode}'),
                          subtitle: Text('VNo: ${order.vNo}'),
                        ),
                      );
                    } else if (controller.hasMoreData.value) {
                      return const Center(
                        child: CircularProgressIndicator(), // Show loading indicator at the bottom
                      );
                    } else {
                      return const SizedBox.shrink(); // Hide if no more data
                    }
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}