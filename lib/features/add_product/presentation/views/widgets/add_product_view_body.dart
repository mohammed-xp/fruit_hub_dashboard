import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_function/build_toast.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/managers/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expiryMonths, numOfCalories, unitAmount;
  File? fileImage;
  bool isFeatured = false, isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                lableText: S.of(context).productName,
                onSaved: (value) {
                  name = value!;
                },
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                lableText: S.of(context).productPrice,
                onSaved: (value) {
                  price = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                lableText: S.of(context).productCode,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                lableText: S.of(context).productDescription,
                onSaved: (value) {
                  description = value!;
                },
                textInputType: TextInputType.text,
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                lableText: S.of(context).expiryDateInMonths,
                onSaved: (value) {
                  expiryMonths = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextFormField(
                      lableText: S.of(context).numberOfCalories,
                      onSaved: (value) {
                        numOfCalories = num.parse(value!);
                      },
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      S.of(context).per,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                      lableText: S.of(context).unitAmount,
                      onSaved: (value) {
                        unitAmount = num.parse(value!);
                      },
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              IsOrganicCheckBox(
                onChecked: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChecked: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                onImageSelected: (value) {
                  if (value != null) fileImage = value;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: S.of(context).addProduct,
                onPressed: () {
                  if (fileImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        isFeatured: isFeatured,
                        image: fileImage!,
                        expirationMonths: int.parse(expiryMonths.toString()),
                        numOfCalories: int.parse(numOfCalories.toString()),
                        unitAmount: int.parse(unitAmount.toString()),
                        isOrganic: isOrganic,
                        reviews: [],
                      );

                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    buildToast(
                      context,
                      message: S.of(context).imageIsRequired,
                      state: ToastStates.ERROR,
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
