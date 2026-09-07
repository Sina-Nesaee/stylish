import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/presentation/bloc/register/register_bloc.dart';

class RegisterScreenProvider extends StatelessWidget {
  const RegisterScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  @override
  void dispose() {
    nameControler.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Container(color: Colors.amber);
        }
        if (state is RegisterError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Text('Create an account'),
            TextField(controller: nameControler),
            TextField(controller: emailControler),
            TextField(controller: passwordControler),
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                final isLoading = state is RegisterLoading;
                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<RegisterBloc>().add(
                            RegisterSubmitted(
                              name: nameControler.text,
                              email: emailControler.text,
                              password: passwordControler.text,
                            ),
                          );
                        },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Create Account'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
