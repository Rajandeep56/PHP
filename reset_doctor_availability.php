<?php
	session_start();
	$con=new mysqli ('localhost', 'root', '','project_final');
    if ($con -> connect_errno) {
        echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
        exit();
      }
      else {
        echo "db connected";
      }

     
?>
     
<!DOCTYPE html>
<html lang="en">
<?php include 'header.php'; ?>

        <center>
<form action="reset_doctor_availability.php" method="post">
			
			<div  class="inner_container">
			
            <label>Select a Doctor</label>
        <select name="doctorName">
            <?php
                 $query = "select * from doctors";
                 $statement = mysqli_query($con,$query);
                while ($doctorname = $statement->fetch_assoc()){
                    $test = $doctorname["doctorName"];
                    echo "<option>$test</option>";
            
                }
                ?>
        </select><br><br>
        
				
		<button name="book"  type="submit">Reset Availability</button><br><br><br>
         <a href='makeUnavailabletime.php' >Modify Availability</a> <br>
         <a href='Availability.php' >Create Availability</a> <br>

        <?php 
         if(isset($_POST['book']))
         {    $docName=$_POST['doctorName'];
           
            $query3 = "update Availability 
                        set Status = 'Available' 
                        where ( Status ='Reserved' or Status ='Unavailable')and medicalLicence in (select Availability.medicalLicence from Availability 
                        INNER JOIN doctors
                        ON Availability.medicalLicence = doctors.medicalLicence and doctors.doctorName = '$docName' ) ";
            $statement3 = mysqli_query($con,$query3);
            echo "$statement3";
            if($statement3){
            echo " Availability reset for '$docName'<br>";
        }
        }
        ?>
			</form></center>
            

	</body>
   

<?php include 'footer.php'; ?>

</html>