import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sunofa_map/core/utils/app_helpers.dart';
import 'package:sunofa_map/core/utils/screen_size.dart';
import 'package:sunofa_map/themes/app_themes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Controller pour le champ de téléphone
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'US'; 
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'US'); 

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
        title: Text(
          'Register',
          style: AppTheme().stylish1(20, AppTheme.white, isBold: true),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Register',
                  style: AppTheme().stylish1(24, AppTheme.black, isBold: true),
                ),
              ),
          SizedBox(height: context.heightPercent(3)),
              Text(
                'First and last name',
                style: AppTheme().stylish1(15, AppTheme.black),
              ),
              AppHelpers.buildTextFormField(
                hint: 'ex: Jean Marck',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom complet';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.heightPercent(3)),
              // Champ E-mail
              Text(
                'E-mail',
                style: AppTheme().stylish1(15, AppTheme.black),
              ),
              AppHelpers.buildTextFormField(
                hint: 'email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un e-mail valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.heightPercent(3)),
             
              Text(
                'Phone number',
                style: AppTheme().stylish1(15, AppTheme.black),
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber); // Action sur le changement du numéro
                },
                onInputValidated: (bool isValid) {
                  print('Valid number: $isValid');
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG, // Fenêtre modale pour choisir le pays
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: phoneNumber,
                textFieldController: phoneController,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputDecoration: const InputDecoration(
                  hintText: '201-555-0123',
                  border: OutlineInputBorder(),
                ),
                onSaved: (PhoneNumber number) {
                  print('Saved number: $number');
                },
              ),
              SizedBox(height: context.heightPercent(3)),
              // Champ Mot de passe
              Text(
                'Password',
                style: AppTheme().stylish1(15, AppTheme.black),
              ),
              AppHelpers.buildTextFormField(
                hint: 'password',
                isPassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.heightPercent(3)),
              // Champ Confirmation du mot de passe
              Text(
                'Confirm password',
                style: AppTheme().stylish1(15, AppTheme.black),
              ),
              AppHelpers.buildTextFormField(
                hint: 'confirm password',
                isPassword: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer votre mot de passe';
                  } else if (value != passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.heightPercent(5)),
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
                            'Register',
                            style: AppTheme().stylish1(15, AppTheme.white),
                          ),
                        ),
                      ),
                    ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
