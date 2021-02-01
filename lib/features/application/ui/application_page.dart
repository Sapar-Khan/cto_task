import 'package:cto_task/features/application/bloc/appl_bloc.dart';
import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/card_item.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  ApplBloc applBloc;
  int totalCount;
  bool isLoading = false;
  List<Results> items = [];

  @override
  void initState() {
    print("initState");
    applBloc = BlocProvider.of<ApplBloc>(context)..add(ApplLoadItem());
    super.initState();
  }



  @override
  void dispose() {
    applBloc.close();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   print('build');
  //   return Scaffold(
  //     body: BlocConsumer<ApplBloc, ApplState>(
  //       listener: (context, state){

  //       },
  //       builder: (context, state){
  //         if(state is ApplLoading){
  //           print('state is ApplLoading');
  //         }
  //         if(state is ApplSuccess){
  //           print('state is ApplSuccess');
  //         }
  //         if(state is ApplError){
  //           print('state is ApplError');
  //         }
  //         print('$state ------');
  //         return Container();
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplBloc, ApplState>(
      listener: (context, state) {
        print('listner');
        if (state is ApplLoading) {
          print('loading...');
        }
        if (state is ApplError) {
          print('error in listner');
        }
        if (state is ApplSuccess) {
          print('success');
          print(state.appl.pageSize);
          setState(() {
            totalCount = state.appl.totalCount;
            items.addAll(state.appl.results);
            isLoading = false;
          });
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Количество: $totalCount',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    applBloc.add(ApplLoadItem());
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      // print(items[index]);
                      return CardItem(results: items[index]);
                      // return Container();
                    }),
              ),
            ),
            Container(
              height: isLoading ? 50.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
