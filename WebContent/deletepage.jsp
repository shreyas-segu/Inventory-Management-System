<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
    <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
                <html>

                <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta name="author" content="Shreyas Segu">
                    <title>Inventory Management System</title>
                    <!-- Bootstrap core CSS-->
                    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <!-- Custom fonts for this template-->
                    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
                    <!-- Custom styles for this template-->
                    <link href="css/IMS.css" rel="stylesheet">
                    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
                </head>

                <body class="fixed-nav bg-dark" id="page-top">

                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/IMS" user="root" password="admin"
                    />


                    <!-- Navigation-->
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
                        <a class="navbar-brand" href="index.html">Inventory Management System</a>
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Home">
                                    <a class="nav-link" href="home.jsp">
                                        <i class="fa fa-fw fa-home"></i>
                                        <span class="nav-link-text">Home</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Stock">
                                    <a class="nav-link" href="stock.jsp">
                                        <i class="fa fa-fw fa-stack-overflow"></i>
                                        <span class="nav-link-text">Stock</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Suppliers">
                                    <a class="nav-link" href="supplier.jsp">
                                        <i class="fa fa-fw fa-address-card-o"></i>
                                        <span class="nav-link-text">Suppliers</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Items">
                                    <a class="nav-link" href="items.jsp">
                                        <i class="fa fa-fw fa-shopping-cart"></i>
                                        <span class="nav-link-text">Items</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="History">
                                    <a class="nav-link" href="history.jsp">
                                        <i class="fa fa-fw fa-history "></i>
                                        <span class="nav-link-text">Item History</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add">
                                    <a class="nav-link" href="addpage.jsp">
                                        <i class="fa fa-fw fa-pencil-square-o "></i>
                                        <span class="nav-link-text">Add</span>
                                    </a>
                                </li>
                                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Delete">
                                    <a class="nav-link" href="deletepage.jsp">
                                        <i class="fa fa-fw fa-pencil-square-o "></i>
                                        <span class="nav-link-text">Delete</span>
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav sidenav-toggler">
                                <li class="nav-item">
                                    <a class="nav-link text-center" id="sidenavToggler">
                                        <i class="fa fa-fw fa-angle-left"></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                                        <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <!--main body-->
                    <div class="content-wrapper">
                        <div class="container-fluid">
                            <div class="card mb-3">
                                <form method="post" action="delete.jsp" name="form2">
                                    <div class="table-responsive">
                                        <table class="table" id="dataTable">
                                            <tr>
                                                <td>
                                                    <label for="text">Item ID</label>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" id="id" name="id"> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <button type="submit" class="btn btn-primary" name="btn2">Delete</button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Scroll to Top Button-->
                        <a class="scroll-to-top rounded" href="#page-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                        <!-- Logout Modal-->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                        <a class="btn btn-primary" href="logout.jsp">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- Bootstrap core JavaScript-->
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <!-- Core plugin JavaScript-->
                    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                    <!-- Custom scripts for all pages-->
                    <script src="js/IMS.js"></script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#dataTable").dataTable({
                            });
                        });
                    </script>
                    <script src="vendor/datatables/jquery.dataTables.js"></script>
                    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
                </body>

</html>