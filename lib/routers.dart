import "package:go_router/go_router.dart";
import "package:todo_recreate/pages/dashboard.dart";
import "package:todo_recreate/pages/add_todo.dart";

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: "dashboard",
      path: "/",
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      name: "add_todo",
      path: "/add_todo",
      builder: (context, state) => const AddTodo(),
    ),
  ],
);
