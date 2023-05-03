import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/add_transaction/add_transaction_cubit.dart';
import '../widgets/add_page/add_transaction_button.dart';
import '../widgets/add_page/amount_input_container.dart';
import '../widgets/add_page/calender_date_picker_widget.dart';
import '../widgets/add_page/categories_grid_view_widget.dart';
import '../widgets/add_page/transaction_type_selector_container_widget.dart';
GlobalKey<FormState> keyAmount = GlobalKey();

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: keyAmount,
      child: BlocConsumer<AddTransactionCubit, AddTransactionState>(
        listener: (context,state){
          if(state is AddTransactionDone){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added Successfully")));
          }
          if(state is AddTransactionError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        buildWhen: (prev,curr){
          if(curr is AddTransactionDone){
            return false;
          }
          if(curr is AddTransactionError){
            return false;
          }
          return true;
          },
  builder: (context, state) {
        if(state is AddTransactionIncome) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TransactionTypeSelectorContainerWidget(),
              AmountInputContainer(
                labelText: "Amount",
                onChanged: (val){
                    if(double.parse(val) > 0){
                      BlocProvider.of<AddTransactionCubit>(context).setAmount(val);
                    }
                },
                validator: (txt){
                  if(txt=="" || double.parse(txt!) <= 0){
                    return "Please enter valid amount";
                  }
                },
                onSavedFunc: (txt){
                  BlocProvider.of<AddTransactionCubit>(context).setAmount(txt);
                },
                textEditingController: TextEditingController(text: BlocProvider.of<AddTransactionCubit>(context).getAmount()),
                textInputType: TextInputType.number,
              ),
              const CalenderDatePickerWidget(),
              CategoriesGridViewWidget(data: state.list,images: state.images,),
              AmountInputContainer(
                labelText: "Description",
                onChanged: (val){
                    BlocProvider.of<AddTransactionCubit>(context).setDescription(val);
                },
                validator: (txt){
                  if(txt==""){
                    return "Please enter valid Description";
                  }
                },
                onSavedFunc: (txt){
                  BlocProvider.of<AddTransactionCubit>(context).setDescription(txt);
                },
                textEditingController: TextEditingController(text: BlocProvider.of<AddTransactionCubit>(context).getDescription()),
                textInputType: TextInputType.text,
                minLines: 4,
              ),
              const AddTransactionButton()
            ],
          );
        }else if(state is AddTransactionExpense){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TransactionTypeSelectorContainerWidget(),
              AmountInputContainer(
                labelText: "Amount",
                onChanged: (val){
                  if(double.parse(val) > 0){
                    BlocProvider.of<AddTransactionCubit>(context).setAmount(val);
                  }
                },
                validator: (txt){
                  if(txt=="" || double.parse(txt!) <= 0){
                    return "Please enter valid amount";
                  }
                },
                onSavedFunc: (txt){
                  BlocProvider.of<AddTransactionCubit>(context).setAmount(txt);
                },
                textEditingController: TextEditingController(text: BlocProvider.of<AddTransactionCubit>(context).getAmount()),
                textInputType: TextInputType.number,
              ),
              const CalenderDatePickerWidget(),
              CategoriesGridViewWidget(data: state.list,images: state.images,),
              AmountInputContainer(
                labelText: "Description",
                onChanged: (val){
                    BlocProvider.of<AddTransactionCubit>(context).setDescription(val);
                },
                validator: (txt){
                  if(txt==""){
                    return "Please enter valid Description";
                  }
                },
                onSavedFunc: (txt){
                  BlocProvider.of<AddTransactionCubit>(context).setDescription(txt);
                },
                textEditingController: TextEditingController(text: BlocProvider.of<AddTransactionCubit>(context).getDescription()),
                textInputType: TextInputType.text,
                minLines: 4,
              ),
              const AddTransactionButton()
            ],
          );
        }
        return Container();
  },
),
      ),
    );
  }
}