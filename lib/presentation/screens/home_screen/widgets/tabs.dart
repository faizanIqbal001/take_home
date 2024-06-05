import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_home/export.dart';

class TaskTabs extends StatelessWidget {
  Function onToDoTap;
  Function onInProgressTap;
  Function onDoneTap;

  TaskTabs({
    super.key,
    required this.onToDoTap,
    required this.onInProgressTap,
    required this.onDoneTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () => onToDoTap(),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalValue(4),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: verticalValue(16),
                    horizontal: horizontalValue(20),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      appConstants.toDo,
                      style: textStyles.bold.copyWith(
                          fontSize: sizes.fontRatio * 12, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onInProgressTap(),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(4),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalValue(16),
                      horizontal: horizontalValue(20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        appConstants.inProgress,
                        style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onDoneTap(),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(4),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalValue(16),
                      horizontal: horizontalValue(20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        appConstants.done,
                        style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
