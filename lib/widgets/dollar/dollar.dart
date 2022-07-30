import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:giavang/bloc/dollar/dollar_bloc.dart';
import 'package:giavang/widgets/dollar/dollar_card/dollar_card.dart';
import 'package:giavang/widgets/widgets/empty_screen.dart';

import 'package:giavang/widgets/widgets/loading_indicator.dart';

class DollarSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DollarBloc, DollarState>(
        builder: (BuildContext context, DollarState state) {
      if (state is DollarInitial) {
        BlocProvider.of<DollarBloc>(context).add(FetchDollar());
      }

      Timer.periodic(Duration(seconds: 300), (timer) {
        BlocProvider.of<DollarBloc>(context).add(FetchDollar());
      });

      if (state is DollarError) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: EmptyScreen(message: state.message),
        );
      }

      if (state is DollarLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.datas.length,
          itemBuilder: (BuildContext context, int index) {
            // Ensure that we don't have empty headlines.
            if (state.datas[index].datas.isEmpty) {
              return EmptyScreen(
                  message:
                      'There are no data related to ${state.datas[index].keyWord}.');
            }
            return DollarCardWidget(
              title: 'Dollar',
              datas: state.datas[index].datas,
            );
          },
        );
      }

      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3, left: 4, right: 4),
        child: LoadingIndicatorWidget(),
      );
    });
  }
}
