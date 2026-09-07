import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/profile/presentation/bloc/profile_bloc.dart';
import 'package:stylish/feathers/profile/presentation/widgets/profile_form_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    pincodeController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    bankAcountController.dispose();
    accountHolderNameController.dispose();
    ifscCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileLoaded) {
            emailController.text = state.profile.profilEemail;
            passwordController.text = state.profile.profilePassword;
            pincodeController.text = state.profile.profilePincode.toString();
            addressController.text = state.profile.profileAddress;
            cityController.text = state.profile.profileCity;
            countryController.text = state.profile.profileCountry;
            bankAcountController.text = state.profile.profileBankAcount
                .toString();
            accountHolderNameController.text =
                state.profile.profileAccountHolderName;
            ifscCodeController.text = state.profile.profileIfscCode;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile updated successfully')),
            );
          }
          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            if (state is ProfileLoaded ||
                state is UpdateProfileLoaded ||
                state is UpdateProfileLoading) {
              final profile = switch (state) {
                ProfileLoaded() => state.profile,
                UpdateProfileLoaded() => state.profile,
                UpdateProfileLoading() => state.profile,
                _ => throw Exception(),
              };

              final isUpdating = state is UpdateProfileLoading;

              return ProfileForm(
                onSave: (updatedProfile) {
                  context.read<ProfileBloc>().add(
                    UpdateProfileSubmittedEvent(profile: updatedProfile),
                  );
                },
                profile: profile,
                isUpdating: isUpdating,
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
