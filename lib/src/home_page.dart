import 'package:flutter/material.dart';
import 'second_page.dart';

enum Commands { loginWithAccount, loginWithGoogle, createAccount}

class HomePage extends StatefulWidget {
  final String title;
  final int counter;
  final ValueChanged<void> decrementCounter;
  final ValueChanged<void> incrementCounter;
  final ValueChanged<Commands> popUpSelection;
  final bool checked;

  HomePage({
    Key key,
    this.title,
    this.counter,
    this.decrementCounter,
    this.incrementCounter,
    this.popUpSelection,
    this.checked,
  }) : super (key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  void _onPressed() {
    widget.incrementCounter(null);
  }

  void _accountPressed() {
    print('Account pressed');
  }

  void _popUpSelection(Commands choice) {
    widget.popUpSelection(choice);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new PopupMenuButton(
            icon: Icon(Icons.account_circle),
            onSelected: _popUpSelection,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Commands>>[
              const PopupMenuItem<Commands> (
                value: Commands.loginWithGoogle,
                child: ListTile(leading: Icon(null), title: Text('Sign In With Google')),
              ),
              const PopupMenuItem<Commands> (
                value: Commands.loginWithAccount,
                child: ListTile(leading: Icon(null), title: Text('Sign In')),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Commands> (
                value: Commands.createAccount,
                child: ListTile(leading: Icon(Icons.create), title: Text('Create Account')),
              ),
            ],
          ),
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You Have push the button this many times:'),
            new Text(
              widget.counter.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            new RaisedButton(
              child: new Text('Next Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SecondPage(
                        widget.decrementCounter,
                        title: 'My Second Page',
                        counter: widget.counter,
                      ),
                  ),
                );
              },
            )
          ],
        )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

}