import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends GetView<ProjectDetailWrapperGetx> {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.adaptSize,
            ),
            SizedBox(
              height: 278.adaptSize,
              width: 370.adaptSize,
              child: Swiper(
                itemWidth: double.maxFinite,
                outer: true,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
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
                  duration: const Duration(milliseconds: 1500),
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(207, 199, 192, 192),
                          offset: Offset(0, 1),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            maxHeight: controller.seeMoreDes.value
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
                                ? controller.seeMoreDes(false)
                                : controller.seeMoreDes(true);
                          },
                          child: Text(
                            controller.seeMoreDes.value
                                ? 'See Less ↖'
                                : 'See more ↘',
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        ),
                      )
                    ],
                  ));
            }),
            const SizedBox(
              height: 12,
            ),
            ClientDetailRow(
              text: "John Doe",
              icon: Icons.person,
              onpressed: () {},
            ),
            const SizedBox(
              height: 9,
            ),
            ClientDetailRow(
              text: "+0123456",
              onpressed: () {
                _launchDialer("+0123456");
              },
              icon: Icons.phone,
            ),
            const SizedBox(
              height: 9,
            ),
            ClientDetailRow(
              text: "test45@gmail.com",
              onpressed: () => launchCEmail("test45@gmail.com"),
              icon: Icons.mail,
            ),
            const SizedBox(
              height: 9,
            ),
            ClientDetailRow(
              text: "Kathmandu,Nepal",
              icon: Icons.location_pin,
              onpressed: () {},
            ),
            SizedBox(
              height: 24.adaptSize,
            ),
            SizedBox(
              width: double.maxFinite,
              child: CustomIconButtonB(
                onPressed: () {},
                text: "Edit Project",
                icon: Icons.edit,
              ),
            ),
            SizedBox(
              height: 40.adaptSize,
            ),
          ],
        ),
      ),
    );
  }
}

class ClientDetailRow extends StatelessWidget {
  const ClientDetailRow(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpressed});

  final String text;
  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onpressed,
      child: SizedBox(
        width: double.maxFinite,
        child: Row(children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 18, 20, 23),
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void launchCEmail(email) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': 'Inquiry',
    }),
  );
  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    print('Could not launch $emailLaunchUri');
  }
}

void _launchDialer(String phoneNumber) async {
  final Uri url = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
