import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:passport/data/repository/api_repository_impl.dart';
import 'package:passport/domain/model/passport_info.dart';
import 'package:passport/utils/constants/strings.dart';
import 'package:passport/domain/model/data_state.dart';

import 'api_repository_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('getPassportInfo', () {
    test('returns an PassportInfo if the http call completes successfully', () async {
      final dio = MockDio();
      final ari = ApiRepositoryImpl(dio);

      final file = File('test_resources/passport_info_test_json.json');

      when(dio.get(getPassportInfoUrl)).thenAnswer(
          (_) async => Response(data: jsonDecode(await file.readAsString()), statusCode: 200, requestOptions: RequestOptions(path: getPassportInfoUrl)));

      DataState<PassportInfo> pi = await ari.getPassportInfo();
      expect(pi, isA<DataSuccess<PassportInfo>>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final dio = MockDio();
      final ari = ApiRepositoryImpl(dio);

      when(dio.get(getPassportInfoUrl)).thenThrow(DioException(
          response: Response<String>(statusCode: 500, requestOptions: RequestOptions(path: getPassportInfoUrl)),
          requestOptions: RequestOptions(path: getPassportInfoUrl)));

      final pi = await ari.getPassportInfo();
      expect(pi, isA<DataFailed<PassportInfo>>());
    });
    test('throws an exception if the http call completes with an unknown error', () async {
      final dio = MockDio();
      final ari = ApiRepositoryImpl(dio);
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(dio.get(getPassportInfoUrl)).thenThrow(Exception("unknown"));

      final pi = await ari.getPassportInfo();
      expect(pi, isA<DataNotSet<PassportInfo>>());
    });
  });
}
