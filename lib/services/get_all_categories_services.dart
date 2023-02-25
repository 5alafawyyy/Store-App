import '../helper/api.dart';
import '../helper/api_end_points.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: ApiEndPoints.allCategoriesBaseUrl);

    return data;
  }
}
