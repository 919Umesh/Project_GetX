import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/client/clientprofile/create_client_getx.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../../Helper/get_routes.dart';
import '../../../base/Api_end_point/api_endpoints.dart';

class ClientProfile extends GetView<CreateClientGetx> {
  const ClientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
        ),
        body: GetBuilder(builder: (CreateClientGetx ctrler) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: true
                // !controller.isProfileLoading.value &&
                //         controller.userProfileModel != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      controller.userProfileModel != null &&
                              controller.userProfileModel!.thumbnail != null
                          ? Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                      radius: 35.0,
                                      backgroundImage: NetworkImage(
                                          ApiEndpoint.imagebaseUrl +
                                              controller.userProfileModel!
                                                  .thumbnail!)),
                                  Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        // _showDialog(context, false);
                                      },
                                      child: Container(
                                        height: 32.0,
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.secondary),
                                          shape: BoxShape.circle,
                                          color: context.theme.primaryColor,
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.edit,
                                              color: AppColors.secondary),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const CircleAvatar(
                                    radius: 35.0,
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.jpeg'),
                                  ),
                                  Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        Get.toNamed(Routes.createClient);
                                      },
                                      child: Container(
                                        height: 32.0,
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.secondary),
                                          shape: BoxShape.circle,
                                          color: context.theme.primaryColor,
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 255, 254, 252)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 28.adaptSize,
                      ),
                      Text(
                        "Client Information",
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 25.adaptSize,
                      ),
                      Row(
                        children: [
                          Text(
                            "Name ",
                            style: context.textTheme.titleSmall,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            "dwa", //  controller.userProfileModel!.firstName ?? '',
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.adaptSize,
                      ),
                      Row(
                        children: [
                          Text(
                            "Contact ",
                            style: context.textTheme.titleSmall,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'dwad', // " controller.userProfileModel!.phone ?? '',"
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.adaptSize,
                      ),
                      Row(
                        children: [
                          Text(
                            "Email ",
                            style: context.textTheme.titleSmall,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'email', //" controller.userProfileModel!.email ?? """,
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.adaptSize,
                      ),
                      Row(
                        children: [
                          Text(
                            "Address ",
                            style: context.textTheme.titleSmall,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Address', //" controller.userProfileModel!.email ?? """,
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.adaptSize,
                      ),
                      CustomIconButtonB(
                        text: 'Logout',
                        onPressed: () {
                          Get.offAllNamed(Routes.signin);
                        },
                        icon: Icons.logout,
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }));
  }
}
