import 'package:api_session/data/helpers/end_points.dart';
import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://api.spoonacular.com/recipes/';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getAllRecipes() async {
    Response response = await _dio.get(
      '$_baseUrl${EndPoints.recipes}',
      queryParameters: {
        'apiKey': '16f916df31eb46529a4012b3a03cd1be',
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getRecipeDetails(int id) async {
    Response response = await _dio.get(
      '$_baseUrl$id/${EndPoints.information}',
      queryParameters: {
        'apiKey': '16f916df31eb46529a4012b3a03cd1be',
      },
    );
    return response.data;
  }
}
