import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_page.dart';

class CustomeCard extends StatefulWidget {
  final ProductModel product;

  const CustomeCard({super.key, required this.product});

  @override
  State<CustomeCard> createState() => _CustomeCardState();
}

class _CustomeCardState extends State<CustomeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id,
            arguments: widget.product.id);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 14,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(1, 1)),
            ]),
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 10),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // '',
                          '\$ ${widget.product.price}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 10,
            child: Image.network(
              widget.product.image,
              width: 85,
              height: 85,
            ),
          ),
        ],
      ),
    );
  }
}
