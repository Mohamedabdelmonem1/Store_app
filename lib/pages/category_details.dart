import 'package:flutter/material.dart';
import 'package:store_app/services/get_category_services.dart';
import '../component/custom_card.dart';
import '../models/all_product_model.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    String productName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
          child: FutureBuilder<List<ProductModel>>(
            future: CategoryServices()
                .getCategoryProducts(categoryName: productName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
