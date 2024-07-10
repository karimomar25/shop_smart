import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/widgets/app_name_text_widget.dart';
import 'package:shop_smart/core/widgets/subtitle_text.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/inner_views/product_details/widgets/heart_btn.dart';

import '../../../core/providers/products_provider.dart';

class ProductDetailsView extends StatefulWidget {
  static const routName = "/ProductDetailsScreen";
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrentProduct =
    productsProvider.findByProductId(productId!);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        // automaticallyImplyLeading: false,
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrentProduct!.productImage,
              height: size.height * 0.38,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          getCurrentProduct.productTitle,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                       SubtitleTextWidget(
                        label: getCurrentProduct.productPrice,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeartButtonWidget(
                          bkgColor: Colors.blue.shade100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.0,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.add_shopping_cart),
                              label: const Text("Add to cart"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitlesTextWidget(label: "About this item"),
                      SubtitleTextWidget(label: getCurrentProduct.productCategory),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubtitleTextWidget(label: getCurrentProduct.productDescription),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
