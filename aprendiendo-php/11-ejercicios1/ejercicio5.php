<?php

/* 
EJERCICIO5, Hacer un programa que muestre todos los numeros entre dos numeros que nos lleguen por la URL ($_GET)
 */
 
if(isset($_GET['numero1']) && isset($_GET['numero2'])){
    
    $num1 = $_GET['numero1'];
    $num2 = $_GET['numero2'];
    
    if($num1 <= $num2){
        for($con=$num1; $con<=$num2; $con++){
            echo "$con"."<br>";
        }
    }else{
        for($con=$num2; $con<=$num1; $con++){
            echo "$con"."<br>";
        }
    }
}else{
    echo "<h4>Introduce datos por la URL</h4>";
}

