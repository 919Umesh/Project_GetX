import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/order_List/order_List_getX.dart';

class OrderListScreen extends GetView<OrderReportController> {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          controller.hasMoreData.value) {
        controller.loadMoreOrders();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.createProduct);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.orderList.isEmpty) {
          return const Center(
            child: Text('No orders available'),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.orderList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < controller.orderList.length) {
                      final order = controller.orderList[index];
                      return InkWell(
                        onTap: () {
                        },
                        child: ListTile(
                          subtitle: Text('VNo: ${order.vNo}'),
                        ),
                      );
                    } else if (controller.hasMoreData.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const SizedBox.shrink();
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