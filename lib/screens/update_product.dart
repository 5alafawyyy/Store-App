import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static String id = 'UpdateProduct';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    String? productName, productDescription, image, productPrice;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    hintText: 'Product Name',
                    onChanged: (String name) {
                      productName = name;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    onChanged: (String desc) {
                      productDescription = desc;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    hintText: 'Price',
                    onChanged: (String price) {
                      productPrice = price;
                    },
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    hintText: 'Image',
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomButon(
                    onTap: ()async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                       await updateProduct(
                          product,
                          productName,
                          productPrice,
                          productDescription,
                          image,
                        ).then((value) {
                          setState(() {
                            isLoading = false;
                          });
                          if (kDebugMode) {
                            print('Update is done successfully');
                          }
                        });
                      } on Exception {
                        setState(() {
                          isLoading = false;
                        });
                        if (kDebugMode) {
                          print('Update is failed');
                        }
                      }
                    },
                    text: 'Update',
                    buttonBackgroundColor: Colors.blue,
                    buttonTextColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(
    ProductModel product,
    String? productName,
    String? productPrice,
    String? productDescription,
    String? image,
  ) async{
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName ?? product.title,
      price: productPrice ?? product.price,
      description: productDescription ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
