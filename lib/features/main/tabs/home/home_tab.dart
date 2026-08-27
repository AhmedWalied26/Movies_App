import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/main/tabs/home/home_tab_view_model.dart';
import 'package:movies_app/features/main/tabs/home/home_tab_view_model_bottom.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../widgets/movie_card_item.dart';
import '../../widgets/main_error_widget.dart';
import '../../widgets/main_loading_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  HomeTabViewModelBottom viewModelBottom = HomeTabViewModelBottom();

  @override
  void initState() {
    super.initState();
    viewModel.getMoviesByGenre('');
    viewModelBottom.getMoviesByGenre('Action');
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
          ChangeNotifierProvider(
            create: (context) =>  viewModel,
            child: Consumer<HomeTabViewModel>(
                builder: (context, viewModel, child) {
                 if (viewModel.isLoading == true){
                   return MainLoadingwidget();
                 } else if(viewModel.errorMessage != null) {
                   return MainErrorWidget(errorMessage: viewModel.errorMessage!,
                       onPressed: (){
                     viewModel.moviesList;
                       });
                 }else if (viewModel.moviesList == null){
                   return MainLoadingwidget();
                 }else{
                  var moviesList = viewModel.moviesList?? [];
                  return CarouselSlider.builder(
                  itemCount: moviesList.length,
                  itemBuilder: (context, index , realIndex) {
                  return SizedBox(
                  width: width*0.5,
                  child: MovieCardItem(
                  movie: moviesList[index],
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
               },
            ),
              ),
            Image.asset(AppAssets.watchNowImage),
            Padding(
              padding: EdgeInsetsDirectional.only(start: width * 0.035),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.action,
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
              child:  ChangeNotifierProvider(
                create: (context) =>  viewModelBottom,
                child: Consumer<HomeTabViewModelBottom>(
                  builder: (context, viewModel, child) {
                    if (viewModel.isLoading == true){
                      return MainLoadingwidget();
                    } else if(viewModel.errorMessage != null) {
                      return MainErrorWidget(errorMessage: viewModel.errorMessage!,
                          onPressed: (){
                            viewModel.getMoviesByGenre("Action");
                          });
                    }else if (viewModel.actionMoviesList == null){
                      return MainLoadingwidget();
                    }else{
                      var moviesList = viewModel.actionMoviesList?? [];
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesList.length,
                        separatorBuilder: (context, index) => SizedBox(width: width * 0.035),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.33,
                            child: MovieCardItem(
                              movie: moviesList[index],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
FutureBuilder(
                future: DioManager.getMoviesByGenre("Action"),
                builder: (context, snapshot) {
                  //todo : Loading ;
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return MainLoadingwidget();
                  }
                  else if (snapshot.hasError){
                    return MainErrorWidget(
                        errorMessage: "Something went wrong",
                        onPressed: (){
                          DioManager.getMoviesByGenre("Drama");
                          setState(() {

                          });
                        }
                    );
                  }
                  else if (snapshot.data!.status != "ok"){
                    return MainErrorWidget(
                        errorMessage: snapshot.data!.message!,
                        onPressed: (){
                          DioManager.getMoviesByGenre("Drama");
                          setState(() {

                          });
                        }
                    );
                  }
                  else {
                    var moviesList = snapshot.data?.data?.movies ?? [];
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                      scrollDirection: Axis.horizontal,
                      itemCount: moviesList.length,
                      separatorBuilder: (context, index) => SizedBox(width: width * 0.035),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: width * 0.33,
                          child: MovieCardItem(
                            movie: moviesList[index],
                          ),
                        );
                      },
                    );
                  }
                },)
 */
