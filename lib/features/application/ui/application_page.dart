import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Text(
              'Количество: 192981',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 16,
            ),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
            AppCard(),
          ]),
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide.none,
      onPressed: () {
        print("GestureDetector");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200]),
              child: Icon(
                Icons.image_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                height: 110,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subasu OutBack(2007г)",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Замена сальника распредвала",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          child: Text('Кокшетау',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
                        ),
                        Text('3 минуты назад',
                            style: TextStyle(fontSize: 13, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child:
                  Icon(Icons.arrow_forward_ios, size: 20, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}

// Card(
//               child: ListTile(
//                 dense: true,
//                 isThreeLine: true,
//                 leading: Container(
//                   padding: EdgeInsets.all(0),
//                   margin: EdgeInsets.all(0),
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage('assets/images/aha.png'))),
//                 ),
//                 title: Column(
//                   children: [
//                     Text("sjdhflskfhskjd"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("sdflnsdklfhsdfljso")
//                   ],
//                 ),
//                 subtitle: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [Text("sdfsdf00"), Text("sdfhsdgf")],
//                 ),
//               ),
//             // ),
