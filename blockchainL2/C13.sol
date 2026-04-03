// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract TaskManager {
    enum TaskStatus { Todo, InProgress, Done }
    struct Task {
        uint id;
        string title;
        TaskStatus status;
        address creator;
    }
    mapping(uint => Task) public tasks;
    uint public taskCount;
    function createTask(string memory title) public {
        tasks[taskCount] = Task(taskCount, title, TaskStatus.Todo, msg.sender);
        taskCount++;
    }
    function startTask(uint id) public {
        require(tasks[id].status == TaskStatus.Todo, "Niepoprawny status");
        tasks[id].status = TaskStatus.InProgress;
    }
    function completeTask(uint id) public {
        require(tasks[id].status == TaskStatus.InProgress, "Najpierw rozpocznij");
        tasks[id].status = TaskStatus.Done;
    }
}
