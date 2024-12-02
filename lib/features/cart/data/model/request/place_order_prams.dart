class PlaceOrderPrams {
  int? governorateId;
  String? name;
  String? phone;
  String? address;
  String? email;

  PlaceOrderPrams({
    this.governorateId,
    this.name,
    this.phone,
    this.address,
    this.email,
  });

  factory PlaceOrderPrams.fromJson(Map<String, dynamic> json) {
    return PlaceOrderPrams(
      governorateId: json['governorate_id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'governorate_id': governorateId,
        'name': name,
        'phone': phone,
        'address': address,
        'email': email,
      };
}
