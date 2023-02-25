import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_services.dart';

import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Trend'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;

            return GridView.builder(
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 70.0,
              ),
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 60.0,
                bottom: 15.0,
              ),
              itemCount: products.length,
              itemBuilder: ((context, index) {
                return CustomCard(
                  product:products[index],
                  
                 
                );
              }),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('There is an error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        }),
      ),
    );
  }
}
