import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class SelectDateBottomSheet extends StatefulWidget {
  const SelectDateBottomSheet({super.key});

  @override
  State<SelectDateBottomSheet> createState() => _SelectDateBottomSheetState();
}

class _SelectDateBottomSheetState extends State<SelectDateBottomSheet> {
  DateTime today = DateTime.now();
  DateTime? selectedDay;
  bool showBackButtom = false;

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TableCalendar(
            daysOfWeekHeight: 20,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: AppColors.darkBlueText, fontWeight: FontWeight.w600),
              weekendStyle: TextStyle(
                  color: AppColors.darkBlueText, fontWeight: FontWeight.w600),
            ),
            calendarStyle: CalendarStyle(
              outsideTextStyle:
                  TextStyle(color: Colors.grey.shade400, fontSize: 14),
              defaultTextStyle:
                  const TextStyle(color: AppColors.darkBlueText, fontSize: 14),
              selectedTextStyle: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary50,
                  border: Border.all(color: AppColors.primary100)),
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400)),
              todayTextStyle: const TextStyle(fontSize: 14),
            ),
            headerStyle: const HeaderStyle(
                leftChevronVisible: true,
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.darkBlueText,
                ),
                leftChevronMargin: EdgeInsets.symmetric(horizontal: 0.0),
                rightChevronIcon: Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.darkBlueText,
                ),
                rightChevronMargin: EdgeInsets.symmetric(horizontal: 0.0),
                headerPadding: EdgeInsets.only(bottom: 12)),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, selectedDay),
            focusedDay: selectedDay ?? today,
            firstDay: today,
            lastDay: DateTime.now().add(const Duration(days: 60)),
            onDaySelected: onDaySelected,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: PrimaryButton(
            enabled: selectedDay != null,
            onTap: () {
              Navigation.back(
                context: context,
                result: selectedDay,
              );
            },
            child: const Text('Confirm'),
          ),
        ),
      ],
    );
  }
}
