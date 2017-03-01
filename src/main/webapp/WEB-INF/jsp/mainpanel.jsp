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

    <style>
        .projects {
            margin: 0 auto;
            margin-left: 25px;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #333333;
            background-color: #fff;
        }
        html {
            font-size: 10px;
            -webkit-tap-highlight-color: transparent;
            font-family: sans-serif;
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        .projects .project-header {
            background-image: -moz-linear-gradient(37% 0% -90deg, #5183be 0%, #375d9e 99%);
            background-image: -webkit-gradient(linear, 37% 0%, 37% 100%, color-stop(0, #5183be), color-stop(0.99, #375d9e));
            background-image: -webkit-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -o-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -ms-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            width: 700px;
            height: 50px;
            border: 1px solid #315589;
            -moz-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            -webkit-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            position: relative;
        }

        .projects .project-header .project-field {
            background: transparent url(/resources/icons/project.png) no-repeat 15px 50%;
            padding: 0 80px 0 45px;
        }

        .projects .project-header h2 {
            font-family: Arial, Helvetica, sans-serif;
            color: white;
            font-size: 18px;
            font-weight: bold;
            line-height: 38px;
            text-shadow: 0px 1px 0px #28405D;
            overflow: hidden;
            width: 100%;
            height: 40px;
            margin: 5px 0;
            padding: 1px 5px;
            border: 1px solid transparent;
            cursor: pointer;
            text-align: left;
        }

        h2, .h2 {
            font-size: 30px;
        }

        h1, .h1, h2, .h2, h3, .h3 {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
            font-family: inherit;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
        }

        h2, .h2 {
            font-size: 30px;
        }

        h1, .h1, h2, .h2, h3, .h3 {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
            font-family: inherit;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
        }

        .projects .project-header .control {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        /*.control {
             overflow: hidden;
            display: none;
        }*/

        .projects .project-header .control ul {
            margin: 0 0 0 -20px;
        }

        .control ul {
            margin: 0 12px 0 -12px;
            padding: 0;
            word-spacing: -.3em;
        }

        ul, ol {
            margin-top: 0;
            margin-bottom: 10px;
        }

        ul, ol {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .projects .project-header .control li {
            border-left: 1px solid #5284BF;
            margin: 0 0 0 10px;
            padding: 0 0 0 10px;
        }

        .control li {
            display: inline-block;
            margin: 0 0 0 10px;
            padding: 0 0 0 10px;
            vertical-align: text-bottom;
            word-spacing: normal;
            border-left: 1px solid #ccc;
        }

        .projects .project-header .control .edit {
            background: url(/resources/icons/edit.png) no-repeat 50% 50%;
        }

        .control a {
            display: block;
            width: 16px;
            height: 16px;
            position: relative;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }

        a {
            background-color: transparent;
        }

        .projects .project-header .control .delete {
            background: url(/resources/icons/delete.png) no-repeat 50% 50%;
        }

        .control a {
            display: block;
            width: 16px;
            height: 16px;
            position: relative;
        }

        .new_task {
            display: block;
            margin-top: 0em;
        }

        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        input {
            line-height: normal;
        }

        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }

        .projects .create-task-header {
            background-image: -moz-linear-gradient(50% 0% -90deg, #e1e1e1 0%, #ccc 100%);
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0, #e1e1e1), color-stop(1, #ccc));
            background-image: -webkit-linear-gradient(-90deg, #e1e1e1 0%, #ccc 100%);
            background-image: -o-linear-gradient(-90deg, #e1e1e1 0%, #ccc 100%);
            background-image: -ms-linear-gradient(-90deg, #e1e1e1 0%, #ccc 100%);
            background-image: linear-gradient(-90deg, #e1e1e1 0%, #ccc 100%);
            border: 1px solid #abafa3;
            width: 700px;
            height: 50px;
            padding: 8px 15px 0;
        }

        .projects .create-task-header .create-task-in {
            background: url(/resources/icons/add_task.png) no-repeat 0 50%;
            padding: 0 0 0 34px;
        }
        .input-group {
            position: relative;
            display: table;
            border-collapse: separate;
        }
        .input-group {
            position: relative;
            display: table;
            border-collapse: separate;
        }

        .projects .create-task-header .create-task-in input {
            float: none;
            background-color: white;
            width: 533px;
            height: 30px;
            -moz-box-shadow: inset 0px 1px 2px 0px rgba(0,0,0,0.75);
            -webkit-box-shadow: inset 0px 1px 2px 0px rgba(0,0,0,0.75);
            box-shadow: inset 0px 1px 2px 0px rgba(0,0,0,0.75);
        }

        .input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .authform .input-group-btn:first-child>.button, .input-group-btn:first-child>.btn-group>.btn, .authform .input-group-btn:first-child>.btn-group>.button, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle), .authform .input-group-btn:last-child>.button:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child>.btn-group:not(:last-child)>.btn, .authform .input-group-btn:last-child>.btn-group:not(:last-child)>.button {
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
        }
        .input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group>.btn, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child>.btn-group:not(:last-child)>.btn {
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
        }
        .input-group-addon, .input-group-btn, .input-group .form-control {
            display: table-cell;
        }
        .input-group .form-control {
            position: relative;
            z-index: 2;
            float: left;
            width: 100%;
            margin-bottom: 0;
        }
        .input-group-addon, .input-group-btn, .input-group .form-control {
            display: table-cell;
        }
        .input-group .form-control {
            position: relative;
            z-index: 2;
            float: left;
            width: 100%;
            margin-bottom: 0;
        }
        .form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }
        .form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        input {
            line-height: normal;
        }
        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        input {
            line-height: normal;
        }
        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }

        .projects .create-task-header .create-task-in span.add-task {
            padding-top: 1px;
        }
        .input-group-btn {
            position: relative;
            font-size: 0;
            white-space: nowrap;
        }
        .input-group-addon, .input-group-btn {
            width: 1%;
            white-space: nowrap;
            vertical-align: middle;
        }
        .input-group-addon, .input-group-btn, .input-group .form-control {
            display: table-cell;
        }
        .input-group-btn {
            position: relative;
            font-size: 0;
            white-space: nowrap;
        }
        .input-group-addon, .input-group-btn {
            width: 1%;
            white-space: nowrap;
            vertical-align: middle;
        }
        .input-group-addon, .input-group-btn, .input-group .form-control {
            display: table-cell;
        }

        .projects .create-task-header .create-task-in button.add-task {
            padding-top: 4px;
            background-image: -moz-linear-gradient(#96cdb0 0%, #4d8464 97%);
            background-image: -webkit-gradient(linear, color-stop(0, #96cdb0), color-stop(0.97, #4d8464));
            background-image: -webkit-linear-gradient(#96cdb0 0%, #4d8464 97%);
            background-image: -o-linear-gradient(#96cdb0 0%, #4d8464 97%);
            background-image: -ms-linear-gradient(#96cdb0 0%, #4d8464 97%);
            background-image: linear-gradient(#96cdb0 0%, #4d8464 97%);
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            outline: none;
            font-weight: bold;
            color: white;
            text-align: center;
            border: 1px solid #447557;
            height: 29px;
            width: 108px;
            text-shadow: 0px 1px 0px rgba(0,0,0,0.75);
        }
        .input-group-btn:last-child>.btn, .authform .input-group-btn:last-child>.button, .input-group-btn:last-child>.btn-group {
            z-index: 2;
            margin-left: -1px;
        }
        .input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child>.btn, .authform .input-group-btn:last-child>.button, .input-group-btn:last-child>.btn-group>.btn, .authform .input-group-btn:last-child>.btn-group>.button, .input-group-btn:last-child>.dropdown-toggle, .input-group-btn:first-child>.btn:not(:first-child), .authform .input-group-btn:first-child>.button:not(:first-child), .input-group-btn:first-child>.btn-group:not(:first-child)>.btn, .authform .input-group-btn:first-child>.btn-group:not(:first-child)>.button {
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
        }
        .input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group {
            z-index: 2;
            margin-left: -1px;
        }
        .input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group>.btn, .input-group-btn:last-child>.dropdown-toggle, .input-group-btn:first-child>.btn:not(:first-child), .input-group-btn:first-child>.btn-group:not(:first-child)>.btn {
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
        }
        .input-group-btn>.btn, .authform .input-group-btn>.button {
            position: relative;
        }
        .input-group-btn>.btn {
            position: relative;
        }
        .btn, .authform .button {
            display: inline-block;
            margin-bottom: 0;
            font-weight: normal;
            text-align: center;
            vertical-align: middle;
            touch-action: manipulation;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            white-space: nowrap;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .btn {
            display: inline-block;
            margin-bottom: 0;
            font-weight: normal;
            text-align: center;
            vertical-align: middle;
            touch-action: manipulation;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            white-space: nowrap;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        button, html input[type="button"], input[type="reset"], input[type="submit"] {
            -webkit-appearance: button;
            cursor: pointer;
        }
        button, select {
            text-transform: none;
        }
        button {
            overflow: visible;
        }
        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        button, html input[type="button"], input[type="reset"], input[type="submit"] {
            -webkit-appearance: button;
            cursor: pointer;
        }
        button, select {
            text-transform: none;
        }
        button {
            overflow: visible;
        }
        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }

        .task-list {
            border: 1px solid #abafa3;
            background: #f0ad4e;
            border-radius: 0 0 10px 10px;
            overflow: hidden;
            width: 700px;
        }
    </style>
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
            <div id="ajax_project_load" class="projects"></div>
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
    <%--<div id="projectRow_projectId_" class="row">
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
    </div>--%>

        <div class="project" id="projectRow_projectId_" style="display: block; padding-bottom: 15px; padding-top: 15px">
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
