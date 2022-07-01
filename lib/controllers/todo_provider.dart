/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider_example/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  // TODO: program your provider as you want
  // initialize data
  String? _title;
  String? _dsc;
  final List<TodoModel?> _listTodos = [];
  TodoModel? _selectedTodo;

  // setters
  setTitle(String val) async {
    _title = val;
    notifyListeners();
  }

  setDsc(String val) async {
    _dsc = val;
    notifyListeners();
  }

  addToList(TodoModel val) async {
    _listTodos.add(val);
    notifyListeners();
  }

  removeFromList(int id) async {
    _listTodos.removeWhere((element) => element!.id == id);
    notifyListeners();
  }

  updateList(TodoModel val) async {
    _listTodos[_listTodos.indexWhere((element) => element!.id == val.id)] = val;
    notifyListeners();
  }

  selectTodo(TodoModel val) async {
    _selectedTodo = val;
    notifyListeners();
  }

  // getters
  String? get title => _title;
  String? get dsc => _dsc;
  List<TodoModel?> get listTodos => _listTodos;
  TodoModel? get selectedTodo => _selectedTodo;
}
