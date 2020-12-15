import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page_provider.dart';
import 'package:ajo_online/utils/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Consumer<LoginPageProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if ([ActionStatus.InProgress, ActionStatus.Loading].contains(value.getActionStatus))
                  ...[
                    CupertinoActivityIndicator(),
                    Text('${value.getActionMessage}')
                  ],
                if ([ActionStatus.Failed, ActionStatus.Success, ActionStatus.Info].contains(value.getActionStatus))
                  ...[
                    // CupertinoActivityIndicator(),
                    Text('${value.getActionMessage}')
                  ],
                Container(
                  child: TextFormField(
                    initialValue: '${value.email}',
                    onChanged: (email) {
                      value.email = email;
                    },
                  ),
                ),

                Container(
                  child: TextFormField(
                    initialValue: '${value.password}',
                    onChanged: (password) {
                      value.password = password;
                    },
                    obscureText: !value.passwordIsVisible,
                  ),
                ),

                InkWell(
                  onTap: () => value.setPasswordIsVisible = !value.passwordIsVisible,
                  child: Text('${value.passwordIsVisible ? 'hide' : 'show'} password'),
                ),

                Container(
                  child: RaisedButton(
                    child: Text('Login'),
                    onPressed: () => value.verifyInput(context),
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}