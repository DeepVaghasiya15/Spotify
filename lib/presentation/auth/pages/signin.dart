import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
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
            _enterEmailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 30,),
            BasicAppButton(onPressed: (){}, title: 'Sign In')
          ],
        ),
      ),
    );
  }

  Widget _registerText(){
    return const Text(
      'Sign In',
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
          hintText: 'Enter Username Or Email'
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
  Widget _signupText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member ?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext Context) => SigupPage()));
          }, child: const Text('Register Now',style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}
