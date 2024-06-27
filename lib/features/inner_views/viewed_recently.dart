import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/widgets/product_widget.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/cart/presentation/widgets/empty_bag.dart';


class ViewedRecentlyView extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";
  const ViewedRecentlyView({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.assetsImagesBagOrder,
              title: "No viewed products yet",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.assetsImagesBagShoppingCart,
                ),
              ),
              title: const TitlesTextWidget(label: "Viewed recently (6)"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              builder: (context, index) {
                return const ProductWidget();
              },
              itemCount: 200,
              crossAxisCount: 2,
            ),
          );
  }
}
