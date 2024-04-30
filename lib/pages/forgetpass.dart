import 'package:auth/helper/message.dart';
import 'package:auth/pages/verifcation.dart';
import 'package:auth/widget/cusstomtextfield.dart';
import 'package:auth/widget/custombuttonfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';


class forgetpass extends StatefulWidget {
  forgetpass({super.key});

  @override
  State<forgetpass> createState() => _forgetpassState();
  
}

class _forgetpassState extends State<forgetpass> {
  String? email;
  TextEditingController? emailController=TextEditingController();
  Future<void> sendinggmail()async{
    try {
      var gmailmessage= Message();
      gmailmessage.subject='subject from news app';
      gmailmessage.text= 'hey ......send from news';
      gmailmessage.from= Address(email.toString());
      gmailmessage.recipients.add(email);
      var smtpserver =gmailRelaySaslXoauth2(email!,'yucq dydx wdrm fzjg');
     await send(gmailmessage, smtpserver);
      print("........... email send");

      
    } catch (e) {
      massage(context, "sorry there's an error $e");
      
    }

  }
  Future cheackemail()async{
    try {
  await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController!.text.trim());
} on FirebaseAuthException catch (e) {
  massage(context, 'not email');
}

  }

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'forget my password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                  child: Text('Please Enter Email Address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17))),
              SizedBox(
                height: 20,
              ),
              customtextfiald(
                Controller: emailController,
                validator: (data) {
                  if (data!.isEmpty) {
                    return "Field is required";
                  }
                  if (!data.contains('@gmail.com')) {
                    return 'Email must contain @gmail.com';
                  }
                },
                onChanged: (data) {
                  emailController = data as TextEditingController?;
                },
                hintText: 'enter your email',
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: 40,
              ),
              custombuttonfield(
                text: 'Send',
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController!.text.trim());
                          sendinggmail();
                      
                      
                      
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return verifiaction();
                        },
                      ));
                    } on FirebaseAuthException catch (e) {
                      massage(context, 'emailnot exist');
                      
                    } 
                  }
                },
              ),
              
           
            ],
          ),
        ),
      ),
    );
  }
}

