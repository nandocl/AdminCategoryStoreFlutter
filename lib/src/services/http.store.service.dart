import 'dart:convert' as convert;

import 'http.base.service.dart';
import '../models/store.model.dart';

class StoreService {
  static Future<List<StoreItem>> getAllStores() async {
    List<StoreItem> storeList = [];
    String endPoint = '/api/api1...';
    var stores = await HttpMainService.get(endPoint);
    if (stores == null) return Future.error('error');
    List data = convert.jsonDecode(stores)['data'];
    storeList = data.map((item) => StoreItem.fromJson(item)).toList();
    return storeList;
  }

  static Future<StoreItem> getOneStore(String storeId) async {
    StoreItem storeItem = new StoreItem();
    String endPoint = '/api/api1...' + storeId;
    var stringRes = await HttpMainService.get(endPoint);
    if (stringRes == null) return Future.error('error');
    var jsonRes = convert.jsonDecode(stringRes);
    storeItem = StoreItem.fromJson(jsonRes['data']);
    return storeItem;
  }

  static Future<StoreItem> createStore(StoreItem storeItem) async {
    StoreItem storeItem = new StoreItem();
    String endPoint = '/api/api1...';
    var stringRes = await HttpMainService.post(endPoint, storeItem.toJson());
    if (stringRes == null) return Future.error('error');
    var jsonRes = convert.jsonDecode(stringRes);
    storeItem = StoreItem.fromJson(jsonRes['data']);
    return storeItem;
  }

  static Future<StoreItem> updateStore(StoreItem storeItem) async {
    StoreItem storeItem = new StoreItem();
    String endPoint = '/api/api1...';
    var stringRes = await HttpMainService.post(endPoint, storeItem.toJson());
    if (stringRes == null) return Future.error('error');
    var jsonRes = convert.jsonDecode(stringRes);
    storeItem = StoreItem.fromJson(jsonRes['data']);
    return storeItem;
  }

  static Future<bool> deleteStore(String storeId) async {
    String endPoint = '/api/api1...' + storeId;
    var stringRes = await HttpMainService.delete(endPoint);
    if (stringRes == null) return Future.error('error');
    return true;
  }
}
