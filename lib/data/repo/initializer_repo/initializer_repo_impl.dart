import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

class InitializerRepoImpl implements InitializerRepo {
  final StorageRepo storageRepo;
  NetworkHelper networkHelper;

  InitializerRepoImpl({required this.storageRepo, required this.networkHelper});

//@override
// Future<Either<LoginResponseModel, Failure>> hitLogin() async {
//   final response = await networkHelper.post(
//     NetworkEndPoints.signIn,
//     body: {
//       'phoneNumber': storageRepo.getString(key: StorageKey.phoneNumber),
//       'password': storageRepo.getString(key: StorageKey.password),
//       'countryCode': storageRepo.getString(key: StorageKey.countryCode),
//     },
//   );
//
//   return response.fold(
//     (success) {
//       var decodedJson = jsonDecode(success);
//       if (decodedJson == null) {
//         return Right(
//           Failure(
//             status: false,
//             message: appConstants.serverIsNotResponding,
//           ),
//         );
//       }
//       if (decodedJson['status'] == null) {
//         return Right(
//           Failure(
//             status: false,
//             message: appConstants.serverIsNotResponding,
//           ),
//         );
//       }
//
//       LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
//         decodedJson,
//       );
//
//       if (loginResponseModel.status ?? false) {
//         storageRepo.saveString(
//           key: StorageKey.token,
//           value: loginResponseModel.data!.token,
//         );
//         Map<String, dynamic> payload = Jwt.parseJwt(
//           loginResponseModel.data!.token ?? "",
//         );
//         JwtPayLoad jwtPayLoad = JwtPayLoad.fromJson(payload);
//         storageRepo.saveInt(key: StorageKey.id, value: jwtPayLoad.id);
//         storageRepo.saveString(
//             key: StorageKey.email, value: jwtPayLoad.email);
//         storageRepo.saveBool(key: StorageKey.user, value: jwtPayLoad.user);
//         storageRepo.saveString(
//           key: StorageKey.userType,
//           value: jwtPayLoad.userType,
//         );
//         storageRepo.saveInt(
//           key: StorageKey.agencyId,
//           value: jwtPayLoad.agencyId,
//         );
//         storageRepo.saveString(
//           key: StorageKey.name,
//           value: jwtPayLoad.name,
//         );
//         storageRepo.saveString(
//           key: StorageKey.companyName,
//           value: jwtPayLoad.agencyName,
//         );
//         storageRepo.saveString(
//           key: StorageKey.phoneNumber,
//           value: jwtPayLoad.phoneNumber,
//         );
//         if (loginResponseModel.status == true) {
//           storageRepo.saveBool(key: StorageKey.isUserLoggedIn, value: true);
//         }
//         return Left(loginResponseModel);
//       } else {
//         return Right(
//           Failure(
//             status: false,
//             message: loginResponseModel.statusMsg.toString(),
//           ),
//         );
//       }
//     },
//     (error) {
//       return Right(
//         Failure(
//           status: false,
//           message: error.message,
//         ),
//       );
//     },
//   );
// }
}
