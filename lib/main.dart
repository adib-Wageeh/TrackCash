import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_cash/core/constants.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/core/res/colors.dart';
import 'package:track_cash/ui/screens/add_transaction/screen/add_transaction_screen.dart';
import 'package:track_cash/ui/screens/report/screen/report_screen.dart';
import 'package:track_cash/ui/screens/settings/presentation/pages/settings_page.dart';
import 'package:track_cash/ui/screens/settings/presentation/provider/locale_provider.dart';
import 'ui/screens/calender/screen/calendar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  await Future.delayed(Duration(seconds: 1));

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale(TranslationsConstants.localeEN),
      Locale(TranslationsConstants.localeAr),
    ],
    path: 'assets/translations',
    startLocale: const Locale(TranslationsConstants.localeEN),
    fallbackLocale: const Locale(TranslationsConstants.localeEN),
    useOnlyLangCode: true,
    child: ChangeNotifierProvider<LocaleProvider>(
    create: (context) => LocaleProvider()
    ,child: HomePage()),
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
    return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: Consumer<LocaleProvider>(
                builder: (context, _,__) {
                  print('update');
                  return Scaffold(
                    body: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
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
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.secondaryColor,
                        items: [
                          TabItem(icon: Icons.calendar_month_rounded, title: 'calendar'.tr()),
                          TabItem(icon: Icons.add, title: 'add'.tr()),
                          TabItem(icon: Icons.query_stats_rounded, title: 'report'.tr()),
                          TabItem(icon: Icons.settings, title: 'settings'.tr()),
                        ],
                        onTap: onTabTapped),
                  );
                }
              ),
            );
      }
}


