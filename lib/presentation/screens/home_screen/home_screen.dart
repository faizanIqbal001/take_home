import 'package:take_home/export.dart';
import 'package:take_home/presentation/bloc/export.dart';
import 'package:take_home/presentation/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>().add(GetSingleProject());
    context.read<HomeScreenBloc>().add(GetSections());
    context.read<HomeScreenBloc>().add(GetActiveTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return state.status == HomeScreenStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.greenAccent,
                    ),
                  )
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
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
                          onToDoTap: () {},
                          onInProgressTap: () {},
                          onDoneTap: () {},
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: ListView.builder(
                              itemCount: state.toDo!.length,
                              itemBuilder: (context, index) {
                                return TaskWidget(
                                  title: state.toDo![index].content ?? '',
                                  description:
                                      state.toDo![index].description ?? '',
                                  priority: state.toDo![index].priority ?? 4,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
          listener: (context, state) {
            switch (HomeScreenStatus) {}
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: InkWell(
        onTap: () {

        },
        child: Container(
          height: sizes.widthRatio * 40,
          width: sizes.widthRatio * 80,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
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
              const Icon(Icons.create),
            ],
          ),
        ),
      ),
    );
  }
}
