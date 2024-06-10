import 'package:take_home/export.dart';

class CreateTaskBottomSheet extends StatelessWidget {
  TextEditingController taskTitleController;
  Function onCreateTap;
  List<String> sections;
  Function(String) onSectionChange;
  String selectedValue;

  CreateTaskBottomSheet({
    super.key,
    required this.taskTitleController,
    required this.onCreateTap,
    required this.sections,
    required this.onSectionChange,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.create,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Text(
                    "Create Task",
                    style: textStyles.medium.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
              verticalSpacer(10),
              CustomTextField(
                controller: taskTitleController,
                title: "Title",
                hintText: "Enter Title Here...",
              ),
              verticalSpacer(10),
              CustomTextField(
                controller: taskTitleController,
                title: "Description",
                hintText: "Enter Description Here...",
              ),
              verticalSpacer(20),
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) => onSectionChange(newValue!),
                items: sections.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              verticalSpacer(20),
              InkWell(
                onTap: () => onCreateTap(),
                child: Container(
                  height: sizes.heightRatio * 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        "Create",
                        style: textStyles.bold.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
