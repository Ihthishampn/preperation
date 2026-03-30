import 'package:flutter/material.dart';
import 'package:inter/core/app/app_state.dart';
import 'package:inter/provider/product_provider.dart';
import 'package:inter/widgets/category_horizontal_cards.dart';
import 'package:inter/widgets/custum_search_bar.dart';
import 'package:inter/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<ProductProvider>().handleFetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: iconButtonMy(icon: Icons.more_vert),
        actions: [iconButtonMy(icon: Icons.sort_rounded)],
        centerTitle: true,
        title: Text("Product List", style: textTitleStyle()),
      ),

      body: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          // search bar here
          CustumSearchBar(),

          const SizedBox(height: 24),
          // heading of category and see all
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Category", style: textSideHeadingStyle()),
                Text("See All", style: textSideHeadingStyle()),
              ],
            ),

            // categoey horizonatal scrollable selction cards here
          ),

          Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.state == AppState.initial ||
                  provider.state == AppState.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.state == AppState.error) {
                return Center(child: Text(provider.error.toString()));
              }
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    return CategoryHorizontalCards(
                      provider: provider,
                      index: index,
                    );
                  },
                ),
              );
            },
          ),

          // product cards
          Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.state == AppState.initial ||
                  provider.state == AppState.loading) {
                return CircularProgressIndicator();
              }
              if (provider.state == AppState.error) {
                return Text(provider.error.toString());
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(index: index,productProvider: provider,);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget iconButtonMy({required IconData icon}) {
    return IconButton(onPressed: () {}, icon: Icon(icon));
  }

  TextStyle textTitleStyle() {
    return TextStyle(fontWeight: .bold, color: Colors.black);
  }

  TextStyle textSideHeadingStyle() {
    return TextStyle(
      fontWeight: .w600,
      color: const Color.fromARGB(255, 100, 100, 100),
      fontSize: 16,
    );
  }
}
