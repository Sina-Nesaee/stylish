
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/widget/bottomNavigation_Widget.dart';
import 'package:stylish/feathers/search/presentation/widgets/search_widget.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_bloc.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_state.dart';
import 'package:stylish/feathers/product/presentation/widgets/product_appBar_Widget.dart';



class TrendingProducts extends StatelessWidget {
  const TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ProductAppBar(),
      ),
      body: Column(
        children: [
          SearchSection(),
          BlocBuilder<ProductDiscoveryBloc, ProductDiscoveryState>(
            builder: (context, state) {
              if (state is TrendingProductLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              if (state is TrendingProductSuccess) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.products[index];
                    return Container(color: Colors.red);
                  },
                );
              }
              ;
              return SizedBox();
            },
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
