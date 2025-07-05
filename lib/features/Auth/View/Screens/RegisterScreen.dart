import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/Auth/View/Widgets/CustomFieldWidget.dart';

import '../../Cubit/auth_cubit.dart';
import '../../Cubit/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAddSuccess) {
          if (state.model.status == "success") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Register Success"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state.model.status == "error") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Register Failed"),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 1,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 50),
            Customfieldwidget(hintText: "Name", controller: nameController),
            SizedBox(height: 20),
            Customfieldwidget(hintText: "Email", controller: emailController),
            SizedBox(height: 20),
            Customfieldwidget(hintText: "Phone", controller: phoneController),
            SizedBox(height: 20),
            Customfieldwidget(
              hintText: "National Id",
              controller: nationalIdController,
            ),

            SizedBox(height: 20),

            Customfieldwidget(hintText: "Gender", controller: genderController),
            SizedBox(height: 20),
            Customfieldwidget(
              hintText: "Password",
              controller: passwordController,
            ),

            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.read<AuthCubit>().register(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  nationalId: nationalIdController.text,
                  gender: genderController.text,
                  password: passwordController.text,
                );
              },

              style: TextButton.styleFrom(backgroundColor: Colors.blue),

              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
