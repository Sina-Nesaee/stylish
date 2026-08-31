import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/splash/data/repositories/splash_repository.dart';
import 'package:stylish/feathers/splash/presentation/bloc/splash_bloc.dart';
import 'package:stylish/gen/assets.gen.dart';
import 'package:stylish/feathers/onBoarding/presentation/screen/onBoardingScreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(SplashRepository())..add(CheckAuthStatus()),
      child: SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: BlocListener<SplashBloc , SplashState>(
        listener: (context, state) {
          if (state is SplashUnauthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onboardingscreen()),
            );
          }
          if (state is SplashAuthenticated) {
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()))


          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.logo.logo.image(width: 120),
              SizedBox(width: 12),
              Text(
                'Stylish',
                style: themeData.textTheme.headlineLarge!.copyWith(
                  color: Color(0xffF83758),
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
