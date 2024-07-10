import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/models/product_model.dart';
import 'package:shop_smart/core/providers/products_provider.dart';
import 'package:shop_smart/core/widgets/product_widget.dart';
import 'package:shop_smart/core/widgets/title_text.dart';

class SearchView extends StatefulWidget {
  static const routeName = " /SearchView";
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final poroductsProvider = Provider.of<ProductsProvider>(context);

    // get the cat name we passed while navigation
    String? passedCaterogy =
        ModalRoute.of(context)!.settings.arguments as String?;

    List<ProductModel> productList = passedCaterogy == null
        ? poroductsProvider.products
        : poroductsProvider.findProductByCaterogy(
            caterogyName: passedCaterogy.toLowerCase());
    // create instance of our product provider
    final productsProvider = Provider.of<ProductsProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.assetsImagesBagShoppingCart),
          ),
          title: TitlesTextWidget(label: passedCaterogy ?? "Search products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      searchTextController.clear();
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
                onChanged: (value) {
                  // log("value of the text is $value");
                },
                onSubmitted: (value) {
                  // log("value of the text is $value");
                  // log("value of the controller text: ${searchTextController.text}");
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: DynamicHeightGridView(
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    builder: (context, index) {
                      return ProductWidget(
                        // give the value of the prodcutId to equal the
                        porductId: productList[index].productId,
                      );
                    },
                    // give the length to the gridview from the products list which is in our provider
                    itemCount: productList.length,
                    crossAxisCount: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
