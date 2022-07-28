import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giavang/bloc/alerts/alerts_bloc.dart';
import 'package:giavang/bloc/gold/gold_bloc.dart';
import 'package:giavang/bloc/dollar/dollar_bloc.dart';

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
            BlocProvider<DollarBloc>(
              create: (context) => DollarBloc(),
            ),
            BlocProvider<AlertsBloc>(
              create: (context) => AlertsBloc(),
            ),
            
          ],
          child: MaterialApp(
            title: 'Giá Vàng',
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