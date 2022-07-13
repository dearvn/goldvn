import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giavang/bloc/alerts/alerts_bloc.dart';
import 'package:giavang/bloc/auth/auth.dart';
import 'package:giavang/bloc/news/news_bloc.dart';
import 'package:giavang/bloc/options/options_bloc.dart';
import 'package:giavang/bloc/profile/profile_bloc.dart';
import 'package:giavang/bloc/search/search_bloc.dart';
import 'package:giavang/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:giavang/respository/user/repository.dart';
import 'package:giavang/widgets/about/about.dart';
import 'package:giavang/widgets/auth/intro_screen.dart';
import 'package:giavang/widgets/home.dart';
//import 'package:giavang/widgets/main/main_screen.dart';
import 'package:giavang/helpers/style/theme.dart' as Style;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return MultiBlocProvider(
                providers: [
                  BlocProvider<OptionsBloc>(
                    create: (context) => OptionsBloc(),
                  ),
                  //BlocProvider<ProfileBloc>(
                  //  create: (context) => ProfileBloc(),
                  //),
                  BlocProvider<AlertsBloc>(
                    create: (context) => AlertsBloc(),
                  ),
                  BlocProvider<SearchBloc>(
                    create: (context) => SearchBloc(),
                  ),
                  BlocProvider<SectorPerformanceBloc>(
                    create: (context) => SectorPerformanceBloc(),
                  ),
                  BlocProvider<NewsBloc>(
                    create: (context) => NewsBloc(),
                  ),
                ],
                child: MaterialApp(
                  title: 'SPY Options App',
                  theme: ThemeData(brightness: Brightness.dark),
                  home: StockMarketAppHome(),
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/about': (context) => AboutSection()
                  },
                )
            );
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
