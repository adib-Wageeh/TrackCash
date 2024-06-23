import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/ui/screens/add_transaction/screen/add_transaction_screen.dart';
import 'package:track_cash/ui/screens/report/screen/report_screen.dart';
import 'package:track_cash/ui/screens/settings/domain/use_case/theme_use_case.dart';
import 'package:track_cash/ui/screens/settings/presentation/cubit/theme_changer/theme_cubit.dart';
import 'package:track_cash/ui/screens/settings/presentation/pages/settings_page.dart';
import 'core/assets/assets.dart';
import 'ui/screens/calender/screen/calendar_screen.dart';

void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  await init();
  EasyLoading.instance
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.deepPurpleAccent
    ..maskColor = Colors.deepPurpleAccent
    ..userInteractions = false;


  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
          create: (context) =>
              ThemeCubit(themeUseCase: getIt<ThemeUseCase>())..getTheme()),
    ],
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (state is setTheme) {
          return MaterialApp(
            home: const HomePage(),
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
          );
        }
        return Container();
      },
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          CalendarScreen(),
          AddTransactionScreen(),
          ReportScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
          height: 55,
          top: -20,
          initialActiveIndex: currentIndex,
          elevation: 5,
          backgroundColor: Assets.mainColor,
          items: const [
            TabItem(icon: Icons.calendar_month_rounded, title: 'Calender'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.query_stats_rounded, title: 'Report'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          onTap: onTabTapped),
    );
  }
}
