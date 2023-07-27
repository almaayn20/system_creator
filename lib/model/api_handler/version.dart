import 'package:system_creator/model/api_handler/version_applications.dart';

class Version {
  final String versionNumber;
  final String appId;
  final VersionApplications versionApplications;

  Version(
      {required this.versionNumber,
      required this.appId,
      required this.versionApplications});
}
