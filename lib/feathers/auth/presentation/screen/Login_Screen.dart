import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/presentation/bloc/login/login_bloc.dart';
import 'package:stylish/feathers/auth/presentation/widget/SocialLoginButton_widget.dart';
import 'package:stylish/feathers/home/presentaition/screen/home_page.dart';

class LoginScreenProvider extends StatelessWidget {
  const LoginScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) { 
    
        if (state is LoginSuccess) {
             

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Container(color: Colors.red,)),
          );
        }
        if (state is LoginError) {
             
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          
        }
      },
      child: Scaffold(
      
           body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text('Welcome Back!'),
                    TextField(controller: emailController),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                  
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                            if (state is LoginLoading)
                             const CircularProgressIndicator();
                          return ElevatedButton(
                            onPressed: state is LoginLoading
                                ? null
                                : () {
                                    context.read<LoginBloc>().add(
                                      LoginSubmitted(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                            child: Text('Login'),
                          );
                        },
                      ),
                    ),
                    Text('- OR Continue with -'),
                   SocialloginbuttonWidget(),
                  ],
                ),
              ),
            )
          
      ),
    );
  }
}
