import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/exception/exceptions.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkService {
  final snackbar = locator<SnackbarService>();
  final _log = getLogger("NetworkService");
  Future<Either<void, dynamic>> fmt(Function function) async {
    try {
      return Right(await function.call());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      _log.v(errorMessage);
      snackbar.showSnackbar(message: errorMessage);
      return const Left(null);
    }
  }
}