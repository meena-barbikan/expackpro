import 'package:expackpro/apiview/config_service.dart';

import 'user_model.dart';

class LoginService extends HttpConfig {
  Future loginApi({required UserModel model, String? token}) async {
    return await postApi(filename: "/api/login", mapModel: model.toLoginMap());
  }
}
