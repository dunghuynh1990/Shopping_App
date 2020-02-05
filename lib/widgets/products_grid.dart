import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFaves;
  ProductsGrid(this.showFaves);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFaves ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }


//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: Provider.of<Products>(context),
//      builder: (context, dataSnapshot) {
//        if (dataSnapshot.connectionState == ConnectionState.waiting) {
//          return Center(child: CircularProgressIndicator());
//        } else {
//          if (dataSnapshot.error != null) {
//            return Center(child: Text('An error occured!'));
//          } else {
//            final productsData = Provider.of<Products>(context, listen: false);
//            final products = showFaves ? productsData.favoriteItems : productsData.items;
//            return GridView.builder(
//              padding: const EdgeInsets.all(8.0),
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10,
//                childAspectRatio: 3 / 2,
//              ),
//              itemCount: products.length,
//              itemBuilder: (context, index) => ChangeNotifierProvider.value(
//                value: products[index],
//                child: ProductItem(),
//              ),
//            );
//          }
//        }
//      },
//    );
//  }
}