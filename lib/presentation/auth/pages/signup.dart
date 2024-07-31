import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';

import '../../../service_locator.dart';

class SigupPage extends StatelessWidget {
  SigupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
              height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 50,
          horizontal: 30
        ),
        child: Column(
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _fullNameField(context),
            const SizedBox(height: 20,),
            _enterEmailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 30,),
            BasicAppButton(onPressed: ()async{
              var result = await sl<SignupUseCase>().call(
                params: CreateUserReq(
                    fullName: fullName,
                    email: email,
                    password: password)
              )
            }, title: 'Create Account')
          ],
        ),
      ),
    );
  }

  Widget _registerText(){
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
    );
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Full Name'
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _enterEmailField(BuildContext context){
    return TextField(
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: const InputDecoration(
          hintText: 'Password'
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _signInText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext Context) => const SigninPage()));
          }, child: const Text('Sign In',style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}
