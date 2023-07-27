import 'dart:ui';

class Company {
  final String namel;
  final int phone;
  final String address;
  final Image logo;
  final double commercialRegistrationNumber;
  final String webPage = '';
  final String email;
  final String description;
  final String applicationName;
  final Image applicationLogo;
  final String applicationPackageName;
  final int targetCompanyId;

  Company(
      {required this.namel,
      required this.phone,
      required this.address,
      required this.logo,
      required this.commercialRegistrationNumber,
      required this.email,
      required this.description,
      required this.applicationName,
      required this.applicationLogo,
      required this.applicationPackageName,
      required this.targetCompanyId});
}
