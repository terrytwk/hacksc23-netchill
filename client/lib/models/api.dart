import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:requests/requests.dart';

class ApiCredentials {
  const ApiCredentials();
}

class ApiNotifier extends StateNotifier<ApiCredentials> {
  ApiNotifier(this.ref) : super(const ApiCredentials());

  final StateNotifierProviderRef ref;

  // [serverAddress] is the correct api address to use
  String get _serverAddress {
    if (kReleaseMode) {
      return 'https://api.joinwrld.com/v1';
    }

    return 'https://api.joinwrld.com/v1';
  }

  /////////////////////////////////////////////
  // Methods to send http requests to the API
  /////////////////////////////////////////////

  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    return await requestMethod(
      HttpMethod.GET,
      path,
      headers: headers,
    );
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return await requestMethod(
      HttpMethod.POST,
      path,
      body: body,
      headers: headers,
    );
  }

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return await requestMethod(
      HttpMethod.PUT,
      path,
      body: body,
      headers: headers,
    );
  }

  Future<dynamic> delete(
    String path, {
    Map<String, String>? headers,
  }) async {
    return await requestMethod(
      HttpMethod.DELETE,
      path,
      headers: headers,
    );
  }

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return await requestMethod(
      HttpMethod.PATCH,
      path,
      body: body,
      headers: headers,
    );
  }

  // Send the given request with the specified method
  Future<dynamic> requestMethod(HttpMethod method, String path,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    String url = '$_serverAddress$path';
    Response r;

    body = body ?? {};
    headers = {
      ...?headers,
    };

    switch (method) {
      case HttpMethod.GET:
        headers[HttpHeaders.contentTypeHeader] = 'application/json';

        r = await http.get(
          Uri.parse(url),
          headers: headers,
        );
        break;
      case HttpMethod.POST:
        headers[HttpHeaders.contentTypeHeader] = 'application/json';

        r = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );

        break;
      case HttpMethod.PUT:
        headers[HttpHeaders.contentTypeHeader] = 'application/json';

        r = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );

        break;
      case HttpMethod.DELETE:
        r = await http.delete(Uri.parse(url), headers: headers);
        break;
      case HttpMethod.PATCH:
        headers[HttpHeaders.contentTypeHeader] = 'application/json';

        r = await http.patch(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      default:
        return {};
    }

    // Throw error if there was one
    if (r.hasError) {
      throw r;
    }

    // Get json object to return
    String response = r.content();
    dynamic json;
    if (response.isNotEmpty) {
      json = jsonDecode(response);
    } else {
      json = null;
    }

    // Write sessionCookie to secure storage if it was set on this request
    // final cookieJar = Requests.extractResponseCookies(r.headers);
    // if (cookieJar.isNotEmpty) {
    //   if (cookieJar['session'] != null) {
    //     String sessionCookieString = cookieJar['session'].toString();
    //     sessionCookieString =
    //         sessionCookieString.substring(sessionCookieString.indexOf(':') + 1);
    //     const storage = FlutterSecureStorage();
    //     await storage.write(key: 'sessionCookie', value: sessionCookieString);
    //   }
    // }

    return json;
  }
}
