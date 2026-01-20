import 'package:flutter/material.dart';
import '../../domain/entities/medical_provider_entity.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class MedicalProviderListWidget extends StatelessWidget {
  final List<MedicalProviderEntity> providers;
  final MedicalProviderEntity? selectedProvider;
  final Function(MedicalProviderEntity) onProviderSelected;

  const MedicalProviderListWidget({
    super.key,
    required this.providers,
    this.selectedProvider,
    required this.onProviderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10), 
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: providers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final provider = providers[index];
        final isSelected = selectedProvider?.id == provider.id;
        
        return MedicalProviderCard(
          provider: provider,
          isSelected: isSelected,
          onTap: () {
            onProviderSelected(provider);
          },
        );
      },
    );
  }
}

class MedicalProviderCard extends StatelessWidget {
  final MedicalProviderEntity provider;
  final bool isSelected;
  final VoidCallback onTap;

  const MedicalProviderCard({
    super.key,
    required this.provider,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(
                  color: AppColor.primaryColor,
                  width: 2,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.tealColor.withOpacity(0.2),
                      AppColor.blueColor.withOpacity(0.2),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: provider.avatar.isNotEmpty
                      ? Image.network(
                          provider.avatar,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              color: AppColor.primaryColor,
                              size: 24,
                            );
                          },
                        )
                      : Icon(
                          Icons.person,
                          color: AppColor.primaryColor,
                          size: 24,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.fullName,
                      style: AppTextStyle.style16B.copyWith(
                        color: AppColor.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    if (provider.subHeading.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        provider.subHeading,
                        style: AppTextStyle.style14.copyWith(
                          color: AppColor.grey,
                          decoration: TextDecoration.none,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (provider.location.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColor.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              provider.location,
                              style: AppTextStyle.style12.copyWith(
                                color: AppColor.grey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (provider.availableDays.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        children: provider.availableDays.map((day) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              day,
                              style: AppTextStyle.style12.copyWith(
                                color: AppColor.primaryColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              if (provider.isHospital)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.primaryColor.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    'Hospital',
                    style: AppTextStyle.style12.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.orange.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    'Doctor',
                    style: AppTextStyle.style12.copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
