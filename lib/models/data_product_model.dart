class DataProductModel {
  dynamic productId;
  String productImage;
  dynamic productPrice;
  String productDescription;
  String productName;
  dynamic productState;
  int productQuantity;
  dynamic totalPrice;
  var myProductModelfor1pro;

  DataProductModel({
    this.productId = 0,
    this.productImage = 'assets/images/medicine.png',
    this.productPrice = 00,
    this.productName = 'Name Product',
    this.productState = 0,
    this.productQuantity = 1,
    this.totalPrice,
    this.myProductModelfor1pro,
    this.productDescription = "There are many fake or unproven medical products and"
        " methods that claim to diagnose, prevent or cure COVID-19.[1] "
        "Fake medicines sold for COVID-19 may not contain the ingredients"
        "they claim to contain, and may even contain harmful ingredients.[2][1][3]"
        " In March 2020, the World Health Organization (WHO)"
        " released a statement recommending against taking any",
  });
  factory DataProductModel.fromJson(jsonData) {
    return DataProductModel(
      productId: jsonData['id'],
      productName: jsonData['pro_name'],
      productPrice: jsonData['price'],
      productDescription: jsonData['description'],
      productImage: jsonData['image'],
      productState: jsonData['stock'],


    );
  }

}
/*

final List<DataProductModel> items = [
  DataProductModel(
    productName: 'Cold & Flu Relief',
    productImage: 'assets/images/Cold & Flu Relief.jpg',
    productPrice: 30,
    productState: 'available',
  ),
  DataProductModel(
    productName: 'Dramamine',
    productImage: 'assets/images/Dramamine.jpg',
    productPrice: 50,
    productState: 'available',
  ),
  DataProductModel(
    productName: 'EM -EX',
    productImage: 'assets/images/EM -EX.jpg',
    productPrice: 80,
    productState: 'available',
  ),
  DataProductModel(
    productName: 'Emetrex',
    productImage: 'assets/images/Emetrex.jpg',
    productPrice: 70,
    productState: 'not available',
  ),
  DataProductModel(
    productName: 'Evusheld',
    productImage: 'assets/images/Evusheld.jpg',
    productPrice: 100,
    productState: 'available',
  ),
  DataProductModel(
    productName: 'Panadol',
    productImage: 'assets/images/panadol.jpg',
    productPrice: 20,
    productState: 'not available',
  ),
  DataProductModel(
    productName: 'Comtrex',
    productImage: 'assets/images/comtrex.jpg',
    productPrice: 25,
    productState: 'not available',
  ),
];

*/