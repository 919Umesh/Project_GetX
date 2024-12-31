class ProductMasterModel {
  final String groupName;
  final String dbName;
  final String subGroupName;
  final String productUnit;
  final String productAltUnit;
  final double salesRate;
  final double purchaseRate;
  final String productCode;
  final String productName;

  ProductMasterModel({
    required this.groupName,
    required this.dbName,
    required this.subGroupName,
    required this.productUnit,
    required this.productAltUnit,
    required this.salesRate,
    required this.purchaseRate,
    required this.productCode,
    required this.productName,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'dbName': dbName,
      'subGroupName': subGroupName,
      'productUnit': productUnit,
      'productAltUnit': productAltUnit,
      'salesRate': salesRate,
      'purchaseRate': purchaseRate,
      'productCode': productCode,
      'productName': productName,
    };
  }
}
