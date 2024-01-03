import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/component/custom_textfield.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/services/update_product_services.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;
  String? des;
  String? price;
  String? image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Update Product",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    hint: "Product Name",
                    onChanged: (val) {
                      productName = val;
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    hint: "description",
                    onChanged: (val) {
                      des = val;
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    hint: "price",
                    inputType: TextInputType.number,
                    onChanged: (val) {
                      price = val;
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    hint: "image",
                    onChanged: (val) {
                      image = val;
                    }),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await UpdateProductService().updateProduct(
                          title: productName ?? product.title,
                          price: price ?? product.price.toString(),
                          description: des ?? product.description,
                          image: image ?? product.image,
                          category: product.category,
                          id: product.id,
                        );
                        print("success");
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Text(
                      "Update",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
