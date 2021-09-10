import 'package:flutter/material.dart';
import 'package:test_file/bloc/global_bloc.dart';

import 'last_screen/last_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    const saveSnackBar = SnackBar(content: Text('Saved successfully!'));
    return StreamBuilder(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<StartState> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Test file"),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => LastScreen(),
                              ),
                            );
                          },
                          child: Text("Menu"),
                        ),
                        ElevatedButton(
                          autofocus: false,
                          onPressed: snapshot.data.loaded == 0 ||
                                  snapshot.data.loading != 0
                              ? null
                              : () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(saveSnackBar);
                                },
                          child: Text("Save"),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: snapshot.data.loaded == 0 &&
                                  snapshot.data.loading == 0
                              ? null
                              : () {
                                  bloc.deleteFiles();
                                },
                          child: Text("Throw off"),
                        ),
                      ]),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
