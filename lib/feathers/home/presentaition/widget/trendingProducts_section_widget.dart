import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_event.dart';
import 'package:stylish/feathers/product/presentation/screens/Trending_Products.dart';
import 'package:stylish/feathers/product/presentation/screens/discount_Product.dart';
import 'package:stylish/feathers/product/presentation/widget/bloc_provider_widget.dart';

class TrendingProductsSection extends StatelessWidget {
  const TrendingProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Trending Products '),
                  Row(children: [Icon(CupertinoIcons.time), Text('Last Date')]),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDiscoveryPageProvider(
                        event: GetTrendingProductsEvent(),
                        child: TrendingProducts(),
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [Text('views'), Icon(CupertinoIcons.arrow_right)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
