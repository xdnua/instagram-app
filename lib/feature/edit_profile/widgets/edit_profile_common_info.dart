import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/edit_profile/providers/EditProfileFormNotifier.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';

class EditProfileCommonInfo extends ConsumerStatefulWidget {
  const EditProfileCommonInfo({super.key});

  @override
  ConsumerState<EditProfileCommonInfo> createState() =>
      _EditProfileCommonInfoState();
}

class _EditProfileCommonInfoState extends ConsumerState<EditProfileCommonInfo> {
  late final TextEditingController _nameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _websiteController;
  late final TextEditingController _bioController;
  late final TextEditingController _phoneController;
  String _gender = 'Nam';

  final List<String> genderItems = ['Nam', 'Nữ', 'Khác'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);

    _nameController = TextEditingController(text: user.name);
    _usernameController = TextEditingController(text: user.username);
    _websiteController = TextEditingController(text: user.website);
    _bioController = TextEditingController(text: user.bio);
    _phoneController = TextEditingController(text: user.phone);

    // map user.gender to dropdown items
    _gender = _mapGender(user.gender);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _websiteController.dispose();
    _bioController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // map English gender to Vietnamese for dropdown
  String _mapGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Nam';
      case 'female':
        return 'Nữ';
      case 'other':
        return 'Khác';
      default:
        return 'Nam'; // default value
    }
  }

  // map back to API value
  String _mapGenderToApi(String gender) {
    switch (gender) {
      case 'Nam':
        return 'Male';
      case 'Nữ':
        return 'Female';
      case 'Khác':
        return 'Other';
      default:
        return 'Male';
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = ref.watch(AppService.localization);
    final editNotifier = ref.read(editProfileFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          label: localization.name,
          controller: _nameController,
          onChanged: editNotifier.updateName,
        ),
        _buildTextField(
          label: localization.username,
          controller: _usernameController,
          onChanged: editNotifier.updateUsername,
          readOnly: true,
        ),
        _buildTextField(
          label: 'Website',
          controller: _websiteController,
          onChanged: editNotifier.updateWebsite,
        ),
        _buildTextField(
          label: localization.bio,
          controller: _bioController,
          onChanged: editNotifier.updateBio,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          label: localization.gender,
          value: _gender,
          items: genderItems,
          onChanged: (val) {
            if (val != null) {
              setState(() => _gender = val);
              editNotifier.updateGender(_mapGenderToApi(val));
            }
          },
        ),
        _buildTextField(
          label: localization.phone,
          controller: _phoneController,
          onChanged: editNotifier.updatePhone,
          keyboardType: TextInputType.phone,
        ),
        _buildTextField(
          label: localization.email,
          controller: TextEditingController(
            text: ref.read(userProvider).email,
          ), // read-only
          readOnly: true,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    void Function(String)? onChanged,
    bool readOnly = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            maxLines: maxLines,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.divider),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.radioActive),
              ),
              fillColor: readOnly ? Colors.grey.shade100 : Colors.white,
              filled: readOnly,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: items.contains(value) ? value : null,
            items:
                items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.divider),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.radioActive),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
