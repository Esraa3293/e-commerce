/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428eb43dc1175abc65ca0b3","6428ead5dc1175abc65ca0ad","6428e884dc1175abc65ca096","6428e778dc1175abc65ca08a","6428cb19dc1175abc65ca031","6428e319dc1175abc65ca06d","6428def9dc1175abc65ca061","6408de536406cd15828e8f10","6428cd70dc1175abc65ca03d","6408da1c6406cd15828e8f0a","6428e509dc1175abc65ca07e","6428c3b8dc1175abc65ca00e","6428bf40dc1175abc65c9ff1","6408e43a6406cd15828e8f22"]

class RemoveWishlistEntity {
  RemoveWishlistEntity({
      this.status, 
      this.message, 
      this.data,});

  RemoveWishlistEntity.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? status;
  String? message;
  List<String>? data;


}