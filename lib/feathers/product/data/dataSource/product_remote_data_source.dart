
import 'package:stylish/feathers/product/data/Model/product_Model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);

}

