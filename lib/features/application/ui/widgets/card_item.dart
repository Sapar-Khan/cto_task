import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
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
