import '../model/itemModel.dart';
import 'package:dio/dio.dart';

class GetDataFromModel {
  Future<Sample> getAllItems() async {
    const String url = 'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';
    var response = await Dio().get(url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
    if (response.statusCode == 200) {
      List<dynamic> dynamicResponseList = response.data.toList();
      List<Sample> sampleList =
          dynamicResponseList.map((e) => Sample.fromJson(e)).toList();
      return sampleList.first;
    } else {
      return Sample();
    }
  }
}
