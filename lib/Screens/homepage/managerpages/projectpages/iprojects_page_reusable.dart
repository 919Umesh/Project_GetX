import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/manager_pages_getx.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:search_page/search_page.dart';


class ProjectsListPage extends GetView<ManagerPagesGetx> {
  const ProjectsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () => showSearch(
              context: context,
              delegate: SearchPage(
                onQueryUpdate: print,
                items: controller.people,
                searchLabel: 'Search Projects',
                suggestion: const Center(
                  child: Text('Filter projects by names'),
                ),
                failure: const Center(
                  child: Text('No Project found , create new projects'),
                ),
                filter: (person) => [
                  person.name,
                  person.surname,
                  person.age.toString(),
                ],
                sort: (a, b) => a.compareTo(b),
                builder: (person) => ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.surname),
                  trailing: Text('${person.age} yo'),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.darkBklue)),
              child: const Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Search Project",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff475467),
                        height: 17 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32.adaptSize,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed(Routes.projectDetailWrapper),
                  child: Container(
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Design Estimate & Construction of bridge",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff475467),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Anamnagar Kathmandu",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8c8e98),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.lightGrey,
                                size: 14,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Jan 02, 2024",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mediumGrey,
                                  height: 18 / 10,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                "On Progress",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff349cf3),
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
