

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';

class GetproductById {
 final ProdctRepository repsitory;

  GetproductById({required this.repsitory});
 Future<Product> call(int id){
  return repsitory.getProductById(id);
 }

}