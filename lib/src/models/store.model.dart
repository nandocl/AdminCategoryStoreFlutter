class StoreItem {
  StoreItem({
    this.storeId,
    this.code,
    this.storeName,
    this.storeAddress,
    this.phone,
    this.fax,
    this.storeKey,
    this.storeDescription,
    this.storeType,
    this.salesTransactionTypeId,
    this.purchaseTransactionTypeId,
    this.status,
    this.meta,
    this.lastModificationDate,
    this.creationDate,
  });

  int storeId;
  String code;
  String storeName;
  String storeAddress;
  String phone;
  String fax;
  String storeKey;
  String storeDescription;
  String storeType;
  int salesTransactionTypeId;
  int purchaseTransactionTypeId;
  String status;
  List<Meta> meta;
  dynamic lastModificationDate;
  DateTime creationDate;

  factory StoreItem.fromJson(Map<String, dynamic> json) => StoreItem(
        storeId: json["store_id"] ?? '',
        code: json["code"] ?? '',
        storeName: json["store_name"] ?? '',
        storeAddress: json["store_address"] ?? '',
        phone: json["phone"] ?? '',
        fax: json["fax"] ?? '',
        storeKey: json["store_key"] ?? '',
        storeDescription: json["store_description"] ?? '',
        storeType: json["store_type"] ?? '',
        salesTransactionTypeId: json["sales_transaction_type_id"] ?? '',
        purchaseTransactionTypeId: json["purchase_transaction_type_id"] ?? '',
        status: json["status"] ?? '',
        meta: List<Meta>.from(json["meta"].map((x) => Meta.fromJson(x))) ?? '',
        lastModificationDate: json["last_modification_date"] ?? '',
        creationDate: DateTime.parse(json["creation_date"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "code": code,
        "store_name": storeName,
        "store_address": storeAddress,
        "phone": phone,
        "fax": fax,
        "store_key": storeKey,
        "store_description": storeDescription,
        "store_type": storeType,
        "sales_transaction_type_id": salesTransactionTypeId,
        "purchase_transaction_type_id": purchaseTransactionTypeId,
        "status": status,
        "meta": List<dynamic>.from(meta.map((x) => x.toJson())),
        "last_modification_date": lastModificationDate,
        "creation_date": creationDate.toIso8601String(),
      };
}

class Meta {
  Meta({
    this.metaId,
    this.metaKey,
    this.metaValue,
    this.storeId,
    this.creationDate,
  });

  String metaId;
  String metaKey;
  String metaValue;
  String storeId;
  DateTime creationDate;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        metaId: json["meta_id"] ?? '',
        metaKey: json["meta_key"] ?? '',
        metaValue: json["meta_value"] ?? '',
        storeId: json["store_id"] ?? '',
        creationDate: DateTime.parse(json["creation_date"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "meta_id": metaId,
        "meta_key": metaKey,
        "meta_value": metaValue,
        "store_id": storeId,
        "creation_date": creationDate.toIso8601String(),
      };
}
