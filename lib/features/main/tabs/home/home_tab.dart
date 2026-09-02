import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/tabs/home/widgets/home_tab_widget_byGenre.dart';
import 'package:movies_app/utils/size_utils.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';
import '../../../../widgets/main_error.dart';
import '../../../../widgets/main_loading_widget.dart';
import '../../../../widgets/movie_card_item.dart';
import 'cubit/home_general_cubit.dart';
import 'cubit/home_general_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return BlocBuilder<HomeGeneralCubit, HomeGeneralState>(
      builder: (context, state) {
        var cubit = context.read<HomeGeneralCubit>();
        String? bgImage;

        if (state is HomeGeneralSuccessState && state.moviesList.isNotEmpty) {
          var movie = state.moviesList[cubit.selectedMovieIndex];
          bgImage = movie.largeCoverImage ?? movie.mediumCoverImage;
        }

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.5),
                BlendMode.darken,
              ),
              fit: BoxFit.fill,
              image: (bgImage != null && bgImage.isNotEmpty)
                  ? NetworkImage(bgImage)
                  : AssetImage(AppAssets.onBoardingImage6) as ImageProvider,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: height * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.availableNowImage),
                SizedBox(height: height * 0.02),

                if (state is HomeGeneralLoadingState || state is HomeGeneralInitialState)
                  const MainLoadingwidget()
                else if (state is HomeGeneralErrorState)
                  MainError(
                    errorMessage: state.errorMessage,
                    onPressed: () {
                      context.read<HomeGeneralCubit>().getMoviesGeneral();
                    },
                    onTap: () {
                      context.read<HomeGeneralCubit>().getMoviesGeneral();
                    },
                  )
                else if (state is HomeGeneralSuccessState)
                    SizedBox(
                      height: height * 0.38,
                      child: CarouselSlider.builder(
                        itemCount: state.moviesList.length,
                        itemBuilder: (context, index, realIndex) {
                          return SizedBox(
                            width: width * 0.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.movieDetailsScreen,
                                  arguments: state.moviesList[index].id,
                                );
                              },
                              child: MovieCardItem(
                                movie: state.moviesList[index] as dynamic,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          height: height * 0.38,
                          enlargeCenterPage: true,
                          viewportFraction: 0.5,
                          onPageChanged: (index, reason) {
                            context.read<HomeGeneralCubit>().changeSelectedMovie(index);
                          },
                        ),
                      ),
                    ),

                SizedBox(height: height * 0.02),
                Image.asset(AppAssets.watchNowImage),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.horror,
                        style: AppStyles.regular20White,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.browseScreen);
                        },
                        child: Row(
                          spacing: width * 0.01,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.see_More,
                              style: AppStyles.regular16DarkPrimary,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.22,
                  child: const HomeTabWidgetByGenre(genre: "Horror"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}