part of 'auth_profile_generator_page.dart';

class _AuthProfileGeneratorPageView extends StatefulWidget {
  const _AuthProfileGeneratorPageView();

  @override
  State<_AuthProfileGeneratorPageView> createState() =>
      __AuthProfileGeneratorPageViewState();
}

class __AuthProfileGeneratorPageViewState
    extends State<_AuthProfileGeneratorPageView>
    with _AuthProfileGeneratorPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppLangDropdown.circle(
          onChanged: (_) => setState(() {}),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, cst) {
            return Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    minHeight: cst.maxHeight,
                  ),
                  child: Padding(
                    padding: context.ext.padding.horizontal.xl,
                    child: Form(
                      key: _formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            context.ext.sizedBox.height.xl,
                            const Spacer(),
                            Center(
                              child: GestureDetector(
                                onTap: _pickProfileImage,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Observer(
                                      builder: (_) => ProfileAvatarWidget(
                                        imageData: _viewModel.profileImage,
                                        radius:
                                            context.ext.screen.byOrientation(
                                          portrait:
                                              context.ext.screen.width * 0.35,
                                          landscape:
                                              context.ext.screen.height * 0.3,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -4,
                                      bottom: -4,
                                      child: CircleAvatar(
                                        backgroundColor: context.appThemeExt
                                            .appColors.primary.onColor,
                                        foregroundColor: context
                                            .appThemeExt.appColors.primary,
                                        child: const Icon(AppIcons.camera),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            context.ext.sizedBox.height.xl6,
                            AppTextFormField(
                              controller: _usernameController,
                              hintText: LocaleKeys
                                  .pagesAuthProfileGeneratorFieldsUsernameHint
                                  .translate,
                              focusNode: _usernameFocusNode,
                              nextFocusNode: _firstNameFocusNode,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              inputFormatters: ValidationExt.usernameFormatters,
                              validator: (p0) => p0.validateUsername,
                            ),
                            context.ext.sizedBox.height.md,
                            Row(
                              spacing: context.ext.values.md,
                              children: [
                                Expanded(
                                  child: AppTextFormField(
                                    controller: _firstNameController,
                                    hintText: LocaleKeys
                                        .pagesAuthProfileGeneratorFieldsFirstNameHint
                                        .translate,
                                    focusNode: _firstNameFocusNode,
                                    nextFocusNode: _lastNameFocusNode,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    validator: (p0) => p0.validateFirstName,
                                  ),
                                ),
                                Expanded(
                                  child: AppTextFormField(
                                    controller: _lastNameController,
                                    hintText: LocaleKeys
                                        .pagesAuthProfileGeneratorFieldsLastNameHint
                                        .translate,
                                    focusNode: _lastNameFocusNode,
                                    nextFocusNode: _bioFocusNode,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    validator: (p0) => p0.validateLastName,
                                  ),
                                ),
                              ],
                            ),
                            context.ext.sizedBox.height.md,
                            AppTextFormField(
                              controller: _bioController,
                              hintText: LocaleKeys
                                  .pagesAuthProfileGeneratorFieldsBioHint
                                  .translate,
                              focusNode: _bioFocusNode,
                              nextFocusNode: _continueBtnFocusNode,
                              keyboardType: TextInputType.multiline,
                              maxLength: AppConfigs.userProfileBioLength,
                              maxLines: 3,
                              textInputAction: TextInputAction.done,
                            ),
                            AppLangDropdown(
                              onChanged: (_) {
                                setState(() {});
                              },
                            ),
                            context.ext.sizedBox.height.xl6,
                            const Spacer(),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: context.ext.screen.width * 0.3,
                              ),
                              child: AppElevatedButton(
                                onPressed: _onContinue,
                                focusNode: _continueBtnFocusNode,
                                child: Text(
                                  LocaleKeys
                                      .pagesAuthProfileGeneratorButtonsContinueLabel
                                      .translate,
                                ),
                              ),
                            ),
                            context.ext.sizedBox.height.xl,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
