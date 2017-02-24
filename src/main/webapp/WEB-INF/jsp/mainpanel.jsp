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
<nav class="navbar navbar-transparen">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 text-center">
            <div style="height: 70pt">
                <h1>SIMPLE TODO LIST</h1>
                <p>FOR RUBY GARAGE :)</p>
            </div>
            <div id="ajax_project_load"></div>
            <button type="button" class="btn btn-info btn-lg addprojectbutton" data-toggle="modal" data-target="#addProject">
                <span class='glyphicon glyphicon-plus-sign'></span>&nbspAdd TODO List
            </button>
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
                        <div class="row">
                            <label class="control-label col-md-3 col-sm-3" for="editTaskName" style="align-self: center;">Name:</label>
                            <div class="col-md-9 col-sm-9">
                                <input type="text" class="form-control" id="editTaskName">
                            </div>
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
                                    <input type="checkbox" class="form-control edit-task-checkbox" id="editTaskIsDone">
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
    <div id="projectRow_projectId_" class="row">
        <div class="panel panel-group projects">
            <div class="panel panel-heading project-header" id="project_header_projectId_">
                <div class="row">
                    <div class="col-md-1 col-sm-1">
                        <span class='glyphicon glyphicon-tasks'></span>
                    </div>
                    <div class="col-md-9 col-sm-9 text-left" >
                        <strong id='projectHeaderName_projectId_'>

                        </strong>
                    </div>
                    <div class="col-md-2 col-sm-2 hidden" id="project_header_controls_projectId_">
                        <button id='editProject_projectId_' onClick='editProject(this.id)' data-toggle='modal' data-target='#editProject' class="mybutton">
                            <i><span class='glyphicon glyphicon-pencil'></span></i>
                        </button>
                        &nbsp
                        <button id='deleteProject_projectId_' onClick='deleteProject(this.id.split("_")[1])' type='button' class="mybutton">
                            <span class='glyphicon glyphicon-trash'></span>
                        </button>
                    </div>
                </div>
            </div>
            <div id='addTaskPanel' class='input-group'>
                <input type='text' class='form-control' placeholder='Start typing here to create a task...' id='addTaskInput_projectId_'>
                <span class='input-group-btn' for='addTaskInput_projectId_'>
                <button class='btn' type='submit' onclick='addTask(this.id)' id='addTaskButton_projectId_'>Add</button>
                </span>
            </div>
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
                    <div class="row">
                        <div class="col-md-9 col-sm-9">
                            <label id="taskName_taskId_"></label>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <span class="deadline hidden" id="deadline_taskId_"></span>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td class='table-controls' id='controls_taskId_'>
            <div class="row hidden" id="controlsDiv_taskId_">
                <div class="col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                    <button id='editTask_taskId_projectId_' class="mybutton" onClick="editTask(this.id.split('_')[2], this.id.split('_')[1])" data-toggle='modal' data-target='#editTask'><span class='glyphicon glyphicon-pencil'></span></button>
                </div>
                <div class="col-md-5 col-md-pull-1 col-sm-5 col-sm-pull-1">
                    <button id='deleteTask_taskId_projectId_' class="mybutton" onClick="deleteTask(this.id.split('_')[2],this.id.split('_')[1])" type="button"><span class='glyphicon glyphicon-trash'></span></button>
                </div>
            </div>
        </td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="webjars/datetimepicker/2.4.7/build/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="/resources/js/todolist.js"></script>
</body>
</html>
