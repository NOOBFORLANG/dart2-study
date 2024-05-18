import 'package:flutter/material.dart';
import 'package:loggin_app/src/pages/test.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "로그인",
            textAlign: TextAlign.center,
          ),
        ),
        body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "ID : admin ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "PW : admin ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Enter ID",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: controller2,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue)),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (controller.text == "admin" &&
                          controller2.text == "admin") {
                        print("일치");

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Test()));
                      } else if (controller.text.isEmpty &&
                          controller2.text.isEmpty) {
                        print("아무것도 안쳤을때");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  '알림',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                content: Text("왜 아무것도 안침"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Close',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              );
                            });
                      } else {
                        print("불일치");

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  '알림',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text("아이디 또는 비밀번호 불일치."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        controller.clear();
                                        controller2.clear();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close')),
                                ],
                              );
                            });
                      }
                    },
                    child: const Text(
                      "확인",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
