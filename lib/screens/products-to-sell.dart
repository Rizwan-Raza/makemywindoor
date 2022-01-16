import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/helperwidgets/product_card.dart';
import 'package:makemywindoor/model/product.dart';
import 'package:makemywindoor/services/project_service.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final int selectedFilter;
  const ProductsScreen({Key? key, this.selectedFilter = 0}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selected = 0;
  List<String> chips = ["All", "Doors", "Windows", "Others"];
  @override
  void initState() {
    super.initState();
    selected = widget.selectedFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[2],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
                children: chips
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FilterChip(
                            label: Text(e),
                            selected: selected == chips.indexOf(e),
                            onSelected: (bool value) {
                              setState(() {
                                selected = chips.indexOf(e);
                              });
                            },
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            showCheckmark: false,
                          ),
                        ))
                    .toList()),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: Provider.of<ProjectServices>(context)
                    .getProductsOf(selected),
                // stream: Provider.of<ProjectServices>(context).getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.5,
                              height: SizeConfig.screenHeight * 0.5,
                              child: Lottie.asset(
                                  "assets/imgs/lotties/empty.json",
                                  repeat: false),
                            ),
                            const Text("No Products Available"),
                          ],
                        ),
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs
                          .map((doc) => ProductCard(
                                product: Product.fromMap(doc.data()),
                              ))
                          .toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
