// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:myapp/Layout/screen_layout.dart';
// import 'package:myapp/Owner_login_screens/SignUp.dart';
// import 'package:myapp/screens/home_screen.dart';
// import 'package:myapp/widgets/color_theme.dart';
// import 'package:myapp/widgets/custom_mainbutton.dart';
// import 'package:myapp/widgets/custom_textfeild.dart';
// import 'package:myapp/service/auth_service.dart';
// import 'package:myapp/DashboardScreen.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _obscureConfirm = true;
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> login() async {
//     if (!_formkey.currentState!.validate()) return;

//     setState(() {
//       _isLoading = true;
//     });

//     final auth = AuthService();
//     final result = await auth.login(
//       emailController.text.trim(),
//       passwordController.text,
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (result['success'] == true) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Color.fromARGB(255, 168, 141, 203),
//           content: Text('Login successful'),
//         ),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ScreenLayout()),
//       );
//     } else {
//       // Custom error message based on status code
//       String message;
//       if (result['statusCode'] == 401) {
//         message = 'Invalid email or password';
//       } else if (result['statusCode'] == 404) {
//         message = 'Server endpoint not found';
//       } else {
//         message = (result['message'] ?? 'Login failed').toString();
//       }

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(message)));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 67),
//               SizedBox(
//                 height: 60,
//                 width: 243,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Positioned(
//                       left: 20,
//                       child: Image.asset(
//                         "assets/a1.png",
//                         width: 60,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       left: 60,
//                       child: Text(
//                         "AsfahAmani",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w700,
//                           color: textColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 17),
//               Text(
//                 "LogIn to your Business Account",
//                 style: GoogleFonts.montserrat(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   height: 1,
//                   color: textColor,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 12),
//               Text(
//                 "Enter your details to access Dashboard",
//                 style: GoogleFonts.lato(
//                   height: 1,
//                   fontSize: 14,
//                   color: Color(0xFF565D6D),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 31),
//               Form(
//                 key: _formkey,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               top: 24,
//                               right: 24,
//                               left: 24,
//                               bottom: 44,
//                             ),
//                             child: CustomTextField(
//                               prefixIcon: Icons.message_outlined,
//                               controller: emailController,
//                               hintText: "Enter your email or username",
//                               labelText: "Email or Username",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Please enter email or username";
//                                 }
//                                 if (!value.contains("@")) {
//                                   return "Enter a valid email";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               right: 24,
//                               left: 24,
//                               bottom: 16,
//                             ),
//                             child: CustomTextField(
//                               prefixIcon: Icons.lock_outline,
//                               controller: passwordController,
//                               hintText: "Enter your password",
//                               labelText: "Password",
//                               obscureText: _obscureConfirm,
//                               suffixIcon: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscureConfirm = !_obscureConfirm;
//                                   });
//                                 },
//                                 icon: Icon(
//                                   _obscureConfirm
//                                       ? Icons.visibility_off_outlined
//                                       : Icons.remove_red_eye_outlined,
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Please enter password";
//                                 }
//                                 if (value.length < 8) {
//                                   return "Password must be at least 8 characters";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 10),
//                     TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         foregroundColor: Color(0xFF653B9B),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       child: Text(
//                         "Forgot Password?",
//                         style: GoogleFonts.lato(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           height: 22 / 14,
//                           color: btnColor,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: CustomMainButton(
//                         onPressed: _isLoading ? null : login,
//                         text: "LogIn",
//                         isLoading: _isLoading,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 57),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Row(
//                   children: const [
//                     Expanded(
//                       child: Divider(thickness: 1, color: Color(0xFF565D6D)),
//                     ),
//                     Text("  OR  ", style: TextStyle(color: Color(0xFF565D6D))),
//                     Expanded(
//                       child: Divider(thickness: 1, color: Color(0xFF565D6D)),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Container(
//                 width: 342,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(width: 1, color: Color(0xFF171A1F)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FaIcon(
//                       size: 24,
//                       FontAwesomeIcons.google,
//                       color: Color(0xFF171A1F),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "Continue with Google",
//                       style: GoogleFonts.lato(
//                         color: Color(0xFF171A1F),
//                         fontSize: 14,

//                         fontWeight: FontWeight.w500,
//                         height: 22 / 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 width: 342,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(width: 1, color: Color(0xFF171A1F)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FaIcon(
//                       size: 24,
//                       FontAwesomeIcons.facebook,
//                       color: Color(0xFF171A1F),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "Continue with Facebook",
//                       style: GoogleFonts.lato(
//                         color: Color(0xFF171A1F),
//                         fontSize: 14,

//                         fontWeight: FontWeight.w500,
//                         height: 22 / 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 49),
//               Text(
//                 "Don't have an account?",
//                 style: GoogleFonts.lato(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,

//                   color: Color(0xFF565D6D),
//                 ),
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(6),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignUpPage()),
//                   );
//                 },
//                 child: Text(
//                   "SignUp",
//                   style: GoogleFonts.lato(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF653B9B),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
