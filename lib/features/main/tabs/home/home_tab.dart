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
import '../../../../utils/app_styles.dart';
import '../../../../widgets/movie_card_item.dart';
import '../../../../widgets/main_loading_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeGeneralCubit>().getMoviesGeneral();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.5),
            BlendMode.darken,
          ),
<<<<<<< HEAD
          fit: BoxFit.fill,
          image: AssetImage(AppAssets.onBoardingImage6),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.availableNowImage),
            BlocBuilder<HomeGeneralCubit, HomeGeneralState>(
              builder: (context, state) {
                if (state is HomeGeneralLoadingState) {
                  return const MainLoadingwidget();
                } else if (state is HomeGeneralErrorState) {
                  return MainError(
=======
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
>>>>>>> f8a2f63 (feat: update home background dynamically with active movie poster)
                    errorMessage: state.errorMessage,
                    onPressed: () {
                      context.read<HomeGeneralCubit>().getMoviesGeneral();
                    },
                    onTap: () {
                      context.read<HomeGeneralCubit>().getMoviesGeneral();
                    },
                  );
                } else if (state is HomeGeneralSuccessState) {
                  var moviesList = state.moviesList;
                  return CarouselSlider.builder(
                    itemCount: moviesList.length,
                    itemBuilder: (context, index, realIndex) {
                      return SizedBox(
                        width: width * 0.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.movieDetailsScreen,
                              arguments: moviesList[index].id,
                            );
                          },
                          child: MovieCardItem(
                            movie: moviesList[index] as dynamic,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      height: height * 0.38,
                      enlargeCenterPage: true,
                      viewportFraction: 0.5,
                    ),
                  );
                }
                return const SizedBox();
              },
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
              child: HomeTabWidgetByGenre(genre: "Horror"),
            ),
          ],
        ),
      ),
    );
  }
}
