# Software Engineering Concepts

[TOC]

## Software Engineering Process

1. Specification 
2. Development
3. Validation
4. Evolution



### Waterfall

- Requirement analysis & definition
- System and software design
- Implementation and unit testing
- Integration and system testing
- Operations and maintenance

Pros:

- rigid process
- plan driven

Cons:

- activities are isolated
  - late-changing

> Fit: Embedded systems, safety-critical systems



### Incremental

Fast release!

Pros:

- Flexible

Cons:

- Large organizations with many teams struggled to adopt

> Fit: consumer software, web-based systems, mobile apps



### Agile (Scrum)

- Individuals & interaction > Processes & tools
- working software > comprehensive documentation
- customer collaboration > contract negotiation
- reacting to change > following plan

**Planning**

- release planning (several months)
- sprint / iteration planning (2-4 weeks)

**Sprints**

- units of time for agile (scrum-based)
- begin with **planning session** (backlog tasks)
- end with **retrospective** (improve?)

**Backlog**

- backlog is a list of outstanding tasks to be completed
  - can add or change priority
  - task is never removed
- ordered by priority
- tasks usually map to issue reports

**User Stories**

- User requirement written in customer’s language
- As a `type of user`, I would like `feature description` so that `rationale`

**Epics**

- Long-term objectives in agile software projects
- Composed of a set of related user stories that may span multiple sprints

**Story Points**: Unit of effort estimation

- product manager assign
- planning poker

**Velocity**: How many ranked user stories can be completed in a given time?

> sprint planning --> daily scrum (stand-up) --> sprint/iteration review --> sprint retrospective



---



## Version Control System

Offline accessibility: git is Distributed Version Control System (DVCS)

Branch and merge operations: DVCS clients can create and merge branches as lightweight operations on their client machines



### Git Operations

`git clone`

`git log \ git branch \ git tag`

`git checkout <branch> <commit>`

`git add`  

`git commit`

`git merge`

`git reset \ revert \ rebase`

`git push`

`git fetch \ pull`



### GitHub

The defacto standard Git service provider: 

- GitHub hosts Git repositories for open source and proprietary software projects

Features:

- Fork 
  - Forking allows you to create a deep copy of said repository in your own GitHub profile
- Pull Request 
  - A pull request signals to the forked repository that your fork contains changes that you’d like to integrate
  - After pushing changes from your client to your fork repo, you can create a pull request from its GitHub page
- Issue tracking
  - Issues are used to plan project development
- Social feature



### Software Release & Continuous Integration (CI)

1. Integration

2. Build

3. Deployment

   Loop: Commit --> Build --> Test --> Report

**CI tools:** 

- Download and install: Hudson/Jenkins; CruiseControl; Buildbot
- Cloud-based: CloudBees; TravisCI; CircleCI



---



## Build System

Build systems describe how sources are translated into deliverables

- **low-level**
  - explicitly defined dependencies and rules for each input and output file
- **abstraction-based**
  - derive low-level build code from high-level data like maps of deliverables to file lists
- **framework-driven**
  - Follows the principle of **<u>“convention over configuration,”</u>** where default
    behavior is assumed unless explicitly overridden
- **testing-frameworks**
  - Manage the execution of automated tests and generate reports
- **dependency-management**
  - Resolve and acquire dependent libraries and tools



###  Low-level (make file)

- expressing dependencies
- writing recipes



### Framework-driven

#### Maven

- Maven assumes that a build job follows a **lifecycle** 
- A lifecycle is a sequential series of **phases** 
- A phase performs a series of **goals** that are bound via **plugins**

**lifecycle**

- Default: Produces the project deliverables 
- Clean: Undoes build commands to return the project to its initial state (i.e., just after cloning and checkout)
- Site: Generates the project website materials



#### Gradle

**Gradle build model** 

- **Task graph**: Directed acyclic graph (DAG) of tasks

- Gradle determines which tasks to run based on that

**Tasks: units of work** 

- **Actions**: copy file, compile source, etc. 
- **Inputs**: values, files, directories on which actions operate
- **Outputs**: files, directories that the actions modify

**Configuration files** 

- Determined by naming conventions
- `settings.gradle`: project initialization and configuration
- `build.gradle`: definition of build tasks (Groovy-style)

> Initialization --> Configuration --> Execution

> Gradle phases != Maven phases 
>
> Maven phase ≈ Gradle task graph



---



## Requirements Engineering

Requirements are either: 

1. A condition or capability needed by a user to solve a problem or achieve an objective.
2. A condition or capability that must be met or possessed by a system […] to satisfy a contract, standard, specification, or other formally imposed document.



### User requirements (High-level reqs) everyone understands

Describe the services the system is expected to provide



### System requirements (Low-level reqs) detailed

Detailed descriptions of system functions and operational constraints



### Functional requirements 

- Describe what the system should do
- Typically attributed to one component of the system
- Typical form: “The system shall do …”



### Non-functional (extrafunctional) requirements

- Specify properties of the system as a whole
- Typical form: “The system shall be …” (but many variations are possible)
- Be careful: often overlooked

> Speed, size, ease of use, reliability, robustness, protability



### Challenges

- Ambiguous: 
  - Understood differently by different teams 
- Incomplete: 
  - Some system features are missing 
- Inconsistent: 
  - Requirements are contradicting with each other 
- Unquantifiable: 
  - Cannot be validated / measured 
  - E.g. "System should be bug free"
- What vs. how: 
  - Never describe <u>how</u> the system should deliver the requirement
  - Focus on <u>what</u> the system should do



### Characteristics of Good Requirements

- Feasibility - Avoid wishful thinking
- Necessity - Provides the details of the desired end goal
- Testability - Contains quantifiable success criteria



---



## UML (Unified Modeling Language)

- Workflow / business process / behavior / communication
  - UML activity diagrams
  - UML sequence diagrams
- Functions / use cases
  - UML use case diagrams
- Domain models / data structures
  - UML class diagram



### Use case diagrams 

- Capture main features / functions of the system
- Capture how end users interact with the system
- Using a graphical notation

**Actors**: 

- Role played in the system

- Depicted using stick figures
- Can represent a user or an external system

**Use Case**:

-  Naming: Verb + Subject

**Connections**: 

- Lines connect the actors to use cases that they can initiate

**Good Practices**:

- Put the most important Actors and UCs to the top-left corner
- Use several diagrams to avoid clutter (at most 5-7 UCs per diagram)
- Actors on the left/ right, UCs in the middle



### Class diagrams

- Capture key concepts and relations in a domain
- Frequently serves as basis of database design
  - used by **object-relational mapping (ORM)** (Hibernate)
- Defines structure of various serialization formats

[Read more here](https://github.com/yingjie-xu/notes_public/blob/master/notes/uml_diagrams.pdf)



---



## Data Persistence Technologies

Application data should persist when: 

- the application is closed 
- If the application crashes (hopefully, this doesn’t happen!)

**Database**

- Are designed to store and retrieve data efficiently
- Pros: 
  - Space-efficient (uses as little storage space as possible)
  - Quick (data retrieval is usually fast)

- Cons: 
  - Complex 
  - Requires specialized maintenance and operators

[Read more here](https://github.com/yingjie-xu/notes_public/blob/master/notes/SQL_summary.md)

How to systematically design such tables? 

- Design data storage in domain models

- Use object-relational mapping (ORM)



### Java Database Connectivity (JDBC)

- A Java standard that defines the API for connecting Java applications to DBMSs
- There are JDBC drivers that implement the API for most of the popular DBMSs

Pros: 

- Gives powerful, low-level access to the power of SQL from within the Java programming environment

- Errors can be handled smoothly using standard Java exception handling practices (i.e., try-catch blocks)

Cons: 

- SQL statements tend to be embedded in the Java code, leading do increased program complexity

- A mapping between concepts in the object-oriented (Java) and the relational DB (SQL) scopes needs to be specified and maintained (painful for large applications)



### Object Relational Mapping (ORM)

An OO programming concept that defines a design time mapping 

- Input: 
  - Domain model (UML Class Diagram)

- Output: 
  - Relational database tables (e.g. SQL commands)
  - Foreign key constraints

**Tools:**

- Java Persistence API (**JPA**) --> **style**
- **Hibernate** (ORM tool) --> **tool** of the style



### Java Persistence Query Language (JPQL)

- Declarative object-oriented query language for JPA
- Syntax is similar to SQL 
- Query retrieves a set of entities (objects) 
  - Rather then rows as in SQL
- Each query is accessible as a query method
- `@Query` annotation contains the JPQL query

```java
@Query("SELECT c FROM Course c") 
Collection<Course> findAllCourses();
```



### CRUD Operations

- Create 
- Read 
- Update
- Delete



### JPA Entity Lifecycle

[Read more here](https://www.objectdb.com/java/jpa/persistence/managed)



---



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



---



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



---



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
- **Test stubs ** *(Replaces a called module)*
  - partial implementations of components on which a component under test (CUT) depends
  - Must be declared/invoked like the real unit 
    - Same name 
    - Same parameter list and return type
    - Same modifiers (e.g., static)
- **Test drivers ** *Replaces a calling module*
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



<u>**Procedure of testing**</u>

1. **Unit Testing** (visibility of code details)
2. **Integration Testing** (visibility of integrated structure --> test multiple units together)
3. **System Testing** (requirement and specifications --> test the whole system together; test by the engineering)  
4. **Acceptance Test** (User test)



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



### Development Testing: Unit Testing with Equivalence Partitioning 

Inputs can be thought of as members of sets with common characteristics

- Select test cases on the edge of the partitions 
- Select a test case near the middle as well

> ex. For the GRE score between 130 and 170
>
> ​      Test for: 129, 150 (middle), 171
>
> ex. To check for valid password --> only one test fulfill all the requirements
>
> ​      To check for invalid password --> create a test for each of requirement

***<u>Idea</u>***: One test case covers all valid equivalence. One test case for each invalid equivalence class



#### Key phases of unit testing

1. **setup**: Prepare the system for executing the test case
2. **call**: Call the method under test
3. **assertion**: Check that the system state is in its expected form
4. **teardown**: Clean up after a test



### Development testing: Integration Testing (ref Dynamic V&V)

1. Big Bang integration strategy (All at once)
2. Top-Down integration strategy (Few drivers needed, but many stubs)
3. Bottom-Up integration strategy (Few stubs needed, but many drivers)

**Guidelines for interface testing**

1. Examine the code to be tested and identify each call to an external component
2. Where objects are accepted as parameters, always test a null input
3. Design tests to deliberately cause the component to fail
4. Where components use a shared memory interface, design tests to vary their order of access



### Development Testing: System Testing (Use case based testing)

different teams work on the same project

Each project should outline testing policies to reach the level of risk that is comfortable

1. All system functions that are accessed through **menus** should be tested
2. Combinations of functions that are accessed through the same menu must be tested
3. Where user input is provided, all functions must be tested with correct and invalid input

UML sequence diagrams



### Release Testing

- Technically speaking, some development organizations write white-box system tests 
- Release tests are never white-box tests, they are always black-box!



### User Testing

Types of user tests 

- Alpha tests: 
  - A select group of users works closely with the development team to test early releases 
  - Defects are expected, but alpha users get access to “bleeding edge” features!

- Beta tests: 
  - A larger group of users is allowed to experiment with a release









 