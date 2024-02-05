import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leute/data/models/refrige_model.dart';
import 'package:leute/data/models/user_model.dart';
import 'package:leute/data/repository/refrige_repository.dart';
import 'package:leute/data/repository/user_data_repository.dart';
import 'package:leute/view/page/main_my_fridge/main_screen_state.dart';
import 'package:leute/view/widget/main_my_fridge_widget/make_fridge_widget.dart';

class MainScreenViewModel extends ChangeNotifier {
  List<Widget> fridges = [];
  List<RefrigeDetail> refrigeItems = [];

  final UserDataRepository userDataRepository = UserDataRepository();

  MainScreenState _state = MainScreenState();

  MainScreenState get state => _state;

  // set state(MainScreenState newState) {
  //   _state = newState;
  //   notifyListeners();
  // }

  @override
  void dispose() {
    _state = state.copyWith(disposed: true);
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!state.disposed) {
      super.notifyListeners();
    }
  }

  MainScreenViewModel() {
    fetchFridgeData();
  }

  Future<void> fetchFridgeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      //비동기로 변경
      List<UserModel> userData = await userDataRepository.getFirebaseUserData();
     _state = state.copyWith(currentUser: userData.firstWhere(
          (user) => user.email == FirebaseAuth.instance.currentUser!.email));

      if (state.currentUser == null) {
        _state = state.copyWith(isLoading: true);
        notifyListeners();
      }
      final allRefrigeItems =
          await RegisterdRefrigeRepository().getFirebaseRefrigesData();
      refrigeItems = allRefrigeItems
          .where((e) => e.validationCode == state.currentUser!.validationCode)
          .toList();

      for (int i = 1; i <= refrigeItems.length; i++) {
        fridges.add(MakeFridge(
            refrigeItems: refrigeItems,
            currentUser: state.currentUser!,
            index: i - 1));
      }
      notifyListeners();
    } catch (error) {
      // 에러 처리
      print('Error fetching data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
