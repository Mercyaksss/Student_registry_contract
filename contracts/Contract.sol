// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract StudentRegistry {
    struct Student {
        uint256 id;         // Unique ID for the student
        address addr;       // Address of the student
        string name;        // Name of the student
        uint8 age;          // Age of the student
        bool isRegistered;  // Registration status
    }

    // Address of the contract owner
    address public owner;

    // Registration fee
    uint256 public registrationFee = 0.5 ether;

    // Modifier to restrict certain functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Constructor to initialize the owner
    constructor() {
        owner = msg.sender;
    }

    // Mappings
    mapping(uint256 => Student) public students;
    mapping(address => bool) public hasRegistered;

    // Counter to track the next student ID
    uint256 public studentCounter;

    // Events
    event StudentRegistered(uint256 id, address addr, string name, uint8 age);
    event StudentDeleted(uint256 id, address addr);
    event FundsWithdrawn(address owner, uint256 amount);

    // Function to register a student
    function registerStudent(string memory _name, uint8 _age) public payable {
        require(msg.value == registrationFee, "Incorrect registration fee");
        require(!hasRegistered[msg.sender], "You are already registered");

        // Increment the counter to generate a new ID
        studentCounter++;

        // Add the student to the mapping using the new ID
        students[studentCounter] = Student({
            id: studentCounter,
            addr: msg.sender,
            name: _name,
            age: _age,
                        isRegistered: true
        });

        // Mark the sender as registered
        hasRegistered[msg.sender] = true;

        // Emit the registration event
        emit StudentRegistered(studentCounter, msg.sender, _name, _age);
    }

    // Function to get a student by their ID
    function getStudentById(uint256 _id) public view returns (uint256, address, string memory, uint8, bool) {
        Student memory student = students[_id];
        require(student.isRegistered, "Student not found");
        return (student.id, student.addr, student.name, student.age, student.isRegistered);
    }

    // Function to delete a student by their ID
    function deleteStudent(uint256 _id) public {
        Student memory student = students[_id];
        require(student.isRegistered, "Student not found");
        require(msg.sender == student.addr || msg.sender == owner, "Unauthorized deletion");

        // Clear registration status
        hasRegistered[student.addr] = false;

        // Delete the student from the mapping
        delete students[_id];

        // Emit the deletion event
        emit StudentDeleted(_id, student.addr);
    }

    // Function to update the registration fee (owner only)
    function updateRegistrationFee(uint256 _newFee) public onlyOwner {
        registrationFee = _newFee;
    }

    // Function to withdraw contract balance (owner only)
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        payable(owner).transfer(balance);

        // Emit the withdrawal event
        emit FundsWithdrawn(owner, balance);
    }

    // Receive function to accept ETH
    receive() external payable {}
}

