import 'dart:convert';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:http/http.dart' as http;

class Request {
  final String url;
  final dynamic body;

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Map<String, String> headersSecured = {
    "Accept": "application/json",
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  Request({this.url, this.body});

  Future<http.Response> postSecured() {
    print(url);
    print(body);
    print(headersSecured);
    return http
        .post(Uri.parse(url),
            headers: headersSecured,
            body: body,
            encoding: Encoding.getByName("utf-8"))
        .timeout(Duration(minutes: 5));
  }

  Future<http.Response> postMultiPart() {
    Map<String, String> headersMultiPart = {
      'Content-Type': 'multipart/form-data',
      // 'Accept': 'application/html',
    };
    print(url);
    print(body);
    print(headersMultiPart);
    return http
        .post(Uri.parse(url),
            headers: headersMultiPart,
            body: body,
            encoding: Encoding.getByName("utf-8"))
        .timeout(Duration(minutes: 5));
  }

  Future<http.Response> post() {
    print(url);
    print(body);
    print(headers);
    return http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(Duration(minutes: 5));
  }

  Future<http.Response> postWithBearer(token) {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    print(url);
    print(body);
    print(headersWithBearer);
    return http
        .post(Uri.parse(url), headers: headersWithBearer, body: body)
        .timeout(Duration(minutes: 5));
  }

  Future<http.StreamedResponse> postAPIwithoutBearer(url, body) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
    };

    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());

    if (body != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);
      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    } else {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    }
  }

  Future<http.StreamedResponse> postAPIwithoutBearer2(url, body) async {
    // Map<String, String> headersWithBearer = {
    //   'Content-Type': 'application/json',
    // };

    printData("url", url);
    printData("Body", body.toString());
    // printData("Header", headersWithBearer.toString());

    if (body != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);
      // request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    } else {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    }
  }


  Future<http.StreamedResponse> postAPI(url, body, token) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());

    if (body != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);
      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    } else {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    }
  }


  Future<http.StreamedResponse> postAPIWithMedia(
      url, body, token, strImg) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());
    printData("strImg", strImg);

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(body);
    request.files.add(await http.MultipartFile.fromPath('image', strImg));

    request.headers.addAll(headersWithBearer);
    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.Response> put() {
    print(url);
    print(body);
    print(headers);
    return http
        .put(Uri.parse(url), headers: headers, body: body)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    print(url);
    print(body);
    print(headers);
    return http
        .get(Uri.parse(url), headers: headers)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> getWithBearer(token) {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
      // 'Accept': 'application/html',
      // 'Access-Token': SharePreData.token,
    };
    print(url);
    print(body);
    print(headersWithBearer);
    print("USER UNIQUE get token :::::::::::::::::: " + token);
    return http
        .get(Uri.parse(url), headers: headersWithBearer)
        .timeout(Duration(minutes: 2));
  }

  Future<http.StreamedResponse> postAPIWithMediaWithoutBearer(
      url, body, token, strImg) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());
    printData("strImg", strImg);

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(body);
    request.files.add(await http.MultipartFile.fromPath('image', strImg));

    request.headers.addAll(headersWithBearer);
    http.StreamedResponse response = await request.send();

    return response;
  }



  Future<http.Response> postWithoutBearer(url, token) {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    print(url);
    print(body);
    print(headersWithBearer);
    return http
        .post(Uri.parse(url), headers: headersWithBearer, body: body)
        .timeout(Duration(minutes: 5));
  }
}
