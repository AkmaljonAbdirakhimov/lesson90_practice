import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Box _todosBox;

  final TextEditingController _todoController = TextEditingController();
  List<Map<dynamic, dynamic>> _todos = [];

  @override
  void initState() {
    super.initState();

    _initTodos().then((_) {
      _getTodos();
    });
  }

  Future<void> _initTodos() async {
    _todosBox = await Hive.openBox("todos");
  }

  void _getTodos() {
    if (_todosBox.containsKey("todos")) {
      _todos = List<Map<dynamic, dynamic>>.from(_todosBox.get("todos"));
      setState(() {});
    }
  }

  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todos.add(
            {'title': _todoController.text, 'date': DateTime.now().toString()});
        _todosBox.put("todos", _todos);
        _todoController.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
      _todosBox.put("todos", _todos);
    });
  }

  void _editTodo(int index) {
    // Implement your edit logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Todo',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _todos[index]['title']!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_todos[index]['date']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _deleteTodo(index),
                          child: const Text(
                            'delete',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _editTodo(index),
                          child: const Text(
                            'edit',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
