import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/client/clienthome/client_home_blank.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../../Helper/get_routes.dart';
import 'client_home_getx.dart';

class ClientHome extends GetView<ClientHomeGetx> {
  const ClientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        title: '',
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.clientProfile);
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.black,
                foregroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              ),
            ),
          ],
        ),
      ),
      body: controller.sampleDates.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.adaptSize,
                    ),
                    GetBuilder(builder: (ClientHomeGetx ctrler) {
                      return SizedBox(
                        height: 67.adaptSize,
                        child: ListView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10.adaptSize),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.containsToday
                              ? controller.sampleDates.length
                              : controller.sampleDates.length + 1,
                          itemBuilder: (context, index) {
                            if (index < controller.sampleDates.length) {
                              controller.formatDayOfWeek(
                                  controller.sampleDates[index].toLocal());
                            }
                            if (!controller.containsToday &&
                                index == controller.sampleDates.length) {
                              controller
                                  .formatDayOfWeek(DateTime.now().toLocal());
                            }

                            return !controller.containsToday &&
                                    index == controller.sampleDates.length
                                ? InkWell(
                                    onTap: () {
                                      controller.showRequestNotipage = true;
                                      controller.selectedIndex = index;
                                      controller.update();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5.adaptSize),
                                      padding: const EdgeInsets.all(4),
                                      height: index == controller.selectedIndex
                                          ? 66.adaptSize
                                          : 52.adaptSize,
                                      width: index == controller.selectedIndex
                                          ? 66.adaptSize
                                          : 52.adaptSize,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: index ==
                                                  controller.selectedIndex
                                              ? AppColors.calenderBlue
                                              : AppColors.calenderUnselected),
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Text(
                                            controller.dayOfWeek,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: index ==
                                                      controller.selectedIndex
                                                  ? AppColors.white
                                                  : AppColors.darkBlue,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Today",
                                            style: TextStyle(
                                              height: 38 / 20,
                                              fontFamily: "Inter",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: index ==
                                                      controller.selectedIndex
                                                  ? AppColors.white
                                                  : AppColors.darkBlue,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            controller.monthYear,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: index ==
                                                      controller.selectedIndex
                                                  ? AppColors.white
                                                  : AppColors.darkBlue,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      controller.selectedIndex = index;
                                      controller.update();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5.adaptSize),
                                      padding: const EdgeInsets.all(4),
                                      height: index == controller.selectedIndex
                                          ? 66.adaptSize
                                          : 52.adaptSize,
                                      width: index == controller.selectedIndex
                                          ? 66.adaptSize
                                          : 52.adaptSize,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: index ==
                                                  controller.selectedIndex
                                              ? AppColors.calenderBlue
                                              : AppColors.calenderUnselected),
                                      child: Center(
                                        child: controller.isTodayfun(
                                                controller.sampleDates[index])
                                            ? Column(
                                                children: [
                                                  Text(
                                                    controller.dayOfWeek,
                                                    style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    "Today",
                                                    style: TextStyle(
                                                      height: 38 / 20,
                                                      fontFamily: "Inter",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    controller.monthYear,
                                                    style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Text(
                                                    controller.dayOfWeek,
                                                    style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    controller.dayOfMonth,
                                                    style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    controller.monthYear,
                                                    style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: index ==
                                                              controller
                                                                  .selectedIndex
                                                          ? AppColors.white
                                                          : AppColors.darkBlue,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      );
                    }),
                    SizedBox(
                      height: 24.adaptSize,
                    ),
                    GetBuilder(builder: (ClientHomeGetx ctrler) {
                      return controller.showRequestNotipage
                          ? const ClientHomeBlank()
                          : Column(
                              children: [
                                SizedBox(
                                  height: 278.adaptSize,
                                  width: 370.adaptSize,
                                  child: Swiper(
                                    itemWidth: double.maxFinite,
                                    outer: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/logo.png',
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      );
                                    },
                                    itemCount: 3,
                                    pagination: const SwiperPagination(),
                                    control: const SwiperControl(),
                                    autoplay: true,
                                  ),
                                ),
                                Obx(() {
                                  return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  207, 199, 192, 192),
                                              offset: Offset(0, 1),
                                              blurRadius: 4.0,
                                              spreadRadius: 1.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Design Estimate & Construction of bridge",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                                maxHeight:
                                                    controller.seeMoreDes.value
                                                        ? double.maxFinite
                                                        : 65,
                                                minHeight: 30),
                                            child: const Text(
                                              " work today ais is the dy achhtachmoachhtachmork today ais is tachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentshe dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsThis is thtachmentsrk today ais is the dy atThis is thtachmentsatThis is thtachhtachmork today aachhtachmork today ais is the dy atThis is thtachmentsis is the dy atThis is thtachments.",
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff667085),
                                              ),
                                              // overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                controller.seeMoreDes.value
                                                    ? controller
                                                        .seeMoreDes(false)
                                                    : controller
                                                        .seeMoreDes(true);
                                              },
                                              child: Text(
                                                controller.seeMoreDes.value
                                                    ? 'See Less ↖'
                                                    : 'See more ↘',
                                                style: const TextStyle(
                                                    color: AppColors.primary),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                }),
                                SizedBox(
                                  height: 42.adaptSize,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: CustomIconButtonF(
                                    onPressed: () {},
                                    text: "Contact Project Creator",
                                    icon: Icons.call,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.adaptSize,
                                ),
                              ],
                            );
                    })
                  ],
                ),
              ),
            )
          : const ClientHomeBlank(),
    );
  }
}
