import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable{

  final String? id;
  final String? title;
  final String? description;
  final String? price;
  final String? isPromo;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? serviceTypeId;
  final String? salonId;

  ChatEntity({ this.id,  this.title,  this.description,  this.price,  this.isPromo,  this.imageUrl,  this.createdAt,  this.updatedAt,  this.serviceTypeId,  this.salonId,});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, price, isPromo, imageUrl, createdAt, updatedAt, serviceTypeId, salonId];

  
}