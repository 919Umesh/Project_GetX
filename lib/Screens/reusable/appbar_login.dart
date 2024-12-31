import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/reusable/custom_draggable_empty.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';

class CustomAppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final double height;

  const CustomAppBarLogin({
    super.key,
    required this.title,
    this.actions = const [],
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        title: Text(title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        actions: actions,
        backgroundColor: AppColors.backgroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  // final List<Widget> actions;
  final double height;
  final Widget? leading;

  const CustomAppBarHome({
    super.key,
    required this.title,
    // this.actions = const [],
    this.height = kToolbarHeight,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44),
      child: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: leading,
        actions: [
          IconButton(
            onPressed: () => _showDraggableSnackbar(context),
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
        centerTitle: false,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGrey),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  void _showDraggableSnackbar(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CustomDraggableEmpty(
            initialheight: 0.80,
            maxheight: 0.90,
            childWidget: Expanded(
              child: ListView.builder(
                itemCount: 150,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const ListTile(
                          leading: Icon(FontAwesomeIcons.wpforms),
                          subtitle: Text(
                            "2 hours ago",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff667085),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          title: Text(
                            "Your report for july 8 is ready",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff475467),
                            ),
                            textAlign: TextAlign.left,
                          )),
                      Divider(
                        endIndent: 25.adaptSize,
                        indent: 25.adaptSize,
                      )
                    ],
                  );
                },
              ),
            ));
      },
    );
  }
}
