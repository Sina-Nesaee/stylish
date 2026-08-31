import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/home/presentaition/home_bloc/home_bloc.dart';
import 'package:stylish/feathers/home/presentaition/widget/allFeatures_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/banner_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/category_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/dealOfTheDay_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/discountOffer_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/flatOffe_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/highdiscount_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/newArrivals_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/recommandedProduct_section_widget.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';
import 'package:stylish/feathers/search/presentation/widget/search_result_Widget.dart';
import 'package:stylish/feathers/search/presentation/widget/search_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/specialOffer_section_widget.dart';
import 'package:stylish/feathers/home/presentaition/widget/trendingProducts_section_widget.dart';

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
