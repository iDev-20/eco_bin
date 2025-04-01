import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';

Future showAppBottomSheet({
  required BuildContext context,
  required Widget child,
  String? title,
  String? closeText,
  bool showCloseButton = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
}) async {
  var res = await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(30),
                      topRight:
                          Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // title and close button
                      Visibility(
                        visible: title != null || showCloseButton,
                        child: Padding(
                          padding: const EdgeInsets.only(
                           top: 16,
                           left: 16,
                           right: 8,
                           bottom: 8
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title?? '',
                                  style: const TextStyle(
                                    color: AppColors.darkBlueText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: showCloseButton,
                                child: Material(
                                  color: AppColors.transparent,
                                  child: Ink(
                                    color: AppColors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: (){
                                        Navigation.back(context: context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: AppImages.svgCloseBottomSheetIcon,
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // content
                      SafeArea(child: child),

                      // space
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

  return res;
}
