import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/tabs/home/cubit/home_general_cubit.dart';
import 'package:movies_app/features/main/tabs/home/cubit/home_general_state.dart';
import 'package:movies_app/features/main/tabs/home/widgets/home_tab_widget_by_genre.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/widgets/main_error.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/size_utils.dart';
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
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height * 0.65,
              child: (bgImage != null && bgImage.isNotEmpty)
                  ? Image.network(
                bgImage,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )
                  : Image.asset(
                AppAssets.onBoardingImage6,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black45,
                      Colors.black26,
                      Color(0xFF121312),
                      Color(0xFF121312),
                    ],
                    stops: [0.0, 0.35, 0.65, 1.0],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.01),
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
                        height: height * 0.36,
                        child: CarouselSlider.builder(
                          itemCount: state.moviesList.length,
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                              width: width * 0.5,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context, AppRoutes.movieDetailsScreen,
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
                            height: height * 0.36,
                            enlargeCenterPage: true,
                            viewportFraction: 0.5,
                            onPageChanged: (index, reason) {
                              context.read<HomeGeneralCubit>().changeSelectedMovie(index);
                            },
                          ),
                        ),
                      ),
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
          ],
        );
      },
    );
  }
}
