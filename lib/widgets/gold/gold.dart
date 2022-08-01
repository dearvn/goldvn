import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giavang/bloc/gold/gold_bloc.dart';
import 'package:giavang/widgets/gold/gold_card/gold_card.dart';
import 'package:giavang/widgets/widgets/empty_screen.dart';
import 'package:giavang/widgets/widgets/loading_indicator.dart';

class GoldSectionWidget extends StatefulWidget {
  const GoldSectionWidget();

  @override
  _GoldSectionWidget createState() => _GoldSectionWidget();
}

class _GoldSectionWidget extends State<GoldSectionWidget> {
  Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 60), (Timer t) => _reload());
  }

  void _reload() {
    print("***************************reload gold***************************");
    BlocProvider.of<GoldBloc>(context).add(FetchGold());
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoldBloc, GoldState>(
        builder: (BuildContext context, GoldState state) {
      if (state is GoldInitial) {
        BlocProvider.of<GoldBloc>(context).add(FetchGold());
      }

      if (state is GoldError) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: EmptyScreen(message: state.message),
        );
      }

      if (state is GoldLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.datas.length,
          itemBuilder: (BuildContext context, int index) {
            // Ensure that we don't have empty headlines.
            if (state.datas[index].datas.isEmpty) {
              return EmptyScreen(message: 'Chưa có dữ liệu.');
            }
            return GoldCardWidget(
              title: 'GOLD',
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
