import 'package:flutter/material.dart';
import 'package:full_application/CustomWedgets/custom_field.dart';
import 'package:full_application/Providers/authprovider.dart';
import 'package:full_application/Screens/loginPage.dart';
import 'package:provider/provider.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providerobject = context.read<Authprovider>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: .bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomField(
              lable: "Name",
              prefixIcon: Icons.person,
              controllers: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            CustomField(
              lable: "Password",
              prefixIcon: Icons.lock,
              controllers: passwordcontroller,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "password incorrect";
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            CustomField(
              lable: "Email",
              prefixIcon: Icons.email,
              controllers: emailcontroller,
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return "Email incorrect";
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            CustomField(
              lable: "Phone",
              prefixIcon: Icons.phone,
              controllers: phonecontroller,
              validator: (value) {
                if (value == null || value.length < 11) {
                  return "Phone incorrect";
                }
                return null;
              },
            ),
            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color.fromARGB(255, 198, 222, 219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                side: BorderSide(width: 50),
              ),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  final succes = await providerobject.userregister(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                    name: namecontroller.text,
                    phone: phonecontroller.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        providerobject.auth?.message ?? "please Trye again",
                      ),
                      backgroundColor: succes ? Colors.green : Colors.red,
                    ),
                  );
                  if (succes) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  }
                }
              },
              child: Text(
                "Signup",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
