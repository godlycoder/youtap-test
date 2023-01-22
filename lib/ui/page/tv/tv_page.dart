import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_db/ui/component/block_tv.dart';
import 'package:movie_db/ui/page/tv/bloc/tv_cubit.dart';
import 'package:movie_db/ui/page/tv/bloc/tv_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<StatefulWidget> createState() => _TvPageState();

}

class _TvPageState extends State<TvPage> {

  @override
  void initState() {
    BlocProvider.of<TvCubit>(context)
      ..getOnAirTv()
      ..getPopularTv();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<TvCubit, TvState>(
          listener: (_, state) {
            if (state is ErrorTvState) {
              Fluttertoast.showToast(msg: state.message);
            }
          },
          child: ListView(
            children: [
              BlocBuilder<TvCubit, TvState>(
                  buildWhen: (_, state) {
                    return state is GetOnAirTvState;
                  },
                  builder: (_, state) {
                    List<TvUiModel>? list;

                    if (state is GetOnAirTvState) {
                      list = state.data;
                    }

                    return UiKitBlockTv(
                      title: AppLocalizations.of(context)?.tvOnTheAirTitle ?? '',
                      subtitle: AppLocalizations.of(context)?.tvOnTheAirDesc ?? '',
                      list: list,
                    );
                  }
              ),
              BlocBuilder<TvCubit, TvState>(
                  buildWhen: (_, state) {
                    return state is GetPopularTvState;
                  },
                  builder: (_, state) {
                    List<TvUiModel>? list;

                    if (state is GetPopularTvState) {
                      list = state.data;
                    }

                    return UiKitBlockTv(
                      title: AppLocalizations.of(context)?.tvPopularTitle ?? '',
                      subtitle: AppLocalizations.of(context)?.tvPopularDesc ?? '',
                      list: list,
                      type: UiKitBlockTvType.item,
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