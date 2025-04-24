<!DOCTYPE html>
<head>

</head>
<body>
    <div style="width: 75%; margin: auto;">
        <form action="query/inserisciUtente.php" method="POST"  style="display:flex; flex-wrap: wrap;">
        <?php
                include "include/connessione.php";

                $query = "SELECT NomeCategoria FROM CATEGORIA;";
                if($result = $conn ->query($query)){
                    while($row = $result->fetch_assoc()){
                        echo '<div style="border-radius: 25px; border: 2px solid #73AD21;padding: 20px; width: 100px; height: 50px;">
                        <input type="checkbox" name="vehicle3" value="'.$row["NomeCategoria"].'">'.$row["NomeCategoria"]."</div>";
                    }
                }else{
                    die($conn->errno());
                }
        ?>
        </form>
    </div>
</body>