import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/funcs/my_app_functions.dart';
import 'package:shop_smart/core/widgets/app_name_text_widget.dart';
import 'package:shop_smart/core/widgets/subtitle_text.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/inner_views/viewed_recently.dart';
import 'package:shop_smart/features/inner_views/wishlist.dart';
import 'package:shop_smart/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:shop_smart/providers/theme_provider.dart';
import 'package:short_navigation/short_navigation.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.assetsImagesBagShoppingCart),
        ),
        title: const AppNameTextWidget(
          fontSize: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TitlesTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 3),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label: "Hadi Kachmar"),
                      SizedBox(
                        height: 6,
                      ),
                      SubtitleTextWidget(label: "Coding.with.hadi@gmail.com")
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitlesTextWidget(
                  label: "General",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                  text: "All Order",
                  imagePath: Assets.assetsImagesBagOrderSvg,
                  function: () {},
                ),
                CustomListTile(
                  text: "Wishlist",
                  imagePath: Assets.assetsImagesBagWishlistSvg,
                  function: () {
                    Go.to(WishlistView());
                  },
                ),
                CustomListTile(
                  text: "Viewed recently",
                  imagePath: Assets.assetsImagesProfileRecent,
                  function: () {
                    Go.to(ViewedRecentlyView());
                  },
                ),
                CustomListTile(
                  text: "Address",
                  imagePath: Assets.assetsImagesProfileAddress,
                  function: () {},
                ),
                const SizedBox(height: 6),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 6),
                const TitlesTextWidget(
                  label: "Settings",
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  secondary: Image.asset(
                    Assets.assetsImagesProfileTheme,
                    height: 34,
                  ),
                  title: Text(themeProvider.getIsDarkTheme
                      ? "Dark Mode"
                      : "Light Mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
              ),
              icon: const Icon(Icons.login),
              label: const Text("Login"),
              onPressed: () async {
                await MyAppFunctions.showErrorOrWarningDialog(
                    context: context,
                    subtitle: "Are you sure you want to signout",
                    fct: () {},
                    isError: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
