import 'package:flutter/material.dart';
import 'package:test_file/bloc/global_bloc.dart';
import 'package:test_file/theme/app_colors.dart';
import 'package:test_file/theme/app_text_styles.dart';

class FileWidget extends StatelessWidget {
  final int index;
  final String text;
  const FileWidget({this.index, this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(index.toString(), style: AppTextStyles.fileStyle),
      title: Text(text, style: AppTextStyles.fileStyle),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: AppColors.fileInfo),
        onPressed: () {
          bloc.deleteFile(text);
        },
      ),
    );
  }
}
