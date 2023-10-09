import 'package:e_commerce/features/home/domain/entities/AddWishlistEntity.dart';

/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9"]

class WishlistModel extends AddWishlistEntity {
  WishlistModel({
    super.status,
    super.message,
    super.data,
  });

  WishlistModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
