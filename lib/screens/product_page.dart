// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/components/custom_text_form_feild.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_single_product_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/update_product.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    super.key,
  });
  static String id = 'ProductPage';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? title, desc, price, image;

  bool isLoading = false, isOpen = false;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var bottomSheetController;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            automaticallyImplyLeading: false,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.store,
                  color: Color.fromARGB(255, 245, 77, 5),
                  size: 34,
                ),
                Text(
                  ' StoreAPP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  ' PRO',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Color.fromARGB(255, 245, 77, 5),
                  ),
                ),
              ],
            ),
          ),
          body: FutureBuilder<dynamic>(
              future: SingleProduct().getSingleProduct(id: id),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  ProductModel productModel = snapshot.data!;
                  return Container(
                    padding: EdgeInsets.all(20),
                    // width: 700,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 200,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.network(productModel.image,
                                  fit: BoxFit.contain)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            productModel.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          productModel.description,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        Text(
                          '${productModel.price} \$',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 245, 77, 5),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          productModel.category,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        Text(
                          'rating : ${productModel.rating.rate}  count:${productModel.rating.count}',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                            if (isOpen) {
                              bottomSheetController = scaffoldKey.currentState!
                                  .showBottomSheet((context) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  width: double.infinity,
                                  // decoration: BoxDecoration(color: Colors.red),
                                  child: Form(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFeild(
                                          hintText: 'Product Title',
                                          inputType: TextInputType.text,
                                          onChanged: (data) {
                                            title = data;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFeild(
                                          hintText: 'Product Description',
                                          inputType: TextInputType.text,
                                          onChanged: (data) {
                                            desc = data;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFeild(
                                          hintText: 'Product price',
                                          inputType: TextInputType.number,
                                          onChanged: (data) {
                                            price = data;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFeild(
                                          hintText: 'Product Image',
                                          inputType: TextInputType.text,
                                          onChanged: (data) {
                                            image = data;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            isLoading = true;
                                            setState(() {});
                                            try {
                                              updateProduct(productModel);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'updated product successfully')));
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text(e.toString())));
                                              // print(e.toString());
                                            }
                                            isLoading = false;
                                            setState(() {});
                                          },
                                          color: const Color.fromARGB(
                                              255, 245, 77, 5),
                                          child: const Text(
                                            'Update Product',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                              bottomSheetController.closed.then((value) {
                                setState(() {
                                  isOpen = !isOpen;
                                });
                              });
                              print('clesed');
                            } else {
                              Navigator.of(context).pop();
                              print('closed from pop');
                              setState(() {
                                isOpen = !isOpen;
                              });
                            }
                          },
                          color: Color.fromARGB(255, 245, 77, 5),
                          child: const Text(
                            'Update Product',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  // return Column(children: [Text('${productModel.description}')]);
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }))),
    );
  }

  void updateProduct(ProductModel productModel) {
    UpdateProductService().updateProduct(
        id: productModel.id,
        title: title == null ? productModel.title : title!,
        price: price == null ? productModel.price.toString() : price!,
        desc: desc == null ? productModel.description : desc!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
