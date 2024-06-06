import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:take_home/export.dart';

class NetworkHelperImpl extends NetworkHelper {
  NetworkHelperImpl({required this.storageRepo});

  final StorageRepo storageRepo;

  @override
  Future<Either<String, Failure>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: appendHeader(headers: headers, url: url),
      );
      return handleResponse(response: response);
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> post(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: encodeBody ? json.encode(body) : body,
        headers:
            modifyHeader ? appendHeader(headers: headers, url: url) : headers!,
        encoding: encoding,
      );

      return handleResponse(response: response, requestBody: json.encode(body));
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> multipart(
    String url, {
    Map<String, String>? headers,
    body,
    files,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      body.forEach((key, value) => request.fields[key] = value);

      headers!.forEach((key, value) => request.headers[key] = value);

      files.forEach(
        (name, filePath) async => request.files.add(
          await http.MultipartFile.fromPath(
            name,
            filePath,
          ),
        ),
      );

      http.StreamedResponse response = await request.send();

      String responseText = await response.stream.bytesToString();

      final int statusCode = response.statusCode;

      if (statusCode >= 400) {
        return Right(
          Failure(
            status: false,
            message: 'Something went wrong',
          ),
        );
      } else {
        return Left(responseText);
      }
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http
        .delete(Uri.parse(url),
            headers: appendHeader(headers: headers, url: url))
        .then((http.Response response) {
      return handleResponse(response: response);
    });
  }

  @override
  Future<Either<String, Failure>> put(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    return http
        .put(Uri.parse(url),
            body: json.encode(body),
            headers: appendHeader(headers: headers, url: url),
            encoding: encoding)
        .then(
      (http.Response response) {
        return handleResponse(response: response);
      },
    );
  }

  @override
  Either<String, Failure> handleResponse({
    http.Response? response,
    String? requestBody,
  }) {
    final int statusCode = response!.statusCode;

    if (statusCode >= 400) {
      final errorJson = jsonDecode(response.body);
      return Right(
        Failure(
          status: false,
          message: errorJson['statusMsg'],
        ),
      );
    } else {
      return Left(response.body.toString());
    }
  }

  @override
  Map<String, String> appendHeader({
    Map<String, String>? headers,
    bool refresh = false,
    String? url,
  }) {
    try {
      headers ??= <String, String>{};
      headers['Content-Type'] = 'application/json';
      headers['Authorization'] = "Bearer 81bdf26d342a23f2290fd2e2e9b513ecf2facde9";
    } catch (e) {
      debugPrint(e.toString());
    }

    return headers!;
  }

  @override
  Future<Either<String, Failure>> patch(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        body: encodeBody ? json.encode(body) : body,
        headers:
            modifyHeader ? appendHeader(headers: headers, url: url) : headers!,
        encoding: encoding,
      );

      return handleResponse(
        response: response,
        requestBody: json.encode(
          body,
        ),
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }
}
