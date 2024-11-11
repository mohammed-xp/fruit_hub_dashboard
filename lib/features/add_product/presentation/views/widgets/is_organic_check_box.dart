import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChecked});

  final ValueChanged<bool> onChecked;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isOrganic,
          onChecked: (value) {
            isOrganic = value;
            widget.onChecked(value);
            setState(() {});
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            S.of(context).isProductOrganic,
            style: AppStyles.styleSemiBold13(context).copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
