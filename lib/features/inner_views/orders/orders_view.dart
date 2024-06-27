import 'package:flutter/material.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/cart/presentation/widgets/empty_bag.dart';
import 'widgets/orders_widget.dart';

class OrdersViewFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersViewFree({Key? key}) : super(key: key);

  @override
  State<OrdersViewFree> createState() => _OrdersViewFreeState();
}

class _OrdersViewFreeState extends State<OrdersViewFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: 'Placed orders',
          ),
        ),
        body: isEmptyOrders
            ? EmptyBagWidget(
                imagePath: Assets.assetsImagesBagOrder,
                title: "No orders has been placed yet",
                subtitle: "",
                buttonText: "Shop now")
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersWidgetFree(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                      // thickness: 8,
                      // color: Colors.red,
                      );
                },
              ));
  }
}
