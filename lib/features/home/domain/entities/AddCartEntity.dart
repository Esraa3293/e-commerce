/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// data : {"_id":"64d42106c09ea90035712104","cartOwner":"64d4194318b1d9a1108b3f19","products":[{"count":2,"_id":"64d42106c09ea90035712105","product":"6428ebc6dc1175abc65ca0b9","price":149}],"createdAt":"2023-08-09T23:28:06.656Z","updatedAt":"2023-08-14T22:06:00.396Z","__v":0,"totalCartPrice":298}

class AddCartEntity {
  AddCartEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  String? message;
  num? numOfCartItems;
  CartDataEntity? data;



}

/// _id : "64d42106c09ea90035712104"
/// cartOwner : "64d4194318b1d9a1108b3f19"
/// products : [{"count":2,"_id":"64d42106c09ea90035712105","product":"6428ebc6dc1175abc65ca0b9","price":149}]
/// createdAt : "2023-08-09T23:28:06.656Z"
/// updatedAt : "2023-08-14T22:06:00.396Z"
/// __v : 0
/// totalCartPrice : 298

class CartDataEntity {
  CartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartDataEntity.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProducts.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartProducts>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['_id'] = id;
  //   map['cartOwner'] = cartOwner;
  //   if (products != null) {
  //     map['products'] = products?.map((v) => v.toJson()).toList();
  //   }
  //   map['createdAt'] = createdAt;
  //   map['updatedAt'] = updatedAt;
  //   map['__v'] = v;
  //   map['totalCartPrice'] = totalCartPrice;
  //   return map;
  // }

}

/// count : 2
/// _id : "64d42106c09ea90035712105"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 149

class CartProducts {
  CartProducts({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartProducts.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  num? price;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['count'] = count;
  //   map['_id'] = id;
  //   map['product'] = product;
  //   map['price'] = price;
  //   return map;
  // }

}