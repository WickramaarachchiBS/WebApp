<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/11/2024
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">

    <title>AdminPortal</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- tailwind css -->
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
    <link href="https://unpkg.com/@tailwindcss/custom-forms/dist/custom-forms.min.css" rel="stylesheet">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- fonts -->
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

    <!-- css -->
    <link rel="stylesheet" href="css/admin.css">
</head>

<body>

<!-- navbar -->



<div class="cardArea">
    <!-- add movie button -->
    <div class="buttonSection">
        <a href="#" class="addbtn"><button class="btn1" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">ADD MOVIE</button></a>
    </div>
    <!-- Add Button Modal -->
    <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Movie</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- input section -->
                <div id='modal-body' class="p-8 mt-6 lg:mt-0 rounded shadow">

                    <form class="form1" name="addForm" action="addMovieServlet" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Movie Id</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id="my-textfield" type="number" value="" name="movieId" required>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Movie Name</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id="my-textfield" type="text" value="" name="movieName">
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Ticket Price($)</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id="my-textfield" type="number" value="" name="mPrice">
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textarea">Movie Description</label>
                            </div>
                            <div class="md:w-2/3">
                                <textarea class="form-textarea block w-full focus:bg-white" id="my-textarea" value="" rows="5" name="mDesc"></textarea>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Image for the Card</label>
                            </div>
                            <div class="md:w-2/3">
                                <input id="filebutton" name="cardImage" class="inputfile" type="file">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn1 btn-primary" style="scale: 1; padding: 6px;">Add Movie</button>
                            <button type="button" class="btn1 btn-secondary" data-bs-dismiss="modal" style="scale: 1; padding: 6px;">Close</button>
                        </div>
                    </form>
                </div>
                <!--/input section-->
            </div>
        </div>
    </div>
    <!-- /Add button modal -->




    <!-- movie cards -->
    <div class="wrapper">
        <div class="box-area">
            <c:forEach var = "movie" items="${movieList}">
            <div class="box">
                <img alt="${movie.mName}" src="${pageContext.request.contextPath}/getImage?id${movie.mId}">
                <div class="overlay">
                    <h3>${movie.mName}</h3>

                    <!-- edit button -->
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
                        <a href="#">Edit</a>
                    </button>
                    <!-- delete button -->
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
                        <a href="#">Delete</a>
                    </button>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    <!-- /movie cards -->

</div>





<!-- Edit button common modal -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Movie</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- input section -->
            <div id='modal-body' class="p-8 mt-6 lg:mt-0 rounded shadow">
                <form name="addForm" action="" method="post" onsubmit="return validateForm()">
                    <div class="md:flex mb-6">
                        <div class="md:w-1/3">
                            <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Movie Name</label>
                        </div>
                        <div class="md:w-2/3">
                            <input class="form-input block w-full focus:bg-white" id="my-textfield" type="text" value="" name="movieName">
                        </div>
                    </div>
                    <div class="md:flex mb-6">
                        <div class="md:w-1/3">
                            <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Ticket Price</label>
                        </div>
                        <div class="md:w-2/3">
                            <input class="form-input block w-full focus:bg-white" id="my-textfield" type="text" value="" name="price">
                        </div>
                    </div>
                    <div class="md:flex mb-6">
                        <div class="md:w-1/3">
                            <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textarea">Movie Description</label>
                        </div>
                        <div class="md:w-2/3">
                            <textarea class="form-textarea block w-full focus:bg-white" id="my-textarea" value="" rows="5" name="txtarea"></textarea>
                        </div>
                    </div>
                    <div class="md:flex mb-6">
                        <div class="md:w-1/3">
                            <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="my-textfield">Image for the Card</label>
                        </div>
                        <div class="md:w-2/3">
                            <input id="filebutton" name="cardImage" class="input-file" type="file">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Movie</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
            <!--/input section-->
        </div>
    </div>
</div>
<!-- /edit button common modal -->


<!-- Delete button common modal -->
<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #c0ad05ce;">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Warning  <i class="fa-solid fa-circle-exclamation fa-lg"></i></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="background-color: #da8787b2;">
                <p>Are you sure you want to delete this movie?</p>
            </div>
            <div class="modal-footer" style="background-color: #da8787b2;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Delete</button>
            </div>
        </div>
    </div>
</div>
<!-- /Delete button common modal -->


<!-- script to validate empty inputs in add movie modal -->
<script>
    function validateForm() {
        var a = document.forms["addForm"]["movieName"].value;
        var b = document.forms["addForm"]["price"].value;
        var c = document.forms["addForm"]["txtarea"].value;
        var d = document.forms["addForm"]["filebutton"].value;
        if ((a == null || a == "") || (b == null || b == "") || (c == null || c == "") || (d == null || d == "")) {
            alert("Please Fill In All Required Fields");
            return false;
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>