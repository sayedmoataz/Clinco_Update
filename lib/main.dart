import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_clinco/Modules/Home_page.dart';
import 'package:new_clinco/cubit/home_cubit_cubit.dart';

import 'Modules/opening/offline_widget.dart';
import 'Modules/opening/splash_screen.dart';
import 'Shared/network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp( DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..forceUpgrade,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Clinco',
        home: OfflineBuilder(connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return const SplashScreen();
          } else {
            return const OfflineWidget();
          }
        },
          child: Center(child: CircularProgressIndicator(color: HexColor('#ECB365'))),
        ),
      )
    );
  }
}

