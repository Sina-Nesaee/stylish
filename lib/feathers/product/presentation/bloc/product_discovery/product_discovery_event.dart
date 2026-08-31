import 'package:flutter/cupertino.dart';

@immutable
sealed class ProductDiscoveryEvent {}



class GetTrendingProductsEvent extends ProductDiscoveryEvent {}

class GetNewArrivalsEvent extends ProductDiscoveryEvent {}

class GetProductDiscountEvent extends ProductDiscoveryEvent {}

class GetRecommandProductsEvent extends ProductDiscoveryEvent {}
