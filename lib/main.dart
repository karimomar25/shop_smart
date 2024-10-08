import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/consts/theme_data.dart';
import 'package:shop_smart/core/providers/products_provider.dart';
import 'package:shop_smart/core/root_view.dart';
import 'package:shop_smart/core/providers/theme_provider.dart';
import 'package:shop_smart/features/inner_views/product_details/product_details_view.dart';
import 'package:shop_smart/features/search/presentation/search_view.dart';
import 'package:short_navigation/short_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductsProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          routes: {
            SearchView.routeName: (context) => const SearchView(),
            ProductDetailsView.routName: (context) =>
                const ProductDetailsView(),
          },
          navigatorKey: Go.navigatorKey,
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const RootView(),
        );
      }),
    );
  }
}
