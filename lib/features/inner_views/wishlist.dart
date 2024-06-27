import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/providers/products_provider.dart';
import 'package:shop_smart/core/widgets/product_widget.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/cart/presentation/widgets/empty_bag.dart';

class WishlistView extends StatelessWidget {
  static const routName = "/WishlistScreen";
  const WishlistView({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.assetsImagesBagBagWish,
              title: "Nothing in ur wishlist yet",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.assetsImagesBagShoppingCart),
              ),
              title: const TitlesTextWidget(label: "Wishlist (6)"),
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
                return ProductWidget(
                  porductId: productsProvider.getProduct[index].productId,
                );
              },
              itemCount: productsProvider.getProduct.length,
              crossAxisCount: 2,
            ),
          );
  }
}
