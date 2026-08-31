import 'package:flutter/material.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/home/presentaition/screen/home_page.dart';
import 'package:stylish/feathers/search/presentation/widget/search_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/trendingProducts_section_widget.dart';
import 'package:stylish/feathers/product/data/dataSource/product_remote_data_source.dart';
import 'package:stylish/feathers/product/presentation/screens/Detail_product.dart';
import 'package:stylish/feathers/product/presentation/screens/Trending_Products.dart';
import 'package:stylish/gen/fonts.gen.dart';
import 'package:stylish/feathers/splash/presentation/screens/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryTextColor = Colors.black;
    return MaterialApp(
      title: 'Flutter Demo',
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
        colorScheme: ColorScheme.light(
          primary: Color(0xffF83758),
          
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: FontFamily.montserrat,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: primaryTextColor,

          )
        )
       
      ),
      home: const HomePageProvider(),
    );
  }
}
