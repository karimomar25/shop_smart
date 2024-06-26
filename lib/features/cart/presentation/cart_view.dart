import 'package:flutter/material.dart';
import 'package:shop_smart/consts/assets.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/cart/presentation/widgets/cart_bottom_sheet_widget.dart';
import 'package:shop_smart/features/cart/presentation/widgets/cart_widget.dart';
import 'package:shop_smart/features/cart/presentation/widgets/empty_bag.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.assetsImagesBagShoppingBasket,
              title: "Your cart is empty",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            bottomSheet: CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.assetsImagesBagShoppingCart),
              ),
              title: const TitlesTextWidget(label: "Cart (6)"),
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
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartWidget();
              },
            ),
          );
  }
}
