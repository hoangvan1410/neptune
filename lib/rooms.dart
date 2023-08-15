class Address {
  String street;
  String city;
  String state;
  String countryOrRegion;
  String postalCode;

  Address(this.street,this.city,this.state,this.countryOrRegion,this.postalCode);

  factory Address.fromMap(Map<String, dynamic> json) {
    return Address(
      json['street'],
      json['city'],
      json['state'],
      json['countryOrRegion'],
      json['postalCode'],
    );
  }
}

class Rooms {
  String id;
  String emailAddress;
  String displayName;
  String phone;
  String nickname;
  int? floorNumber;
  int capacity;
  String bookingType;
  Address address;

  Rooms(this.id,this.emailAddress,this.displayName,this.phone,this.nickname,this.floorNumber,this.capacity,this.bookingType,this.address);

  factory Rooms.fromMap(Map<String, dynamic> json) {
    return Rooms(
      json['id'],
      json['emailAddress'],
      json['displayName'],
      json['phone'],
      json['nickname'],
      json['floorNumber'],
      json['capacity'],
      json['bookingType'],
      Address.fromMap(json['address'] as Map<String, dynamic>) ,
    );
  }
}