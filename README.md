Introduction
============

Launguage and Framework Considerations
--------------------------------------

We chose Ruby on Rails as the underlying web framework for our project.
After working with it for the project , it seems to be much better than
other frameworks that we had previously tried. Following are the
important features that stand out in our mind:

-   Being one of the most popular frameworks , it has a huge ecosystem
    of users and developers and support of a lot of low level detail are
    already taken care of. Lot of code is bolierplate in a web
    application. Compared to other frameworks , it seems that in rails
    least amount of boilerplate needs to be written manually.This leads
    to huge increase in productivity.

-   The idea of Convention over Configuration leads to better design
    patterns and less time spent in configuring various details.

-   DRY : It provides good support of writing modular, reusable code at
    model , views and controller layer. The facilty of writing partial
    views was very useful in combatting duplicate code in presentation
    logic.

-   RESTful : One of the best practices that rails uses by default is
    restful architecture for models and controllers. It makes it easier
    to integrate with other ecosystems and no effort needs to be spent
    on building a restful api for the system in future.

-   TDD : Rails by default fully embraces Test Driven Developement, all
    the controllers have test specs auto generated. There are very well
    supported and extensive libraries for both blackbox and whitebox
    based testing.

-   Agile : From personal experience , ruby and rails are both sutable
    for agile methodologies. The framework and its design decisons feel
    quite natural and don’t get in the way. No time is wasted in
    fighting the framework as in many other competeing frameworks.

We choose git for version control and github for source code hosting.
Github also provides wiki and issues to handle various project details
and management issues. The repository can be cloned from \cite{github}.

Heroku is PaaS platform for hosting web applications. A major benefit of
using rails and heroku was the ease of deployement and continuous
integration facilities available in the ecosystem. A prototype is hosted
at \cite{heroku}

Main Models
-----------

Student:
:   Student Model has all the basic information about the student
    including his personal information. It maintains relationship with
    department, academic information, registration form and template
    models to capture the properties related to a student.

Faculty
:   Faculty Model does the same task as the student model but for
    faculty. It has relationship with offered courses and departmennt.
    We have allowed a faculty to take as amny courses and a course can
    be taken by more than one faculty.

Department
:   Department model is used just to keep track of existing departments.
    It is linked to all the models which have the concept of department.

Academic Information
:   Academic information model keeps track of past performances of a
    student. It is used to generate the transcript and calculate
    performace index (cpi,spi etc). When an instructor submits the grade
    the information is moved to this model.

Course
:   Course model consist of all the courses that are offered till now in
    the history of the institute.

Offered Course
:   Offered courses are the actual courses that are offered next
    semester. So a student can request courses to take in next semester
    only for these courses. Offered courses are linked to courses to
    preserve one to one relationship between them.

Lecture Time
:   Lecture time captures the weekly schedule of the offered courses. It
    enables us to automatically detect timetable clashes and also
    generate timetable for the offered courses taken by the student.

Registration Form
:   Registration form keeps track of the pre-registration. A student can
    add or delete courses to this form and then submit it to DUGC for
    verification. It is also used to see what all courses the student is
    taking this semester so to enable a faculty to submit grades for the
    students.

Template
:   Template is used by any priviledged person to create a semester
    template constraint for a student or a group of students. We can
    create compulsory as well as bucket courses to be taken by a student
    in a particular semester and this constraint will be checked when
    the student submits his pre registration form.

Features:
---------

The various features implemented in the software are listed below:

Basic Sign-up and Sign-in
:   There is a sign up and sign in facility for both student and faculty
    which tracks there profile and creates sessions for secure browsing.

Pre-Registration
:   In pre-registration section we have implemented course (offered
    course) request which can be accepted or rejected by the faculties
    who are taking the courses. The course can only be requested if
    pre-requsites are satisfied. Faculty can send meet message to
    student keeping the request on hold. Once the courses are accepted
    they can be added to pre-registration. If there is any time-conflict
    with already added courses then the course cannot be added. If the
    form does not satisfy the semester template applied to him his form
    can’t be submmited. After the submission of the form it can be
    withdrawn before dugc accepts.

Time-Table
:   Time table can be seen once any course is added to the form. It
    automatically alerts if any clashibg course is added to
    pre-registration form.

Course Constraints & Templates
:   This facility provides dugc to create or modify course templates.
    Each template contains several course constraint which contains
    courses compulsory for student to take. One constraint can contain
    more than one course which means that the student has to do one
    course out of the given courses.

Grade Submission & Transcript
:   Grades can be submitted by any faculties taking that course. Once
    the grades are submitted they are reflected in the transcript
    provided to the student.

Transfer Role
:   Dugc can tranfer his role to any other faculty. This power can be
    revoked by dugc once the requirement is complete. During this period
    dugc’s facilities are accessible to both the faculty.

Software Testing and Agile Software Development
===============================================

We developed our OARS using iterartive and incremental development based
on the developed test cases prior to the development of actual code. We
designed automated test cases for every unit (class) that needs to be
added for our functionalities, than the developed code was tested upon
the test cases, if the test cases passes we would combine the new unit
with our previous model and continue with the same process for futher
development, else we would rectify our problem and iterate the whole
preocess again. The test cases were written. We wrote our test cases
using *Cucumber* which is a tool to run test cases in ruby, written in
*BDD* Behavior Driven Development style. Each test case consist of a
feature and multiple scenarios, where feature defines the testing area
and scenarios defines the multiple paths which the test case could take.
The whole test-case consists of two files:

-   *Feature File*: This is a normal file written with BDD style (close
    to Natural Language) which contains basically three commands
    *Given*,*When* and *Then* which defines the complete scenario.

-   *Step Defination*: This file contains the actual code that needs to
    be run while going through the steps mentioned in the feature file.
    The steps in the feature file act as a regular expression in the
    feature definations and the code written in the function defination
    gets executed while cucumber parses to the feature file. Basically
    what it does is that it visits throuhout the application checking
    the correctness in terms of the view(output) of the application, by
    browsing though the *HTML* code, filling input values and navigating
    from one location to another in the application. The step
    definitions are written in Ruby. This gives much flexibility on how
    the test steps are executed. It can use an already exisiting step
    definitions for a given step if you need the same step for checking
    some other functionality.

These type of tests should be run during the implementation phase as
well as later on when the site is fully functional. Even if the test was
created during the implementation phase, it should still be run every
time with every new release that goes out. It can even be used as a part
of a stand-alone test set for the site. This helps in reducing our
effort by huge amount as fas as testing is considered. We wrote feature
files to test accross all our units, which carried out steps to navigate
through our system through the outside views, i.e. they basically tested
our units through *Black Box Testing*. Then we wrote test cases for
integration testing i.e. to check whether the units are interacting
properly or not. For special cases like cpi,spi calculation: we wrote
special test cases (on function level) to verify their functionality.
This whole testing and code process helped us in saving time and
debugging our code. Also, it helped in removing the manual testing of
our software which needs to be done in any case.\
Maintaining any software and test automation will definitly benefit from
good development process.So we used git as our version control system.
It will enable us in maintaining the current version of the automation
and also in tracking the changes done to it and also to revert back to
an earlier state if we get stuck into a problem.

9

https://github.com/pankajmore/oars

oars.herokuapp.com
