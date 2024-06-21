import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/consts/theme_data.dart';
import 'package:shop_smart/features/home/presentation/home_view.dart';
import 'package:shop_smart/providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: Styles.themeData(
              IsDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: HomeView(),
        );
      }),
    );
  }
}
