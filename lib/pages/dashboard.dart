import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tasklist = [
      TodoTile(
        id: 1,
        taskname: "Market Research",
        time: "10:00 AM (10 minutes ago)",
        status: "Done",
        statusColor: const Color.fromARGB(255, 180, 161, 253),
        indicatorColor: const Color(0xFF8B7FBD),
        icon: Icons.assist_walker,
      ),
      TodoTile(
        id: 2,
        taskname: "Competitive Analysis",
        time: "12:00 PM",
        status: "In Progress",
        statusColor: const Color.fromARGB(255, 255, 133, 52),
        indicatorColor: const Color(0xFFFFA366),
        icon: Icons.work,
      ),
      TodoTile(
        id: 5,
        taskname: "Create Low-fidelity Wireframe",
        time: "07:00 PM",
        status: "To-do",
        statusColor: const Color.fromARGB(255, 64, 160, 255),
        indicatorColor: const Color(0xFF7DB8F3),
        icon: Icons.house,
      ),
      TodoTile(
        id: 4,
        taskname: "How to pitch a Design Sprint",
        time: "09:00 PM",
        status: "To-do",
        statusColor: const Color.fromARGB(255, 141, 249, 92),
        indicatorColor: const Color.fromARGB(255, 147, 253, 149),
        icon: Icons.check_circle,
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return tasklist[index];
        },
        itemCount: tasklist.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/add_todo");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  final int id;
  final String taskname;
  final String time;
  final String status;
  final Color statusColor;
  final Color indicatorColor;
  final IconData icon;

  const TodoTile({
    required this.id,
    required this.taskname,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.indicatorColor,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left section: ID, Task name, Time with indicator
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  // Task info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID: ${id.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 12, 12, 12),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          taskname,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,

                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 12, 12, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: indicatorColor.withAlpha(50),
                    ),
                    child: Icon(icon, color: indicatorColor),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Delete icon
          ],
        ),
      ),
    );
  }
}
