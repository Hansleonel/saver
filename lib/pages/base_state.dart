import 'package:flutter/material.dart';
import 'package:saver/blocs/provider/bloc.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/dependency_injections/injection.dart';

abstract class BaseState<T extends StatefulWidget, K extends Bloc>
    extends State<T> {
  K? bloc;
  // add AppLocalizations lang
  // late AppLocalizations lang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = Provider.of<K>(() => getIt.get<K>());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // add the next line when we have AppLocalizations
    // lang = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Provider.dispose();
    super.dispose();
  }
}
