class ProductResponseModel {
  ProductResponseModel({
    required this.status,
    required this.message,
    required this.products,
  });

  final int status;
  final String message;
  final List<ProductModel> products;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
        json["products"]!.map((x) => ProductModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "products": products.map((x) => x.toJson()).toList(),
  };
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.salesRate,
    required this.purchaseRate,
    required this.quantity,
    required this.unit,
    required this.duration,
    required this.fromDate,
    required this.toDate,
    required this.productImage,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final int salesRate;
  final int purchaseRate;
  final int quantity;
  final String unit;
  final String duration;
  final DateTime fromDate;
  final DateTime toDate;
  final String productImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      salesRate: json["salesRate"] ?? 0,
      purchaseRate: json["purchaseRate"] ?? 0,
      quantity: json["quantity"] ?? 0,
      unit: json["unit"] ?? "",
      duration: json["duration"] ?? "",
      fromDate: DateTime.parse(json["fromDate"] ?? DateTime.now().toIso8601String()),
      toDate: DateTime.parse(json["toDate"] ?? DateTime.now().toIso8601String()),
      productImage: json["productImage"] ?? "",
      createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "salesRate": salesRate,
    "purchaseRate": purchaseRate,
    "quantity": quantity,
    "unit": unit,
    "duration": duration,
    "fromDate": fromDate.toIso8601String(),
    "toDate": toDate.toIso8601String(),
    "productImage": productImage,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
