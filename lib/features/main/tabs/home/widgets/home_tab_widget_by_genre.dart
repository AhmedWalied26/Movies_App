import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/main_error.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../../widgets/movie_card_item.dart';
import '../../../../../widgets/main_loading_widget.dart';
import '../cubit/home_genre_cubit.dart';
import '../cubit/home_genre_state.dart';

class HomeTabWidgetByGenre extends StatefulWidget {
  final String? genre;
  const HomeTabWidgetByGenre({super.key, this.genre});

  @override
  State<HomeTabWidgetByGenre> createState() => _HomeTabWidgetByGenreState();
}

class _HomeTabWidgetByGenreState extends State<HomeTabWidgetByGenre> {
  late HomeGenreCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeGenreCubit()..getMoviesByGenre(widget.genre!);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return BlocProvider(
      create: (context) => HomeGenreCubit()..getMoviesByGenre(widget.genre!),
      child: BlocBuilder<HomeGenreCubit, HomeGenreState>(
        builder: (context, state) {
          if (state is HomeGenreLoadingState) {
            return const MainLoadingwidget();
          } else if (state is HomeGenreErrorState) {
            return MainError(
              errorMessage: state.errorMessage,
              onPressed: () {
                context.read<HomeGenreCubit>().getMoviesByGenre(widget.genre!);
              },
              onTap: () {
                context.read<HomeGenreCubit>().getMoviesByGenre(widget.genre!);
              },
            );
          } else if (state is HomeGenreSuccessState) {
            var moviesList = state.moviesList;
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.035),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: width * 0.33,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.movieDetailsScreen,
                        arguments: moviesList[index].id,
                      );
                    },
                    child: MovieCardItem(movie: moviesList[index] as dynamic),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}