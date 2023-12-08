import 'package:dimastiui/screens/reedem_success.dart';
import 'package:flutter/material.dart';
import '../controllers/accountData.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ReedemPage extends StatefulWidget {
  const ReedemPage({super.key});

  @override
  State<ReedemPage> createState() => _ReedemPageState();
}

class _ReedemPageState extends State<ReedemPage> {
  final reecodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String status = "";
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopNavBar(width),
            Container(
              height: height-150,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldReedem(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(status, style: TextStyle(fontSize: 12, color: Colors.red),),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: ()async {
                      var response1=await http.post(Uri.https("bicaraai12.risalahqz.repl.co","validateRedeemCode"),
                                body:jsonEncode({"email":AccountData.email!,"redeem":reecodeController.text})
                               );
                      var data1=jsonDecode(response1.body);
                      if(data1[1]!=1){
                        setState((){});
                      }else{
                        AccountData.permissionStatus=1;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return SuccessReedem();}));}
                    },
                    child:Container(
                        alignment: Alignment.center,
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff528DE7),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("USE REEDEM CODE", style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                  ),
                )]
              ),
            )
          ],
        ),
      ),
    );
  }

  Container TextFieldReedem() {
    return Container(
                height: 65,
                padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  maxLength: 24,
                  controller: reecodeController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.discount_rounded),
                    counterText: '',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Reedem Code"),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
  }

  Container TopNavBar(double width) {
    return Container(
          height: 80,
          padding: EdgeInsets.only(left: 20, top: 10),
          width: width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            const Color(0xff528DE7),
            const Color(0xff20BCDA),
            const Color(0xff1CC2D9),
            const Color(0xff0FD3D5),
            const Color(0xff0FD3D5)
          ])
          ),
          child: Text("Reedem Code", style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: "Poppins"),),
        );
  }
}