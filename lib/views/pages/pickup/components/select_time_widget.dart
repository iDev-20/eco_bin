import 'package:flutter/material.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({super.key});

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  String selectedPeriod = TimePeriod.morning.period;
  String? selectedTime;

  List<String> timeSlots = TimePeriod.morning.timeSlots;

  final List<String> periods = ['Morning', 'Afternoon', 'Evening'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a time',
          style: TextStyle(
            color: AppColors.darkBlueText,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            children: [
              Row(
                children: [
                  selectPeriodButton(timePeriod: TimePeriod.morning),
                  const SizedBox(width: 12),
                  selectPeriodButton(timePeriod: TimePeriod.afternoon),
                  const SizedBox(width: 12),
                  selectPeriodButton(timePeriod: TimePeriod.evening),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 16),
              showTimes(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSingleTimeRow({required List<String> slots}) {
    List<Widget> rows = [];

    for (int i = 0; i < slots.length; i += 1) {
      rows.add(
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                right: i == slots.length - 1 && slots.length == 4 ? 0 : 12),
            child: selectTimeButton(time: slots[i]),
          ),
        ),
      );
    }

    int diff = 4 - slots.length;

    for (int i = 0; i < diff; i += 1) {
      rows.add(const Expanded(child: SizedBox()));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rows,
    );
  }

  Widget selectTimeButton({required String time}) {
    bool usedTime = selectedTime == time;
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTime = time;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: usedTime ? AppColors.primary50 : AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: usedTime ? AppColors.primary100 : Colors.grey.shade200,
            ),
          ),
          child: Text(
            time,
            style: TextStyle(
                color:
                    usedTime ? AppColors.primaryColor : AppColors.darkBlueText,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget selectPeriodButton({required TimePeriod timePeriod}) {
    return Expanded(
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedPeriod = timePeriod.period;
              timeSlots = timePeriod.timeSlots;
              selectedTime = null;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: selectedPeriod == timePeriod.period
                  ? AppColors.primary50
                  : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: selectedPeriod == timePeriod.period
                      ? AppColors.primary100
                      : Colors.grey.shade200),
            ),
            child: Text(
              timePeriod.period,
              style: TextStyle(
                  color: selectedPeriod == timePeriod.period
                      ? AppColors.primaryColor
                      : Colors.grey.shade500,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget showTimes() {
    int length = timeSlots.length;
    if (length <= 4) {
      return buildSingleTimeRow(slots: timeSlots);
    }
    if (length <= 8) {
      return Column(
        children: [
          buildSingleTimeRow(slots: timeSlots.sublist(0, 4)),
          const SizedBox(height: 12),
          buildSingleTimeRow(slots: timeSlots.sublist(4, timeSlots.length)),
        ],
      );
    }

    return Column(
      children: [
        buildSingleTimeRow(slots: timeSlots.sublist(0, 4)),
        const SizedBox(height: 12),
        buildSingleTimeRow(slots: timeSlots.sublist(4, 8)),
        const SizedBox(height: 12),
        buildSingleTimeRow(slots: timeSlots.sublist(8, timeSlots.length)),
      ],
    );
  }
}
