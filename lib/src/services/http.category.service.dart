import 'dart:convert' as convert;
import '../models/category.model.dart';

import 'http.base.service.dart';

class CategoryService {
  static Future<List<Categoria>> getCategorias() async {
    List<Categoria> castList = [];
    String endPoint = '/api/api1...';
    var stringRes = await HttpMainService.get(endPoint);
    print(stringRes);
    if (stringRes == null) return Future.error('error');
    List jsonRes = convert.jsonDecode(stringRes)['data'];
    castList = jsonRes.map((item) => Categoria.fromJson(item)).toList();
    print(castList);
    return castList;
  }
}
