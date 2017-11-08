# Bangazon CLI 

Allow a Bangazon employee user to interact with a basic product ordering database via a command line interface. 
## Getting Started & Installing

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

1. ```git clone https://github.com/FalmouthFalcons/iteration-2.git```
2. run ```ruby schema.rb``` in db folder
3. The database path environmental variable: in the files the database path is set to an
    enviromental variable which you will need to configure in you .zshrc or .bash file
        - follow these instructions:
        [instructions](https://gist.github.com/iest/58692bf1001b0424c257) 
        to create the variable and set it to the absolute path of the bangazon_sqlite3.sqlite3 file
4. To run the CLI run ```ruby main.rb``` in root directory

5. enter the number of the choice you would like to make and follow prompts:
``` *************************************************
    Welcome to Bangazon! Command Line Ordering System
    *************************************************
    1. Create a customer account
    2. Choose active customer
    3. Add a payment type for customer
    4. Create a new product
    5. Add product to shopping cart
    6. Complete an order
    7. Remove customer product
    8. Update product information
    12. Leave Bangazon!
    >
```
    enter 1 at >
    to choose Create a customer account


## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests
1. ```cd test``` from root
2. ```cd models``` or ```cd controllers```
3. run ```ruby <filename>_test.rb```


## Built With

* Ruby
* SQL

## Authors

* **Jim Vickery** - *Team Lead*
* **Brooke Wittenberg**
* **Malcolm Ford**
* **Jasmine Quach**
* **Adam White**

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## Acknowledgments

* Hat tip to Hannah for so many answers to so many questions


