import 'package:stylish/feathers/profile/domain/enteties/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.id,
    required super.profileImage,
    required super.profilEemail,
    required super.profilePassword,
    required super.profilePincode,
    required super.profileAddress,
    required super.profileCity,
    required super.profileState,
    required super.profileCountry,
    required super.profileBankAcount,
    required super.profileAccountHolderName,
    required super.profileIfscCode,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      profileImage: json["ProfileImage"],
      profilEemail: json["profilEemail"],
      profilePassword: json["profilePassword"],
      profilePincode: json["profilePincode"],
      profileAddress: json["profileAddress"],
      profileCity: json["profileCity"],
      profileState: json["profileState"],
      profileCountry: json["profileCountry"],
      profileBankAcount: json["profileBankAcount"],
      profileAccountHolderName: json["profileAccountHolderName"],
      profileIfscCode: json["profileIfscCode"],
    );
  }
}
