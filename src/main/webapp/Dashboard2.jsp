<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="./assets/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/dashboard.css" />
</head>
<% String user_type = (String) session.getAttribute("user_type"); %>
<%-- <%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String isAuthenticated = (String) session.getAttribute("user_authenticated");
	String user_type = (String) session.getAttribute("user_type");
	if ((isAuthenticated == "true")) {
		if (user_type == "instructor") {
			response.sendRedirect("Dashboard1.jsp");
		}
	} else {
		response.sendRedirect("SelectLogin.html");
	}
%> --%>
<body class="bg-white">

	<%@ include file="header.jsp" %>
    <div class="container light-style flex-grow-1 container-p-y mb-5">
        <h4 class="font-weight-bold py-3 mb-4">Admin Dashboard</h4>
        <div class="card overflow-hidden mb-4" style="border-radius: .75rem;">
            <div class="row no-gutters row-bordered row-border-light min-h-100">
                <div class="col-md-3 pt-0 d-md-block d-none">
                    <div class="list-group list-group-flush account-settings-links border-right h-100">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#course-details">Courses</a>
                        <!-- <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#contact-details">Contact Details</a> -->
                        <!-- <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-security">Security</a> -->
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <div class="card-body">
                                <h6 class="mb-4">Account Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="srujan" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="Srujan Kumar" />
                                </div>
                                <%-- <div class="form-group">
                                    <label class="form-label">Middle Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.mName}" />
                                </div> --%>
                                <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="Cheekati" />
                                </div>
                                <%-- <div class="form-group">
                                    <label class="form-label">Date Of Birth</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.dob}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Age</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.age}" />
                                </div> --%>
                                <div class="form-group">
                                    <label class="form-label">Gender</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="Male" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Language</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="English" />
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="course-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4 d-inline">Course Details</h6>
                                <button type="button" class="btn btn-primary btn-sm" style="float: right;" data-toggle="modal" data-target="#courseModal">Add Course</button>

                                <table class="table table-striped mt-5">
                                    <thead>
                                        <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    	List courses = (List)session.getAttribute("courses");
                                    %>
	                                    <c:forEach items="${courses}" var="course">
										    <tr>
											    <th scope="row"><c:out value="${course.crs_id}"/></th>
	                                            <td><c:out value="${course.crs_name}"/></td>
	                                            <td><c:out value="${course.crs_desc}"/></td>
	                                            <td>
	                                            <!--  <button type="button" class="btn btn-primary text-sm mr-3" style="padding: 5px 10px;">Edit</button> -->
		                                            <form method="post" action="api/course/delete">
		                                            	<input type="hidden" name="crs_id" value="${course.crs_id}"/>
		                                            	<button type="submit" class="btn btn-danger text-sm" style="padding: 5px 10px;">Delete</button>
		                                            </form>
	                                            </td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                    </table>
                            </div>
                            <div class="modal" tabindex="-1" role="dialog" id="courseModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
	                                    <div class="modal-header">
	                                        <h5 class="modal-title">Add Course</h5>
	                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                        <span aria-hidden="true">&times;</span>
	                                        </button>
	                                    </div>
	                                    <form method="post" action="api/course/add">
		                                    <div class="modal-body">
		                                        <div class="form-group">
		                                            <label class="form-label">Name </label>
		                                            <input type="text" class="form-control mb-1 bg-white" value="" id="crs-name" name="name"/>
		                                        </div>
		                                        <div class="form-group">
		                                            <label class="form-label">Description </label>
		                                            <input type="text" class="form-control mb-1 bg-white" value="" id="crs-desc" name="desc"/>
		                                        </div>
		                                    </div>
		                                    <div class="modal-footer">
		                                        <button type="submit" class="btn btn-primary" style="padding: 10px 25px;">Add</button>
		                                        <button type="button" class="btn btn-secondary" style="padding: 10px 25px;" data-dismiss="modal" >Cancel</button>
		                                    </div>
	                                    </form>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>
    <%@ include file="footer.jsp" %>
</body>

</html>