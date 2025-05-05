import 'package:flutter/material.dart';

class DashboardMetricGridView extends StatelessWidget {
  const DashboardMetricGridView({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: children.isNotEmpty,
      child: Column(
        children: [
          Row(
            children: [
              getWidgetAtIndex(0),
              horizontalSpacer(),
              getWidgetAtIndex(1),
              horizontalSpacer(),
              getWidgetAtIndex(2),
            ],
          ),
          Visibility(
            visible: indexIsAvailable(3),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  getWidgetAtIndex(3),
                  horizontalSpacer(),
                  getWidgetAtIndex(4),
                  horizontalSpacer(),
                  getWidgetAtIndex(5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget horizontalSpacer(){
    return const SizedBox(width: 10);
  }

  bool indexIsAvailable(int index){
    return index < children.length;
  }

  Widget getWidgetAtIndex(int index){
    return Expanded(
      child: indexIsAvailable(index)? 
        children[index] : const SizedBox.shrink(),
    );
  }
}