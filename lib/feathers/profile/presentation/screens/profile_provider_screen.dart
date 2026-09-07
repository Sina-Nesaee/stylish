import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/profile/presentation/bloc/profile_bloc.dart';
import 'package:stylish/feathers/profile/presentation/screens/profile_Screen.dart';

class ProfileScreenProvider extends StatelessWidget {
  const ProfileScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(GetProfileSubmittedEvent()),
      child: ProfileScreen(),
    );
  }
}