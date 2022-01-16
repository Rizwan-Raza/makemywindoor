import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/model/product.dart';
import 'package:makemywindoor/utils/size_config.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: product.pImageURL,
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.36,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              // Image.network(product.pImageURL,
              //     width: double.infinity,
              //     height: SizeConfig.screenHeight * 0.36,
              //     fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.pName,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        const Icon(
                          LineIcons.indianRupeeSign,
                          color: Colors.black,
                        ),
                        Text(product.pPrice,
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
              Text(product.pType,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              Text(product.pDescription),
            ],
          ),
        ),
      ),
    );
  }
}
