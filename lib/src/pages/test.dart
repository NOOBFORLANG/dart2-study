import 'package:flutter/material.dart';

// 로그인 성공후 페이지
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("성공적으로 로그인 되었습니다.", style: TextStyle(fontSize: 15)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("뒤로")),
            )
          ],
        ),
      ),
    );
  }
}
