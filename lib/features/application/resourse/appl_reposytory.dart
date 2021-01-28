import 'package:cto_task/features/resource/provider.dart';

class ApplReposytory {
  ApiProvider _apiProvider = ApiProvider();
  int page = 1;
  int pageSize = 30;
  int kind = 1;
  int cityId = 1;

  Future<dynamic> fetchApplItems() async {
    Map result = await _apiProvider.getApplItems(
        page: page, pageSize: pageSize, kind: kind, cityId: cityId);
    print(result);
    return null;
  }
}
