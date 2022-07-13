import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giavang/bloc/alerts/alerts_bloc.dart';

import 'package:giavang/bloc/gold/gold_bloc.dart';
import 'package:giavang/bloc/news/news_bloc.dart';
//import 'package:giavang/bloc/portfolio/portfolio_bloc.dart';
//import 'package:giavang/bloc/profile/profile_bloc.dart';
import 'package:giavang/bloc/search/search_bloc.dart';
//import 'package:giavang/bloc/sector_performance/sector_performance_bloc.dart';

import 'package:giavang/widgets/about/about.dart';
import 'package:giavang/widgets/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<GoldBloc>(
              create: (context) => GoldBloc(),
            ),
            BlocProvider<AlertsBloc>(
              create: (context) => AlertsBloc(),
            ),
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(),
            ),
            //BlocProvider<SectorPerformanceBloc>(
            //  create: (context) => SectorPerformanceBloc(),
            //),
            BlocProvider<NewsBloc>(
              create: (context) => NewsBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'GIAVANG',
            theme: ThemeData(brightness: Brightness.dark),
            home: StockMarketAppHome(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/about': (context) => AboutSection()
            },
          )
      )
  );
}