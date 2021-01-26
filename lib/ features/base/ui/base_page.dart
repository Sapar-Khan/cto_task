import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white, elevation: 0,),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              // color: Colors.,
              image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/aha.png'),
            // fit: BoxFit.cover
          )),
          child: Column(
            children: [
              SizedBox(height: 280),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Найди СТО или запчасть за 3 минуты',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,

                        ),
                        SizedBox(height: 20,),
                        ListTile(
                          tileColor: Colors.green,
                          onTap: (){print("1 list tile");},
                          leading: Icon(Icons.contactless, size: 60, color: Colors.white,),
                          title: Text('Отправить заявку'),
                          subtitle: Text('Получить цены от свободных '),
                        ),
                      ],
                    ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class BasePage extends StatefulWidget {
//   @override
//   _BasePageState createState() => _BasePageState();
// }

// class _BasePageState extends State<BasePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         minimum: const EdgeInsets.all(16),
//         child: Stack(
//           children: [
//             Container(
//                 height: 450,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/aha.png'),
//                       // fit: BoxFit.cover
//                     ))),

//             // top: 300,
//             // bottom: 60,
//             Positioned(
//               // top: 400,
//               child: Container(
//                   width: double.infinity,
//                   height: 400,
//                   decoration: BoxDecoration(color: Colors.red),
//                   child: Text("test koi brat")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
