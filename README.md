# To-Do List App in Swift

A simple To-Do List application built in Swift that allows users to create, complete, and delete tasks. This is a command-line version of a task manager that can be extended with a user interface or other features in the future.

## Features
- **Add tasks**: You can add new tasks to the list.
- **Toggle completion**: You can mark tasks as completed or pending.
- **Remove tasks**: You can remove tasks from the list.

## How It Works
This app uses the following components:
- **Task Class**: Represents a single task with a name and a completion status.
- **TaskManager Class**: Manages the list of tasks. It supports adding tasks, toggling completion status, and removing tasks.

### Example of Usage
```swift
// Create a task manager instance
let taskManager = TaskManager()

// Add some tasks
taskManager.addTask(name: "Buy groceries")
taskManager.addTask(name: "Walk the dog")
taskManager.addTask(name: "Finish Swift project")

// Toggle the completion status of a task
taskManager.toggleTaskCompletion(at: 0)

// Print tasks
taskManager.printTasks()

// Remove a task
taskManager.removeTask(at: 1)

// Print tasks after removal
taskManager.printTasks()
How to Build On It
Feel free to fork or clone this repository to add new features, such as:

User interface: Build a UI using SwiftUI or UIKit.

Persistence: Store tasks in a file or database.

Advanced features: Add due dates, task categories, or priorities.

Contributing
If you want to contribute to this project:

Fork the repository.

Create a new branch for your feature or bug fix.

Open a pull request with your changes.

License
This project is open-source under the MIT License.

markdown
Copy code

### How to Set This Up:

1. **Create a GitHub Repository**:
   - Go to GitHub and create a new repository (e.g., `todo-app-swift`).
   - Clone the repository to your local machine.

2. **Add the Code**:
   - Create a new Swift file (e.g., `TodoApp.swift`).
   - Paste the provided Swift code into this file.
   
3. **Create the README**:
   - Create a `README.md` file in the root directory of your project.
   - Paste the `README.md` content provided above.

4. **Commit and Push**:
   - Open your terminal/command line.

"Code is not just a language, it’s a way of thinking, creating, and solving problems." 

Made by Gidon Joseph !
   - Navigate to the project folder.
   - Run the following commands to commit and push the changes:
