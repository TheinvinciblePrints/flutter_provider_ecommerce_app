import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/viewmodels/onboarding_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/views/account/account_view.dart';
import 'package:ecommerceapp/ui/views/cart_view.dart';
import 'package:ecommerceapp/ui/views/category_view.dart';
import 'package:ecommerceapp/ui/views/home/home_view.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<OnBoardingViewModel>(
      model: OnBoardingViewModel(
        storageService: context.watch<LocalStorageService>(),
      ),
      onModelReady: (model) => model.getAppState(),
      builder: (_context, model, child) => LandingBody(),
    );
  }
}

class LandingBody extends StatelessWidget {
  final currentTab = [
    HomeView(),
    CategoryView(),
    CartView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BottomNavigationBarProvider>();
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: tabIconsColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          provider.currentIndex = index;
        },
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Assets.iconCategory),
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Assets.iconProfile),
            ),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
