import 'package:expackpro/apipage/config_service.dart';
import 'package:get/get_common/get_reset.dart';

import 'api_model.dart';

class ApiService extends ConfigServiceApi {
  Future authApi() async {
    return await getApi(filename: "/posts");
  }

  Future authlistapi({required ApiModel model}) async {
    return postApi(filename: "", mapModel: {});
  }
}
