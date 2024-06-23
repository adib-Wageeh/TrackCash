import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/utils/common_functions.dart';
import 'package:track_cash/ui/screens/add_transaction/cubit/add_transaction_cubit.dart';
import 'package:track_cash/ui/screens/add_transaction/cubit/add_transaction_state.dart';
import 'package:track_cash/ui/screens/add_transaction/widgets/calender_date_picker_widget.dart';
import 'package:track_cash/ui/widgets/transaction_type_selector_container_widget.dart';
import '../widgets/add_transaction_button.dart';
import '../widgets/amount_input_container.dart';
import '../widgets/categories_grid_view_widget.dart';

GlobalKey<FormState> keyAmount = GlobalKey();
class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {

  void _onStateChangeListener(BuildContext context, AddTransactionState state) {
    if (state.isSuccess) {
    } else if (state.isError) {
      state.mapOrNull(error: (data) {
        final error = data.failure?.error;
        showErrorToast(context, error!);
      });
    }
  }

  TransactionType selectedTransactionType = TransactionType.firstIncome();
  String? amount;
  DateTime selectedDate = DateTime.now();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AddTransactionCubit>(
        lazy: false,
        create: (_)=> AddTransactionCubit(),
        child: SingleChildScrollView(
          child: Form(
              key: keyAmount,
          child: BlocConsumer<AddTransactionCubit, AddTransactionState>(
            listener: _onStateChangeListener,
          builder: (context, state) {
              if(state.isLoading){
                return const Center(child: CircularProgressIndicator());
              }else{
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TransactionTypeSelectorContainerWidget(
                    isIncome: (selectedTransactionType.type == 1)?true:false,
                    onPressed: (type){
                      if(type != selectedTransactionType.type){
                        setState(() {
                          if(type == 1){
                            selectedTransactionType = TransactionType.firstIncome();
                          }else{
                            selectedTransactionType = TransactionType.firstExpense();
                          }
                        });
                      }
                    },
                  ),
                  AmountInputContainer(
                    labelText: "Amount",
                    onChanged: (val){

                    },
                    validator: (txt){
                      return "Please enter valid amount";
                    },
                    onSavedFunc: (txt){
                      // BlocProvider.of<AddTransactionCubit>(context).setAmount(txt);
                    },
                    textEditingController: amountController,
                    textInputType: TextInputType.number,
                  ),
                  CalenderDatePickerWidget(
                    selectedDate: selectedDate,
                    onDateChanged: (date){
                      if(date != selectedDate){
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                  ),
                  CategoriesGridViewWidget(
                    selectedTypeId: selectedTransactionType.id,
                    onChange: (TransactionType newType){
                      setState(() {
                        selectedTransactionType = newType;
                      });
                    },
                    types: (selectedTransactionType.type == 1)?
                        TransactionType.incomeTypes:TransactionType.expenseTypes,
                  ),
                  AmountInputContainer(
                    labelText: "Description",
                    onChanged: (val){
                        // BlocProvider.of<AddTransactionCubit>(context).setDescription(val);
                    },
                    validator: (txt){},
                    onSavedFunc: (txt){
                      // BlocProvider.of<AddTransactionCubit>(context).setDescription(txt);
                    },
                    textEditingController: descriptionController,
                    textInputType: TextInputType.text,
                    minLines: 3,
                  ),
                  AddTransactionButton(
                    onTap: (){

                    },
                  )
                ],
              );
            }
          },
        ),
          ),
        ),
      ),
    );
  }
}
