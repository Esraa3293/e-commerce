import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';

/// results : 10
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6439d61c0049ad0b52b90051","name":"Music","slug":"music","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511964020.jpeg","createdAt":"2023-04-14T22:39:24.365Z","updatedAt":"2023-04-14T22:39:24.365Z"},{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511865180.jpeg","createdAt":"2023-04-14T22:37:45.627Z","updatedAt":"2023-04-14T22:37:45.627Z"},{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg","createdAt":"2023-04-14T22:36:58.118Z","updatedAt":"2023-04-14T22:36:58.118Z"},{"_id":"6439d41c67d9aa4ca97064d5","name":"SuperMarket","slug":"supermarket","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511452254.png","createdAt":"2023-04-14T22:30:52.311Z","updatedAt":"2023-04-14T22:30:52.311Z"},{"_id":"6439d40367d9aa4ca97064cc","name":"Baby & Toys","slug":"baby-and-toys","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511427130.png","createdAt":"2023-04-14T22:30:27.166Z","updatedAt":"2023-04-14T22:30:27.166Z"},{"_id":"6439d3e067d9aa4ca97064c3","name":"Home","slug":"home","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511392672.png","createdAt":"2023-04-14T22:29:52.763Z","updatedAt":"2023-04-14T22:29:52.763Z"},{"_id":"6439d3c867d9aa4ca97064ba","name":"Books","slug":"books","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511368164.png","createdAt":"2023-04-14T22:29:28.200Z","updatedAt":"2023-04-14T22:29:28.200Z"},{"_id":"6439d30b67d9aa4ca97064b1","name":"Beauty & Health","slug":"beauty-and-health","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511179514.png","createdAt":"2023-04-14T22:26:19.587Z","updatedAt":"2023-04-14T22:26:19.587Z"},{"_id":"6439d2f467d9aa4ca97064a8","name":"Mobiles","slug":"mobiles","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511156008.png","createdAt":"2023-04-14T22:25:56.071Z","updatedAt":"2023-04-14T22:25:56.071Z"},{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511121316.png","createdAt":"2023-04-14T22:25:21.783Z","updatedAt":"2023-04-14T22:25:21.783Z"}]

class CategoryOrBrandModel extends CategoryOrBrandEntity {
  CategoryOrBrandModel({
    super.results,
    this.metadata,
    super.data,
  });

  CategoryOrBrandModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Metadata? metadata;
}

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

class Data extends DataEntity {
  Data({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;
}