import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/home/presentaition/home_bloc/home_bloc.dart';
import 'package:stylish/feathers/home/presentaition/widgets/all_features_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/banner_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/category_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/deal_of_the_day_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/discount_offer_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/flat_off_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/high_discount_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/new_arrivals_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/recommanded_product_section_widget.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';
import 'package:stylish/feathers/search/presentation/widgets/search_result_widget.dart';
import 'package:stylish/feathers/search/presentation/widgets/search_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/special_offer_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widgets/trending_products_section_widget.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(GetHomeDataEvent()),
        ),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
      ],
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(actions: [Text('')]),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SearchSection(),
                SearchResultWidget(),
                AllFeatures(),
                CategoriesSection(),
                BannerSection(),
                DealOfTheDay(),
                RecommandProductSection(),
                SpichalOfferSection(),
                FlatOfferSection(),
                TrendingProductsSection(),
                HighDiscountProductsSection(),
                NewArrivalsSection(),
                DiscountProductSection(),
                // BottomNavigationBar(
                //   items: <BottomNavigationBarItem>[
                //     BottomNavigationBarItem(
                //       icon: Icon(CupertinoIcons.arrow_counterclockwise),
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(CupertinoIcons.arrow_counterclockwise),
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(CupertinoIcons.arrow_counterclockwise),
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(CupertinoIcons.arrow_counterclockwise),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
