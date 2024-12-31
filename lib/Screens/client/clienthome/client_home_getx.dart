import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClientHomeGetx extends GetxController {
  RxBool seeMoreDes = false.obs;

  RxBool requestButtonDisabled = false.obs;
  bool showRequestNotipage = false;

  int selectedIndex = 0;

  bool isToday = false;
  bool containsToday = false;

  final List<DateTime> sampleDates = [
    DateTime(2024, 1, 1), // January 15, 2024
    DateTime(2024, 2, 2), // February 20, 2024
    DateTime(2024, 3, 3), // March 10, 2024
    DateTime(2024, 4, 4), // April 25, 2024
    DateTime(2024, 5, 5), // May 5, 2024
    DateTime(2024, 6, 6), // June 18, 2024
    DateTime(2024, 7, 7), // July 22, 2024

    DateTime(2024, 9, 8), // September 12, 2024
    DateTime(2024, 7, 9), // October 31, 2024
    DateTime(2024, 7, 10), // November 11, 2024
    DateTime(2024, 7, 15), // December 25, 2024
    // DateTime(2024, 8, 8), // August 7, 2024 (today's date)
  ];

  // Create a DateFormat instance for different parts of the date
  final dayOfWeekFormat = DateFormat('EEE'); // Mon
  final dayOfMonthFormat = DateFormat('d'); // 21
  final monthYearFormat = DateFormat('M/yyyy'); // 11/2024

  // Format the date
  String dayOfWeek = '';
  String dayOfMonth = '';
  String monthYear = '';

  formatDayOfWeek(DateTime date) {
    dayOfWeek = dayOfWeekFormat.format(date);
    dayOfMonth = dayOfMonthFormat.format(date);
    monthYear = monthYearFormat.format(date);
  }

  isTodayfun(DateTime date) {
    final now = DateTime.now();
    isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;
    return isToday;
  }

  bool containsTodayfun(List<DateTime> dates) {
    final today = DateTime.now();
    for (var date in dates) {
      if (date.year == today.year &&
          date.month == today.month &&
          date.day == today.day) {
        containsToday = true;
        return containsToday;
      }
    }
    containsToday = false;

    return containsToday;
  }

  @override
  void onInit() {
    containsTodayfun(sampleDates);
    super.onInit();
  }
}
