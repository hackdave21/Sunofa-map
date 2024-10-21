import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sunofa_map/core/utils/app_helpers.dart';
import 'package:sunofa_map/core/utils/screen_size.dart';
import 'package:sunofa_map/themes/app_themes.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const HeroIcon(
            HeroIcons.arrowLeftCircle,
            color: AppTheme.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: Text('Connexion',
            style: AppTheme().stylish1(20, AppTheme.white, isBold: true)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Connexion',
                style: AppTheme().stylish1(20, AppTheme.black, isBold: true)),
            const SizedBox(height: 32),
              Text('Email',
                style: AppTheme().stylish1(15, AppTheme.black, isBold: false)),
            AppHelpers.buildTextFormField(
              hint: 'email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your e-mail ';
                }
                return null;
              },
            ),
             SizedBox(height: context.heightPercent(5)),
             Text('Password',
                style: AppTheme().stylish1(15, AppTheme.black, isBold: false)),
            AppHelpers.buildTextFormField(
              hint: 'Password',
              isPassword: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password ';
                }
                return null;
              },
            ),
           SizedBox(height: context.heightPercent(2)),
            TextButton(
              onPressed: () {
                // Action "Mot de passe oublié"
              },
              child: const Text('Forgot your password?'),
            ),
          SizedBox(height: context.heightPercent(3)),
          Center(
            child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppTheme.primaryColor,
                      ),
                      child: InkWell(
                        onTap: () {
                            Navigator.pushNamed(context, '/Dashboardscreen');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                          child: Text(
                            'Connexion',
                            style: AppTheme().stylish1(15, AppTheme.white),
                          ),
                        ),
                      ),
                    ),
          ),
           SizedBox(height: context.heightPercent(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("don't have an account? ",
                    style: AppTheme().stylish1(15, AppTheme.black)),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Registerscreen');
                  },
                  child: Text(
                    "Register",
                   style: AppTheme().stylish1(15, AppTheme.primaryColor, isBold: true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
