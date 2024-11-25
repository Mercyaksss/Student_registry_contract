# Student Registry Smart Contract

This project contains a **Student Registry Smart Contract** built using **Solidity** for managing student registrations on the Ethereum blockchain. It allows students to register by paying a fee, with each registration including a unique ID. The contract also includes functions for fetching student information, updating registration status, and deleting students from the registry.

### Key Features:

- **Student Registration**: Students can register by paying a 0.5 ETH fee.
- **Owner-Only Functions**: Only the contract owner can delete students and withdraw funds.
- **Mapping and Structs**: Stores student information using structs and mappings with unique IDs.
- **Fee Mechanism**: Requires a 0.5 ETH registration fee per student.
- **Student Deletion**: Allows the owner to delete a student from the registry.

### How It Works:

1. **Register a Student**: Call `registerStudent` with the student's name, age, and a 0.5 ETH fee.
2. **Get Student Details**: Fetch student details by ID using `getStudentById`.
3. **Delete Student**: Only the owner can delete a student using `deleteStudent`.

### Technologies Used:

- **Solidity** for smart contract development
- **Ethereum** blockchain
- **Thirdweb** for deployment and interaction
- **Hardhat** for local blockchain simulation and testing

### Deployment:

The contract is deployed on the Ethereum network and is managed via Thirdweb SDK.

### Setup Instructions:

1. Clone the repository:  
   ```bash
   git clone <repo_url>

2. Navigate to the project directory:
     ```bash
    cd <repo_name>

3. Install dependencies:
     ```bash
    npm install


### Usage Instructions:
If there’s any frontend or other tools you're using to interact with the contract, describe it here.

```markdown
### Usage Instructions:

1. Register a Student: 
   - Call the `registerStudent` function, passing the student's name, age, and a 0.5 ETH fee.
   
2. Get Student Details: 
   - Use `getStudentById` to retrieve the student's information by providing the student's unique ID.

3. Delete Student:
   - Only the owner can call `deleteStudent` to remove a student from the registry.

You can interact with the contract using Hardhat or integrate it with a frontend to allow users to register students easily.
# Student_registry_contract
