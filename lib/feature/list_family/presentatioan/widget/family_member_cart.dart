import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_basic_details.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_educationdetails.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_health_details.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_sociel_details.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatefulWidget {
  final String name;
  // final String position;
  final String houseNumber;
  final String houseName;
  final String phone;
  final String whatsapp;
  final String ward;
  final String age;
  final String editId;
  final String position;
  final String lastUpdated;
  final SurveySectionType sectionType;
  const MemberCard({
    super.key,
    required this.name,
    //  required this.position,
    required this.houseNumber,
    required this.houseName,
    required this.phone,
    required this.whatsapp,
    required this.editId,
    required this.position,
    required this.ward,
    required this.age,
    required this.lastUpdated,
    required this.sectionType,
  });

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  void onViewTap(BuildContext context) {
    late Widget page;

    switch (widget.sectionType) {
      case SurveySectionType.personal:
        page = const EditFamilyMemberBasicDetails(mode: PageMode.view);
        break;
      case SurveySectionType.education:
        page = const EditFamilyMemberEducationdetails(mode: PageMode.view);
        break;
      case SurveySectionType.employment:
        page = const EditFamilyHealthDetails(mode: PageMode.view);
        break;
      case SurveySectionType.health:
        page = const EditFamilyHealthDetails(mode: PageMode.view);
        break;
      case SurveySectionType.welfare:
        page = const EditFamilyMemberSocielDetails(mode: PageMode.view);
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void onEditTap(BuildContext context) {
    late Widget page;

    switch (widget.sectionType) {
      case SurveySectionType.personal:
        page = const EditFamilyMemberBasicDetails(mode: PageMode.edit);
        break;
      case SurveySectionType.education:
        page = const EditFamilyMemberEducationdetails(mode: PageMode.edit);
        break;
      case SurveySectionType.employment:
        page = const EditFamilyHealthDetails(mode: PageMode.edit);
        break;
      case SurveySectionType.health:
        page = const EditFamilyHealthDetails(mode: PageMode.edit);
        break;
      case SurveySectionType.welfare:
        page = const EditFamilyMemberSocielDetails(mode: PageMode.edit);
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Icon and Name
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColor.lightBlue,
                  shape: BoxShape.circle,
                ),
                // child: const Icon(
                //   Icons.person,
                //   color: AppColor.primary,
                //   size: 28,
                // ),
                child: Image.asset(
                  'assets/images/contact.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fill,
                  color: AppColor.iconColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          widget.houseNumber,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '|',
                          style: TextStyle(fontSize: 13, color: AppColor.black),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.houseName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: AppColor.black,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColor.hintText2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '|',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.textLabel2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          'assets/icons/whatsapp_icon.png', // You'll need to add WhatsApp icon
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.chat,
                              size: 16,
                              color: Colors.green,
                            );
                          },
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.whatsapp,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColor.hintText2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Divider(thickness: 1, color: AppColor.grey1),

          const SizedBox(height: 7),
          // Ward Info
          Row(
            children: [
              Image.asset(
                'assets/icons/family_icon.png',
                width: 12,
                height: 12,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const Icon(
                    Icons.family_restroom,
                    size: 12,
                    color: AppColor.primary,
                  );
                },
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  widget.ward,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.hintText2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Age
          Row(
            children: [
              Image.asset(
                'assets/icons/age_icon.png',
                width: 12,
                height: 12,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  //print('Error loading image: $error');
                  return const Icon(
                    Icons.bar_chart,
                    size: 12,
                    color: AppColor.primary,
                  );
                },
              ),
              const SizedBox(width: 6),
              Text(
                widget.age,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.hintText2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          // Last Updated
          Row(
            children: [
              Icon(Icons.update, size: 16, color: AppColor.iconColor),
              const SizedBox(width: 6),
              Text(
                widget.lastUpdated,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.hintText2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton.icon(
                onPressed: () => onViewTap(context),
                // onPressed: () {
                //   //add contition
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => AddFamilyMembers()),
                //   );
                // },
                icon: const Icon(
                  Icons.visibility,
                  size: 14,
                  color: AppColor.button,
                ),
                label: const Text(
                  'View',
                  style: TextStyle(
                    color: AppColor.iconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.iconColor,
                  side: const BorderSide(color: AppColor.iconColor),
                  minimumSize: const Size(57, 23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.only(top: 4,bottom: 4),
                ),
              ),
              const SizedBox(width: 7),
              OutlinedButton.icon(
                //add contition
                onPressed: () {
                  onEditTap(context);
                },
                icon: const Icon(Icons.edit, size: 14, color: AppColor.button),
                label: const Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColor.iconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.iconColor,
                  side: const BorderSide(color: AppColor.iconColor),
                  minimumSize: const Size(57, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.only(top: 4,bottom: 4),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
