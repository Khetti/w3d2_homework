<!-- CRUD Quiz
Use the solution to this afternoon’s Property Tracker lab to answer the following questions. Please write your answers under each question, push the file to GitHub, and submit in the usual way.

MVP Questions
In our Property Tracker application:

Q1. Where are we instantiating instances of the Property class? -->
New Property objects are being created in console.rb

<!-- Q2. Where are we defining the SQL that enables us to save the ruby Property object into the database? -->
The save method in the property class is allowing us to save the objects to our database. The sql code is as follows:
INSERT INTO properties
(address, value, number_of_bedrooms, year_built)
VALUES ($1, $2, $3, $4) RETURNING id;

<!-- Q3. In console.rb, which lines modify the database? -->
property1.save() takes our property object and commits it to the database.
any other modifications are done in psql using the property methods.

<!-- Q4. Why do we not define the id of a Property object at the point we instantiate it (‘new it up’)? -->
it hasn't been committed to the database yet. we'll never be searching for it
by id so the id isn't required at this point.

<!-- Q5. Where and how do we assign the id (that is generated by the database) to the ruby Property object? -->
the object is assigned an id when we use the save method (@id = result[0]['id'].to_i() is the code that does this) and the id is returned as
well as the other properties when the table is created.

<!-- Q6. Why do we put a guard (an if clause) on the @id attribute in the constructor? -->
we don't want the id attribute to be changed by us or our methods for any reason; we want the database to assign and track it

<!-- Q7. Why are some of the CRUD actions represented by instance methods, and others by class methods? -->
some of the actions require an object to have any effect (such as "update", we need to actually have an object to update) whereas others don't require a specific object to run (for example, deleting all)

<!-- Q8. What type of data structure is returned by calls to db.exec_prepared()? In the save method, how do we access the id from the returned data structure? -->
a hash (of instance variables) is returned by calls to db.exec_prepared, and
we are able to access is by using the 'id' key which is set up in our initialize method. in the save() example, this is directly referred to in
@id = result[0]['id'].to_i()
so we're accessing the id key in the hash and assigning this to the @id instance variable


<!-- Q9. Why do we use prepared statements when performing database operations? -->
you can use string interpolation instead, but this leaves your code susceptible to an SQL injection attack


<!-- Extension Questions -->
<!-- Look at the find_by_id and find_by_address methods in the Property class. -->

<!-- Q10. What do they take in as their arguments? -->
they take in the sql code, and the array of instance variables, though it happens to be just one variable in both examples, @id and @address respectively.
<!-- Q11. What are their return values? -->
the return value will be a property object matching the id or address
