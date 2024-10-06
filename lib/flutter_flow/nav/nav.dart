import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const LoginPageWidget()
          : const SignupPageOption1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const LoginPageWidget()
              : const SignupPageOption1Widget(),
        ),
        FFRoute(
          name: 'signup_page_option1',
          path: '/signupPageOption1',
          builder: (context, params) => const SignupPageOption1Widget(),
        ),
        FFRoute(
          name: 'SplashScreen',
          path: '/splashScreen',
          builder: (context, params) => const SplashScreenWidget(),
        ),
        FFRoute(
          name: 'Dashboard_for_interns',
          path: '/dashboardForInterns',
          builder: (context, params) => const DashboardForInternsWidget(),
        ),
        FFRoute(
          name: 'homepage_sample_option1',
          path: '/homepageSampleOption1',
          builder: (context, params) => const HomepageSampleOption1Widget(),
        ),
        FFRoute(
          name: 'dashboard_for_universities',
          path: '/dashboardForUniversities',
          builder: (context, params) => const DashboardForUniversitiesWidget(),
        ),
        FFRoute(
          name: 'Login_page',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'User_Profile_Intern',
          path: '/userProfileIntern',
          builder: (context, params) => const UserProfileInternWidget(),
        ),
        FFRoute(
          name: 'Privacy_Support',
          path: '/privacySupport',
          builder: (context, params) => const PrivacySupportWidget(),
        ),
        FFRoute(
          name: 'internshiptab_intern_pathway_o2',
          path: '/internshiptabInternPathwayO2',
          builder: (context, params) => const InternshiptabInternPathwayO2Widget(),
        ),
        FFRoute(
          name: 'My_Application',
          path: '/myApplication',
          builder: (context, params) => const MyApplicationWidget(),
        ),
        FFRoute(
          name: 'Wishlist_Saved_Internship',
          path: '/wishlistSavedInternship',
          builder: (context, params) => const WishlistSavedInternshipWidget(),
        ),
        FFRoute(
          name: 'Logout',
          path: '/logout',
          builder: (context, params) => const LogoutWidget(),
        ),
        FFRoute(
          name: 'Dashboard_for_internsCopy',
          path: '/dashboardForInternsCopy',
          builder: (context, params) => const DashboardForInternsCopyWidget(),
        ),
        FFRoute(
          name: 'homepage_sample_option1Copy',
          path: '/homepageSampleOption1Copy',
          builder: (context, params) => const HomepageSampleOption1CopyWidget(),
        ),
        FFRoute(
          name: 'internshiptab_intern_pathway_o2Copy',
          path: '/internshiptabInternPathwayO2Copy',
          builder: (context, params) =>
              const InternshiptabInternPathwayO2CopyWidget(),
        ),
        FFRoute(
          name: 'LogoutCopy',
          path: '/logoutCopy',
          builder: (context, params) => const LogoutCopyWidget(),
        ),
        FFRoute(
          name: 'My_ApplicationCopy',
          path: '/myApplicationCopy',
          builder: (context, params) => const MyApplicationCopyWidget(),
        ),
        FFRoute(
          name: 'Privacy_SupportCopy',
          path: '/privacySupportCopy',
          builder: (context, params) => const PrivacySupportCopyWidget(),
        ),
        FFRoute(
          name: 'Wishlist_Saved_InternshipCopy',
          path: '/wishlistSavedInternshipCopy',
          builder: (context, params) => const WishlistSavedInternshipCopyWidget(),
        ),
        FFRoute(
          name: 'Notification_bar',
          path: '/notificationBar',
          builder: (context, params) => const NotificationBarWidget(),
        ),
        FFRoute(
          name: 'Notification_barCopy',
          path: '/notificationBarCopy',
          builder: (context, params) => const NotificationBarCopyWidget(),
        ),
        FFRoute(
          name: 'Setting_page',
          path: '/settingPage',
          builder: (context, params) => const SettingPageWidget(),
        ),
        FFRoute(
          name: 'Setting_pageCopy',
          path: '/settingPageCopy',
          builder: (context, params) => const SettingPageCopyWidget(),
        ),
        FFRoute(
          name: 'training_tab_o4',
          path: '/trainingTabO4',
          builder: (context, params) => const TrainingTabO4Widget(),
        ),
        FFRoute(
          name: 'training_tab_o4Copy',
          path: '/trainingTabO4Copy',
          builder: (context, params) => const TrainingTabO4CopyWidget(),
        ),
        FFRoute(
          name: 'guidence_tab_02',
          path: '/guidenceTab02',
          builder: (context, params) => const GuidenceTab02Widget(),
        ),
        FFRoute(
          name: 'Resume_tab_o3',
          path: '/resumeTabO3',
          builder: (context, params) => const ResumeTabO3Widget(),
        ),
        FFRoute(
          name: 'guidence_tab_02Copy',
          path: '/guidenceTab02Copy',
          builder: (context, params) => const GuidenceTab02CopyWidget(),
        ),
        FFRoute(
          name: 'Resume_tab_o3Copy',
          path: '/resumeTabO3Copy',
          builder: (context, params) => const ResumeTabO3CopyWidget(),
        ),
        FFRoute(
          name: 'Home_page_universities',
          path: '/homePageUniversities',
          builder: (context, params) => const HomePageUniversitiesWidget(),
        ),
        FFRoute(
          name: 'Home_page_universitiesCopy',
          path: '/homePageUniversitiesCopy',
          builder: (context, params) => const HomePageUniversitiesCopyWidget(),
        ),
        FFRoute(
          name: 'Our_services',
          path: '/ourServices',
          builder: (context, params) => const OurServicesWidget(),
        ),
        FFRoute(
          name: 'About_Internships',
          path: '/aboutInternships',
          builder: (context, params) => const AboutInternshipsWidget(),
        ),
        FFRoute(
          name: 'About_InternshipsCopy',
          path: '/aboutInternshipsCopy',
          builder: (context, params) => const AboutInternshipsCopyWidget(),
        ),
        FFRoute(
          name: 'Our_servicesCopy',
          path: '/ourServicesCopy',
          builder: (context, params) => const OurServicesCopyWidget(),
        ),
        FFRoute(
          name: 'Profile_Page_universities',
          path: '/profilePageUniversities',
          builder: (context, params) => const ProfilePageUniversitiesWidget(),
        ),
        FFRoute(
          name: 'Profile_Page_universitiesCopy',
          path: '/profilePageUniversitiesCopy',
          builder: (context, params) => const ProfilePageUniversitiesCopyWidget(),
        ),
        FFRoute(
          name: 'homepage_for_company_o1',
          path: '/homepageForCompanyO1',
          builder: (context, params) => const HomepageForCompanyO1Widget(),
        ),
        FFRoute(
          name: 'Collaboration_page',
          path: '/collaborationPage',
          builder: (context, params) => const CollaborationPageWidget(),
        ),
        FFRoute(
          name: 'Collaboration_pageCopy',
          path: '/collaborationPageCopy',
          builder: (context, params) => const CollaborationPageCopyWidget(),
        ),
        FFRoute(
          name: 'Setting_page_Universities',
          path: '/settingPageUniversities',
          builder: (context, params) => const SettingPageUniversitiesWidget(),
        ),
        FFRoute(
          name: 'User_Profile_InternCopy',
          path: '/userProfileInternCopy',
          builder: (context, params) => const UserProfileInternCopyWidget(),
        ),
        FFRoute(
          name: 'Setting_page_UniversitiesCopy',
          path: '/settingPageUniversitiesCopy',
          builder: (context, params) => const SettingPageUniversitiesCopyWidget(),
        ),
        FFRoute(
          name: 'service_tab_company_o2',
          path: '/serviceTabCompanyO2',
          builder: (context, params) => const ServiceTabCompanyO2Widget(),
        ),
        FFRoute(
          name: 'collaborate_tab_for_company_o1',
          path: '/collaborateTabForCompanyO1',
          builder: (context, params) => const CollaborateTabForCompanyO1Widget(),
        ),
        FFRoute(
          name: 'Notification_page',
          path: '/notificationPage',
          builder: (context, params) => const NotificationPageWidget(),
        ),
        FFRoute(
          name: 'postinternship_tab_for_company_o2',
          path: '/postinternshipTabForCompanyO2',
          builder: (context, params) => const PostinternshipTabForCompanyO2Widget(),
        ),
        FFRoute(
          name: 'Notification_pageCopy',
          path: '/notificationPageCopy',
          builder: (context, params) => const NotificationPageCopyWidget(),
        ),
        FFRoute(
          name: 'Partnership_page',
          path: '/partnershipPage',
          builder: (context, params) => const PartnershipPageWidget(),
        ),
        FFRoute(
          name: 'Partnership_page_2',
          path: '/partnershipPage2',
          builder: (context, params) => const PartnershipPage2Widget(),
        ),
        FFRoute(
          name: 'Program_Initiative_goverment',
          path: '/programInitiativeGoverment',
          builder: (context, params) => const ProgramInitiativeGovermentWidget(),
        ),
        FFRoute(
          name: 'homepage_gov_o4',
          path: '/homepageGovO4',
          builder: (context, params) => const HomepageGovO4Widget(),
        ),
        FFRoute(
          name: 'Collaboration_Pages',
          path: '/collaborationPages',
          builder: (context, params) => const CollaborationPagesWidget(),
        ),
        FFRoute(
          name: 'Profile_Goverement',
          path: '/profileGoverement',
          builder: (context, params) => const ProfileGoverementWidget(),
        ),
        FFRoute(
          name: 'Our_service_Gover',
          path: '/ourServiceGover',
          builder: (context, params) => const OurServiceGoverWidget(),
        ),
        FFRoute(
          name: 'profilepage_company_o1',
          path: '/profilepageCompanyO1',
          builder: (context, params) => const ProfilepageCompanyO1Widget(),
        ),
        FFRoute(
          name: 'Setting_page_gover',
          path: '/settingPageGover',
          builder: (context, params) => const SettingPageGoverWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signupPageOption1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Intern2Success_logo_edited_edited.webp',
                      width: 500.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
