import 'package:styria_flutter_web/pages/apps_page.dart';
import 'package:styria_flutter_web/pages/classifieds_details_page.dart';
import 'package:styria_flutter_web/pages/classifieds_page.dart';
import 'package:styria_flutter_web/pages/conference_room_page.dart';
import 'package:styria_flutter_web/pages/create_expense_page.dart';
import 'package:styria_flutter_web/pages/appstore_page.dart';
import 'package:styria_flutter_web/pages/awards_page.dart';
import 'package:styria_flutter_web/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/pages/expense_details_page.dart';
import 'package:styria_flutter_web/pages/expense_page.dart';
import 'package:styria_flutter_web/pages/events_details_page.dart';
import 'package:styria_flutter_web/pages/events_page.dart';
import 'package:styria_flutter_web/pages/feeds_v2_page.dart';
import 'package:styria_flutter_web/pages/insight_page.dart';
import 'package:styria_flutter_web/pages/links_page.dart';
import 'package:styria_flutter_web/pages/login_page.dart';
import 'package:styria_flutter_web/pages/news_details_page.dart';
import 'package:styria_flutter_web/pages/news_page.dart';
import 'package:styria_flutter_web/pages/organisation_page.dart';
import 'package:styria_flutter_web/pages/people_page.dart';
import 'package:styria_flutter_web/pages/planner_page.dart';
import 'package:styria_flutter_web/pages/skills_page.dart';
import 'package:styria_flutter_web/pages/user_details_page.dart';
import 'package:styria_flutter_web/pages/time_report_page.dart';
import './../pages/profile_details_page.dart';
import './../constants/route_constants.dart';

final goRouter = GoRouter(routes: [
  GoRoute(
    path: AppRoute.home,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const DashboardPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.apps,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const AppsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.planner,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const PlannerPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.insight,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const InsightPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.organisation,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const OrganisationPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.links,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const LinksPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.news,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const NewsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.newsDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const NewsDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.skills,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const SkillsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.expense,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ExpensePage(),
    ),
  ),
  GoRoute(
    path: AppRoute.expenseDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ExpenseDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.createExpense,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const CreateExpensePage(),
    ),
  ),
  GoRoute(
    path: AppRoute.awards,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const AwardsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.feeds,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const FeedsV2Page(),
    ),
  ),
  GoRoute(
    path: AppRoute.events,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const EventsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.eventDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const EventsDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.appstore,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const AppStorePage(),
    ),
  ),
  //  GoRoute(
  //   path: '/feedsv2',
  //   pageBuilder: (context, state) => NoTransitionPage<void>(
  //     key: state.pageKey,
  //     child: const FeedsV2Page(),
  //   ),
  // ),
  // GoRoute(
  //   path: '/appstore',
  //   pageBuilder: (context, state) => NoTransitionPage<void>(
  //     key: state.pageKey,
  //     child: const AppStorePage(),
  //   ),
  // ),
  GoRoute(
    path: AppRoute.login,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const LoginPage(),
    ),
  ),
  // GoRoute(
  //   path: '/feeds',
  //   pageBuilder: (context, state) => NoTransitionPage<void>(
  //     key: state.pageKey,
  //     child: const FeedsPage(),
  //   ),
  // ),
  GoRoute(
    path: AppRoute.people,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const PeoplePage(),
    ),
  ),
  GoRoute(
    path: AppRoute.userDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const UserDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.profile,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ProfileDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.timeReport,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const TimeReportPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.classifieds,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ClassifiedsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.classifiedDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ClassifiedsDetailsPage(),
    ),
  ),
  GoRoute(
    path: AppRoute.bookConferenceRoom,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: ConferenceRoomPage(),
    ),
  ),
]);
