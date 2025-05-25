import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/views/pages/home/components/dashboard_metric_grid_view.dart';
import 'package:waste_management_app/views/pages/home/faq_page.dart';
import 'package:waste_management_app/views/pages/home/notifications_page.dart';
import 'package:waste_management_app/views/pages/home/videos_page.dart';
import 'package:waste_management_app/views/pages/home/volunteer_page.dart';
import 'package:waste_management_app/providers/user_provider.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName ?? 'User123';

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: AppColors.primaryColor,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: Image(image: AppImages.appLogo)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello, $userName 👋',
                        style: const TextStyle(
                            color: AppColors.primary50,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Ready to keep your space clean today?',
                        style: TextStyle(color: AppColors.primary50),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: GestureDetector(
                      onTap: () {
                        Navigation.navigateToScreen(
                            context: context,
                            screen: const NotificationsPage());
                      },
                      child: const Icon(
                        Icons.notifications_rounded,
                        color: AppColors.primary100,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 140,
              right: 0,
              bottom: 0,
              child: Material(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      const Text(
                        'Services',
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          singleButton(
                            title: 'Schedule Pickup',
                            onTap: () {
                              Navigation.navigateToScreen(
                                  context: context,
                                  screen: const RequestPickupPage());
                            },
                          ),
                          const SizedBox(width: 10),
                          singleButton(
                            title: 'Videos',
                            onTap: () {
                              Navigation.navigateToScreen(context: context, screen: const VideosPage());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          singleButton(
                            title: 'Pickup History',
                            onTap: () {},
                          ),
                          const SizedBox(width: 10),
                          singleButton(
                            title: 'Get Help',
                            onTap: () {
                              Navigation.navigateToScreen(
                                  context: context, screen: const FAQPage());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 137,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            wasteContainerHorizontal(
                                image: AppImages.slideshow1),
                            wasteContainerHorizontal(
                                image: AppImages.slideshow2),
                            wasteContainerHorizontal(
                                image: AppImages.slideshow3),
                            wasteContainerHorizontal(
                                image: AppImages.slideshow4, rightPadding: 0.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      DashboardMetricGridView(
                        children: [
                          singleCounter(
                              title: 'Recycled \nplastic',
                              count: '20',
                              color: AppColors.boxColor1),
                          singleCounter(
                              title: 'Recycled \nmetals',
                              count: '0',
                              color: AppColors.boxColor2),
                          singleCounter(
                              title: 'Organic \nwaste',
                              count: '13',
                              color: AppColors.boxColor3),
                          singleCounter(
                              title: 'General \nwaste',
                              count: '5',
                              color: AppColors.boxColor4),
                          singleCounter(
                              title: 'General \nwaste',
                              count: '1',
                              color: AppColors.boxColor5),
                          singleCounter(
                              title: 'General \nwaste',
                              count: '0',
                              color: AppColors.boxColor6),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context, screen: const VolunteerPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Become a Volunteer',
                              style: TextStyle(
                                  color: AppColors.darkBlueText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary50,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                  Icons.keyboard_arrow_right_rounded),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // wasteContainerVertical(image: AppImages.slideshow6),
                      // const SizedBox(height: 8),
                      wasteContainerVertical(
                          image: AppImages.slideshow7, rightPadding: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleButton({required String title, required VoidCallback onTap}) {
    return Expanded(
      child: Material(
        elevation: 2,
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: const Border(
                top: BorderSide(color: AppColors.primaryColor, width: 0.8),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Widget wasteContainerHorizontal(
      {required ImageProvider image, double? rightPadding}) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding ?? 8.0),
      child: Container(
        height: 137,
        width: 273,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget wasteContainerVertical(
      {required ImageProvider image, double? rightPadding}) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding ?? 8.0),
      child: Container(
        height: 200,
        // width: 273,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget singleCounter(
      {required String count, required String title, required Color color}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // height: 98,
        padding:
            const EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              count,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
