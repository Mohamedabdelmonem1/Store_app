import 'package:flutter/material.dart';
import 'package:store_app/component/custom_category.dart';
import 'package:store_app/services/all_category_services.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 27,
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
            child: FutureBuilder(
              future: AllCategoryServices().getAllCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List products = snapshot.data!;
                  return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 80,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CustomCategory(productName: products[index]);
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
      ),
    );
  }
}
