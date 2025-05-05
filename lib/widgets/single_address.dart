import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.savedAddress,
    required this.selected,
    required this.onTap,
  });

  final SavedAddress savedAddress;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary50 : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selected ? AppColors.primary100 : AppColors.grey200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.location),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (savedAddress.addressDetail?.isEmpty ?? false)
                            ? savedAddress.address
                            : savedAddress.addressDetail ?? '',
                        style: const TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                        visible:
                            savedAddress.addressDetail?.isNotEmpty ?? false,
                        child: Text(
                          (savedAddress.addressDetail?.isNotEmpty ?? false)
                              ? savedAddress.address
                              : savedAddress.addressDetail ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppCheckBoxWidget(selected: selected)
            ],
          ),
        ),
      ),
    );
  }
}

class SingleEditableAddress extends StatelessWidget {
  const SingleEditableAddress({
    super.key,
    required this.savedAddress,
    required this.onTap,
  });

  final SavedAddress savedAddress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.location),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (savedAddress.addressDetail?.isEmpty ?? false)
                            ? savedAddress.address
                            : savedAddress.addressDetail ?? '',
                        style: const TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                        visible:
                            savedAddress.addressDetail?.isNotEmpty ?? false,
                        child: Text(
                          (savedAddress.addressDetail?.isNotEmpty ?? false)
                              ? savedAddress.address
                              : savedAddress.addressDetail ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_horiz, color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
