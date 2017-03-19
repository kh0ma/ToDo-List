# ToDo-List
Simple ToDo list for Ruby Garage.

You can find this app on heroku: http://todolist-kh0ma.herokuapp.com/

TODO: add sortable to tasks and projects
use jquery ui to implement this task
adding new columns in ddl are needed

each sortable element should have sort_id
when we add new element sort_id should increment and return sort_id to Ui

when user change elements order we send ajax post with map {element_id : sort_id} and save changes to database

now on page update backend should return elements sorted by sort_id
