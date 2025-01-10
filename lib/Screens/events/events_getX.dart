// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'events_repo.dart';
//
//
// class GetEventsController extends GetxController {
//   final isLoading = false.obs;
//   final eventsList = [].obs;
//   final calendarFormat = CalendarFormat.month.obs;
//   final focusedDay = DateTime.now().obs;
//   final selectedDay = DateTime.now().obs;
//   final selectedEvents = [].obs;
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     await fetchEventsList();
//   }
//
//   Future<void> fetchEventsList() async {
//     isLoading.value = true;
//     try {
//       final model = await getEventsRepository.getEvents();
//       if (model.status == 200) {
//         eventsList.value = model.events;
//         selectedEvents.value = getEventsForDay(selectedDay.value);
//       } else {
//         debugPrint('Error Occurred');
//       }
//     } catch (e) {
//       debugPrint("Error fetching events: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   List<dynamic> getEventsForDay(DateTime day) {
//     return eventsList.where((event) {
//       final eventDate = DateTime.parse(event.date);
//       return isSameDay(eventDate, day);
//     }).toList();
//   }
//
//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     this.selectedDay.value = selectedDay;
//     this.focusedDay.value = focusedDay;
//     selectedEvents.value = getEventsForDay(selectedDay);
//   }
// }
// Updated Controller
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'events_repo.dart';

class GetEventsController extends GetxController {
  final isLoading = false.obs;
  final eventsList = [].obs;
  final monthlyEvents = [].obs;
  final calendarFormat = CalendarFormat.month.obs;
  final focusedDay = DateTime.now().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchEventsList();
  }

  Future<void> fetchEventsList() async {
    isLoading.value = true;
    try {
      final model = await getEventsRepository.getEvents();
      if (model.status == 200) {
        eventsList.value = model.events;
        updateMonthEvents();
      } else {
        debugPrint('Error Occurred');
      }
    } catch (e) {
      debugPrint("Error fetching events: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<dynamic> getEventsForDay(DateTime day) {
    try {
      return eventsList.where((event) {
        DateTime? eventDate;
        try {
          eventDate = DateTime.parse(event.date.toString());
        } catch (e) {
          return false;
        }
        return eventDate.year == day.year &&
            eventDate.month == day.month &&
            eventDate.day == day.day;
      }).toList();
    } catch (e) {
      return [];
    }
  }

  void updateMonthEvents() {
    try {
      monthlyEvents.value = eventsList.where((event) {
        DateTime? eventDate;
        try {
          eventDate = DateTime.parse(event.date.toString());
        } catch (e) {
          return false;
        }
        return eventDate.year == focusedDay.value.year &&
            eventDate.month == focusedDay.value.month;
      }).toList();
    } catch (e) {
      debugPrint("Error updating monthly events: $e");
      monthlyEvents.value = [];
    }
  }
}