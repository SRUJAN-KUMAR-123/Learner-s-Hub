<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
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
%>
<body class="bg-white">

	<%@ include file="header.jsp" %>
    <div class="container light-style flex-grow-1 container-p-y mb-5">
        <h4 class="font-weight-bold py-3 mb-4">Student Dashboard</h4>
        <div class="card overflow-hidden mb-4" style="border-radius: .75rem;">
            <div class="row no-gutters row-bordered row-border-light min-h-100">
                <div class="col-md-3 pt-0 d-md-block d-none">
                    <div class="list-group list-group-flush account-settings-links border-right h-100">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#edu-details">Educational Details</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#contact-details">Contact Details</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#available_courses"> Available Courses</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#enrolled_courses"> Registered Courses</a>
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
                                        class="form-control mb-1 bg-white" value="${user.uname}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.fName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Middle Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.mName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.lName}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Date Of Birth</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.dob}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Age</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.age}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Gender</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.gender}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Language</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.language}" />
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="edu-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Education Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Qualification</label>
                                    <input disabled onfocus="this.blur();" type="text"
                                        class="form-control mb-1 bg-white" value="${user.qual}" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Name of the Institution</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="${user.inst}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Mode Of Instruction</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${user.mode}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Year of Passing</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${user.year}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Pass Percentage</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();" value="${user.per}" disabled/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="contact-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Contacts Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Phone No.</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="+91 ${user.mobile}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email Id</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="${user.email}" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Address</label>
                                    <textarea class="form-control bg-white" rows="4" disabled>${user.address}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact-details">
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Contacts Details</h6>
                                <div class="form-group">
                                    <label class="form-label">Phone No.</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="+91 9494901874" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email Id</label>
                                    <input class="form-control mb-1 bg-white" onfocus="this.blur();"
                                        value="srujanch75@gmail.com" disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Address</label>
                                    <textarea class="form-control" rows="4" disabled>Hill Colony &#10;Ongole&#10;523001</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane d-block d-md-none" id="available_courses">
                            <div class="card-body pb-2">
                                <h6 class="mb-4 d-inline">Available Courses</h6>
								<table class="table table-striped mt-5">
                                    <thead>
                                        <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Instructors</th>
                                        <th scope="col">Action</th>
                                        <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach items="${available_courses}" var="course">
										    <tr>
											    <th scope="row"><c:out value="${course.crs_id}"/></th>
	                                            <td><c:out value="${course.crs_name}"/></td>
	                                            <td><c:out value="${course.crs_desc}"/></td>
	                                            <td>
	                                            	<c:forEach items="${course.instructor_names}" var="instructor">
	                                            		<p>${instructor[1]}</p>
	                                            	</c:forEach>
	                                            </td>
	                                            <td>
		                                            <button type="submit" class="btn btn-primary text-sm mr-3" style="padding: 5px 10px;" data-toggle="modal" data-target="#courseModal-${course.crs_id}">Enroll</button>
	                                            </td>
	                                            <td>
											    <div class="modal" tabindex="-1" role="dialog" id="courseModal-${course.crs_id}">
					                                <div class="modal-dialog" role="document">
					                                    <div class="modal-content">
						                                    <div class="modal-header">
						                                        <h5 class="modal-title">Choose Instructor </h5>
						                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                                        <span aria-hidden="true">&times;</span>
						                                        </button>
						                                    </div>
						                                    <form method="post" action="api/enrollment/add">
						                                    	<div class="modal-body">
							                                    	<input type="hidden" name="student_id" value="${user.student_id}">
							                                    	<input type="hidden" name="crs_id" value="${course.crs_id}">
							                                        <select name="instructor_id" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" required>
							                                        	<c:forEach items="${course.instructor_names}" var="instructor" varStatus="loop">
						                                            		<option value="${instructor[0]}" <c:choose> <c:when test="${loop.index == 0}"> selected </c:when> </c:choose>>  ${instructor[1]} </option>
						                                            	</c:forEach>
																	</select>
							                                    </div>
							                                    <div class="modal-footer">
							                                        <button type="submit" class="btn btn-primary" style="padding: 10px 25px;">Enroll</button>
							                                        <button type="button" class="btn btn-secondary" style="padding: 10px 25px;" data-dismiss="modal" >Cancel</button>
							                                    </div>
							                                </form>
					                                    </div>
						                            </div>
					                            </div>
				                            </td>
										    </tr>
				                        </c:forEach>
                                    </tbody>
                                </table>
                        	</div>
                        </div>
                        
                        <div class="tab-pane d-block d-md-none" id="enrolled_courses">
                            <div class="card-body pb-2">
                                <h6 class="mb-4 d-inline">Enrolled Courses</h6>
								<table class="table table-striped mt-5">
                                    <thead>
                                        <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Instructors</th>
                                        <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach items="${enrolled_courses}" var="course">
										    <tr>
											    <th scope="row"><c:out value="${course.crs_id}"/></th>
	                                            <td><c:out value="${course.crs_name}"/></td>
	                                            <td><c:out value="${course.crs_desc}"/></td>
	                                            <td>${course.instructor_names[0][1]}</td>
	                                            <td>
	                                            	<form method="post" action="api/enrollment/delete">
	                                            		<input type="hidden" name="crs_id" value="${course.crs_id}" />
	                                            		<input type="hidden" name="student_id" value="${user.student_id}" />
		                                            	<button type="submit" class="btn btn-primary text-sm mr-3" style="padding: 5px 10px;">Unregister</button>
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