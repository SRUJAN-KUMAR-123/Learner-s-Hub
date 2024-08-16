<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Instructor Dashboard</title>
    <link rel="stylesheet" href="./assets/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/dashboard.css" />
</head>

<body class="bg-white">
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String isAuthenticated = (String) session.getAttribute("user_authenticated");
	String user_type = (String) session.getAttribute("user_type");
	if ((isAuthenticated == "true")) {
		if (user_type == "student") {
			response.sendRedirect("Dashboard.jsp");
		}
	} else {
		response.sendRedirect("SelectLogin.html");
	}
%>
	<%@ include file="header.jsp" %>
    <div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-4">Instructor Dashboard</h4>
        <div class="card overflow-hidden mb-4" style="border-radius: .75rem;">
            <div class="row no-gutters row-bordered row-border-light min-h-100">
                <div class="col-md-3 pt-0 d-md-block d-none">
                    <div class="list-group list-group-flush account-settings-links border-right h-100">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#edu-details">Experience Details</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#contact-details">Contact Details</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#course-details">Registered Courses</a>
                       <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#avl-course-details">Available Courses</a>
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
                                        class="form-control mb-1 bg-white" value="${instructor.uname}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.fName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Middle Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.mName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.lName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Date Of Birth</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.dob}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Age</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.age}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Gender</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.gender}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Language</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.language}" />
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="edu-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Experience Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Subject's Taught</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${instructor.subjects}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Education Background</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="${instructor.degree}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Availability</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${instructor.availability}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Teaching Experience</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${instructor.teachingexp}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Bio-Graphy</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${instructor.biography}" disabled/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="contact-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Contacts Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Phone No.</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="+91 ${instructor.mobile}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email Id</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="${instructor.email}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Address</label>
                                    <textarea class="form-control bg-white" rows="4" disabled>${instructor.address}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="course-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4 d-inline">Registered Courses</h6>

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
	                                    <c:forEach items="${enrolled_courses}" var="course">
										    <tr>
											    <th scope="row"><c:out value="${course.crs_id}"/></th>
	                                            <td><c:out value="${course.crs_name}"/></td>
	                                            <td><c:out value="${course.crs_desc}"/></td>
	                                            <td>
	                                            <form method="post" action="api/enrollment/delete">
		                                            <input type="hidden" name="instructor_id" value="${instructor.instructor_id}" />
		                                            <input type="hidden" name="crs_id" value="<c:out value="${course.crs_id}"/>" />
		                                            <button type="submit" class="btn btn-primary text-sm mr-3" style="padding: 5px 10px;">Deregister</button>
	                                            </form>
	                                            </td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                        	</div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="avl-course-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4 d-inline">Available Courses</h6>

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
	                                    <c:forEach items="${available_courses}" var="course">
										    <tr>
											    <th scope="row"><c:out value="${course.crs_id}"/></th>
	                                            <td><c:out value="${course.crs_name}"/></td>
	                                            <td><c:out value="${course.crs_desc}"/></td>
	                                            <td>
	                                            <form method="post" action="api/enrollment/add">
		                                            <input type="hidden" name="instructor_id" value="${instructor.instructor_id}" />
		                                            <input type="hidden" name="crs_id" value="<c:out value="${course.crs_id}"/>" />
		                                            <button type="submit" class="btn btn-primary text-sm mr-3" style="padding: 5px 10px;">Register</button>
	                                            </form>
	                                            </td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
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