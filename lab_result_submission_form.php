
<!DOCTYPE html>
<html>
<?php include 'header.php'; ?>

	<div id="main-wrapper">
	<center><h2>Upload Lab Results</h2></center>
		<form action="lab_results.php" method="post" enctype="multipart/form-data">
			<div class="imgcontainer">
				<img src="imgs/avatar.png" alt="Avatar" class="avatar">
			</div>
			<div class="inner_container">
				
                <label><b>Health Card Number</b></label>
				<input type="text" placeholder="Enter Health card number" name="cardnumber" required><br>
                <label><b>Choose File</b></label>
				<input type="file" name="pdf_file" id="pdf_file" accept="application/pdf" /><br><br>
	 
				<button name="results" class="sign_up_btn" type="submit">Upload Results</button><br>
				
				<a href="homepage.php"><button type="button" class="back_btn">Homepage</button></a><br>
			</div>
		</form>
		
	</div>
</body>

<?php include 'footer.php'; ?>

      </html>