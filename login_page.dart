import 'package:clicknetgames/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFF810000),
                      Color(0XFF290000),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 120.0),
                  child: Column(
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignUpBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() => GestureDetector(
        onTap: () => print('cadastre-se pressionado'),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'não possui uma conta?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' Crie uma conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSocialBtnRow() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialBtn(
              logo: const AssetImage('assets/img/facebook.jpg'),
              onTap: () => print('facebook pressed'),
            ),
            _buildSocialBtn(
              logo: const AssetImage('assets/img/google.jpg'),
              onTap: () => print('google pressed'),
            ),
          ],
        ),
      );

  Widget _buildSocialBtn({
    required Function onTap,
    required AssetImage logo,
  }) =>
      InkWell(
        onTap: () => onTap,
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image: logo,
            ),
          ),
        ),
      );

  Widget _buildSignInWithText() {
    return Column(
      children: const [
        Text(
          '- OU -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Faça Login com',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildLoginBtn() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 5.0,
            padding: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () => print('botao login apertado'),
          child: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.black, //Color(0xFF620000), vermelho
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      );

  Widget _buildRememberMeCheckbox() => SizedBox(
        height: 20.0,
        child: Row(
          children: [
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.black,
                activeColor: const Color(0xFF810000),
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              ),
            ),
            const Text(
              "Lembrar Senha",
              style: kLabelStyle,
            ),
          ],
        ),
      );

  Widget _buildForgotPasswordBtn() => Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Esqueceu a senha?",
              style: kLabelStyle,
            ),
          ),
        ),
      );

  Widget _buildPasswordTF() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: kLabelStyle,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: const TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Digite sua Senha',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );

  Widget _buildEmailTF() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: kLabelStyle,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Digite seu Email',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );
}
