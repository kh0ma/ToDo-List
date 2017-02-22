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
    <title>ToDo List</title>
    <link rel="stylesheet" href="webjars/datatables/1.10.12/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">

    <script type="text/javascript" src="webjars/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="webjars/datetimepicker/2.4.7/jquery.datetimepicker.css">
    <script type="text/javascript" src="webjars/datetimepicker/2.4.7/build/jquery.datetimepicker.full.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            color: black;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 100%}


        /* Set black background color, white text and some padding */
        footer {
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:100%;}
        }

        html {
            /*background: url(/resources/images/bg.jpg) no-repeat center center fixed;*/
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#d3d1a8+0,d0cea8+4,d0cdac+4,cfccab+9,d0ccb1+12,ceccb5+13,cdcbb6+16,cbc9b4+19,c7c5b0+20,c8c6b1+20,c5c3ac+21,c1bfa8+25,bdbfa7+25,bcbea8+27,babfa9+33,babfab+34,bbbfb0+34,bbbfb0+34,b9bdae+35,bcc0b1+35,bbc2b2+36,bdc1b2+38,bec3af+38,bfc3ac+40,bfc3aa+41,c2c1a2+41,c2c1a2+42,c4c29b+42,c4c196+42,c4c196+43,c3c08d+43,c8bf88+44,c6c084+44,c9bb7c+45,c6bc77+45,cbba72+45,c9b86a+46,cdb764+46,c9b45b+46,cfb254+47,cbb24e+47,d0b04b+48,cead42+48,d2ac3f+48,d2ac3d+49,cfac36+49,d0a930+49,d0a62d+50,d0a729+50,d0a525+50,d4a322+51,d2a41d+51,cfa11a+52,d2a118+52,d2a118+53,d59f18+53,d29c15+53,d39b10+53,d2990e+56,cf940a+56,d19510+57,d3930f+58,d08f0d+58,d18d10+60,cf8a11+60,cf8910+62,cd870e+62,cb820f+67,cd7f10+68,cc7e12+70,ca7b12+73,c87910+73,c87912+74,c67710+75,c87914+76,c57514+76,c37312+78,c27115+80,bf6e13+82,bd6c11+82,bc6b10+83,bc6b10+90,b9680d+91,ba660c+93,b8640e+93,b86310+93,b35e0d+94,b35c0d+96,b25a10+96,af570d+96,b0580e+97,ac540a+97,ac540c+99,ab500a+100 */
            background: #d3d1a8; /* Old browsers */
            background: -moz-linear-gradient(top,  #d3d1a8 0%, #d0cea8 4%, #d0cdac 4%, #cfccab 9%, #d0ccb1 12%, #ceccb5 13%, #cdcbb6 16%, #cbc9b4 19%, #c7c5b0 20%, #c8c6b1 20%, #c5c3ac 21%, #c1bfa8 25%, #bdbfa7 25%, #bcbea8 27%, #babfa9 33%, #babfab 34%, #bbbfb0 34%, #bbbfb0 34%, #b9bdae 35%, #bcc0b1 35%, #bbc2b2 36%, #bdc1b2 38%, #bec3af 38%, #bfc3ac 40%, #bfc3aa 41%, #c2c1a2 41%, #c2c1a2 42%, #c4c29b 42%, #c4c196 42%, #c4c196 43%, #c3c08d 43%, #c8bf88 44%, #c6c084 44%, #c9bb7c 45%, #c6bc77 45%, #cbba72 45%, #c9b86a 46%, #cdb764 46%, #c9b45b 46%, #cfb254 47%, #cbb24e 47%, #d0b04b 48%, #cead42 48%, #d2ac3f 48%, #d2ac3d 49%, #cfac36 49%, #d0a930 49%, #d0a62d 50%, #d0a729 50%, #d0a525 50%, #d4a322 51%, #d2a41d 51%, #cfa11a 52%, #d2a118 52%, #d2a118 53%, #d59f18 53%, #d29c15 53%, #d39b10 53%, #d2990e 56%, #cf940a 56%, #d19510 57%, #d3930f 58%, #d08f0d 58%, #d18d10 60%, #cf8a11 60%, #cf8910 62%, #cd870e 62%, #cb820f 67%, #cd7f10 68%, #cc7e12 70%, #ca7b12 73%, #c87910 73%, #c87912 74%, #c67710 75%, #c87914 76%, #c57514 76%, #c37312 78%, #c27115 80%, #bf6e13 82%, #bd6c11 82%, #bc6b10 83%, #bc6b10 90%, #b9680d 91%, #ba660c 93%, #b8640e 93%, #b86310 93%, #b35e0d 94%, #b35c0d 96%, #b25a10 96%, #af570d 96%, #b0580e 97%, #ac540a 97%, #ac540c 99%, #ab500a 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top,  #d3d1a8 0%,#d0cea8 4%,#d0cdac 4%,#cfccab 9%,#d0ccb1 12%,#ceccb5 13%,#cdcbb6 16%,#cbc9b4 19%,#c7c5b0 20%,#c8c6b1 20%,#c5c3ac 21%,#c1bfa8 25%,#bdbfa7 25%,#bcbea8 27%,#babfa9 33%,#babfab 34%,#bbbfb0 34%,#bbbfb0 34%,#b9bdae 35%,#bcc0b1 35%,#bbc2b2 36%,#bdc1b2 38%,#bec3af 38%,#bfc3ac 40%,#bfc3aa 41%,#c2c1a2 41%,#c2c1a2 42%,#c4c29b 42%,#c4c196 42%,#c4c196 43%,#c3c08d 43%,#c8bf88 44%,#c6c084 44%,#c9bb7c 45%,#c6bc77 45%,#cbba72 45%,#c9b86a 46%,#cdb764 46%,#c9b45b 46%,#cfb254 47%,#cbb24e 47%,#d0b04b 48%,#cead42 48%,#d2ac3f 48%,#d2ac3d 49%,#cfac36 49%,#d0a930 49%,#d0a62d 50%,#d0a729 50%,#d0a525 50%,#d4a322 51%,#d2a41d 51%,#cfa11a 52%,#d2a118 52%,#d2a118 53%,#d59f18 53%,#d29c15 53%,#d39b10 53%,#d2990e 56%,#cf940a 56%,#d19510 57%,#d3930f 58%,#d08f0d 58%,#d18d10 60%,#cf8a11 60%,#cf8910 62%,#cd870e 62%,#cb820f 67%,#cd7f10 68%,#cc7e12 70%,#ca7b12 73%,#c87910 73%,#c87912 74%,#c67710 75%,#c87914 76%,#c57514 76%,#c37312 78%,#c27115 80%,#bf6e13 82%,#bd6c11 82%,#bc6b10 83%,#bc6b10 90%,#b9680d 91%,#ba660c 93%,#b8640e 93%,#b86310 93%,#b35e0d 94%,#b35c0d 96%,#b25a10 96%,#af570d 96%,#b0580e 97%,#ac540a 97%,#ac540c 99%,#ab500a 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom,  #d3d1a8 0%,#d0cea8 4%,#d0cdac 4%,#cfccab 9%,#d0ccb1 12%,#ceccb5 13%,#cdcbb6 16%,#cbc9b4 19%,#c7c5b0 20%,#c8c6b1 20%,#c5c3ac 21%,#c1bfa8 25%,#bdbfa7 25%,#bcbea8 27%,#babfa9 33%,#babfab 34%,#bbbfb0 34%,#bbbfb0 34%,#b9bdae 35%,#bcc0b1 35%,#bbc2b2 36%,#bdc1b2 38%,#bec3af 38%,#bfc3ac 40%,#bfc3aa 41%,#c2c1a2 41%,#c2c1a2 42%,#c4c29b 42%,#c4c196 42%,#c4c196 43%,#c3c08d 43%,#c8bf88 44%,#c6c084 44%,#c9bb7c 45%,#c6bc77 45%,#cbba72 45%,#c9b86a 46%,#cdb764 46%,#c9b45b 46%,#cfb254 47%,#cbb24e 47%,#d0b04b 48%,#cead42 48%,#d2ac3f 48%,#d2ac3d 49%,#cfac36 49%,#d0a930 49%,#d0a62d 50%,#d0a729 50%,#d0a525 50%,#d4a322 51%,#d2a41d 51%,#cfa11a 52%,#d2a118 52%,#d2a118 53%,#d59f18 53%,#d29c15 53%,#d39b10 53%,#d2990e 56%,#cf940a 56%,#d19510 57%,#d3930f 58%,#d08f0d 58%,#d18d10 60%,#cf8a11 60%,#cf8910 62%,#cd870e 62%,#cb820f 67%,#cd7f10 68%,#cc7e12 70%,#ca7b12 73%,#c87910 73%,#c87912 74%,#c67710 75%,#c87914 76%,#c57514 76%,#c37312 78%,#c27115 80%,#bf6e13 82%,#bd6c11 82%,#bc6b10 83%,#bc6b10 90%,#b9680d 91%,#ba660c 93%,#b8640e 93%,#b86310 93%,#b35e0d 94%,#b35c0d 96%,#b25a10 96%,#af570d 96%,#b0580e 97%,#ac540a 97%,#ac540c 99%,#ab500a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d3d1a8', endColorstr='#ab500a',GradientType=0 ); /* IE6-9 */


            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;

            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .tasks-table
        {
            width: 100%;
            margin: -1px 0 0;
        }

        .tasks-row
        {
            border-top: 1px solid #E7EBEA;
            background: #fff;
            height: 48px;
        }

        .table-checkBox
        {
            border-right: 1px solid #EFDADF;
            width: 40px;
            text-align: center;
            position: relative;
        }

        .table-name
        {
            font-size: 13px;
            line-height: 120%;
            font-weight: bold;
            color: #999;
            padding: 0;
            word-wrap: break-word;
            word-break: break-all;
            table-layout: fixed;
        }
        .table-controls
        {
            width: 80px;
            border-left: 1px solid #e7ebea;
            text-align: center;
            padding: 4px 0 0;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }


        .table-name .left-border {
            border-left: 1px solid #EFDADF;
            margin: 0 0 0 2px;
            padding: 4px;
            height: 48px;
        }

        .table-name .task-name-text{
            display: block;
            border: 0;
            padding: 11px 10px;
            border-radius: 3px;
            outline: none;
            width: 100%;
        }

        .edit-task-checkbox {
            height: initial;
            width:  inherit;
        }

        .projects .project-header {
            background-image: -moz-linear-gradient(37% 0% -90deg, #5183be 0%, #375d9e 99%);
            background-image: -webkit-gradient(linear, 37% 0%, 37% 100%, color-stop(0, #5183be), color-stop(0.99, #375d9e));
            background-image: -webkit-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -o-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -ms-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            /*width: 700px;*/
            height: 35px;
            border: 1px solid #315589;
            -moz-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            -webkit-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            position: relative;
        }

        .addprojectbutton {
            background-image: -moz-linear-gradient(37% 0% -90deg, #5183be 0%, #375d9e 99%);
            background-image: -webkit-gradient(linear, 37% 0%, 37% 100%, color-stop(0, #5183be), color-stop(0.99, #375d9e));
            background-image: -webkit-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -o-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: -ms-linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            background-image: linear-gradient(-90deg, #5183be 0%, #375d9e 99%);
            border: 1px solid #315589;
            -moz-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            -webkit-box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            box-shadow: inset 0px 1px 0px rgba(255,255,255,0.35);
            position: relative;
        }

        body {
            margin: 0;
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #333333;
            background: inherit;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            display: block;
            margin: 8px;
        }

        .hidden {
            visibility: hidden;
            over-flow: hidden;
            width: 0px;
            height: 0px;
        }

        .mybutton {
            background: none;
            border: none;
            color: lightgrey;
        }

        .mouseovertask {
            background-color: #feffbe;
        }

        .deadline {
            display: inline;
            min-width: 10px;
            padding: 3px 7px;
            font-size: 12px;
            font-weight: bold;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            align-self: stretch;
            background-color: red;
            border-radius: 10px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-transparen">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center container-transparen">
    <div class="row content" >
        <div class="col-sm-6 text-center col-sm-offset-3">
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

<footer class="container-fluid text-center">
    <p>© kh0ma 2017</p>
</footer>

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
                        <label class="control-label col-sm-3" for="addProjectName" style="align-self: center;">Name:</label>
                        <div class="col-sm-9">
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
                        <label class="control-label col-sm-3" for="editProjectName" style="align-self: center;">Name:</label>
                        <div class="col-sm-9">
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
                        <label class="control-label col-sm-3" for="editTaskName" style="align-self: center;">Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editTaskName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="editDeadLine" style="align-self: center;">DeadLine:</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <input type="text" class="form-control" id="editDeadLine">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div  class="form-group">
                        <label class="control-label col-sm-3" for="editTaskIsDone" style="align-self: center;">Is Completed?</label>
                        <div class="col-sm-9">
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
                    <div class="col-sm-1">
                        <span class='glyphicon glyphicon-tasks'></span>
                    </div>
                    <div class="col-sm-9 text-left" >
                        <strong id='projectHeaderName_projectId_'>

                        </strong>
                    </div>
                    <div class="col-sm-2 hidden" id="project_header_controls_projectId_">
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
                        <div class="col-sm-9">
                            <label id="taskName_taskId_"></label>
                        </div>
                        <div class="col-sm-3">
                            <span class="deadline hidden" id="deadline_taskId_"></span>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td class='table-controls' id='controls_taskId_'>
            <div class="row hidden" id="controlsDiv_taskId_">
                <div class="col-sm-5 col-sm-offset-1">
                    <button id='editTask_taskId_projectId_' class="mybutton" onClick="editTask(this.id.split('_')[2], this.id.split('_')[1])" data-toggle='modal' data-target='#editTask'><span class='glyphicon glyphicon-pencil'></span></button>
                </div>
                <div class="col-sm-5 col-sm-pull-1">
                    <button id='deleteTask_taskId_projectId_' class="mybutton" onClick="deleteTask(this.id.split('_')[2],this.id.split('_')[1])" type="button"><span class='glyphicon glyphicon-trash'></span></button>
                </div>
            </div>
        </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var ajaxUrl = 'ajax/profile/projects/';

    var projectRow = $("#projectRow_projectId_").prop('outerHTML');

    var tableRow = $("#row_taskId_").prop('outerHTML');

    function editTask(projectId,taskId) {
        $.ajax({
            dataType: "json",
            url: ajaxUrl+projectId + "/tasks/" + taskId,
            data: null,
            success: function(data) {
                $("#editTaskName").val(data.name);
                $("#editTaskId").val(data.id);
                $("#editTaskCreated").val(data.created);
                $("#editTaskPriority").val(data.priority);
                $("#editTaskProjectId").val(projectId);
                if(data.deadLine!=null)
                $("#editDeadLine").val(data.deadLine.replace("T"," ").substring(0,16));
                else $("#editDeadLine").val("");
                $("#editTaskIsDone").prop("checked",data.done);
            }
        })
    }

    function editProject(button_id) {
        var projectID = button_id.replace("editProject_","");
        $.ajax({
            dataType: "json",
            url: ajaxUrl+projectID,
            data: null,
            success: function(data) {
                $("#editProjectName").val(data.name);
                $("#editProjectId").val(data.id);
                $("#editProjectCreated").val(data.created);
            }
        })
    }

    function updateTask() {
        var name = $("#editTaskName").val();
        var id = $("#editTaskId").val();
        var created = $("#editTaskCreated").val();
        var priority = $("#editTaskPriority").val();
        var projectId = $("#editTaskProjectId").val();
        var done = $("#editTaskIsDone").prop("checked");
        var deadline = $("#editDeadLine").val().replace(" ","T");
        console.log(JSON.stringify({
            id:id,
            created: created,
            name:name,
            project_id: projectId,
            priority: priority
        }));

        $.ajax({
            type: "PUT",
            url: ajaxUrl+projectId+"/tasks/"+id,
            contentType: "application/json",
            data: JSON.stringify({
                id:id,
                created: created,
                name:name,
                priority: priority,
                done: done,
                deadLine: deadline
            }),
            success: function() {
                $("#taskName_"+id).empty();
                $("#taskName_"+id).append(name);
                $("#checkBox_"+id+"_"+projectId).prop("checked", done);

                if(deadline==null||deadline.length==0) $("#deadline_"+id).addClass("hidden");
                else {
                    $("#deadline_"+id).removeClass("hidden");
                    $("#deadline_"+id).empty().append(deadline.replace("T"," ").substring(0,16));
                }

            }
        });
    }

    function updateProject() {
        var name = $("#editProjectName").val();
        var projectId = $("#editProjectId").val();
        var created = $("#editProjectCreated").val();
        console.log(JSON.stringify({
            name:name,
            id:projectId
        }));

        $.ajax({
            type: "PUT",
            url: ajaxUrl+projectId,
            contentType: "application/json",
            data: JSON.stringify({
                id:projectId,
                created: created,
                name:name}),
            success: function() {
                $("#projectHeaderName_"+projectId).empty();
                $("#projectHeaderName_"+projectId).append(name);
            }
        });
    }

    function deleteTask(projectId, taskId) {
        $.ajax({
            type: "DELETE",
            dataType: "json",
            url: ajaxUrl+projectId+"/tasks/"+taskId,
            data: null,
        });
        $("#row_"+taskId).remove();
    }

    function deleteProject(projectId) {
        $.ajax({
            type: "DELETE",
            dataType: "json",
            url: ajaxUrl+projectId,
            data: null,
        });
        $("#projectRow_"+projectId).remove();
    }

    function taskRender(id, projectId, name, done, deadline, where) {
        var row = tableRow.replace(/taskId_/g,id).replace(/projectId_/g,"_"+projectId);
        where?
                $("#tbody_"+projectId).prepend(row):
                $("#tbody_"+projectId). append(row);
        $("#taskName_"+id).prepend(name);
        $("#checkBox_"+id+"_"+projectId).prop("checked", done);
        $("#checkBox_"+id+"_"+projectId).change(function(){
            setDone(this);
        });
        deadline==null?
                $("#deadline_"+id).addClass("hidden"):
                $("#deadline_"+id).removeClass("hidden");
        if(deadline!=null) $("#deadline_"+id).empty().append(deadline.replace("T"," ").substring(0,16));
        $("#row_"+id).mouseenter(function(){
            $("#controlsDiv_"+id).removeClass("hidden");
            $("#row_"+id).addClass("mouseovertask");
        }).mouseleave(function(){
            $("#controlsDiv_"+id).addClass("hidden");
            $("#row_"+id).removeClass("mouseovertask");
        });
    }

    function addTask(addTaskButtonId) {
        var projectId = addTaskButtonId.replace("addTaskButton_","");
        var name = $("#addTaskInput_"+projectId).val();
        $.ajax({
            type: "POST",
            url: ajaxUrl+projectId+"/tasks/",
            contentType: "application/json",
            data: JSON.stringify({
                name:name}),
            success: function(data) {
                taskRender(data.id,data.project.id,data.name, data.done, null, true);
                $("#addTaskInput_"+projectId).val('');
            }
        });
    }

    function updateTaskByData(data,projectId,where) {
        $.each(data, function(key, val) {
            taskRender(val.id,projectId,val.name, val.done, val.deadLine, where);
        });
    }

    function getTasks(projectId) {
        $.ajax({
            dataType: "json",
            url: ajaxUrl+projectId+"/tasks/",
            data: null,
            success: function(data) {
                updateTaskByData(data,projectId,false)
            }
        });
    }

    function projectRender(id,name,where) {
        var element = projectRow.replace(/projectId_/g,id);
        where?
                $("#ajax_project_load").prepend(element):
                $("#ajax_project_load").append (element);
        $("#projectHeaderName_"+id).append(name);
        $("#project_header_"+id).mouseenter(function(){
            $("#project_header_controls_"+id).removeClass("hidden");
        }).mouseleave(function(){
            $("#project_header_controls_"+id).addClass("hidden");
        });
    }

    function addProject() {
        var name = $("#addProjectName").val();
        $.ajax({
            type: "POST",
            url: ajaxUrl,
            contentType: "application/json",
            data: JSON.stringify({
                name:name}),
            success: function(data) {
                projectRender(data.id,data.name,false);
                $("#addProjectName").val('');
            }
        });
    }

    function updateProjectByData(data) {
        $.each( data, function(key, val) {
            var id = val.id;
            projectRender(id,val.name,true);
            getTasks(id);
        });

    }

    function getProjects() {
        $("#ajax_project_load").empty();
        $.ajax({
            dataType: "json",
            url: ajaxUrl,
            data: null,
            success: function(data) {updateProjectByData(data)}
        });
    }

    function setDone(checkBox) {
        projectId = checkBox.id.split('_')[2];
        id = checkBox.id.split('_')[1];
        done = $("#"+checkBox.id).prop("checked");
        $.ajax({
            type: "POST",
            url: ajaxUrl + projectId + "/tasks/" + id + "/status",
            data: {done: done}
        });
    }

    /* OnPageLoad */
    $(function () {
        getProjects();
    });


    $('#editDeadLine').datetimepicker({
        format:'Y-m-d H:i'
    });

</script>
</body>
</html>
