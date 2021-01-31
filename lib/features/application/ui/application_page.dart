import 'package:cto_task/features/application/bloc/appl_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/card_item.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  ApplBloc applBloc;

  @override
  void initState() {
    applBloc = ApplBloc()..add(ApplLoadItem());
    super.initState();
  }

  @override
  void dispose() {
    applBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ApplBloc, ApplState>(
        listener: (context, state) {
          if (state is ApplError) {
            print('error in listner');
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Количество: 192981',
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView(children: [
                  CardItem(),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
