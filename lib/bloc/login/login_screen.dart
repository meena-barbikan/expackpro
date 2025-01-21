// import 'package:expackpro/bloc/increment_bloc.dart';
// import 'package:expackpro/bloc/login/login_bloc.dart';
// import 'package:expackpro/bloc/login/login_event.dart';
// import 'package:expackpro/bloc/login/login_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => LoginBloc(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: BlocBuilder(
//             builder: (BuildContext context, state) {
//               if (state is LoginLoading) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               if (state is LoginSuccess) {
//                 return Center(child: Text(state.message));
//               }
//               if (state is LoginFailed) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(state.error, style: TextStyle(color: Colors.red)),
//                     SizedBox(height: 20),
//                     _loginForm(context),
//                   ],
//                 );
//               }

//               return _loginForm(context);
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _loginForm(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: username,
//           decoration: InputDecoration(labelText: 'Username'),
//         ),
//         TextField(
//           controller: password,
//           decoration: InputDecoration(labelText: 'Password'),
//           obscureText: true,
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             context.read<LoginBloc>().add(
//                   LoginSumbitted(
//                     username: username.text,
//                     password: password.text,
//                   ),
//                 );
//           },
//           child: Text('Login'),
//         ),
//       ],
//     );
//   }
// }

// class Loginmain extends StatefulWidget {
//   const Loginmain({super.key});

//   @override
//   State<Loginmain> createState() => _LoginmainState();
// }

// class _LoginmainState extends State<Loginmain> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => LoginBloc(),
//       child: LoginScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is LoginSuccess) {
                return Center(child: Text(state.message));
              }

              if (state is LoginFailed) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error, style: TextStyle(color: Colors.red)),
                    SizedBox(height: 20),
                    _loginForm(context),
                  ],
                );
              }

              return _loginForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(
                  LoginSumbitted(
                    username: usernameController.text,
                    password: passwordController.text,
                  ),
                );
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
