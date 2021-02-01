import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardItem extends StatelessWidget {
  final Results results;
  final DateTime dateTime = new DateTime.now();

  CardItem({Key key, @required this.results})
      : assert(results != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ru', timeago.RuMessages());
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
                      results.usrName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        results.note,
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
                        Expanded(
                          child: Text(results.c_name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
                        ),
                        Expanded(
                          child: Text(
                              timeago.format(
                                  dateTime.subtract(dateTime.difference(
                                      DateTime.parse(results.publishedAt))),
                                  locale: 'ru'),
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
                        )
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
