import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/app/routes/app_page.dart';
import '../viewmodels/tab_bar_viewmodel.dart';

class TabBarView extends GetView<TabBarViewModel> {
  const TabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Navigator(
                key: Get.nestedKey(1),
                onGenerateRoute: (settings) {
                  return GetPageRoute(
                    page: () => Obx(() {
                      final currentRoute = controller
                          .tabs[controller.currentIndex.value].route;

                      final definedPage = AppPages.pages.firstWhereOrNull(
                        (page) => page.name == currentRoute,
                      );

                      if (definedPage == null) return _getDefaultPage();

                      return definedPage.page();
                    }),
                  );
                },
              ),
            ),
            _buildBottomTabBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomTabBar(BuildContext context) {
    final theme = Get.theme;
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        onTap: controller.onTabSelected,
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.colorScheme.outline,
        indicatorColor: Colors.transparent,
        padding: EdgeInsets.only(top: 10, bottom: 20),
        labelPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        labelStyle: theme.textTheme.labelSmall,
        tabs: controller.tabs.asMap().entries.map((entry) {
          return Obx(() {
            final isSelected = controller.currentIndex.value == entry.key;
            final tab = entry.value;
            
            return Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    tab.icon,
                    size: 24,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tab.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            );
          });
        }).toList(),
      ),
    );
  }

  Widget _getDefaultPage() {
    return Center(
      child: Text(
        'Página no encontrada',
        style: Get.textTheme.headlineMedium,
      ),
    );
  }
}