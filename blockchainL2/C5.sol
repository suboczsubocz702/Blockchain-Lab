// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract TaskWorkflow {
    enum TaskStatus { Todo, InProgress, Done }
    TaskStatus public status;
    function startTask() public {
        require(status == TaskStatus.Todo, "Zadanie juz rozpoczęte lub zakonczone");
        status = TaskStatus.InProgress;
    }
    function completeTask() public {
        require(status == TaskStatus.InProgress, "Najpierw rozpocznij zadanie");
        status = TaskStatus.Done;
    }
}
