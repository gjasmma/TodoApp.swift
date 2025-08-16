Step 1: Setting Up SwiftUI

Since you were running into issues with SwiftUI before, I’ll assume you’re now using an environment that supports SwiftUI. If you're on an Xcode project, the UI code can go directly into ContentView.swift.

Step 2: Basic UI Design

We will:

Display a list of tasks.

Allow the user to add new tasks.

Allow the user to mark tasks as completed or delete them.

Step 3: Create a SwiftUI View for Task List

Here's a simple SwiftUI interface that mirrors your existing logic. We will:

Display tasks in a list.

Add new tasks via a button.

Toggle completion status for each task.

Delete tasks.

import SwiftUI

// Task model
class Task: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    @Published var isCompleted: Bool
    
    init(name: String, isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() {
        isCompleted.toggle()
    }
}

// Task Manager to manage tasks
class TaskManager: ObservableObject {
    @Published var tasks = [Task]()
    
    func addTask(name: String) {
        let newTask = Task(name: name)
        tasks.append(newTask)
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func toggleTaskCompletion(at index: Int) {
        tasks[index].toggleCompletion()
    }
}

// Content View for the UI
struct ContentView: View {
    @StateObject private var taskManager = TaskManager()
    @State private var newTaskName = ""
    
    var body: some View {
        VStack {
            // Header
            Text("Task Manager")
                .font(.largeTitle)
                .padding()
            
            // New Task Input Field
            HStack {
                TextField("New Task", text: $newTaskName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if !newTaskName.isEmpty {
                        taskManager.addTask(name: newTaskName)
                        newTaskName = ""
                    }
                }) {
                    Text("Add")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            // Task List
            List {
                ForEach(taskManager.tasks) { task in
                    HStack {
                        Text(task.name)
                            .strikethrough(task.isCompleted, color: .gray)
                        
                        Spacer()
                        
                        Button(action: {
                            if let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskManager.toggleTaskCompletion(at: index)
                            }
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                        
                        Button(action: {
                            if let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskManager.removeTask(at: index)
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                }
                .onDelete(perform: delete)
            }
        }
        .padding()
    }
    
    // Handle task deletion
    func delete(at offsets: IndexSet) {
        taskManager.tasks.remove(atOffsets: offsets)
    }
}

// Preview for SwiftUI canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

Explanation:

Task Model:

Task now conforms to Identifiable so that SwiftUI can uniquely identify each task in the list.

The ObservableObject protocol allows the Task class to notify the view when the completion status changes (@Published makes isCompleted reactive).

Task Manager:

TaskManager holds the array of tasks and has methods to add, remove, and toggle tasks.

@Published ensures that updates to tasks trigger UI updates.

UI (ContentView):

TextField: Used for entering new tasks.

Button: Adds the task to the TaskManager.

List: Displays each task with an option to:

Mark as completed (toggle completion).

Delete the task.

ForEach: This is used to dynamically display each task.

Buttons:

The checkmark button toggles the completion status.

The trash button removes the task.

Swipe-to-Delete: onDelete allows for swipe-to-delete functionality in the list.

Step 4: Run the App

Launch the app in the SwiftUI preview or on the simulator to test:

Add tasks using the text field and the "Add" button.

Toggle completion with the checkmark button.

Delete tasks with the trash button or swipe-to-delete.

Step 5: Optional Enhancements

Styling: You can make the app more visually appealing by customizing fonts, colors, and button styles.

Persistence: Add a simple persistence solution (like UserDefaults or CoreData) to store the tasks even after the app is closed.

More Features: Consider adding filters for completed and pending tasks, or adding due dates.

Step 6: Next Steps

You can:

Experiment with animations when toggling the completion status (e.g., a smooth transition between the checkmark states).

Add alert dialogs to confirm deletion of tasks, ensuring the app is user-friendly.

Test on different devices and screen sizes to ensure responsiveness.
