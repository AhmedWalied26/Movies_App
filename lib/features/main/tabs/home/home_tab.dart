import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movie_card_item.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.5),
            .darken,
          ),
          fit: .fill,
          image: AssetImage(AppAssets.onBoardingImage6),
        ),
      ),
      child: SingleChildScrollView(
        padding: .only(bottom: height * 0.1),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Image.asset(AppAssets.availableNowImage),
            CarouselSlider.builder(
              itemCount: 6,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(width: width * 0.52, child: MovieCardItem());
              },
              options: CarouselOptions(
                autoPlay: true,
                height: height * 0.351,
                enlargeCenterPage: true,
                viewportFraction: 0.55,
              ),
            ),
            Image.asset(AppAssets.watchNowImage),
            Padding(
              padding: .directional(start: width * 0.035),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.action,
                    style: AppStyles.regular20White,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: width * 0.01,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.see_More,
                          style: AppStyles.regular16DarkPrimary,
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.22,
              child: ListView.separated(
                padding: .symmetric(horizontal: width * 0.035),
                separatorBuilder: (context, index) =>
                    SizedBox(width: width * 0.035),
                scrollDirection: .horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(width: width * 0.33, child: MovieCardItem());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
