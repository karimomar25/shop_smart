import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/providers/products_provider.dart';
import 'package:shop_smart/core/widgets/subtitle_text.dart';
import 'package:shop_smart/core/widgets/title_text.dart';
import 'package:shop_smart/features/inner_views/product_details/product_details_view.dart';
import 'package:shop_smart/features/inner_views/product_details/widgets/heart_btn.dart';
import 'package:short_navigation/short_navigation.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.porductId,
  });
  // pass the productId value in the constructor of our widget to access it everywhere we call the widget
  final String porductId;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
// make an instanse of our product provider to access the funcs and every thing in it
    final productsProvider = Provider.of<ProductsProvider>(context);
//     access the func we want from our instanse which we made
    final getCurrentProduct =
        // here we pass the id of the productId which is in the func the variable in the constructor
        productsProvider.findByProductId(widget.porductId);
    return getCurrentProduct == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () {
                Go.to(const ProductDetailsView());
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      // passing here
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TitlesTextWidget(
                            // passing here

                            label: getCurrentProduct.productTitle,
                            fontSize: 18,
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                                onPressed: () {},
                                icon: const HeartButtonWidget(
                                  size: 28,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SubtitleTextWidget(
                            // passing here

                            label: getCurrentProduct.productPrice,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.lightBlue,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              onTap: () {},
                              splashColor: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          );
  }
}
 // >> after passing go to view which we will show our widget in like SearhView in this app