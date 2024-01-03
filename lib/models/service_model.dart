class ServiceModel {
  String serviceName;
  String serviceImage;
  String serviceSubName;
  String aboutService;
  String serviceOption;
  String serviceId;
  int servicePrice;
  int serviceQuantity;

  ServiceModel({
    required this.servicePrice,
    required this.serviceQuantity,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.serviceSubName,
    required this.aboutService,
    required this.serviceOption,
  });
}
