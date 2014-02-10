<?php
            //Variables for connecting to your database.
            //These variable values come from your hosting account.
            $hostname = "localhost";
            $username = "njorobib_admin";
            $dbname = "njorobib_default";
			$password="qwer1234";

            //These variable values need to be changed by you before deploying
         
           
            //Connecting to your database
            $connection=mysql_connect($hostname, $username, $password);
			if($connection){

				echo "connected successfully";
					mysql_select_db($dbname);
			}else{
 echo $hostname." ".$username." ".$password;
				echo "connection failed";
			}
            

          