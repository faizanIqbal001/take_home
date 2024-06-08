import 'package:take_home/export.dart';

class TaskTabs extends StatelessWidget {
  Function onToDoTap;
  Function onInProgressTap;
  Function onDoneTap;
  bool toDoSelected;
  bool inProgressSelected;
  bool doneSelected;

  TaskTabs({
    super.key,
    required this.onToDoTap,
    required this.onInProgressTap,
    required this.onDoneTap,
    required this.toDoSelected,
    required this.inProgressSelected,
    required this.doneSelected,
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
                    horizontal: horizontalValue(10),
                  ),
                  decoration: BoxDecoration(
                    color: toDoSelected ? Colors.orange : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black,
                    ),
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
                      horizontal: horizontalValue(10),
                    ),
                    decoration: BoxDecoration(
                      color: inProgressSelected ? Colors.yellow : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black,
                      ),
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
                      horizontal: horizontalValue(10),
                    ),
                    decoration: BoxDecoration(
                      color: doneSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black,
                      ),
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
