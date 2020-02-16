# Software Engineering Concepts

[TOC]

## Framework Driven Development

### Library vs Framework (IoT)

- **Library**
  - Archives that contain shared code for **reuse**
    - Types (e.g., Classes, Interfaces, Abstract Classes) 
    - Exceptions
    - Annotations
- **Framework** (Inversion of control)
  - Implementations of common flows of logic with gaps that can be filled in by application code
  - User plug in their application code into the execution environment of the framework by extending and/or implementing framework-defined types
  - **Inversion of control**
    - The framework handles the flow of execution
  - **Dependency injection** (a form of inversion of control)
    - Dependencies in the framework code are satisfied by application code that injects those dependencies

### API (Application programming interface)

An API specifies how software components should interact.

## RESTful Services (Representational State Transfer)

REST = **Representational State Transfer**

Definition: an architectural style based on transferring representations of **resources** from a server to a client.

An architectural style to build web services 

- Light 
- Maintainable 
- Scalable

> In principle, REST is protocol independent
>
> In practice, almost every RESTful service uses **HTTP**

Representation for passing data: JSON (JavaScript Object Notation) & XML

### HTTP (Hypertext Transfer Protocol)

- Stateless 
- Application-layer 
- Used by modern web apps 
- Always request and response pairs

**Request** = URL + Verb 

**Response** = Status code + Message body



### CRUD (Create, Read, Update, Delete)

1. **Create**—bring the resource into existence. (**POST** is used to create a resource. It has associated data that defines the resource.)
2. **Read**—return a representation of the resource. (**GET**: Fetch an existing resource (identified by a URL))
3. **Update**—change the value of the resource. (**PUT** is used to update the value of a resource with data sent in request.)
4. **Delete**—make the resource inaccessible. (**DELETE** is used to delete the resource.)



### Business Entities vs. Data Transfer Objects (DTOs)

**Business Entities**: The entire business object is retrieved to client

**DTO**: Only a restricted view of the business entity is retrieved to the client.



## Software Quality Assurance

### Test-Driven Development (TDD)

- Write a failing unit test case. Run the test suite to prove that the test case fails.
- Implement just enough functionality to make the test case pass. Run the test suite to prove that the test case passes.
- Improve code as needed. In the example above we refactored the test suite, but often we'll need to refactor the functionality being implemented.
- Repeat until you are satisfied that the test suite provides evidence that your implementation is correct.

> Unit Test --> Integration Test

### Two dimensions of software quality assurance

- Validation (building the right product)
- Verification (building the product right)

Two varieties of techniques:

- **Static V&V** (Validation and Verification): analyses of the code (inspections)
- **Dynamic V&V**: executing the code (Testing)

Inspection is NOT a replacement of testing

### Software inspections (Static V&V)

- **Structured inspections**

  Roles:

  - Moderator (ensures the artifact is ready for review)
  - Recorder (document problems)
  - Reviewer (Analyzes and detects problems in the artifacts)
  - Reader (read aloud the logical units)
  - Producer (author of the artifact)

  Procedure: 

  1. Planning (moderator)
  2. Group preparation
  3. Individual preparation
  4. Review meeting
  5. Error correction & Improvement
  6. Follow-up checks

- **Modern reviews **(Ex. Open source)

  Roles:

  - Author (wrote the code)
  - Reviewer (analyze and detect problems) --> volunteers
  - Integrator (make final decision)
  - Verifier (check functional correctness)

  Procedure:

  1. Upload patch
  2. Execute sanity checks
  3. Notify relevant reviewers
  4. Reviewers assess the patch
  5. Integrate into VCS (version control system)

### Dynamic V&V

**Fault** (Bug): mistakes made by people

**Error**: result of a fault in software artifacts

**Failure**: occur when an error results in erroneous service

**Incident**: consequences of failures

--> Gain confidence in the system

- **Test cases**
  - a set of inputs and list a set of expected outputs
- **Test stubs**
  - partial implementations of components on which a component under test (CUT) depends
- **Test drivers**
  - partial implementations of components that exercise and depend on the tested component

> **Stubs** are dummy modules that always used to simulate the low level modules.
>
> **Stubs** are the called programs.
>
> **Stubs** are used when sub programs are under construction.
>
> **Stubs** are used in top down approach
>
> **Drivers** are dummy modules that always used to simulate the high level modules.
>
> **Drivers** are the calling programs.
>
> **Drivers** are only used when main programs are under construction.
>
> **Drivers** are used in bottom up integration.



**Exhaustive testing**: Testing all possible input combinations is often infeasible



Procedure of testing

1. Unit Testing (visibility of code details)
2. Integration Testing (visibility of integrated structure --> test multiple units together)
3. System Testing (requirement and specifications --> test the whole system together; test by the engineering)  
4. Acceptance Test (User test)



#### Black-Box vs White-Box Testing

**Black-box testing**: (Are requirements there?) 

- Tests that are written **without** considering how the code is written (based on specs)

- Treats the system like an opaque box that accepts inputs and checks outputs

  > System Test; Stress Test; Acceptance Test

- Advantage: Scales up; Check conformance with spec

- Disadvantage: Does not tell how much of the system is being tested

**White-box testing**: (Functionality) 

- Tests that are written with an understanding of the structure of the code 

- Tests the inner workings of the system itself

  > Unit Test; Integration Test

- Advantage: Allows for measuring “**test coverage**” of system

- Disadvantage: Cannot reveal missing functionality!

**Oracle**: expected results































 