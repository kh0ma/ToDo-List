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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
                            <div class="panel-title"><fmt:message key="login.signin"/></div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signuplink"><fmt:message key="login.signup"/></a></div>
                        </div>

                        <div style="padding-top:30px" class="panel-body" >

                            <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                            <form id="loginform" class="form-horizontal" role="form" action="spring_security_check" method="post">

                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="login-email" type="email" class="form-control" name="username" value="" required placeholder=<fmt:message key="login.email"/> >
                                </div>

                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="login-password" type="password" class="form-control" name="password" required placeholder=<fmt:message key="login.password"/>>
                                </div>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="controls col-md-3 col-md-offset-4 col-sm-3 col-sm-offset-4">
                                        <button id="btn-login" class="btn btn-success" type="submit"><fmt:message key="login.loginbutton"/></button>
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
                    <div class="panel-title"><fmt:message key="login.signup"/></div>
                    <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink"><fmt:message key="login.signin"/></a></div>
                </div>
                <div class="panel-body" >
                    <form id="signupform" class="form-horizontal" role="form" method="post" name="registration">

                        <%--<div id="signupalert" style="display:none" class="alert alert-danger">
                            <p>Error:</p>
                            <span></span>
                        </div>--%>



                        <div class="form-group">
                            <label for="email" class="col-md-3 control-label"><fmt:message key="login.email"/></label>
                            <div class="col-md-9">
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-md-3 control-label"><fmt:message key="login.name"/></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="passwordsignup" class="col-md-3 control-label"><fmt:message key="login.password"/> </label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" id="passwordsignup" name="passwordsignup" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comfirmpasswordsignin" class="col-md-3 control-label"><fmt:message key="login.confirpassword"/></label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" id="comfirmpasswordsignin" name="confirmpassword" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Button -->
                            <div class="controls col-md-3 col-md-offset-5 col-sm-3 col-sm-offset-5">
                                <button id="btn-singup" class="btn btn-info" type="submit"><fmt:message key="login.signup"/></button>
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
                        <spring:message code="${message}"/>
                    </div>
                </c:if>

                <p>User login: <b>user@rubygarage.com.ua / password</b></p>

                <p>Admin login: <b>admin@gmail.com / admin</b></p>
            </div>
        </div>
    </div>
    <jsp:include page="fragments/footer.jsp"/>
    <script type="text/javascript" src="/resources/js/login.js"></script>
    <script>
        /*var password = document.getElementById("passwordsignin")
                , confirm_password = document.getElementById("comfirmpasswordsignin");

        function validatePassword(){
            if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;*/
        $(function() {
            // Initialize form validation on the registration form.
            // It has the name attribute "registration"
            $("form[name='registration']").validate({
                // Specify validation rules
                rules: {
                    // The key name on the left side is the name attribute
                    // of an input field. Validation rules are defined
                    // on the right side
                    name: "required",
                    email: {
                        required: true,
                        // Specify that email should be validated
                        // by the built-in "email" rule
                        email: true
                    },
                    passwordsignup: {
                        required: true,
                        minlength: 5
                    },
                    confirmpassword: {
                        required: true,
                        equalTo: "#passwordsignup"
                    }

                },
                // Specify validation error messages
                messages: {
                    name: "Please enter your name",
                    passwordsignup: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                    email: "Please enter a valid email address",
                    confirmpassword: {
                        equalTo: "Passwords must be same"
                    }
                },
                // Make sure the form is submitted to the destination defined
                // in the "action" attribute of the form when valid
                submitHandler: function(form) {
                    form.submit();
                }
            });
        });
    </script>
</body>
</html>
