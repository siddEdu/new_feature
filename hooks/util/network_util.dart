import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkService {
  NetworkService({required Dio client}) : _dioClient = client;

  final Dio _dioClient;

  // Map<String, dynamic> _headers({
  //   required String token,
  //   required String username,
  //   required String tenant,
  // }) =>
  //     {
  //       "Accept": "application/json",
  //       "EPS-token": token,
  //       "EPS-uid": username,
  //       "router-path": "/inst_mobile-app",
  //       "EPS-tenant": tenant,
  //     };

  Future<Map<String, dynamic>> postRequest({
    required String url,
    Object? data,
    bool isLoginRequest = false,
    bool shouldLog = false,
  }) async {
    final uri = Uri.parse(url);
    if (shouldLog) {
      log(uri.toString());
    }
    // final Map<String, dynamic> h eaders;
    // if (isLoginRequest) {
    //   headers = _headers(null);
    // } else {
    //   final currentUser = await locator<AuthenticationBloc>().user;
    //   headers = _headers(currentUser);
    // }
    if (shouldLog) {
      if (data is FormData) {
        log(data.fields.toString());
        log(data.files.toString());
      } else {
        log(data.toString());
      }
    }
    final res = await _dioClient.postUri(
      uri,
      data: data,
      // options: Options(
      //   headers: headers,
      // ),
    );

    if (shouldLog) {
      log(res.toString());
    }

    final Map<String, dynamic> body = res.data as Map<String, dynamic>;

    if (res.statusCode == 200 && body['msg'].toString() == "200") {
      if (body['token_status'] == "token-refreshed") {
        // locator<AuthenticationBloc>().refreshedToken(body['token']);
      }
      return body;
    }

    if (res.statusCode == 200 && body['msg'] == "401") {
      // await locator<AuthenticationBloc>().logout();
      // Util.showSnackBar(
      //   'Authentication failed',
      //   messageType: MessageType.failure,
      // );
      // return;
    }
    if (shouldLog) {
      log('error occurred while network call', error: Exception(body['msg']));
    }
    throw Exception(body['msg']);
  }
}
