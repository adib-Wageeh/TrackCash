import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/add_transaction/add_transaction_cubit.dart';
import '../../../../core/assets/assets.dart';
import '../widgets/add_page/amount_input_container.dart';
import '../widgets/add_page/calender_date_picker_widget.dart';
import '../widgets/add_page/categories_grid_view_widget.dart';
import '../widgets/add_page/transaction_type_selector_container_widget.dart';
import 'package:scale_button/scale_button.dart';

GlobalKey<FormState> keyAmount = GlobalKey();

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
      buildWhen: (curr,next){
        if(next is AddTransactionDone || next is AddTransactionError){
          return false;
        }
        return true;
        },
  builder: (context, state) {
      print(state);
      if(state is AddTransactionIncome) {
        return Column(
          children: [
            const TransactionTypeSelectorContainerWidget(),
            const AmountInputContainer(),
            CalenderDatePickerWidget(state:state.list),
            CategoriesGridViewWidget(data: state.list,images: state.images,),
            const AddTransactionButton()
          ],
        );
      }else if(state is AddTransactionExpense){
        return Column(
          children: [
            const TransactionTypeSelectorContainerWidget(),
            const AmountInputContainer(),
            CalenderDatePickerWidget(state: state.list),
            CategoriesGridViewWidget(data: state.list,images: state.images,),
            const AddTransactionButton()
          ],
        );
      }
      return Container();
  },
),
    );
  }
}


class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: ScaleButton(
          onTap: (){
            if(keyAmount.currentState!.validate()) {
              keyAmount.currentState!.save();
              BlocProvider.of<AddTransactionCubit>(context).addTransactionMethod(
                  context);
            }
          }
          ,child: Container(
          height: 48.0,
          width: 300.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Assets.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),),
      ),
    );
  }
}
