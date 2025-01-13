// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'events_getX.dart';
//
// class GetEventsPage extends GetView<GetEventsController> {
//   const GetEventsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Events Calendar',
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//             ),
//           );
//         } else {
//           return Column(
//             children: [
//               _buildCalendar(),
//               const Divider(height: 1),
//               Expanded(child: _buildEventsList()),
//             ],
//           );
//         }
//       }),
//     );
//   }
//
//   Widget _buildCalendar() {
//     return TableCalendar(
//       firstDay: DateTime.utc(2024, 1, 1),
//       lastDay: DateTime.utc(2025, 12, 31),
//       focusedDay: controller.focusedDay.value,
//       selectedDayPredicate: (day) => isSameDay(controller.selectedDay.value, day),
//       calendarFormat: controller.calendarFormat.value,
//       eventLoader: controller.getEventsForDay,
//       onDaySelected: controller.onDaySelected,
//       onFormatChanged: (format) {
//         controller.calendarFormat.value = format;
//       },
//       calendarStyle: const CalendarStyle(
//         markersMaxCount: 1,
//         markerDecoration: BoxDecoration(
//           color: Colors.deepPurple,
//           shape: BoxShape.circle,
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.deepPurple,
//           shape: BoxShape.circle,
//         ),
//         todayDecoration: BoxDecoration(
//           color: Colors.deepPurpleAccent,
//           shape: BoxShape.circle,
//         ),
//       ),
//       headerStyle: const HeaderStyle(
//         formatButtonTextStyle: TextStyle(color: Colors.deepPurple),
//         titleTextStyle: TextStyle(fontSize: 17.0),
//       ),
//     );
//   }
//
//   Widget _buildEventsList() {
//     return Obx(() {
//       final selectedEvents = controller.selectedEvents;
//
//       if (selectedEvents.isEmpty) {
//         return const Center(
//           child: Text(
//             'No events for selected day',
//             style: TextStyle(color: Colors.black54),
//           ),
//         );
//       }
//
//       return ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         itemCount: selectedEvents.length,
//         separatorBuilder: (context, index) => Divider(
//           color: Colors.grey.shade300,
//           height: 1,
//         ),
//         itemBuilder: (context, index) {
//           final event = selectedEvents[index];
//           return Card(
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListTile(
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 10,
//               ),
//               leading: CircleAvatar(
//                 backgroundColor: Colors.deepPurple.shade100,
//                 child: const Icon(
//                   Icons.event,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               title: Text(
//                 event.title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               subtitle: Text(
//                 event.description,
//                 style: const TextStyle(
//                   color: Colors.black54,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: const Icon(
//                 Icons.chevron_right,
//                 color: Colors.grey,
//               ),
//               onTap: () {
//                 Fluttertoast.showToast(
//                   msg: event.description,
//                   backgroundColor: Colors.black87,
//                   textColor: Colors.white,
//                 );
//               },
//             ),
//           );
//         },
//       );
//     });
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_test/Helper/get_routes.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'events_getX.dart';
//
// class GetEventsPage extends GetView<GetEventsController> {
//   const GetEventsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Get.toNamed(Routes.createEventPage);
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Events Calendar',
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//             ),
//           );
//         } else {
//           return Column(
//             children: [
//               _buildCalendar(),
//               const Divider(height: 1),
//               Expanded(child: _buildMonthlyEventsList()),
//             ],
//           );
//         }
//       }),
//     );
//   }
//
//   Widget _buildCalendar() {
//     return TableCalendar(
//       firstDay: DateTime.utc(2024, 1, 1),
//       lastDay: DateTime.utc(2025, 12, 31),
//       focusedDay: controller.focusedDay.value,
//       calendarFormat: controller.calendarFormat.value,
//       eventLoader: controller.getEventsForDay,
//       onPageChanged: (focusedDay) {
//         controller.focusedDay.value = focusedDay;
//         controller.updateMonthEvents();
//       },
//       onFormatChanged: (format) {
//         controller.calendarFormat.value = format;
//       },
//       calendarStyle: const CalendarStyle(
//         markersMaxCount: 1,
//         markerDecoration: BoxDecoration(
//           color: Colors.deepPurple,
//           shape: BoxShape.circle,
//         ),
//         todayDecoration: BoxDecoration(
//           color: Colors.deepPurpleAccent,
//           shape: BoxShape.circle,
//         ),
//       ),
//       headerStyle: const HeaderStyle(
//         formatButtonTextStyle: TextStyle(color: Colors.deepPurple),
//         titleTextStyle: TextStyle(fontSize: 17.0),
//       ),
//     );
//   }
//
//   Widget _buildMonthlyEventsList() {
//     return Obx(() {
//       final monthlyEvents = controller.monthlyEvents;
//
//       if (monthlyEvents.isEmpty) {
//         return const Center(
//           child: Text(
//             'No events this month',
//             style: TextStyle(color: Colors.black54),
//           ),
//         );
//       }
//
//       monthlyEvents.sort((a, b) {
//         final dateA = DateTime.parse(a.date.toString());
//         final dateB = DateTime.parse(b.date.toString());
//         return dateA.compareTo(dateB);
//       });
//
//       return ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         itemCount: monthlyEvents.length,
//         separatorBuilder: (context, index) => Divider(
//           color: Colors.grey.shade300,
//           height: 1,
//         ),
//         itemBuilder: (context, index) {
//           final event = monthlyEvents[index];
//           final eventDate = DateTime.parse(event.date.toString());
//
//           return Card(
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListTile(
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 10,
//               ),
//               leading: CircleAvatar(
//                 backgroundColor: Colors.deepPurple.shade100,
//                 child: Text(
//                   eventDate.day.toString(),
//                   style: const TextStyle(
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               title: Text(
//                 event.title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 4),
//                   Text(
//                     event.description,
//                     style: const TextStyle(
//                       color: Colors.black54,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//               trailing: const Icon(
//                 Icons.chevron_right,
//                 color: Colors.grey,
//               ),
//               onTap: () {
//                 Fluttertoast.showToast(
//                   msg: event.description,
//                   backgroundColor: Colors.black87,
//                   textColor: Colors.white,
//                 );
//               },
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'events_getX.dart';

class GetEventsPage extends GetView<GetEventsController> {
  const GetEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.createEventPage);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
            ),
          );
        } else {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                floating: true,
                expandedHeight: 80.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Events Calendar',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildCalendar(),
                    const Divider(height: 1),
                  ],
                ),
              ),
              _buildMonthlyEventsList(),
            ],
          );
        }
      }),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: controller.focusedDay.value,
      calendarFormat: controller.calendarFormat.value,
      eventLoader: controller.getEventsForDay,
      onPageChanged: (focusedDay) {
        controller.focusedDay.value = focusedDay;
        controller.updateMonthEvents();
      },
      onFormatChanged: (format) {
        controller.calendarFormat.value = format;
      },
      calendarStyle: const CalendarStyle(
        markersMaxCount: 1,
        markerDecoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonTextStyle: TextStyle(color: Colors.deepPurple),
        titleTextStyle: TextStyle(fontSize: 17.0),
      ),
    );
  }

  Widget _buildMonthlyEventsList() {
    return Obx(() {
      final monthlyEvents = controller.monthlyEvents;

      if (monthlyEvents.isEmpty) {
        return SliverToBoxAdapter(
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'No events this month',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        );
      }

      // Sort events by date
      monthlyEvents.sort((a, b) {
        final dateA = DateTime.parse(a.date.toString());
        final dateB = DateTime.parse(b.date.toString());
        return dateA.compareTo(dateB);
      });

      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final event = monthlyEvents[index];
            final eventDate = DateTime.parse(event.date.toString());

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade100,
                  child: Text(
                    eventDate.day.toString(),
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  event.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      event.description,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: () {
                  Fluttertoast.showToast(
                    msg: event.description,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                  );
                },
              ),
            );
          },
          childCount: monthlyEvents.length,
        ),
      );
    });
  }
}

