<?php

    include('db.php');
    $query = "SELECT * FROM products";
    $result = mysqli_query($conn, $query);

?>

<html>
<head>
    <title>Products Database Data</title>
</head>

<style>
    *{
        margin: 0%;
        padding: 0%;
        /* background-color: mediumseagreen; */
    }
    .main{

        height: 450px;
        width: 600px;
        background-color: mediumspringgreen;
        margin: auto;
        margin-top: 80px;
        padding: 10px;
    }
    .lekha{
        width: 600px;
        text-align: center;
        margin-top: 30px;

    }
   table{
    border: 1px solid black;
    margin:auto;
    margin-top: 20px;
    
   }
   td{
    border: 1px solid black;
    text-align: center;
    background-color: bisque;
    padding: 8px;
   }
   th{
    border: 1px solid black;
    text-align: center;
    background-color: white;
    padding: 5px;
   }

</style>
<body>

<div class="main">
       <div class="lekha"><h1>Products Table</h1></div>

        
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                    </tr>
                    <?php
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['product ID'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['description'] . "</td>";
                        echo "<td>" . $row['price'] . "</td>";
                        echo "</tr>";
                    }
                    ?>
                </table>
    </div>
</body>
</html>

<?php
 mysqli_close($conn);
?>
