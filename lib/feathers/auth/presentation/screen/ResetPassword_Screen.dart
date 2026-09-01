import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/presentation/bloc/resetPassword/reset_password_bloc.dart';

class ResetpasswordScreenProvider extends StatelessWidget {
  const ResetpasswordScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordBloc>(),
      child: ResetpasswordScreen(),
    );
  }
}

class ResetpasswordScreen extends StatefulWidget {
  ResetpasswordScreen({super.key});

  @override
  State<ResetpasswordScreen> createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Reset link sent successfully')),
          );
        }
        if (state is ResetPasswordError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Text('Forgot password?'),
            TextField(controller: emailController),
            Text(
              '* We will send you a message to set or reset your new password',
            ),
            BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
              builder: (context, state) {
                final isLoading = state is ResetPasswordLoading;
                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<ResetPasswordBloc>().add(
                            ResetPasswordSubmittedEvent(
                              email: emailController.text,
                            ),
                          );
                        },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
