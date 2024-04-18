import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:krunaltask/controller/ControlBinding.dart';
import 'package:krunaltask/screens/HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// System Orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        designSize: const Size(375, 812),
    useInheritedMediaQuery: true,
    minTextAdapt: true,
    splitScreenMode: false,
    builder: (context, widget) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ControlBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
    });
  }
}