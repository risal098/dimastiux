import 'package:dimastiui/screens/lockscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bar_items/appbar.dart';
import '../screens/homePage.dart';
import '../screens/register_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/accountData.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String pageName = "LoginPage";
  bool ok = true;
  bool flag = true;
  bool? isChecked = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String status="";
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // void signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }
  Future<void> panggil()async{
    
    var response= await http.get(Uri.https("bicaraai12.risalahqz.repl.co","hello"));
    print("huh?");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const UpBar(),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.92,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF527EE7),
                  Color(0xFF15CAD7),
                  Color(0xFF1CC2D9),
                  Color(0xFF20BCDA),
                  Color(0xFF0FD3D5),
                ],
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                child: Text(
                  "Welcome \nBack!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListView(children: [
                      Image.asset(
                          "assets/images/undraw_Ordinary_day_re_v5hy_1.png",
                          height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo_1.png"),
                          Text(
                            " Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(status, style: TextStyle(color: Colors.red, fontSize: 12),),
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          maxLength: 24,
                          controller: usernameController,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "username",
                            label: Text("username"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          maxLength: 24,
                          obscureText: ok,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Password",
                            label: Text("Password"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  ok ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  if (ok) {
                                    ok = false;
                                    return;
                                  }
                                  ok = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  activeColor: Color(0xFF527EE7),
                                  // tristate: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isChecked = newValue;
                                    });
                                  },
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color(0xFF527EE7),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () async{
                            // signIn();
                            print("panggil");
                            panggil();
                            print("terpanggil");
                            String usernameValue=usernameController.text;
                            String passwordValue=passwordController.text;
                            Get.off(()=>HomePage());
                          /*
                            var response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","login")
                            ,body:jsonEncode([usernameValue,passwordValue]));
                            var code=response.statusCode;
                           
                            if(code==200){
                               var data=jsonDecode(response.body);
                              AccountData.email=data[1];
                              AccountData.userId=data[0];
                              AccountData.username=usernameValue;
                              response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","premium")
                            ,body:jsonEncode([data[0],data[1]]));
                             code=response.statusCode;
                            data=jsonDecode(response.body);
                            AccountData.isPrem=data[0];
                            AccountData.permissionStatus=data[3];
                            AccountData.deadlinePermission=data[2];
                   //         await  AccountData.getData();
                              if (AccountData.permissionStatus == -1){
                                Navigator.push(context, MaterialPageRoute(builder: (context){return LockScreen();}));
                              } else{
                                Get.off(HomePage());
                              }
                              }
                            else{setState(() {
                              status="Account not found!";
                            });}
                            */
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF527EE7)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not a member?"),
                          TextButton(
                              onPressed: () {
                                Get.off( RegisterPage());
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Color(0xFF527EE7),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/vector_3.png"),
                            Text("OR"),
                            Image.asset("assets/images/vector_3.png")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 0.1,
                                  blurRadius: 1)
                            ]),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/flat-color-icons_google.png"),
                                SizedBox(width: 20,),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
