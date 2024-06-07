import 'package:take_home/export.dart';

class InitializerRepoImpl implements InitializerRepo {
  final StorageRepo storageRepo;
  NetworkHelper networkHelper;

  InitializerRepoImpl({required this.storageRepo, required this.networkHelper});

  @override
  Future<void> saveUuid() async {
    var uuid = const Uuid();
    String requestId = uuid.v4();

    storageRepo.saveString(key: StorageKey.uuid, value: requestId);
  }
}
