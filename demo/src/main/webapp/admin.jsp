<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/11/2024
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        *{
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }
        body{
            background: #ebf2ff;
            color: #ffffff;
        }

        /* cards css */

        .cardArea{
            padding: 50px 0;
            /* background-color: #1d2b22; */
            background-image: linear-gradient(to bottom right, #1d2b22, rgb(26, 26, 1));
        }
        .buttonSection{
            display: flex;
            justify-content: center;
            font-size: 18px;
            font-family: "Poppins", sans-serif;
            font-weight: 400;
            transition: 0.3s;
            border: none;
        }

        /* add movie button css  */
        .btn1{
            font-size: 16px;
            margin-top: 10px;
            color: #000000;
            text-decoration: none;
            background: #f1dc16;
            border-radius: 50px;
            text-align: center;
            padding: 10px 50px;
            border-color: #f1dc16;
        }
        .btn1{
            transition: 0.5s;
            font-weight: 600;
        }
        .btn1:hover{
            background-color: #f1dc16;
            color: #000000;
            scale: 1.2;
            font-weight: 600;
        }
        .btn1:active{
            background-color: #eecbcb;
        }

        /* modal css */
        .wrapper{
            padding: 10px 10%;
        }
        .modal-content{
            background-color: transparent;
        }
        .modal-header{
            padding-top: 1%;
            padding-bottom: 1%;
            background-color: #c0ad05ce;;
            color: #ffffff;
        }
        .form1{
            padding-bottom: 1%;
        }
        #modal-body{
            background-color: rgba(0, 0, 0, 0.74);;
            color: #814343;
            padding-bottom: 0;
        }

        /* movie cards css */
        .box-area{
            display: grid;
            align-content: center;
            gap: 50px;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            grid-row: auto;
            margin-top: 50px;
        }
        .box {
            border-radius: 20px;
            position: relative;
            overflow: hidden;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.9);
        }
        .box img{
            width: 100%;
            height: 100%;
            border-radius: 20px;
            display: block;
            transition: transform 0.5s;
        }
        .overlay {
            width: 100%;
            height: 0;
            background: linear-gradient(transparent,#5c5c5c 58%);
            border-radius: 20px;
            position: absolute;
            left: 0;
            bottom: 0;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            font-size: 14px;
            transition: height 0.5s;
        }
        .overlay h3 {
            color: #000000;
            font-weight: 500;
            margin-bottom: 5px;
            margin-top: 80%;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 25px;
            letter-spacing: 2px;
        }
        .btn {
            border: none;
            transition: 0.5s;
        }
        .btn:hover {
            scale: 1.2;
        }
        .overlay a {
            margin-top: 10px;
            color: #000000;
            text-decoration: none;
            font-size: 14px;
            background: #ffffff;
            border-radius: 50px;
            text-align: center;
            padding: 5px 15px;
            transition: 0.3s;
        }
        .overlay a:hover{
            background-color: #aea1e9;
            scale: 1.2;
        }
        .overlay a:active{
            border: none;
        }
        .box:hover img{
            transform: scale(1.1);
        }
        .box:hover .overlay{
            height: 100%;
        }
    </style>
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
                    <h1 class="modal-title fs-5" id="staticBackdropLabel1">Add Movie</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- input section -->
                <div id='modal-body1' class="p-8 mt-6 lg:mt-0 rounded shadow">

                    <form class="form1" name="addForm" action="AddMovieServlet" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="movieId">Movie Id</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id="movieId" type="number" name="id" required>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="movieName">Movie Name</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id="movieName" type="text" name="movieName" required>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="moviePrice">Ticket Price($)</label>
                            </div>
                            <div class="md:w-2/3">
                                <input class="form-input block w-full focus:bg-white" id=moviePrice type="number" name="moviePrice" required>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="movieDesc">Movie Description</label>
                            </div>
                            <div class="md:w-2/3">
                                <textarea class="form-textarea block w-full focus:bg-white" id="movieDesc" rows="5" name="movieDesc"></textarea>
                            </div>
                        </div>

                        <div class="md:flex mb-6">
                            <div class="md:w-1/3">
                                <label class="block text-600 font-bold md:text-left mb-3 md:mb-0 pr-4" for="cardImage">Image for the Card</label>
                            </div>
                            <div class="md:w-2/3">
                                <input id="cardImage" name="cardImage" class="inputfile" type="file">
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
            <!-- Loop through movies -->
            <c:forEach var="movie" items="${movies}">
                <div class="box">
                    <img src="${pageContext.request.contextPath}/${movie.imagePath}" alt="${movie.title}" onerror="this.src='path/to/default/image.jpg'">
                    <div class="overlay">
                        <h3>${movie.title}</h3>

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
                <h1 class="modal-title fs-5" id="staticBackdropLabel2">Edit Movie</h1>
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
        var movieId = document.forms["addForm"]["movieId"].value;
        var movieName = document.forms["addForm"]["movieName"].value;
        var moviePrice = document.forms["addForm"]["mPrice"].value;
        var movieDesc = document.forms["addForm"]["mDesc"].value;
        var fileInput = document.forms["addForm"]["cardImage"].value;

        if (!movieId || !movieName || !moviePrice || !movieDesc || !fileInput) {
            alert("Please fill in all required fields.");
            return false;
        }

        return true; // All validations passed
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>