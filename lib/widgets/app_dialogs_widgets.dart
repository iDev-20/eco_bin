import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';

class AppLoadingDialogWidget extends StatelessWidget {
  const AppLoadingDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(7)),
      ),
      content: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            // const SizedBox(height: AppDimens.defaultMarginMidExtra2),
            // Text(
            //   loadingText ?? AppStrings.loading,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
      // actions: [
      //   FutureBuilder(
      //       future: Future.delayed(const Duration(seconds: AppConstants.displayCancelOnDialogAfter), () => true),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: const Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.symmetric(vertical: AppDimens.mediumSpacing),
      //                   child: Text(
      //                     AppStrings.cancel,
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: AppDimens.normalFontSize,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }

      //         return const SizedBox();
      //       })
      // ],
    );
  }
}

class AppSuccessDialogWidget extends StatelessWidget {
  const AppSuccessDialogWidget(
      {super.key,
      required this.message,
      this.title,
      required this.action,
      required this.hasTitle});

  final String message;
  final String? title;
  final Function? action;
  final bool hasTitle;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: AlertDialog(
        contentPadding: const EdgeInsets.only(top: 10),
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppImages.svgSuccessDialogIcon,
            const SizedBox(height: 16),
            Visibility(
              visible: hasTitle,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.blue,
              thickness: 1,
              height: 0,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                action?.call();
              },
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class AppAlertDialogWidget extends StatelessWidget {
//   const AppAlertDialogWidget({
//     super.key,
//     required this.message,
//     required this.title,
//     required this.action,
//   });

//   final String message;
//   final String title;
//   final Function? action;

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: AlertDialog(
//         contentPadding:
//             const EdgeInsets.only(top: AppDimens.defaultMargin),
//         shape: const RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.all(Radius.circular(AppDimens.defaultBorderRadius)),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             AppImages.svgErrorDialogIcon,
//             const SizedBox(height: AppDimens.defaultMargin),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultMargin),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   color: AppColors.black,
//                   fontSize: AppDimens.normalFontSize,
//                   fontWeight: AppDimens.fontWeight600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: AppDimens.defaultMargin),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: AppDimens.defaultMargin),
//               child: Text(
//                 message,
//                 style: const TextStyle(
//                   color: AppColors.grey600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: AppDimens.defaultMargin),
//             Divider(
//               color: AppColors.grey,
//               thickness: 1,
//               height: AppDimens.zero,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 action?.call();
//               },
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(AppDimens.defaultBorderRadius),
//                 bottomRight: Radius.circular(AppDimens.defaultBorderRadius),
//               ),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: AppDimens.ten),
//                     child: Text(
//                       AppStrings.okay,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: AppDimens.normalFontSize,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




