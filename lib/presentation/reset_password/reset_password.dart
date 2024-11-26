import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:jobpro/utils/authentication_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailconrtroller = TextEditingController();
    

    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailconrtroller,
              decoration: InputDecoration(labelText: "Enter Verification Email ID"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call backend to reset password with the new password entered
                // resetPassword(emailconrtroller.text);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
  // void resetPassword(String verifyemail) async {
  //   final AuthenticationManager _authManager=Get.put(AuthenticationManager());
  //   String url =
  //       'https://erp.teamproit.com/api/method/teampro.api.check_user_and_sendmail';

  //   var response = await get(url as Uri, headers: {
  //     'Accept': 'application/json',
  //     'Cookie': getToken().toString()
  //   });
  //   if (response.statusCode == HttpStatus.ok) {
  //     var dataList = response.body['data'];
  //     if (dataList.length > 0) {
  //       return dataList[0]['item_name'];
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     if (response.statusCode == HttpStatus.forbidden) {
  //       if (response.body['session_expired'] == 1) {
  //         _authManager.logOut();
  //       }
  //     } else {
  //       //show error message
  //       Get.snackbar('Error', response.statusCode.toString());
  //     }
  //   }
    
  // }
  
}
