import 'package:boookia/core/function/textfrom_them.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';

import 'package:boookia/features/home/presentation/page/nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await SharedPrefere.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TextfromThem.themeData,
        home: NavBarScreen(),
      ),
    );
  }
}
