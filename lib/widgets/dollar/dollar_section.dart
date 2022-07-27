import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:giavang/bloc/dollar/dollar_bloc.dart';
import 'package:giavang/shared/colors.dart';
//import 'package:giavang/widgets/dollar/search_box/seach_box.dart';
import 'package:giavang/widgets/dollar/dollar.dart';
import 'package:giavang/widgets/widgets/empty_screen.dart';
import 'package:giavang/widgets/widgets/standard/header.dart';

class DollarSection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: OfflineBuilder(
        child: Container(),
        connectivityBuilder: ( context,  connectivity, child,  ) {
          return connectivity == ConnectivityResult.none 
          ? _buildNoConnectionMessage(context)
          : _buildContent(context);
        }
      )
    );
  }

  Widget _buildNoConnectionMessage(context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 14,
        left: 24,
        right: 24
      ),
      child: EmptyScreen(message: 'Vui lòng kết nối internet.'),
    );
  }

  Widget _buildContent(context) {
    return RefreshIndicator(
      child: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [

            StandardHeader(
              title: 'TỶ GIÁ',
              subtitle: '',
              action: Container(),
            ),

            //SizedBox(height: 16),
            //SearchBoxWidget(),
            //SizedBox(height: 16),
            DollarSectionWidget()
          ]
        )
      ),

      onRefresh: () async {
        // Reload markets section.
        BlocProvider
        .of<DollarBloc>(context)
        .add(FetchDollar());
      },
    );
  }
}