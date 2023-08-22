import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// data : {"_id":"64d42106c09ea90035712104","cartOwner":"64d4194318b1d9a1108b3f19","products":[{"count":2,"_id":"64d42106c09ea90035712105","product":"6428ebc6dc1175abc65ca0b9","price":149}],"createdAt":"2023-08-09T23:28:06.656Z","updatedAt":"2023-08-14T22:06:00.396Z","__v":0,"totalCartPrice":298}

class CartResponse extends AddCartEntity {
  CartResponse({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  CartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartDataEntity.fromJson(json['data']) : null;
  }
}

/// _id : "64d42106c09ea90035712104"
/// cartOwner : "64d4194318b1d9a1108b3f19"
/// products : [{"count":2,"_id":"64d42106c09ea90035712105","product":"6428ebc6dc1175abc65ca0b9","price":149}]
/// createdAt : "2023-08-09T23:28:06.656Z"
/// updatedAt : "2023-08-14T22:06:00.396Z"
/// __v : 0
/// totalCartPrice : 298

class CartDataModel extends CartDataEntity {
  CartDataModel({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

// Data.fromJson(dynamic json) {
//   id = json['_id'];
//   cartOwner = json['cartOwner'];
//   if (json['products'] != null) {
//     products = [];
//     json['products'].forEach((v) {
//       products?.add(Products.fromJson(v));
//     });
//   }
//   createdAt = json['createdAt'];
//   updatedAt = json['updatedAt'];
//   v = json['__v'];
//   totalCartPrice = json['totalCartPrice'];
// }

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

class Products extends CartProducts {
  Products({
    super.count,
    super.id,
    super.product,
    super.price,
  });

// Products.fromJson(dynamic json) {
//   count = json['count'];
//   id = json['_id'];
//   product = json['product'];
//   price = json['price'];
// }

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['count'] = count;
//   map['_id'] = id;
//   map['product'] = product;
//   map['price'] = price;
//   return map;
// }
}
