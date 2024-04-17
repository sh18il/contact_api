class Contact {
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Contact(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Contact.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
     data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
