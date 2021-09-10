import 'package:flutter/material.dart';
import 'package:test_file/bloc/global_bloc.dart';
import 'package:test_file/theme/app_text_styles.dart';

import 'widgets/file_widget.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<StartState> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Uploading files"),
              ),
              body: Container(
                width: size.width,
                height: size.height,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: <Widget>[
                        Text(
                          "Loaded files: ${snapshot.data.loaded}",
                          style: AppTextStyles.infoStyle,
                        ),
                        Text(
                          "Loading files: ${snapshot.data.loading}",
                          style: AppTextStyles.infoStyle,
                        ),
                        Text(
                          "Awaiting files: ${snapshot.data.awaiting}",
                          style: AppTextStyles.infoStyle,
                        ),
                      ] +
                      List.generate(
                        snapshot.data.loaded,
                        (index) => FileWidget(
                          index: index + 1,
                          text: "Loaded",
                        ),
                      ) +
                      List.generate(
                        snapshot.data.loading,
                        (index) => FileWidget(
                          index: snapshot.data.loaded + index + 1,
                          text: "Loading...",
                        ),
                      ) +
                      List.generate(
                        snapshot.data.awaiting,
                        (index) => FileWidget(
                          index: snapshot.data.loaded +
                              snapshot.data.loading +
                              index +
                              1,
                          text: "Awaiting",
                        ),
                      ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: snapshot.data.loaded +
                            snapshot.data.loading +
                            snapshot.data.awaiting >=
                        30
                    ? null
                    : () {
                        bloc.addFiles();
                      },
                child: Icon(Icons.add),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
