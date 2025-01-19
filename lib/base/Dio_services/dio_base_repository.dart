import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

import '../../Helper/constants.dart';
import '../../Helper/shared_preference_fun.dart';
import '../Api_end_point/api_endpoints.dart';
import 'dio_failure.dart';

class BaseRepository {
  var options = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
    headers: {
      "Accept": "application/json",
    },
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );

  CacheOptions cacheOptions = CacheOptions(
    store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
    hitCacheOnErrorExcept: [], // for offline behaviour
  );
  Dio? dio;
  BaseRepository() {
    dio = Dio(options);
    dio!.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        log("REQUEST | URL: ${options.path}\nDATA: ${options.data.toString()}");
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        log("RESPONSE | CODE: ${response.statusCode} | MESSAGE: ${response.statusMessage} \n DATA: ${response.data}");
      }
      return handler.next(response);
    }, onError: (DioException e, handler) {
      log("ERROR: ${e.message}");

      return handler.next(e);
    }));
  }
   Future<Response> postDataToServerTest(
      String url,
      {FormData? baseFormData,
        Map<String, dynamic>? jsonData,
        bool needsAuthorization = false,
        bool defaultsnackbar = true,
        bool changeBaseUrl = false,
        String? changedBaseUrl,
        bool iSJsonDataHeaderType = false}) async {
    if (needsAuthorization) {
      String token = await SharedPreferencesHelper.getString(
          key: SharedPreferenceKey.token);
      if (token.isNotEmpty) {
        dio!.options.headers["Authorization"] = "Token $token";
      }
    }

    // Set content type based on the data type
    dio!.options.headers['Content-Type'] =
    iSJsonDataHeaderType ? 'application/json' : 'multipart/form-data';

    if (changeBaseUrl) {
      dio!.options.baseUrl = changedBaseUrl!;
    } else {
      if (dio!.options.baseUrl != ApiEndpoint.baseUrl) {
        dio!.options.baseUrl = ApiEndpoint.baseUrl;
      }
    }

    Response? result;
    try {
      result = await dio!.post(
        url,
        data: iSJsonDataHeaderType ? jsonData : baseFormData,
      );
      debugPrint('Response Data: ${result.data}');
    } on DioException catch (e) {
      debugPrint('postDataToServer error message: ${e.message}');
      debugPrint('postDataToServer error response: ${e.response}');
      result = handleDioError(e, defaultsnackbar);
    } on SocketException catch (e) {
      return checkSocketException(e, defaultsnackbar)!;
    }

    return result!;
  }

  Future<Response> postDataToServer(String url, FormData baseFormData,
      {bool needsAuthorization = false,
        jsonData,
        bool defaultsnackbar = true,
        bool changeBaseUrl = false,
        String? changedBaseUrl,
        iSJsonDataHeaderType = false}) async {
    if (needsAuthorization) {
      String token = await SharedPreferencesHelper.getString(
          key: SharedPreferenceKey.token);
      if (token.isNotEmpty) {
        dio!.options.headers["Authorization"] = "Token $token";
      }
    }
    if (iSJsonDataHeaderType) {
      dio!.options.headers['content-Type'] = 'application/json';
    }
    if (changeBaseUrl) {
      dio!.options.baseUrl = changedBaseUrl!;
    } else {
      if (dio!.options.baseUrl != ApiEndpoint.baseUrl) {
        dio!.options.baseUrl = ApiEndpoint.baseUrl;
      }
    }
    debugPrint('--------------Server---------');
    debugPrint(ApiEndpoint.baseUrl+url);
    debugPrint(baseFormData.fields.toString());
    Response? result;
    try {
      result = await dio!.post(
        url,
        data: iSJsonDataHeaderType ? jsonData : baseFormData,
      );
      debugPrint('----------result-----------');
      debugPrint(result.data);
    } on DioException catch (e) {
      debugPrint('\n postDataToServer error message : ${e.message}');
      debugPrint('\n postDataToServer error : ${e.error}');
      debugPrint('-------------gdf-----');
      debugPrint(jsonData.toString());
      debugPrint(baseFormData.fields.toString());

      debugPrint('\n postDataToServer error response : ${e.response}');
      result = handleDioError(e, defaultsnackbar);
    } on SocketException catch (e) {
      return checkSocketException(e, defaultsnackbar)!;
    }
    return result!;
  }

  Future<Response> getDataFromServer(String url,
      {bool needsAuthorization = false,
      bool defaultsnackbar = true,
      bool changeBaseUrl = false,
      String? changedBaseUrl,
      required Map<String, dynamic> params}) async {
    if (needsAuthorization) {
      String token = //415fdbfb7fd17c1f943919f72457e6b4a463bee8";
          await SharedPreferencesHelper.getString(key: SharedPreferenceKey.token);
      if (token.isNotEmpty) {
        dio!.options.headers["Authorization"] = "Token $token";
      }
    }
    if (changeBaseUrl) {
      dio!.options.baseUrl = changedBaseUrl!;
    } else {
      if (dio!.options.baseUrl != ApiEndpoint.baseUrl) {
        dio!.options.baseUrl = ApiEndpoint.baseUrl;
      }
    }
    Response? result;
    try {
      var result = await dio!.get(url,
          options: Options(responseType: ResponseType.json),
          queryParameters: params,
          onReceiveProgress: (sent, total) {});
      print('--------base------------');
      print(result.data);
      return result;
    } on DioException catch (e) {
      result = handleDioError(e, defaultsnackbar);
    } on SocketException catch (e) {
      return checkSocketException(e, defaultsnackbar)!;
    }
    return result!;
  }

  Future<Response> patchDataToServer(
    String url, {
    bool needsAuthorization = false,
    bool defaultsnackbar = true,
    bool changeBaseUrl = false,
    String? changedBaseUrl,
    required FormData baseFormData,
  }) async {
    if (needsAuthorization) {
      String token = await SharedPreferencesHelper.getString(
          key: SharedPreferenceKey.token);
      if (token.isNotEmpty) {
        dio!.options.headers["Authorization"] = "Token $token";
      }
    }
    if (changeBaseUrl) {
      dio!.options.baseUrl = changedBaseUrl!;
    } else {
      if (dio!.options.baseUrl != ApiEndpoint.baseUrl) {
        dio!.options.baseUrl = ApiEndpoint.baseUrl;
      }
    }
    Response? result;
    try {
      var result = await dio!.patch(
        url,
        data: baseFormData,
      );
      return result;
    } on DioException catch (e) {
      result = handleDioError(e, defaultsnackbar);
    } on SocketException catch (e) {
      return checkSocketException(e, defaultsnackbar)!;
    }
    return result!;
  }

  Future<Response> deleteDataToServer(
    String url, {
    bool needsAuthorization = false,
    bool defaultsnackbar = true,
    bool changeBaseUrl = false,
    String? changedBaseUrl,
  }) async {
    if (needsAuthorization) {
      String token = await SharedPreferencesHelper.getString(
          key: SharedPreferenceKey.token);
      if (token.isNotEmpty) {
        dio!.options.headers["Authorization"] = "Token $token";
      }
    }
    if (changeBaseUrl) {
      dio!.options.baseUrl = changedBaseUrl!;
    } else {
      if (dio!.options.baseUrl != ApiEndpoint.baseUrl) {
        dio!.options.baseUrl = ApiEndpoint.baseUrl;
      }
    }
    Response? result;
    try {
      var result = await dio!.delete(
        url,
      );
      return result;
    } on DioException catch (e) {
      result = handleDioError(e, defaultsnackbar);
    } on SocketException catch (e) {
      return checkSocketException(e, defaultsnackbar)!;

      // result = handleDioError(DioError(requestOptions: RequestOptions(path: ''),
      //     response: Response(requestOptions: RequestOptions(path: ''), statusCode: HttpStatus.gatewayTimeout)), defaultsnackbar);
    }
    return result!;
  }

  Response? checkSocketException(e, defaultSnackbar) {
    String message = "Cannot connect to internet";

    // if (defaultSnackbar) {
    //   if (!g.Get.isSnackbarOpen) {
    //     g.Get.snackbar('Info', message,
    //         backgroundColor: NaxaAppColors.white,
    //         borderWidth: 1,
    //         borderColor: NaxaAppColors.boxBorderColor);
    //   }
    // }

    return handleDioError(
        DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: HttpStatus.gatewayTimeout)),
        defaultSnackbar);
  }

  handleDioError(DioException e, defaultsnackbar) {
    String message = '';

    if (e.response == null) {
      message =
          "Cannot connect to the internet! 😔 Please recheck your connection. 📶";
    } else {
      message = responseMessage(statusCode: e.response!.statusCode ?? 500);
    }

    if (defaultsnackbar) {
      if (!g.Get.isSnackbarOpen) {
        g.Get.snackbar('Info', message,
            backgroundColor: Colors.white,
            borderWidth: 1,
            borderColor: Colors.amberAccent);
      }
    }
    return e.response;
  }
}

Future<bool> hasInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network, make sure there is actually a net connection.
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a WIFI network, make sure there is actually a net connection.
    return true;
  } else {
    // Neither mobile data or WIFI detected, not internet connection found.
    return false;
  }
}
