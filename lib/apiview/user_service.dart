import 'package:expackpro/apiview/config_service.dart';

import 'user_model.dart';

class UserService extends HttpConfig {
  Future authApi({required UserModel model, String? token}) async {
    return await postApi(
        filename: "/api/register", mapModel: model.toResigster(), token: token);
  }
}

class UserListService extends HttpConfig {
  Future listApi() async {
    return await getApi(filename: "/api/users", mapModel: {});
  }
}

class DataService extends HttpConfig {
  Future listapi() async {
    return await getApi(filename: "/posts", mapModel: {});
  }

  Future createApi({
    required DateModel model,
  }) async {
    return await postApi(filename: "/posts", mapModel: model.tocreateMap());
  }

  Future updateApi({
    required DateModel model,
    required String id,
  }) async {
    return await putApi(filename: "/posts/$id", mapModel: model.toupdateMap());
  }

  Future delApi({
    required DateModel model,
    required String id,
  }) async {
    return await deleteApi(filename: "/posts/$id", mapModel: {});
  }
}

class CommonService extends HttpConfig {
  Future commonlist({required CommonModel model}) async {
    return await getApi(filename: "/posts/1/comments", mapModel: {});
  }
}

class UserListingPlaceService extends HttpConfig {
  Future userListPlace({required UserListPlaceModel model}) async {
    return await getApi(filename: "/users", mapModel: {});
  }
}
