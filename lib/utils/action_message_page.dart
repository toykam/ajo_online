import 'package:ajo_online/utils/base_provider.dart';
import 'package:flutter/material.dart';

class ActionMessagePage extends StatelessWidget {
  ActionState actionState;
  ActionMessagePage({this.actionState});

    Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {

    if ([ActionStatus.Info, ActionStatus.Loading, ActionStatus.InProgress].contains(actionState.actionStatus))
      color = Colors.blue.withOpacity(.5);
    else if ([ActionStatus.Failed].contains(actionState.actionStatus))
      color = Colors.red.withOpacity(.5);
    else if ([ActionStatus.Success].contains(actionState.actionStatus))
      color = Colors.green.withOpacity(.5);

    return [ActionStatus.Loaded].contains(actionState.actionStatus) ? Container() : Container(
      child: Text('${actionState.message}'),
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}