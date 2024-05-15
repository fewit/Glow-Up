import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _GlowUpWalletList = (await secureStorage
                  .getStringList('ff_GlowUpWalletList'))
              ?.map((x) {
                try {
                  return GlowUpWalletStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _GlowUpWalletList;
    });
    await _safeInitAsync(() async {
      _GlowUpRecommendList =
          (await secureStorage.getStringList('ff_GlowUpRecommendList'))
                  ?.map((x) {
                    try {
                      return GlowUpRecommendStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _GlowUpRecommendList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _GlowUpNavPage = '';
  String get GlowUpNavPage => _GlowUpNavPage;
  set GlowUpNavPage(String value) {
    _GlowUpNavPage = value;
  }

  List<GlowUpWalletStruct> _GlowUpWalletList = [
    GlowUpWalletStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_WalletCont\":\"1300\",\"Glow_Up_WalletMoney\":\"0.99\",\"Glow_Up_WalletKey\":\"\"}')),
    GlowUpWalletStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_WalletCont\":\"1300\",\"Glow_Up_WalletMoney\":\"0.99\",\"Glow_Up_WalletKey\":\"Hello World\"}'))
  ];
  List<GlowUpWalletStruct> get GlowUpWalletList => _GlowUpWalletList;
  set GlowUpWalletList(List<GlowUpWalletStruct> value) {
    _GlowUpWalletList = value;
    secureStorage.setStringList(
        'ff_GlowUpWalletList', value.map((x) => x.serialize()).toList());
  }

  void deleteGlowUpWalletList() {
    secureStorage.delete(key: 'ff_GlowUpWalletList');
  }

  void addToGlowUpWalletList(GlowUpWalletStruct value) {
    _GlowUpWalletList.add(value);
    secureStorage.setStringList('ff_GlowUpWalletList',
        _GlowUpWalletList.map((x) => x.serialize()).toList());
  }

  void removeFromGlowUpWalletList(GlowUpWalletStruct value) {
    _GlowUpWalletList.remove(value);
    secureStorage.setStringList('ff_GlowUpWalletList',
        _GlowUpWalletList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGlowUpWalletList(int index) {
    _GlowUpWalletList.removeAt(index);
    secureStorage.setStringList('ff_GlowUpWalletList',
        _GlowUpWalletList.map((x) => x.serialize()).toList());
  }

  void updateGlowUpWalletListAtIndex(
    int index,
    GlowUpWalletStruct Function(GlowUpWalletStruct) updateFn,
  ) {
    _GlowUpWalletList[index] = updateFn(_GlowUpWalletList[index]);
    secureStorage.setStringList('ff_GlowUpWalletList',
        _GlowUpWalletList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGlowUpWalletList(int index, GlowUpWalletStruct value) {
    _GlowUpWalletList.insert(index, value);
    secureStorage.setStringList('ff_GlowUpWalletList',
        _GlowUpWalletList.map((x) => x.serialize()).toList());
  }

  List<GlowUpRecommendStruct> _GlowUpRecommendList = [
    GlowUpRecommendStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_RecommendName\":\"Liquid foundation\",\"Glow_Up_RecommendScore\":\"4\",\"Glow_Up_RecommendContent\":\"Foundation is a common makeup product that is used to even out skin tone, cover facial blemishes, and smooth skin. It creates a flawless, smooth base that provides natural or full coverage.\",\"Glow_Up_RecommentImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Recommend1.png?alt=media&token=6eebc928-14cb-4fa1-8239-2125f8c6da29\"}')),
    GlowUpRecommendStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_RecommendName\":\"Air cushion\",\"Glow_Up_RecommendScore\":\"4\",\"Glow_Up_RecommendContent\":\"Air cushion is a new type of makeup product that became popular in Korea. Its official name is air cushion foundation, and it is a type of foundation product.\",\"Glow_Up_RecommentImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Recommend2.png?alt=media&token=987d17d1-05c0-4e98-b013-69eaba696b25\"}')),
    GlowUpRecommendStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_RecommendName\":\"Lpstick\",\"Glow_Up_RecommendScore\":\"4\",\"Glow_Up_RecommendContent\":\"Lipstick is one of the indispensable products in makeup. Its main function is to add color and gloss to the lips, thereby enhancing the overall attractiveness of the face.\",\"Glow_Up_RecommentImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Recommend3.png?alt=media&token=94a56a11-7666-474a-b86c-1234570f37a9\"}'))
  ];
  List<GlowUpRecommendStruct> get GlowUpRecommendList => _GlowUpRecommendList;
  set GlowUpRecommendList(List<GlowUpRecommendStruct> value) {
    _GlowUpRecommendList = value;
    secureStorage.setStringList(
        'ff_GlowUpRecommendList', value.map((x) => x.serialize()).toList());
  }

  void deleteGlowUpRecommendList() {
    secureStorage.delete(key: 'ff_GlowUpRecommendList');
  }

  void addToGlowUpRecommendList(GlowUpRecommendStruct value) {
    _GlowUpRecommendList.add(value);
    secureStorage.setStringList('ff_GlowUpRecommendList',
        _GlowUpRecommendList.map((x) => x.serialize()).toList());
  }

  void removeFromGlowUpRecommendList(GlowUpRecommendStruct value) {
    _GlowUpRecommendList.remove(value);
    secureStorage.setStringList('ff_GlowUpRecommendList',
        _GlowUpRecommendList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGlowUpRecommendList(int index) {
    _GlowUpRecommendList.removeAt(index);
    secureStorage.setStringList('ff_GlowUpRecommendList',
        _GlowUpRecommendList.map((x) => x.serialize()).toList());
  }

  void updateGlowUpRecommendListAtIndex(
    int index,
    GlowUpRecommendStruct Function(GlowUpRecommendStruct) updateFn,
  ) {
    _GlowUpRecommendList[index] = updateFn(_GlowUpRecommendList[index]);
    secureStorage.setStringList('ff_GlowUpRecommendList',
        _GlowUpRecommendList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGlowUpRecommendList(
      int index, GlowUpRecommendStruct value) {
    _GlowUpRecommendList.insert(index, value);
    secureStorage.setStringList('ff_GlowUpRecommendList',
        _GlowUpRecommendList.map((x) => x.serialize()).toList());
  }

  List<GlowUpGiftTypeStruct> _GlowUpGiftList = [
    GlowUpGiftTypeStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_GiftPrice\":\"0\",\"Glow_Up_GiftAddHot\":\"50\",\"Glow_Up_GiftNum\":\"0\",\"Glow_Up_GiftImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Gifts%2FGlow_Up_GiftFree.png?alt=media&token=26a06b17-99d7-4063-99e4-6a9ccc9eef6c\"}')),
    GlowUpGiftTypeStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_GiftPrice\":\"600\",\"Glow_Up_GiftAddHot\":\"200\",\"Glow_Up_GiftNum\":\"0\",\"Glow_Up_GiftImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Gifts%2FGlow_Up_Gift600.png?alt=media&token=60400f16-473f-4f05-a8d7-5d0bd3f52e5e\"}')),
    GlowUpGiftTypeStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_GiftPrice\":\"700\",\"Glow_Up_GiftAddHot\":\"300\",\"Glow_Up_GiftNum\":\"0\",\"Glow_Up_GiftImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Gifts%2FGlow_Up_Gift700.png?alt=media&token=c7bda931-30d0-497c-885d-15bd7e4a107f\"}')),
    GlowUpGiftTypeStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_GiftPrice\":\"800\",\"Glow_Up_GiftAddHot\":\"400\",\"Glow_Up_GiftNum\":\"0\",\"Glow_Up_GiftImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Gifts%2FGlow_Up_Gift800.png?alt=media&token=7d7f802b-b953-47ca-aa90-c4f4c458ca87\"}')),
    GlowUpGiftTypeStruct.fromSerializableMap(jsonDecode(
        '{\"Glow_Up_GiftPrice\":\"900\",\"Glow_Up_GiftAddHot\":\"500\",\"Glow_Up_GiftNum\":\"0\",\"Glow_Up_GiftImage\":\"https://firebasestorage.googleapis.com/v0/b/travel-example-starter-gg8vp8.appspot.com/o/SystemSetting%2FGlow_Up_Gifts%2FGlow_Up_Gift900.png?alt=media&token=e2c35715-55a7-4baf-bfb5-cac15d2128cd\"}'))
  ];
  List<GlowUpGiftTypeStruct> get GlowUpGiftList => _GlowUpGiftList;
  set GlowUpGiftList(List<GlowUpGiftTypeStruct> value) {
    _GlowUpGiftList = value;
  }

  void addToGlowUpGiftList(GlowUpGiftTypeStruct value) {
    _GlowUpGiftList.add(value);
  }

  void removeFromGlowUpGiftList(GlowUpGiftTypeStruct value) {
    _GlowUpGiftList.remove(value);
  }

  void removeAtIndexFromGlowUpGiftList(int index) {
    _GlowUpGiftList.removeAt(index);
  }

  void updateGlowUpGiftListAtIndex(
    int index,
    GlowUpGiftTypeStruct Function(GlowUpGiftTypeStruct) updateFn,
  ) {
    _GlowUpGiftList[index] = updateFn(_GlowUpGiftList[index]);
  }

  void insertAtIndexInGlowUpGiftList(int index, GlowUpGiftTypeStruct value) {
    _GlowUpGiftList.insert(index, value);
  }

  int _GlowUpSendSuccess = 0;
  int get GlowUpSendSuccess => _GlowUpSendSuccess;
  set GlowUpSendSuccess(int value) {
    _GlowUpSendSuccess = value;
  }

  bool _GlowUpPauseVideo = false;
  bool get GlowUpPauseVideo => _GlowUpPauseVideo;
  set GlowUpPauseVideo(bool value) {
    _GlowUpPauseVideo = value;
  }

  List<DocumentReference> _GlowUpChatUserList = [
    FirebaseFirestore.instance.doc('/Glow_Up_User/example')
  ];
  List<DocumentReference> get GlowUpChatUserList => _GlowUpChatUserList;
  set GlowUpChatUserList(List<DocumentReference> value) {
    _GlowUpChatUserList = value;
  }

  void addToGlowUpChatUserList(DocumentReference value) {
    _GlowUpChatUserList.add(value);
  }

  void removeFromGlowUpChatUserList(DocumentReference value) {
    _GlowUpChatUserList.remove(value);
  }

  void removeAtIndexFromGlowUpChatUserList(int index) {
    _GlowUpChatUserList.removeAt(index);
  }

  void updateGlowUpChatUserListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _GlowUpChatUserList[index] = updateFn(_GlowUpChatUserList[index]);
  }

  void insertAtIndexInGlowUpChatUserList(int index, DocumentReference value) {
    _GlowUpChatUserList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
