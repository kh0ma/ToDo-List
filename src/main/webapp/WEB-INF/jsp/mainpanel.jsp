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
            background: url(/resources/images/bg.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body style="background: inherit">

<nav class="navbar navbar-transparen">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center container-transparen">
    <div class="row content" >
        <div class="col-sm-6 text-center col-sm-offset-3" style="height: 100%">
            <div style="height: 70pt">
                <h1>TODO LIST</h1>

            </div>
            <%--<c:forEach items="${projects}" var="project">
                <jsp:useBean id="project" scope="page" type="com.herokuapp.todolistkh0ma.model.Project"/>
                <div class="row">
                    <div class="panel panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background: #3434a0; color: white">${project.name}</div>
                            <c:forEach items="${project.tasks}" var="task">
                                <jsp:useBean id="task" scope="page" type="com.herokuapp.todolistkh0ma.model.Task"/>
                                <div class="panel-body">
                                        ${task.name}
                                </div>
                            </c:forEach>
                            <div class="panel-footer">Panel Footer</div>
                        </div>
                    </div>
                </div>
            </c:forEach>--%>

            <div id="ajax_project_load"></div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <p>© kh0ma 2017</p>
</footer>
<script type="text/javascript">
    var ajaxUrl = 'ajax/profile/projects/';

    var projectBefore = "<div class=\"row\"> " +
            "<div class=\"panel panel-group\" id=\"project_\"> " +
            "<div class=\"panel panel-heading\" style=\"background: #3434a0; color: white\">";
    var closeDiv = "</div>";
    var taskBefore = "<div class=\"panel-body\">";

    function getProjects() {
        $.ajax({
            dataType: "json",
            url: ajaxUrl,
            data: null,
            success: function(data) {updateByData(data)}
        });
    }

    function getTasks(id) {
        $.ajax({
            dataType: "json",
            url: ajaxUrl+id+"/tasks/",
            data: null,
            success: function(data) {
                $.each(data, function(key, val) {
                    $.each(val, function(key, val) {
                        if(key=="name")
                        {
                            $("#project_"+id).append(taskBefore + val + closeDiv);
                            debugger;
                        }
                    });
                });
            }
        });
    }



    function updateByData(data)
    {
        $.each( data, function( key, val ) {
            var id = 0;
            $.each( val , function( key, val ) {
                if(key=="name")
                $("#ajax_project_load").append(projectBefore.replace("project_","project_"+id) + val + closeDiv);
                if(key=="id"){
                    getTasks(val);
                    id=val;
                }
            });
            $("#ajax_project_load").append(closeDiv + closeDiv);
        });

    }

    $(function () {
        getProjects();
    });
</script>
</body>

</html>
