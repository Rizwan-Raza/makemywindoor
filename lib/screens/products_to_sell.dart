import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:makemywindoor/models/product.dart';
import 'package:makemywindoor/services/project_service.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:makemywindoor/widgets/my_appbar.dart';
import 'package:makemywindoor/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final int selectedFilter;
  const ProductsScreen({Key? key, this.selectedFilter = 0}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selected = 0;
  List<String> chips = ["All", "Aluminium", "UPVC", "Glass"];
  @override
  void initState() {
    super.initState();
    selected = widget.selectedFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: Provider.of<ProjectServices>(context).getProductsOf(
                      selected > 0 && selected < 4 ? chips[selected] : ""),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          // gridDelegate:

                          //     const SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2,
                          //         childAspectRatio: 2 / 3,
                          //         crossAxisSpacing: 8,
                          //         mainAxisSpacing: 8),
                          // shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((doc) => ProductCard(
                                    product: Product.fromMap(doc.data()),
                                  ))
                              .toList(),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
