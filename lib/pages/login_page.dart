import 'package:chat/helpers/mostrar_Alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_labels.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLogo(title: 'Messenger'),
                _Form(),
                CustomLabels(
                  ruta: 'register',
                  title: 'Crea una ahora',
                  pregunta: '¿No tienes cuenta?',
                ),
                Text('Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.blue,
      shape: StadiumBorder(),
      textStyle: const TextStyle(fontSize: 20),
    );

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          CustomButton(
            style: style,
            title: 'Ingresar',
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
                    if(loginOk){
                      //Connect to socket
                      socketService.connect();
                      //Navegar a otra pantalla
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    }else{
                      //Mostrar Alerta
                      mostrarALerta(context, 'Login Incorrecto', 'Revise sus credenciales nuevamente');
                    }
                  },
          ),
        ],
      ),
    );
  }


}
