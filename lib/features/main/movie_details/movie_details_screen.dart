import 'package:flutter/material.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_cast.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_geners.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_head.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_info.dart';
import 'package:movies_app/features/main/movie_details/widgets/movie_screen_shots.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/movie_card_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: .contain,
              alignment: .topCenter,
              image: AssetImage(AppAssets.movieDetailsImage),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            child: SafeArea(
              child: Column(
                children: [
                  MovieHead(
                    movieName: 'Doctor Strange in the Multiverse of Madness',
                    movieTime: '2022',
                  ),
                  SizedBox(height: height * 0.008),
                  CustomElevatedButton(
                    onPressedButton2: () {},
                    title: AppLocalizations.of(context)!.watch,
                    style: AppStyles.bold24White,
                    bgColor: AppColors.redColor,
                  ),
                  SizedBox(height: height * 0.016),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      MovieInfo(text: '15', icon: AppAssets.favoriteIcon),
                      MovieInfo(text: '90', icon: AppAssets.timeIcon),
                      MovieInfo(text: '7.6', icon: AppAssets.rateIcon),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.screenshots,
                        style: AppStyles.bold24White,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.014),
                    itemBuilder: (context, index) {
                      return MovieScreenShots(
                        image: AppAssets.movieScreenShotImage,
                      );
                    },
                  ),
                  SizedBox(height: height * 0.024),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.similar,
                        style: AppStyles.bold24White,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 189 / 279,
                      mainAxisSpacing: height * 0.016,
                      crossAxisSpacing: width * 0.04,
                    ),
                    itemBuilder: (context, index) {
                      return MovieCardItem();
                    },
                  ),
                  SizedBox(height: height * 0.024),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.summary,
                        style: AppStyles.bold24White,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  Text(
                    'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                    style: AppStyles.regular16White,
                  ),
                  SizedBox(height: height * 0.024),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.cast,
                        style: AppStyles.bold24White,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.008),
                    itemBuilder: (context, index) {
                      return MovieCast(
                        name: 'Hayley Atwell',
                        character: 'Captain Carter',
                      );
                    },
                  ),
                  SizedBox(height: height * 0.024),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.genres,
                        style: AppStyles.bold24White,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.016),
                  SizedBox(
                    height: height * 0.132,
                    child: GridView.builder(
                      itemCount: 5,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 28 / 8,
                        mainAxisSpacing: height * 0.011,
                        crossAxisSpacing: width * 0.035,
                      ),
                      itemBuilder: (context, index) {
                        return MovieGeners(generType: 'Action');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
