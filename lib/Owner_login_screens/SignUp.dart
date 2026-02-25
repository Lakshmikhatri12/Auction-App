// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/Owner_login_screens/LogIn.dart';
// import 'package:myapp/widgets/color_theme.dart';
// import 'package:myapp/widgets/custom_mainbutton.dart';
// import 'package:myapp/widgets/custom_textfeild.dart';
// import 'package:myapp/service/auth_service.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// bool _isChecked = false;
// bool _obscureConfirm = true;

// final _formkey = GlobalKey<FormState>();
// final TextEditingController businessController = TextEditingController();
// final TextEditingController ownerController = TextEditingController();
// final TextEditingController emailController = TextEditingController();
// final TextEditingController passwordController = TextEditingController();
// final TextEditingController nameController = TextEditingController();
// final TextEditingController numberController = TextEditingController();
// final TextEditingController confirmpassController = TextEditingController();

// class _SignUpPageState extends State<SignUpPage> {
//   bool _isSubmitting = false;

//   Future<void> _submit() async {
//     if (!_formkey.currentState!.validate()) return;
//     if (!_isChecked) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please agree to Terms & Conditions")),
//       );
//       return;
//     }

//     setState(() {
//       _isSubmitting = true;
//     });

//     final auth = AuthService();
//     final result = await auth.registerBusinessOwner(
//       businessName: businessController.text.trim(),
//       ownerName: ownerController.text.trim(),
//       email: emailController.text.trim(),
//       phone: numberController.text.trim(),
//       password: passwordController.text,
//       confirmPassword: confirmpassController.text,
//       acceptedTerms: true,
//       acceptedPrivacy: true,
//     );

//     setState(() {
//       _isSubmitting = false;
//     });

//     if (result['success'] == true) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Account created! Please verify your email.'),
//         ),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Login()),
//       );
//     } else {
//       final String message = _extractValidationMessage(result);
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(message)));
//     }
//   }

//   String _extractValidationMessage(Map<String, dynamic> result) {
//     final message = (result['message'] ?? '').toString();
//     final errors = result['data']?['errors'] ?? result['errors'];
//     if (errors is List && errors.isNotEmpty) {
//       // Show the first validation error clearly
//       final first = errors.first;
//       final field = first['field'] ?? '';
//       final err = first['message'] ?? message;
//       return field != '' ? '$field: $err' : err.toString();
//     }
//     return message.isNotEmpty ? message : 'Registration failed';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Logo Row
//                 SizedBox(height: 55),
//                 SizedBox(
//                   height: 60,
//                   width: 243,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         left: 20, // adjust position
//                         child: Image.asset(
//                           "assets/a1.png",
//                           width: 60,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Positioned(
//                         left: 60, // move text right of the image
//                         child: Text(
//                           "AsfahAmani",
//                           style: GoogleFonts.montserrat(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w700,
//                             color: textColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 Form(
//                   key: _formkey,
//                   child: Column(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Create your Business Account",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               height: 2,
//                               color: textColor,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           // Business Name
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               top: 23,
//                               right: 40,
//                               left: 40,
//                               bottom: 9,
//                             ),
//                             child: CustomTextField(
//                               prefixIcon: Icons.business,
//                               controller: businessController,
//                               hintText: "Enter Your Business Name",
//                               labelText: "Business Name",
//                               validator: (value) =>
//                                   value == null || value.isEmpty
//                                   ? "Business name required"
//                                   : null,
//                             ),
//                           ),

//                           // Owner Name
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: CustomTextField(
//                               prefixIcon: Icons.person,
//                               labelText: "Owner Name",
//                               controller: ownerController,
//                               hintText: "Enter Your Owner Name",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Owner name required";
//                                 }
//                                 final onlyLetters = RegExp(r'^[a-zA-Z\s]+$');
//                                 if (!onlyLetters.hasMatch(value)) {
//                                   return "Owner name can only contain letters and spaces";
//                                 }
//                                 if (value.trim().length < 2) {
//                                   return "Owner name must be at least 2 characters";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           SizedBox(height: 9),

//                           // Email
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: CustomTextField(
//                               labelText: "Email Address",
//                               prefixIcon: Icons.message_outlined,
//                               controller: emailController,
//                               hintText: "you@example.com",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Email required";
//                                 }
//                                 final emailRegex = RegExp(
//                                   r'^[^@]+@[^@]+\.[^@]+',
//                                 );
//                                 if (!emailRegex.hasMatch(value)) {
//                                   return "Enter valid email";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 9),

//                           // Phone
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: CustomTextField(
//                               labelText: "Phone Number",
//                               prefixIcon: Icons.phone,
//                               controller: numberController,
//                               hintText: "(123)456-7890",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Phone number required";
//                                 }
//                                 final e164 = RegExp(r'^\+?[1-9][\d]{0,15}$');
//                                 if (!e164.hasMatch(value)) {
//                                   return "Use valid phone format (e.g., +1234567890)";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 9),

//                           // Password
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: CustomTextField(
//                               labelText: "Password",
//                               prefixIcon: Icons.lock_outline,
//                               controller: passwordController,
//                               hintText: "Enter Password",
//                               obscureText: _obscureConfirm,

//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Password required";
//                                 }
//                                 if (value.length < 8) {
//                                   return "At least 8 characters";
//                                 }
//                                 final complexity = RegExp(
//                                   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])',
//                                 );
//                                 if (!complexity.hasMatch(value)) {
//                                   return "Include lower, upper, number, special";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 9),

//                           // Confirm Password
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: CustomTextField(
//                               labelText: "Confirm Password",
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
//                               prefixIcon: Icons.lock_outline,
//                               controller: confirmpassController,
//                               hintText: "Confirm Password",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Confirm password required";
//                                 }
//                                 if (value != passwordController.text) {
//                                   return "Passwords do not match";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 28),

//                           // Terms Checkbox
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 40),
//                             child: Row(
//                               children: [
//                                 Checkbox(
//                                   value: _isChecked,
//                                   onChanged: (val) {
//                                     setState(() {
//                                       _isChecked = val ?? false;
//                                     });
//                                   },
//                                 ),
//                                 Expanded(
//                                   child: Text.rich(
//                                     TextSpan(
//                                       text: "I agree to the ",
//                                       style: GoogleFonts.lato(
//                                         fontSize: 14,

//                                         color: textColor,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                       children: [
//                                         TextSpan(
//                                           text: "Terms and Conditions",
//                                           style: GoogleFonts.lato(
//                                             fontSize: 14,

//                                             color: btnColor,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 42),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       // Sign Up Button
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 24,
//                           right: 24,
//                           top: 24,
//                         ),
//                         child: CustomMainButton(
//                           onPressed: _isSubmitting ? null : _submit,
//                           text: 'SignUp',
//                           isLoading: _isSubmitting,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 33),

//                 // Divider with OR
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Row(
//                     children: const [
//                       Expanded(
//                         child: Divider(thickness: 1, color: Color(0xFF565D6D)),
//                       ),
//                       Text(
//                         "  OR  ",
//                         style: TextStyle(color: Color(0x565D6DB3)),
//                       ),
//                       Expanded(
//                         child: Divider(thickness: 1, color: Color(0xFF565D6D)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 31),

//                 Container(
//                   width: 342,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(color: Color(0xFFDEE1E6), width: 1),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FaIcon(
//                         FontAwesomeIcons.google,
//                         size: 24,
//                         color: Color(0xFF171A1F),
//                       ),
//                       SizedBox(width: 16),
//                       Text(
//                         "Continue with Google",
//                         style: GoogleFonts.lato(
//                           fontSize: 14,
//                           height: 22 / 14,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFF171A1F),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // facebook
//                 Container(
//                   width: 342,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(color: Color(0xFFDEE1E6), width: 1),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FaIcon(
//                         FontAwesomeIcons.facebook,
//                         size: 24,
//                         color: Color(0xFF171A1F),
//                       ),
//                       SizedBox(width: 16),
//                       Text(
//                         "Continue with Facebook",
//                         style: GoogleFonts.lato(
//                           fontSize: 14,
//                           height: 22 / 14,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFF171A1F),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 33),

//                 // Already have account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account? ",
//                       style: GoogleFonts.lato(
//                         fontSize: 14,
//                         height: 20 / 14,
//                         fontWeight: FontWeight.w400,
//                         color: textColor,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Login(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Login",
//                         style: GoogleFonts.lato(
//                           fontSize: 14,
//                           height: 20 / 14,
//                           fontWeight: FontWeight.w400,
//                           color: btnColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
