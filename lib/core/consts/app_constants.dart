import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/models/categories_model.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';
  static List<String> bannersImages = [
    Assets.assetsImagesBannersBanner1,
    Assets.assetsImagesBannersBanner2,
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "Phones",
      image: Assets.assetsImagesCategoriesMobiles,
      name: "Phones",
    ),
    CategoriesModel(
      id: "Laptops",
      image: Assets.assetsImagesCategoriesPc,
      name: "Laptops",
    ),
    CategoriesModel(
      id: "Electronics",
      image: Assets.assetsImagesCategoriesElectronics,
      name: "Electronics",
    ),
    CategoriesModel(
      id: "Watches",
      image: Assets.assetsImagesCategoriesWatch,
      name: "Watches",
    ),
    CategoriesModel(
      id: "Clothes",
      image: Assets.assetsImagesCategoriesFashion,
      name: "Clothes",
    ),
    CategoriesModel(
      id: "Shoes",
      image: Assets.assetsImagesCategoriesShoes,
      name: "Shoes",
    ),
    CategoriesModel(
      id: "Books",
      image: Assets.assetsImagesCategoriesBookImg,
      name: "Books",
    ),
    CategoriesModel(
      id: "Cosmetics",
      image: Assets.assetsImagesCategoriesCosmetics,
      name: "Cosmetics",
    ),
  ];
}
