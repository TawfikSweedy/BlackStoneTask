# BlackStoneTask

## Introduction
`BlackStoneTask` is an iOS application built using the **VIPER** architecture to enforce the separation of concerns, making the codebase more modular, scalable, and maintainable. For networking, we use the **MOYA** library, and **PromiseKit** is integrated to simplify asynchronous operations.

---

## Architecture
The project follows the **VIPER** architecture, which stands for:
- **View**: Responsible for the user interface and displaying data.
- **Interactor**: Contains business logic and handles data.
- **Presenter**: Acts as a mediator between the `View` and `Interactor`, coordinating data flow.
- **Entity**: Defines the data models.
- **Router**: Handles navigation between different screens.

### Why VIPER?
- **Code Organization**: Each layer has a specific responsibility, making the code easier to maintain and extend.
- **Improved Testability**: The clear separation of concerns allows for better unit testing.

---

## Networking
The project utilizes **MOYA** for handling all network requests. **MOYA** is built on top of **Alamofire** and provides a cleaner and more structured approach to networking by abstracting API definitions.

### Why MOYA?
- **Readable API Layer**: MOYA makes network requests cleaner and more readable by defining endpoints and network logic in a structured manner.
- **Customizable**: It is highly configurable and integrates well with other libraries like **PromiseKit**.

---

## Asynchronous Operations
The project leverages **PromiseKit** to handle asynchronous tasks in a more elegant and readable way, avoiding the traditional callback hell.

### Why PromiseKit?
- **Simplified Code**: Promises offer a more declarative way to handle asynchronous tasks, making the code easier to understand and maintain.
- **Chainable Operations**: Promises allow chaining multiple asynchronous operations in a clear and linear manner.

---

## How to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/TawfikSweedy/BlackStoneTask.git
