import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/build_toast.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_progress.dart';
import 'package:fruit_hub_dashboard/features/add_product/managers/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductViewBodyBloc extends StatelessWidget {
  const AddProductViewBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailer) {
          buildToast(
            context,
            message: state.message,
            state: ToastStates.ERROR,
          );
        }
        if (state is AddProductSuccess) {
          buildToast(
            context,
            message: S.of(context).addProductSuccess,
            state: ToastStates.SUCCESS,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomProgress(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
