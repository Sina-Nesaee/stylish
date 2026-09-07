
import 'package:stylish/feathers/product/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);

}

