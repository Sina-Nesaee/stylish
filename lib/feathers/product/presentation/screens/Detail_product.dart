import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_detail/product_bloc.dart';

class DetailProduct extends StatelessWidget {
  final int id;
  const DetailProduct({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductDetailBloc>()..add(GetProductByIdEvent(id: id)),
      child: ProductDetailScreen(),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Text('Details')]),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          if (state is ProductDetailLoaded) {
            final product = state.product;
            return Column(
              children: [
               
                Text(product.title),
                Text(product.description)
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
