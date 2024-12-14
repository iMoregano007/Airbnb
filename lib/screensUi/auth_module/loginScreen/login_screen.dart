import 'package:airbnb/resources/app_colors.dart';
import 'package:airbnb/resources/size_config.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String countryName = "India";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: Text(
                'Login or Sign up',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              )),
              h10,
              const Divider(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Airbnb',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                    h20,
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      width: screenWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black),
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CountryCodePicker(
                                backgroundColor: AppColors.white,
                                dialogBackgroundColor: AppColors.white,
                                initialSelection: 'IN',
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                textStyle: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                onChanged: (countryCode) {
                                  setState(() {
                                    countryName = countryCode.name ?? '';
                                  });
                                },
                              ),
                              w5,
                              Text(
                                countryName,
                                style: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          const Divider(
                            height: 1.5,
                            color: AppColors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: commonTextField(
                                context: context,
                                controller: phoneNumberTextController,
                                title: 'Phone no',
                                isBorder: false,
                                hintText: 'Enter Phone No',
                                keyboardType: TextInputType.number,
                                textColor: AppColors.black,
                                length: 10),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
