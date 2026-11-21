import 'package:flutter/material.dart';
import 'package:full_application/CustomWedgets/custom_field.dart';
import 'package:full_application/Providers/authprovider.dart';
import 'package:full_application/Screens/homepage.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
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
            SizedBox(height: 30),
            Center(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: .bold),
              ),
            ),
            SizedBox(height: 30),
            CustomField(
              lable: "email",
              prefixIcon: Icons.email,
              controllers: emailcontroller,
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return "enter valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            CustomField(
              lable: "Password",
              prefixIcon: Icons.lock,
              controllers: passwordcontroller,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "enter valid password";
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 206, 227, 225),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                minimumSize: Size(200, 55),
              ),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  final success = await providerobject.useerlogin(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        providerobject.auth?.message ?? "pleaase Try again",
                      ),
                      backgroundColor: success
                          ? Colors.green
                          : Colors.redAccent,
                    ),
                  );
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  }
                }
              },
      
              child: Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
