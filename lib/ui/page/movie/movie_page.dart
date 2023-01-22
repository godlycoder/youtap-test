import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_db/ui/component/block_movie.dart';
import 'package:movie_db/ui/page/movie/bloc/movie_cubit.dart';
import 'package:movie_db/ui/page/movie/bloc/movie_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<StatefulWidget> createState() => _MoviePageState();

}

class _MoviePageState extends State<MoviePage> {

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context)
      ..getNowPlayingMovies()
      ..getPopularMovies()
      ..getUpcomingMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<MovieCubit, MovieState>(
          listener: (_, state) {
            if (state is ErrorMovieState) {
              Fluttertoast.showToast(msg: state.message);
            }
          },
          child: ListView(
            children: [
              BlocBuilder<MovieCubit, MovieState>(
                buildWhen: (_, state) {
                  return state is GetNowPlayingMoviesState;
                },
                builder: (_, state) {
                  List<MovieUiModel>? list;

                  if (state is GetNowPlayingMoviesState) {
                    list = state.data;
                  }

                  return UiKitBlockMovie(
                    title: AppLocalizations.of(context)?.nowPlayingTitle ?? '',
                    subtitle: AppLocalizations.of(context)?.nowPlayingDesc ?? '',
                    list: list,
                  );
                }
              ),
              BlocBuilder<MovieCubit, MovieState>(
                  buildWhen: (_, state) {
                    return state is GetPopularMoviesState;
                  },
                  builder: (_, state) {
                    List<MovieUiModel>? list;

                    if (state is GetPopularMoviesState) {
                      list = state.data;
                    }

                    return UiKitBlockMovie(
                      title: AppLocalizations.of(context)?.popularTitle ?? '',
                      subtitle: AppLocalizations.of(context)?.popularDesc ?? '',
                      list: list,
                      type: UiKitBlockMovieType.item,
                    );
                  }
              ),
              BlocBuilder<MovieCubit, MovieState>(
                  buildWhen: (_, state) {
                    return state is GetUpcomingMoviesState;
                  },
                  builder: (_, state) {
                    List<MovieUiModel>? list;

                    if (state is GetUpcomingMoviesState) {
                      list = state.data;
                    }

                    return UiKitBlockMovie(
                      title: AppLocalizations.of(context)?.upcomingTitle ?? '',
                      list: list,
                      type: UiKitBlockMovieType.item,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

}