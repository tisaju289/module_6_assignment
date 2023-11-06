<?php

    include('db.php');
    $query = "SELECT * FROM order_items";
    $result = mysqli_query($conn, $query);

?>

<html>
<head>
    <title>Order item Database Data</title>
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
       <div class="lekha"><h1>Order item Table</h1></div>

        
                <table>
                    <tr>
                        <th>Order item ID</th>
                        <th>Quantity</th>
                        <th>unit price</th>
                        <!-- <th>Price</th> -->
                    </tr>
                    <?php
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['order item ID'] . "</td>";
                        echo "<td>" . $row['quantity'] . "</td>";
                        echo "<td>" . $row['unit price'] . "</td>";
                        // echo "<td>" . $row['price'] . "</td>";
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
