import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/app_colors.dart';
import 'blocs/button/button_bloc.dart';
import 'blocs/navbar/navbar_bloc.dart';
import 'blocs/inc_exp/inc_exp_bloc.dart';
import 'core/config/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => IncExpBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.grey,
          fontFamily: Fonts.ns400,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: AppColors.main,
          ),
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
