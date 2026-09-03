import 'package:flutter/material.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile.dart';

class ProfileForm extends StatefulWidget {
  final Function(Profile) onSave;
  final Profile profile;
  final bool isUpdating;

  const ProfileForm({
    super.key,
    required this.onSave,
    required this.profile,
    required this.isUpdating,
  });

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final bankAcountController = TextEditingController();
  final accountHolderNameController = TextEditingController();
  final ifscCodeController = TextEditingController();
  @override
  void initState() {
    emailController.text = widget.profile.profilEemail;
    passwordController.text = widget.profile.profilePassword;
    pincodeController.text = widget.profile.profilePincode.toString();
    addressController.text = widget.profile.profileAddress;
    cityController.text = widget.profile.profileCity;
    stateController.text = widget.profile.profileState;
    countryController.text = widget.profile.profileCountry;
    bankAcountController.text = widget.profile.profileBankAcount.toString();
    accountHolderNameController.text = widget.profile.profileAccountHolderName;
    ifscCodeController.text = widget.profile.profileIfscCode.toString();
    super.initState();
  }

  void _save() {
    final updatedProfile = Profile(
      id: widget.profile.id,
      profileImage: widget.profile.profileImage,
      profilEemail: emailController.text,
      profilePassword: passwordController.text,
      profilePincode:
          int.tryParse(pincodeController.text) ?? widget.profile.profilePincode,
      profileAddress: addressController.text,
      profileCity: cityController.text,
      profileState: stateController.text,
      profileCountry: countryController.text,
      profileBankAcount:
          int.tryParse(bankAcountController.text) ??
          widget.profile.profileBankAcount,
      profileAccountHolderName: accountHolderNameController.text,
      profileIfscCode: ifscCodeController.text,
    );

    widget.onSave(updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController),
        TextField(controller: passwordController),
        TextField(controller: pincodeController),
        TextField(controller: addressController),
        TextField(controller: cityController),
        TextField(controller: stateController),
        TextField(controller: countryController),
        TextField(controller: bankAcountController),
        TextField(controller: accountHolderNameController),
        TextField(controller: ifscCodeController),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: widget.isUpdating ? null : _save,
          child: widget.isUpdating ? null : Text('save'),
        ),
      ],
    );
  }
}
