import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/add_transaction.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/edit_transaction.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transactions_in_month.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/add_transaction/add_transaction_cubit.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/change_category/change_category_cubit.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/remove_transaction/remove_transaction_cubit.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/report_cubit/get_report_cubit.dart';
import 'features/calender_transactions/domain/usecases/get_transaction_in_day.dart';
import 'features/calender_transactions/domain/usecases/get_transactions_total_amount.dart';
import 'features/calender_transactions/domain/usecases/remove_transaction.dart';
import 'features/calender_transactions/presentation/cubit/animateContainer/animate_container_cubit.dart';
import 'features/calender_transactions/presentation/cubit/app_bar/app_bar_cubit.dart';
import 'features/calender_transactions/presentation/cubit/get_transactions_per_day/get_transactions_per_day_cubit.dart';
import 'features/calender_transactions/presentation/cubit/update_transaction/update_transaction_cubit.dart';
import 'features/calender_transactions/presentation/pages/add_transaction_page.dart';
import 'features/calender_transactions/presentation/pages/calender_page.dart';
import 'features/calender_transactions/presentation/pages/reports.dart';
import 'features/settings/presentation/cubit/theme_changer/theme_cubit.dart';
import 'features/settings/presentation/pages/settings_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  init();
  EasyLoading.instance
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.deepPurpleAccent
    ..maskColor = Colors.deepPurpleAccent
    ..userInteractions = false;
  runApp(MultiBlocProvider(providers: [
    BlocProvider<GetTransactionsPerDayCubit>(create: (context)=>GetTransactionsPerDayCubit(getTransactionInDay: getIt<GetTransactionInDay>())),
    BlocProvider<AppBarCubit>(create: (context)=>AppBarCubit()),
    BlocProvider<ThemeCubit>(create: (context)=>ThemeCubit()..toggleTheme(true)),
    BlocProvider<AddTransactionCubit>(create: (context)=>AddTransactionCubit(addTransaction: getIt<AddTransaction>())..switchTransactionType(true)),
    BlocProvider<ChangeCategoryCubit>(create: (context)=>ChangeCategoryCubit()..onCategoryChange(newCategoryIndex: 0)),
    BlocProvider<AnimateContainerCubit>(create: (context)=>AnimateContainerCubit()),
    BlocProvider<UpdateTransactionCubit>(create: (context)=>UpdateTransactionCubit(editTransaction: getIt<EditTransaction>())),
    BlocProvider<RemoveTransactionCubit>(create: (context)=>RemoveTransactionCubit(removeTransaction: getIt<RemoveTransaction>())),
    BlocProvider<GetReportCubit>(create: (context)=>GetReportCubit(getTransactionInMonth: getIt<GetTransactionInMonth>(), getTransactionTotalAmount: getIt<GetTransactionTotalAmount>())),

  ]
    ,child: BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    if(state is setTheme) {
      return MaterialApp(
        home: const HomePage(),
        theme: state.themeData,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      );
    }
    return Container();
  },
),));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBarCubit,AppBarState>(
        builder: (context,state){
          if(state is AppBarAdd){
            BlocProvider.of<AddTransactionCubit>(context).clearAddPage(context);
            return const AddTransactionPage();
          }else if(state is AppBarReport){
            BlocProvider.of<GetReportCubit>(context).switchTransactionState(true);
            return const TransactionsReports();
          }else if(state is AppBarSettings){
            return const SettingsPage();
          }
          BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(BlocProvider.of<GetTransactionsPerDayCubit>(context).selectedDay);
          return const CalendarPage();
        },
      )
        ,
        bottomNavigationBar: ConvexAppBar(
          height: 55,
          top: -20,
          elevation: 5,
          backgroundColor: const Color(0xff691515),
          items: const [
            TabItem(icon: Icons.calendar_month_rounded, title: 'Calender'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.query_stats_rounded, title: 'Report'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          onTap: (int i) {
            final cubit = BlocProvider.of<AppBarCubit>(context);
            switch(i){
              case 0:
                cubit.setCalenderView();
                break;
              case 1:
                cubit.setAddView();
                break;
              case 2:
                cubit.setReportView();
                break;
              case 3:
                cubit.setSettingsView();
                break;
            }
          }),
        );
  }
}