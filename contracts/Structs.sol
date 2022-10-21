// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract ToDoList {
    //Declare a struct which groups together two data types
    struct ToDoItem {
        string text;
        bool completed;
    }

    //Create an array of ToDoItem structs
    ToDoItem[] public todos;

    function createToDo(string memory _text) public {
        // There are multiple ways to initialize structs

        // Method 1 - Call it like a function
        todos.push(ToDoItem(_text, false));

        // Method 2 - Explicity set its keys
        todos.push(ToDoItem({text: _text, completed: false}));

        // Method 3 - Initialize an empty struct, then set individual properties
        ToDoItem memory todo;
        todo.text = _text;
        todo.completed = false;
        todos.push(todo);
    }

    // Update a struct value
    function update(uint _index, string memory _text) public {
        todos[_index].text = _text;
    }

    // Update completed
    function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }
}