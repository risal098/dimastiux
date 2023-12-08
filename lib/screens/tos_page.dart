import 'package:flutter/material.dart';
class MyshowDialog{
    static void showToSDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ToS();
      },
    );
}}

class ToS extends StatelessWidget {
  const ToS({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30/800*width, vertical: 10),
          child: Stack(
            children: [
               Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(child: Text("Terms of Services", style: TextStyle(color: Color(0xFF527EE7), fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Poppins'),)),
              SizedBox(height: 20,),
              Title1('1. Terms of Service ("Terms")'),
              CommonText('Please read these Terms of Service ("Terms") carefully before using the Scriby websites (the "Service") operated by Scriby Developer. ("Scriby Developer", "us", "we", or "our"). Your access to and use of the Service is conditioned upon your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who wish to access or use the Service.'),
              Title1("2. Service"),
              CommonText("Scriby provides users with an interactive platform to learn English by listening to songs and dialogues. Users can type the lyrics or dialogues, and the web includes features for tracking and displaying statistical information on user progress."),
              Title1("3. Age Requirement"),
              CommonText("To use Scriby, you must be 13 years of age or older. Some songs may not be intended for those under the age of 13. If you do not meet the age requirement or do not agree with any part of these Terms, please refrain from using our services."),
              Title1("4. Prohibited Actions"),
              CommonText("\t\t\t1.\t\t\tRedistribute this website without our permission.\n\t\t\t2.\t\tTampering or hacking into this website.\n\t\t\t3.\t\tStealing our content or design on this website.\n\t\t\t4.\t\tUsing inappropriate word(s) as a username.\n\t\t\t5.\t\tUse this website for any unlawful purpose.\n\t\t\t6.\t Collect or track the personal information of other users."),
              Title1("6. Privacy"),
              CommonText("While using our service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you. Personally identifiable information includes user's email. We want to assure you that we are committed to using this data responsibly, and it will not be used for any malicious purposes. Additionally, all collected data will be encrypted securely to ensure the protection of user information."),
              Title1("7. Contact Information"),
              CommonText("If you have further information about this Terms of Service, please contact us by send email to risalahqolbu859@gmail.com.")
      
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(icon: Icon(Icons.close_rounded), onPressed: () {
              Navigator.of(context).pop();
            },),
          )
            ],
          )
      
        ),
      ),
    );
  }

  Padding CommonText(String text) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SelectionArea(child: Text(text, style: TextStyle(fontFamily: 'Poppins'), selectionColor: Color(0XFF1BC2D8),)),
          );
  }

  Text Title1(String text) => Text(text, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20),);
}