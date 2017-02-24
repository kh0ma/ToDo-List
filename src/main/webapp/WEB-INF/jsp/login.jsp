<%--
  Created by IntelliJ IDEA.
  User: kh0ma
  Date: 23.02.17
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <jsp:include page="fragments/header.jsp"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="container col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info" >
                        <div class="panel-heading">
                            <div class="panel-title">Sign In</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signuplink" <%--onClick="$('#loginbox').hide(); $('#signupbox').show()"--%>>Sign Up</a></div>
                        </div>

                        <div style="padding-top:30px" class="panel-body" >

                            <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                            <form id="loginform" class="form-horizontal" role="form" action="spring_security_check" method="post">

                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="login-email" type="text" class="form-control" name="username" value="" placeholder="Email">
                                </div>

                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="login-password" type="password" class="form-control" name="password" placeholder="Password">
                                </div>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="controls col-md-3 col-md-offset-4 col-sm-3 col-sm-offset-4">
                                        <button id="btn-login" class="btn btn-success" type="submit">Login </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Sign Up</div>
                    <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" <%--onclick="$('#signupbox').hide(); $('#loginbox').show()"--%>>Sign In</a></div>
                </div>
                <div class="panel-body" >
                    <form id="signupform" class="form-horizontal" role="form" method="post">

                        <div id="signupalert" style="display:none" class="alert alert-danger">
                            <p>Error:</p>
                            <span></span>
                        </div>



                        <div class="form-group">
                            <label for="email" class="col-md-3 control-label">Email: </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="email" name="email" placeholder="Email Address">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-md-3 control-label">Name: </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-3 control-label">Password: </label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Button -->
                            <div class="controls col-md-3 col-md-offset-5 col-sm-3 col-sm-offset-5">
                                <button id="btn-singup" class="btn btn-info" type="submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>




        </div>

        <div class="row">
            <div class="jumbotron col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" style="background: inherit; color: ghostwhite">
                <c:if test="${error}">
                    <div class="error">
                            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                    </div>
                </c:if>
                <c:if test="${not empty message}">
                    <div class="message">
                        <fmt:message key="${message}"/>
                    </div>
                </c:if>

                <p>User login: <b>user@rubygarage.com.ua / password</b></p>

                <p>Admin login: <b>admin@gmail.com / admin</b></p>
            </div>
        </div>
    </div>
    <jsp:include page="fragments/footer.jsp"/>
    <script type="text/javascript" src="/resources/js/login.js"></script>
</body>
</html>
