import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:giavang/bloc/options/options_bloc.dart';
import 'package:giavang/widgets/options/options_card/options_card.dart';
import 'package:giavang/widgets/widgets/empty_screen.dart';

import 'package:giavang/widgets/widgets/loading_indicator.dart';

class OptionsSectionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionsBloc, OptionsState>(
      builder: (BuildContext context, OptionsState state) {

        if (state is OptionsInitial) {
          BlocProvider
          .of<OptionsBloc>(context)
          .add(FetchOptions());
        }

        if (state is OptionsError) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: EmptyScreen(message: state.message),
          );
        }

        if (state is OptionsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.options.length,
            itemBuilder: (BuildContext context, int index) {

              // Ensure that we don't have empty headlines.
              if (state.options[index].options.isEmpty ) {
                return EmptyScreen(message: 'There are no options related to ${state.options[index].keyWord}.');
              }
              return OptionsCardWidget(
                title: 'SPY',
                options: state.options[index].options,
              );
            },
          );
        }

        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3,
            left: 4,
            right: 4
          ),
          child: LoadingIndicatorWidget(),
        );
      }
    );
  }

}
