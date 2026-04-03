// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract CourseRegistry {
    struct Course {
        uint id;
        string name;
        address instructor;
        address[] students;
    }
    enum EnrollmentStatus { NotEnrolled, Enrolled }
    mapping(uint => Course) public courses;
    mapping(uint => mapping(address => EnrollmentStatus)) public enrollment;
    function createCourse(uint id, string memory name) public {
        courses[id].id = id;
        courses[id].name = name;
        courses[id].instructor = msg.sender;
    }
    function enroll(uint id) public {
        require(enrollment[id][msg.sender] == EnrollmentStatus.NotEnrolled, "Juz zapisany");
        courses[id].students.push(msg.sender);
        enrollment[id][msg.sender] = EnrollmentStatus.Enrolled;
    }
    function getStudents(uint id) public view returns (address[] memory) {
        return courses[id].students;
    }
}
