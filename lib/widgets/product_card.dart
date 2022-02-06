import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/models/product.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl,
              width: double.infinity,
              // height: SizeConfig.screenHeight * 0.36,
              height: (SizeConfig.screenWidth / 2 - 12 - 5 - 24) * 2 / 3,
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
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(product.type,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text(
              product.description,
              maxLines: 3,
              style: const TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ' + product.price,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                      label: const Text("Share"),
                      onPressed: () async {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (childContext) {
                              return AlertDialog(
                                title: const Text('Loading ...'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('please wait ...')
                                  ],
                                ),
                              );
                            });

                        final response = await get(Uri.parse(product.imageUrl));
                        final Directory temp = Directory.systemTemp;
                        final File imageFile = File('${temp.path}/Product');
                        imageFile.writeAsBytesSync(response.bodyBytes);
                        Share.shareFiles(
                          ['${temp.path}/Product'],
                          text:
                              'Name: ${product.name}\nPrice: ${product.price}\nDescription: ${product.description}\nType: ${product.type}',
                        ).then((value) => Navigator.pop(context));
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      icon: const Icon(LineIcons.shareSquare, size: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchWhatsApp(Product product) async {
    String whatsappText =
        "Name: ${product.name}\nType: ${product.type}\nDescription: ${product.description}\nI would Like to talk to you regarding this product.";
    String uri =
        'https://wa.me/+918041246348?text=${Uri.encodeComponent(whatsappText)}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch';
    }
  }
}
