import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/downloads/downloads_bloc.dart';
import 'package:flutter_movie_app/domain/core/dipendencyInjection/injectable.dart';
import 'package:flutter_movie_app/presentation/main_page/screen_main_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application/search/search_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
