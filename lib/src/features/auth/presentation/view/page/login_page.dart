import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:org_eventos_app/services/api_service.dart';
import 'package:org_eventos_app/src/features/auth/domain/model/login_request_model.dart';
import 'package:org_eventos_app/src/features/auth/presentation/viewmodel/login_viewmodel.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:org_eventos_app/src/features/auth/auth_module.dart';

import '../../../../../../config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  bool manterConectado = false;
  String? username = '';
  String? password = '';
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  /*
                  child: Image.asset(
                    "assets/images/mapa.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),*/
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              )
            )
          ),
          FormHelper.inputFieldWidget(
            context, 
            "username",
            "UserName", 
            (onValidateVal){
              if(onValidateVal.isEmpty){
                return "Username can'\t be empty.";
              }

              return null;
            }, 
            (onSavedVal) {
              username = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context, 
              "password",
              "PassWord", 
              (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "Password can'\t be empty.";
                }

                return null;
              }, 
              (onSavedVal) {
                password = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Forget Password ?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Modular.to.pushNamed('/auth/verify');
                          //print("Forget Password");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Login",
              (){
                /*
                if(validateAndSave()) {
                  setState(() { 
                    isAPIcallProcess = true;
                  });

                  LoginRequestModel model = LoginRequestModel(
                    username: username!, 
                    password: password!
                  );

                  APIService.login(model).then((response) => {
                    setState(() { 
                    isAPIcallProcess = false;
                  }),
                  
                    //if(response) {
                    if(true) {
                      Navigator.pushNamedAndRemoveUntil(
                        context, 
                        '/home/', 
                        (route) => false
                      )
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName, 
                        "Invalid Username/Password !", 
                        "OK", 
                        () {
                          Navigator.pop(context);
                        }
                      )
                    }
                  });
                  
                } */
                Modular.to.pushNamed('/auth/home/');;
              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    ),
                  children: <TextSpan>[
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //Modular.to.pushNamed('/signup');
                          Modular.to.pushNamed('/auth/signup');
                          //print("Forget Password");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave(){
    final form = globalFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x663f51b5),
              Color(0x993f51b5),
              Color(0xcc3f51b5),
              Color(0xff3f51b5),
              Color(0xff00000a2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'login'.i18n(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildEmail(),
              SizedBox(height: 20),
              buildSenha(),
              buildEsqueciSenhaBt(),
              _button,
              buildCadastrarBt(),
            ],
          ),
        ),
      ),
    );
  }
}

*/
/* AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x663f51b5),
                    Color(0x993f51b5),
                    Color(0xcc3f51b5),
                    Color(0xff3f51b5),
                    Color(0xff00000a2),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'login'.i18n(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //const SizedBox(height: 50),
                    buildEmail(),
                    //const SizedBox(height: 20),
                    buildSenha(),
                    buildEsqueciSenhaBt(),
                    //buildManterConectado(),
                    //buildLoginBt(),
                    _button,
                    buildCadastrarBt(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ), */
}