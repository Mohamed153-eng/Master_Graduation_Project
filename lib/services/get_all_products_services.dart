import '../Helper/api_helper.dart';
import '../models/data_product_model.dart';

class AllProductsServices {
  Future<List<DataProductModel>> getAllProducts() async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'http://185.132.55.54:8000/products/');
    List<DataProductModel> productsList = [];
    for (var i = 0; i < data.length; i++) {
      productsList.add(DataProductModel.fromJson(data[i])
      );
    }
    return productsList;
  }
}
