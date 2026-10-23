import 'package:flutter/material.dart';
import 'package:desktop/constants/sidebar_navigation.dart';
import 'package:desktop/constants/footer.dart';
import 'package:desktop/constants/user_info_card.dart';
import 'package:desktop/constants/action_button.dart';
import 'package:desktop/constants/searchbar_widget.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';

class BaseScreen extends StatelessWidget {
  final String activePage;
  final Widget child;
  final bool showSearchBar;
  final bool showActionButtons;
  final Widget? customSidebar;
  final Widget? customSearchBar;
  final bool disableScroll;
  final Widget? backgroundImage;

  const BaseScreen({
    super.key,
    required this.activePage,
    required this.child,
    this.showSearchBar = true,
    this.showActionButtons = true,
    this.customSidebar,
    this.customSearchBar,
    this.disableScroll = false,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Scaffold(
      backgroundColor: BarraColors.background,
      body: Stack(
        children: [
          if (backgroundImage != null)
            Positioned.fill(
              child: backgroundImage!,
            ),
          Row(
            children: [
              Container(
                width: responsive.sidebarWidth,
                color: AppColors.transparent,
                child: SizedBox.expand(
                  child: customSidebar ?? SidebarNavigation(activePage: activePage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: showSearchBar ? responsive.scaleHeight(201) : responsive.scaleHeight(148),
                  ),
                  child: disableScroll
                      ? SizedBox.expand(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsive.horizontalPadding,
                            ),
                            child: child,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: EdgeInsets.only(
                            bottom: responsive.scaleHeight(60),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsive.horizontalPadding,
                            ),
                            child: child,
                          ),
                        ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: const Footer(),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: const UserInfoCard(),
          ),

          if (showSearchBar)
            Positioned(
              top: responsive.scaleHeight(49.5),
              left: responsive.sidebarWidth + responsive.scaleWidth(32),
              right: responsive.scaleWidth(430),
              child: Container(
                height: responsive.scaleHeight(80),
                decoration: BoxDecoration(
                  color: customSearchBar != null ? AppColors.border : BarraColors.gray,
                  borderRadius: BorderRadius.circular(
                    responsive.scaleUniform(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: responsive.scaleUniform(4),
                      offset: Offset(0, responsive.scaleUniform(2)),
                    ),
                  ],
                  image: customSearchBar == null ? const DecorationImage(
                    image: NetworkImage(
                      'https://api.builder.io/api/v1/image/assets/TEMP/5af78e865bbf5dcf311e5e8b71ad23314c960ea2?width=1740',
                    ),
                    fit: BoxFit.cover,
                  ) : null,
                ),
                child: customSearchBar ?? const SearchBarWidget(),
              ),
            ),

          if (showActionButtons)
            Positioned(
              top: responsive.scaleHeight(148),
              right: responsive.scaleWidth(16),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionButtonWidget(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
