import 'package:cto_task/features/application/bloc/appl_bloc.dart';
import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:flushbar/flushbar.dart';
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
  bool isEmpty = false;
  List<Results> items = [];

  @override
  void initState() {
    applBloc = BlocProvider.of<ApplBloc>(context)..add(ApplLoadItem());
    super.initState();
  }

  @override
  void dispose() {
    applBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: BlocConsumer<ApplBloc, ApplState>(
          listener: (context, state) {
            if (state is ApplError) {
              Flushbar(
                title: "Ошибка",
                message: state.message,
                flushbarPosition: FlushbarPosition.TOP,
                duration: Duration(seconds: 3),
                isDismissible: false,
                backgroundColor: Colors.red[900],
                borderRadius: 8,
                margin: EdgeInsets.all(16.0),
              )..show(context);
              setState(() {
                isLoading = false;
              });
            }
            if (state is ApplSuccess) {
              if (state.appl.results.isEmpty) {
                setState(() {
                  isEmpty = true;
                  isLoading = false;
                });
                // Scaffold.of(context).showSnackBar(SnackBar(content: Text('')));
              } else
                setState(() {
                  totalCount = state.appl.totalCount;
                  items.addAll(state.appl.results);
                  isLoading = false;
                });
            }
          },
          builder: (context, state) {
            if (state is ApplInitial || (state is ApplLoading && items.isEmpty))
              return Center(child: CircularProgressIndicator());
            if (state is ApplError && items.isEmpty)
              return Center(
                  child: Text(state.message,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      )));
            return _buildBody();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    scrollInfo.metrics.maxScrollExtent &&
                !isEmpty) {
              applBloc.add(ApplLoadItem());
              setState(() {
                isLoading = true;
              });
            }
          },
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CardItem(results: items[index]);
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
    ]);
  }
}
