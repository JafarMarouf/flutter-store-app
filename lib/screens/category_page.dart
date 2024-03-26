// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/get_product_by_category_service.dart';

import '../components/custom_card.dart';
import '../components/custom_text_form_feild.dart';
import '../models/product_model.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 15,
            right: 15,
            bottom: 10,
          ),
          child: Form(
            key: formKey,
            child: CustomTextFormField(
              validate: (val) {
                if (val!.isEmpty) {
                  return 'value must not be empty';
                }
                return '';
              },
              customController: searchController,
              hintText: 'hintText',
              type: TextInputType.text,
              isSuffix: true,
              suffixIcon: Icons.search,
              onPressedSuffix: () {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  FutureBuilder<List<ProductModel>>(
                    future: ProductByCategory()
                        .getProductByCategory(categoryName: ''),
                    builder: (context, snapshot) {
                      // print(snapshot.error);
                      if (snapshot.hasData) {
                        List<ProductModel> product = snapshot.data!;
                        // print(product);
                        return GridView.builder(
                          clipBehavior: Clip.none,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.5,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 70,
                                  crossAxisSpacing: 8),
                          itemCount: product.length,
                          itemBuilder: ((context, index) {
                            return CustomeCard(
                              product: product[index],
                            );
                          }),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                  isLoading = false;
                  setState(() {});
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
