import Foundation

// Task class definition
class Task {
    var name: String
    var isCompleted: Bool
    
    // Initializer to create a task with a name and optional completion status
    init(name: String, isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
    
    // Method to toggle the completion status of the task
    func toggleCompletion() {
        isCompleted.toggle()
    }
}

// Task Manager class to manage tasks
class TaskManager {
    var tasks: [Task] = []
    
    // Method to add a new task
    func addTask(name: String) {
        let newTask = Task(name: name)
        tasks.append(newTask)
    }
    
    // Method to remove a task at a specified index
    func removeTask(at index: Int) {
        if index >= 0 && index < tasks.count {
            tasks.remove(at: index)
        }
    }
    
    // Method to toggle the completion status of a task at a specified index
    func toggleTaskCompletion(at index: Int) {
        if index >= 0 && index < tasks.count {
            tasks[index].toggleCompletion()
        }
    }
    
    // Method to print all tasks and their statuses
    func printTasks() {
        for task in tasks {
            print("\(task.name) - \(task.isCompleted ? "Completed" : "Pending")")
        }
    }
}

// Example usage of TaskManager
let taskManager = TaskManager()

// Adding tasks
taskManager.addTask(name: "Buy groceries")
taskManager.addTask(name: "Walk the dog")
taskManager.addTask(name: "Finish Swift project")

// Toggling completion status for the first task
taskManager.toggleTaskCompletion(at: 0)

// Print all tasks to verify
taskManager.printTasks()

// Removing a task
taskManager.removeTask(at: 1)

// Print tasks after removal
taskManager.printTasks()
