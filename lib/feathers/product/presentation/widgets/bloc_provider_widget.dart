import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_bloc.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_event.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';

class ProductDiscoveryPageProvider extends StatelessWidget{
  final ProductDiscoveryEvent event;
  final Widget child;
  const ProductDiscoveryPageProvider({super.key, required this.event, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductDiscoveryBloc>()..add(event),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
      ],
      child: child,
    );
  }

}


