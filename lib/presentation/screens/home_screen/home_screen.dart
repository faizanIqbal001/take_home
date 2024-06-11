import 'package:flutter/cupertino.dart';
import 'package:take_home/export.dart';
import 'package:take_home/presentation/bloc/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  void initState() {
    context.read<HomeScreenBloc>().add(GetSingleProject());
    context.read<HomeScreenBloc>().add(GetSections());
    Future.delayed(
      const Duration(seconds: 5),
      () {
        context.read<HomeScreenBloc>().add(
              GetActiveTasks(),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state.status == HomeScreenStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.greenAccent,
                ),
              );
            }
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome to ${state.projectName}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Track Your Tasks!',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TaskTabs(
                        onToDoTap: () {
                          context.read<HomeScreenBloc>().add(
                                TabSelection(
                                  toDo: true,
                                  inProgress: false,
                                  done: false,
                                ),
                              );
                        },
                        onInProgressTap: () {
                          context.read<HomeScreenBloc>().add(
                                TabSelection(
                                  toDo: false,
                                  inProgress: true,
                                  done: false,
                                ),
                              );
                        },
                        onDoneTap: () {
                          context.read<HomeScreenBloc>().add(
                                TabSelection(
                                  toDo: false,
                                  inProgress: false,
                                  done: true,
                                ),
                              );
                        },
                        toDoSelected: state.toDoSelected ?? false,
                        inProgressSelected: state.inProgressSelected ?? false,
                        doneSelected: state.doneSelected ?? false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      !state.loadingForUpdateLists
                          ? Expanded(
                              child: Column(
                                children: [
                                  state.toDoSelected
                                      ? state.toDo.isNotEmpty
                                          ? Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: ListView.builder(
                                                  itemCount: state.toDo.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return TaskWidget(
                                                      onDeleteTap: () {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              RemoveTask(
                                                                  index: index),
                                                            );
                                                      },
                                                      onTypeTap:
                                                          (selectedValue) {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              LoadingOnListUpdate(
                                                                  isLoading:
                                                                      true),
                                                            );
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              UpdateLists(
                                                                selectedValue:
                                                                    selectedValue,
                                                                selectedTab:
                                                                    "ToDo",
                                                                selectedIndex:
                                                                    index,
                                                              ),
                                                            );
                                                      },
                                                      types: state.typesOfTasks,
                                                      selectedType: "ToDo",
                                                      title: state.toDo[index]
                                                              .content ??
                                                          '',
                                                      description: state
                                                              .toDo[index]
                                                              .description ??
                                                          '',
                                                      priority: state
                                                              .toDo[index]
                                                              .priority ??
                                                          4,
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : const Text(
                                              'Sorry No Data Found!',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            )
                                      : SizedBox.shrink(),
                                  state.inProgressSelected
                                      ? state.inProgress.isNotEmpty
                                          ? Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: ListView.builder(
                                                  itemCount:
                                                      state.inProgress.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return TaskWidget(
                                                      onDeleteTap: () {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              RemoveTask(
                                                                  index: index),
                                                            );
                                                      },
                                                      onTypeTap:
                                                          (selectedValue) {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              LoadingOnListUpdate(
                                                                  isLoading:
                                                                      true),
                                                            );
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              UpdateLists(
                                                                selectedValue:
                                                                    selectedValue,
                                                                selectedTab:
                                                                    "InProgress",
                                                                selectedIndex:
                                                                    index,
                                                              ),
                                                            );
                                                      },
                                                      types: state.typesOfTasks,
                                                      selectedType:
                                                          "InProgress",
                                                      title: state
                                                              .inProgress[index]
                                                              .content ??
                                                          '',
                                                      description: state
                                                              .inProgress[index]
                                                              .description ??
                                                          '',
                                                      priority: state
                                                              .inProgress[index]
                                                              .priority ??
                                                          4,
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : const Text(
                                              'Sorry No Data Found!',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            )
                                      : SizedBox.shrink(),
                                  state.doneSelected
                                      ? state.done.isNotEmpty
                                          ? Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: ListView.builder(
                                                  itemCount: state.done.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return TaskWidget(
                                                      onDeleteTap: () {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              RemoveTask(
                                                                  index: index),
                                                            );
                                                      },
                                                      onTypeTap:
                                                          (selectedValue) {
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              LoadingOnListUpdate(
                                                                  isLoading:
                                                                      true),
                                                            );
                                                        context
                                                            .read<
                                                                HomeScreenBloc>()
                                                            .add(
                                                              UpdateLists(
                                                                selectedValue:
                                                                    selectedValue,
                                                                selectedTab:
                                                                    "Done",
                                                                selectedIndex:
                                                                    index,
                                                              ),
                                                            );
                                                      },
                                                      types: state.typesOfTasks,
                                                      selectedType: "Done",
                                                      title: state.done[index]
                                                              .content ??
                                                          '',
                                                      description: state
                                                              .done[index]
                                                              .description ??
                                                          '',
                                                      priority: state
                                                              .done[index]
                                                              .priority ??
                                                          4,
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : const Text(
                                              'Sorry No Data Found!',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.greenAccent,
                              ),
                            ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          useSafeArea: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: CreateTaskBottomSheet(
                              taskTitleController: taskTitleController,
                              taskDescriptionController:
                                  taskDescriptionController,
                              onCreateTap: () {
                                context.read<HomeScreenBloc>().add(
                                      CreateNewTask(
                                        title: taskTitleController.text,
                                        description:
                                            taskDescriptionController.text,
                                      ),
                                    );
                              },
                              sections: state.typesOfTasks,
                              taskPriority: state.taskPriority,
                              selectedValue: state.selectedTaskType,
                              onSectionChange: (selectedSection) {
                                context.read<HomeScreenBloc>().add(
                                      ChangeTaskSection(
                                          selectedType: selectedSection),
                                    );
                              },
                              onPriorityChange: (selectedPriority) {
                                context.read<HomeScreenBloc>().add(
                                      ChangePrioritySection(
                                        selectedPriority: selectedPriority,
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: sizes.widthRatio * 40,
                        width: sizes.widthRatio * 90,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Create',
                              style: textStyles.bold.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const Icon(
                              Icons.create,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            switch (state.status) {
              case HomeScreenStatus.taskCreatedSuccess:
                Navigator.of(context).pop();
                context.read<HomeScreenBloc>().add(
                      ChangeStatus(status: HomeScreenStatus.loaded),
                    );
                break;
              case HomeScreenStatus.taskRemoved:
                context.read<HomeScreenBloc>().add(
                      ChangeStatus(status: HomeScreenStatus.loaded),
                    );
                break;
              default:
                break;
            }
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: BlocConsumer<HomeScreenBloc, HomeScreenState>(
      //   builder: (context, state) {
      //     return InkWell(
      //       onTap: () {
      //         showModalBottomSheet(
      //           context: context,
      //           isScrollControlled: true,
      //           isDismissible: true,
      //           useSafeArea: true,
      //           backgroundColor: Colors.transparent,
      //           builder: (context) => Padding(
      //             padding: MediaQuery.of(context).viewInsets,
      //             child: CreateTaskBottomSheet(
      //               taskTitleController:
      //                   state.taskTitleController ?? TextEditingController(),
      //               onCreateTap: () {},
      //               sections: state.typesOfTasks,
      //               selectedValue: state.selectedTaskType,
      //               onSectionChange: (selectedSection) {
      //                 context.read<HomeScreenBloc>().add(
      //                       ChangeTaskSection(selectedType: selectedSection),
      //                     );
      //               },
      //             ),
      //           ),
      //         );
      //       },
      //       child: Container(
      //         height: sizes.widthRatio * 40,
      //         width: sizes.widthRatio * 90,
      //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //         decoration: BoxDecoration(
      //           color: Colors.red.withOpacity(0.2),
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Text(
      //               'Create',
      //               style: textStyles.bold.copyWith(
      //                 color: Colors.black,
      //                 fontSize: 18,
      //               ),
      //             ),
      //             const Icon(
      //               Icons.create,
      //               size: 20,
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      //   listener: (context, state) {
      //     switch (HomeScreenStatus) {}
      //   },
      // ),
    );
  }
}
