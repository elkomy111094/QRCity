import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/View_Models/filter_view_model/home_filter_cubit.dart';
import 'package:qr_city/View_Models/notes_view_model/notes_cubit.dart';
import 'package:qr_city/Views/Screens/splash_Screen.dart';
import 'package:qr_city/translations/codegen_loader.g.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kDarkBlue, // navigation bar color
    statusBarColor: kDarkBlue, // status bar color
    systemNavigationBarDividerColor: Colors.grey,
  ));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeFilterCubit()),
      BlocProvider(create: (context) => NotesCubit()),
    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: QrCityApp()),
    /* DevicePreview(
      builder: (BuildContext context) => QrCityApp(),
    ),*/
  ));
}

class QrCityApp extends StatelessWidget {
  const QrCityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Sizer(
      builder: (BuildContext context, Orientation orientation, _) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: SplashScreen()),
        );
      },
    );
  }
}
