import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/home/watch_video_page.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const youtubeVideoID = 'VQTtg3KgVv4';
const secondYoutubeVideoID = '0ZiD_Lb3Tm0';
const thirdYoutubeVideoID = '3FEywMvpUeA';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  final firstVideoController = YoutubePlayerController();
  final secondVideoController = YoutubePlayerController();
  final thirdVideoController = YoutubePlayerController();

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Videos Page',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            videoContainer(
                image: AppImages.firstYoutubeVideoImage,
                title: 'Garbage Sorting Rules',
                videoId: youtubeVideoID),
            videoContainer(
                image: AppImages.secondYoutubeVideoImage,
                title: 'Why Waste Segregation is Important',
                videoId: secondYoutubeVideoID),
            videoContainer(
                image: AppImages.thirdYoutubeVideoImage,
                title: 'Waste Management',
                videoId: thirdYoutubeVideoID),
          ],
        ),
      ),
    );
  }

  Widget videoContainer(
      {required ImageProvider image,
      required String title,
      required String videoId}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: () {
          Navigation.navigateToScreen(
              context: context,
              screen: WatchVideoPage(
                videoID: videoId,
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
