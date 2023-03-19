// import 'package:firebase_authentication_task/functions/email_pass_services_function.dart';
// import 'package:flutter/material.dart';
// import '../../models/email_pass_model.dart';
// import 'email_pass_home_page.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//
//   String email = '';
//   String password = '';
//   String name = '';
//   String error = '';
//   bool login = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 validator: (val) => val!.isEmpty ? 'Enter an email' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     email = val.trim();
//                   });
//                 },
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               TextFormField(
//                 validator: (val) =>
//                     val!.length < 6 ? 'Enter a password 6+ chars long' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     password = val.trim();
//                   });
//                 },
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Password',
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               SizedBox(
//                 height: 55,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     // onPressed: () async {
//                     //   if (_formKey.currentState!.validate()) {
//                     //     _formKey.currentState!.save();
//                     //     // login
//                     //     UserModel? user = (await _auth.createUserWithEmailAndPassword());
//                     //     if (user != null) {
//                     //       setState(() {
//                     //         error = 'Could not register with those credentials';
//                     //       });
//                     //     } else {
//                     //       login
//                     //           ? AuthService.signinUser(email, password)
//                     //           : AuthService.signupUser(email, password, context);
//                     //     }
//                     //   }
//                     // },
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         login
//                             ? AuthService.signinUser(email, password, context)
//                             : AuthService.signupUser(email, password, name, context);
//                       }
//                     },
//                     child: Text(login ? 'Login' : 'Signup')),
//               ),
//               // ElevatedButton(
//               //   onPressed: () async {
//               //     if (_formKey.currentState!.validate()) {
//               //       UserModel? user = (await _auth
//               //           .registerWithEmailAndPassword()) as UserModel?;
//               //       if (user != null) {
//               //         setState(() {
//               //           error = 'Could not register with those credentials';
//               //         });
//               //       } else {
//               //         Navigator.pushReplacement(
//               //           context,
//               //           MaterialPageRoute(
//               //             builder: (context) => HomePage(),
//               //           ),
//               //         );
//               //       }
//               //     }
//               //   },
//               //   child: const Text('Register'),
//               // ),
//               const SizedBox(height: 10.0),
//               Text(
//                 error,
//                 style: const TextStyle(color: Colors.red, fontSize: 14.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
