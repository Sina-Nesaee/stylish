import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/auth/presentation/bloc/login/login_bloc.dart';

class SocialloginbuttonWidget extends StatelessWidget{
  const SocialloginbuttonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return  Row(
                      children: [
                        IconButton(onPressed:isLoading?null: (){
                          context.read<LoginBloc>().add(
                            LoginWithAppleSubmittedEvent()
                          );
                        }, icon: Icon(CupertinoIcons.app)),
                        IconButton(onPressed:isLoading?null: (){
                          context.read<LoginBloc>().add(
                            LoginWithGoogleSubmittedEvent()
                          );
                        }, icon: Icon(CupertinoIcons.gobackward)),
                        IconButton(onPressed:isLoading?null: (){
                          context.read<LoginBloc>().add(
                            LoginWithFacebookSubmittedEvent()
                          );
                        }, icon: Icon(CupertinoIcons.flag_circle)),
                      ],
                    );
      },
    );
  }
}