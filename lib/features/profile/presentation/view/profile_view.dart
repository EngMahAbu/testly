import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_images.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_app_bar.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';
import 'package:testly/features/profile/presentation/view/reset_password_view.dart';
import 'package:testly/features/profile/presentation/view_model/profile_state.dart';
import 'package:testly/features/profile/presentation/view_model/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileViewModel _profileViewModel = getIt.get<ProfileViewModel>();
  late final TextEditingController _userNameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: 'Mohamed_Ahmed123');
    _firstNameController = TextEditingController(text: 'Mohamed');
    _lastNameController = TextEditingController(text: 'Ahmed');
    _emailController = TextEditingController(text: 'Mohamed098@gmail.com');
    _passwordController = TextEditingController(text: '********');
    _phoneController = TextEditingController(text: '1234567890987');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return BlocProvider<ProfileViewModel>(
      create: (context) => _profileViewModel,
      child: BlocListener<ProfileViewModel, ProfileState>(
        listener: (context, state) {},
        child: _buildProfileScreen(size),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildProfileScreen(Size size) {
    return Scaffold(
      appBar: MainAppBar(title: AppStrings.profile, hideLeading: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.029),
            _buildProfileAvatar(),
            SizedBox(height: size.height * 0.037),
            ..._buildProfileTextFields(size),
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
          child: BlocBuilder<ProfileViewModel, ProfileState>(
            builder: (context, state) {
              // if (state.signup!.isLoading) {
              //   return CircularProgressIndicator(
              //     color: AppColors.white,
              //   );
              // } else {
              return Text(AppStrings.update, style: AppStyles.elevatedButton);
              // }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.grey,
            backgroundImage: AssetImage(AppImages.testlyLogo),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.blueShade40,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProfileTextFields(Size size) {
    return [
      MainTextField(
        label: AppStrings.usernameTextFieldLabel,
        hint: AppStrings.usernameTextFieldLabel,
        controller: _userNameController,
      ),
      SizedBox(height: size.height * 0.025),
      Row(
        children: [
          Expanded(
            child: MainTextField(
              label: AppStrings.firstNameTextFieldLabel,
              hint: AppStrings.firstNameTextFieldLabel,
              controller: _firstNameController,
            ),
          ),
          SizedBox(width: size.height * 0.018),
          Expanded(
            child: MainTextField(
              label: AppStrings.lastNameTextFieldLabel,
              hint: AppStrings.lastNameTextFieldLabel,
              controller: _lastNameController,
            ),
          ),
        ],
      ),
      SizedBox(height: size.height * 0.025),
      MainTextField(
        label: AppStrings.emailTextFieldLabel,
        hint: AppStrings.emailTextFieldLabel,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
      ),
      SizedBox(height: size.height * 0.025),
      MainTextField(
        label: AppStrings.passwordTextFieldLabel,
        hint: AppStrings.passwordTextFieldLabel,
        obscureText: true,
        controller: _passwordController,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordView(),
                ),
              );
            },
            child: Text(AppStrings.change, style: AppStyles.defaultTextButton),
          ),
        ),
      ),
      SizedBox(height: size.height * 0.025),
      MainTextField(
        label: AppStrings.phoneNumberTextFieldLabel,
        hint: AppStrings.phoneNumberTextFieldLabel,
        controller: _phoneController,
        keyboardType: TextInputType.phone,
      ),
    ];
  }
}
