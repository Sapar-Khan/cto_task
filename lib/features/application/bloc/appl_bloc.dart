import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:cto_task/features/application/resourse/appl_reposytory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'appl_event.dart';
part 'appl_state.dart';

class ApplBloc extends Bloc<ApplEvent, ApplState> {
  ApplBloc() : super(ApplInitial());
  ApplReposytory _reposytory = ApplReposytory();

  @override
  Stream<ApplState> mapEventToState(
    ApplEvent event,
  ) async* {
    if (event is ApplLoadItem) {
      yield ApplLoading();
      await _reposytory.fetchDict();
      dynamic result = await _reposytory.fetchApplItems();
      if (result is Appl)
        yield ApplSuccess(appl: result);
      else
        yield ApplError(message: result);
    }
  }
}
