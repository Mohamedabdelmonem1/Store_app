import 'package:flutter/material.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/pages/category_page.dart';
import '../component/custom_card.dart';
import '../services/all_products_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 30,
              )),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        elevation: 0,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryPage(),
                ));
          },
          child: const Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductServices().getAllProducts(),
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
