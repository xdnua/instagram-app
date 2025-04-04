import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({super.key});

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final localization = ref.watch(AppService.localization);

    return Center(
      child: TextFormField(
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(11.25, 11.25, 8, 10.75),
            child: Assets.svgs.icSearch.svg(
              width: 14,
              height: 14,
              color: ColorConstants.textPrimary,
            ),
          ),
          isDense: true,
          hintText: localization.search,
          hintStyle: AppTextStyle(fontSize: 16),
          fillColor: ColorConstants.borderGray,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorConstants.borderGray,
              width: 0,
            ),
          ),
        ),
        onChanged: (value) {},
        onSaved: (value) {},
      ),
    );
  }
}
