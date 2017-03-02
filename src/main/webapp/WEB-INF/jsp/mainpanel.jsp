<%--
  Created by IntelliJ IDEA.
  User: kh0ma
  Date: 11.02.17
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <jsp:include page="fragments/header.jsp"/>
        <link rel="stylesheet" href="webjars/datetimepicker/2.4.7/jquery.datetimepicker.css">
    </head>
    <body>
        <div class="container container-fluid text-center">
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2 text-center">
                    <nav class="navbar navbar-transparen">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <div class="mainpanel_text">
                        SIMPLE TODO LIST
                        <div class="small">FOR RUBY GARAGE :)</div>
                    </div>
                    <div id="ajax_project_load" class="projects"></div>

                </div>

                <div class="col-xs-12 addprojectdiv">
                    <a class="btn btn-primary add-project" data-toggle="modal" data-target="#addProject"><span class="icon-plus"></span>Add TODO List</a>
                </div>
            </div>
        </div>

        <jsp:include page="fragments/footer.jsp"/>

        <!-- Modal Add Project -->
        <div class="modal fade" id="addProject" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Project</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3" for="addProjectName" style="align-self: center;">Name:</label>
                                <div class="col-md-9 col-sm-9">
                                    <input type="text" class="form-control" id="addProjectName">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-large btn-primary" type="button" data-dismiss="modal" onclick="addProject()">Ok</button>
                        <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Edit Project -->
        <div class="modal fade" id="editProject" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit Project</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3" for="editProjectName" style="align-self: center;">Name:</label>
                                <div class="col-md-9 col-sm-9">
                                    <input type="text" class="form-control" id="editProjectName">
                                </div>
                                <input type="hidden" id="editProjectId">
                                <input type="hidden" id="editProjectCreated">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-large btn-primary" type="button" data-dismiss="modal" onclick="updateProject()">Ok</button>
                        <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Edit Task -->
        <div class="modal fade" id="editTask" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit Task</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <input type="hidden" id="editTaskId">
                            <input type="hidden" id="editTaskCreated">
                            <input type="hidden" id="editTaskPriority">
                            <input type="hidden" id="editTaskProjectId">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3" for="editTaskName" style="align-self: center;">Name:</label>
                                <div class="col-md-9 col-sm-9">
                                    <input type="text" class="form-control" id="editTaskName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3" for="editDeadLine" style="align-self: center;">DeadLine:</label>
                                <div class="col-md-9 col-sm-9">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="editDeadLine">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div  class="form-group">
                                <label class="control-label col-md-3 col-sm-3" for="editTaskIsDone" style="align-self: center;">Is Completed?</label>
                                <div class="col-md-9 col-sm-9">
                                    <div class="checkbox pull-left ">
                                        <label>
                                            <input type="checkbox" class="form-control edit-task-checkbox" id="editTaskIsDone" style="margin: -8px -20px;">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-large btn-primary" type="button" data-dismiss="modal" onclick="updateTask()">Ok</button>
                        <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hidden div -->
        <div hidden>
            <div class="project" id="projectRow_projectId_" style="display: block; padding-bottom: 25px; padding-top: 5px">
                <div class="project-header" id="project_header_projectId_">
                    <div class="project-field">
                        <h2 id='projectHeaderName_projectId_'>
                        </h2>
                    </div>
                    <div class="control" id="project_header_controls_projectId_">
                        <ul>
                            <li><a class="edit" id='editProject_projectId_' onClick='editProject(this.id)' data-toggle='modal' data-target='#editProject' type='button'></a></li>
                            <li><a class="delete" id='deleteProject_projectId_' onClick='deleteProject(this.id.split("_")[1])' type='button'></a></li>
                        </ul>
                    </div>
                </div>
                <div class="new_task">
                    <div class="create-task-header">
                        <div class="create-task-in input-group">
                            <input class="form-control" id='addTaskInput_projectId_' placeholder="Start typing here to create a task..." type="text">
                            <span class="input-group-btn add-task">
                                <button class="btn add-task" onclick='addTask(this.id)' id='addTaskButton_projectId_'>Add Task</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="task-list">
                    <table id='tableTasks' class='tasks-table'>
                        <tbody id='tbody_projectId_'>

                        </tbody>
                    </table>
                </div>
            </div>

            <table>
                <tr class='tasks-row' id='row_taskId_'>
                <td class='table-checkBox'>
                    <input type="checkbox" id='checkBox_taskId_projectId_'>
                </td>
                <td class='table-name'>
                    <div class='left-border'>
                        <div class='task-name-text' id='nameDiv_taskId_'>
                            <label id="taskName_taskId_"></label>
                            <span class="deadline hidden" id="deadline_taskId_"></span>
                        </div>
                    </div>
                </td>
                <td class='table-controls' id='controls_taskId_'>
                    <div class="row hidden" id="controlsDiv_taskId_">
                        <ul>
                            <li>
                                <button id='editTask_taskId_projectId_' class="mybutton" onClick="editTask(this.id.split('_')[2], this.id.split('_')[1])" data-toggle='modal' data-target='#editTask'><span class='glyphicon glyphicon-pencil'></span></button>
                            </li>
                            <li style="border-left: 1px solid #ccc;">
                                <button id='deleteTask_taskId_projectId_' class="mybutton" onClick="deleteTask(this.id.split('_')[2],this.id.split('_')[1])" type="button"><span class='glyphicon glyphicon-trash'></span></button>
                            </li>
                        </ul>
                    </div>
                </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript" src="webjars/datetimepicker/2.4.7/build/jquery.datetimepicker.full.min.js"></script>
        <script type="text/javascript" src="/resources/js/todolist.js"></script>
    </body>
</html>
