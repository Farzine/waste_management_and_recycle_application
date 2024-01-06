class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobileNo;
  String alternateMobileNo;
  String email;
  String division;
  String district;
  String union;
  String village;
  String postCode;
  String addressType;

  DeliveryAddressModel({
    required this.addressType,
    required this.division,
    required this.alternateMobileNo,
    required this.district,
    required this.firstName,
    required this.union,
    required this.lastName,
    required this.mobileNo,
    required this.postCode,
    required this.email,
    required this.village,
  });
}
