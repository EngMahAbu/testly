import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_app_bar.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';
import 'package:testly/features/profile/presentation/view_model/profile_state.dart';
import 'package:testly/features/profile/presentation/view_model/profile_view_model.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final ProfileViewModel _profileViewModel = getIt.get<ProfileViewModel>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return BlocProvider<ProfileViewModel>(
      create: (context) => _profileViewModel,
      child: BlocListener<ProfileViewModel, ProfileState>(
        listener: (context, state) {},
        child: _buildResetPasswordScreen(size),
      ),
    );
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildResetPasswordScreen(Size size) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.resetSectionSubTitle),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            ..._buildResetPasswordTextFields(size),
            SizedBox(height: size.height * 0.049),
            _buildMainButton(),
            SizedBox(height: size.height * 0.025),
          ],
        ),
      ),
    );
  }

  Widget _buildMainButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(AppStrings.update, style: AppStyles.elevatedButton),
        ),
      ),
    );
  }

  List<Widget> _buildResetPasswordTextFields(Size size) {
    return [
      MainTextField(
        label: AppStrings.currentPassword,
        hint: AppStrings.currentPassword,
        controller: _currentPasswordController,
        obscureText: true,
      ),
      SizedBox(height: size.height * 0.025),
      MainTextField(
        label: AppStrings.newPassword,
        hint: AppStrings.newPassword,
        controller: _newPasswordController,
        obscureText: true,
      ),
      SizedBox(height: size.height * 0.025),
      MainTextField(
        label: AppStrings.confirmPasswordTextFieldLabel,
        hint: AppStrings.confirmPasswordTextFieldLabel,
        controller: _confirmPasswordController,
        obscureText: true,
      ),
    ];
  }
}
