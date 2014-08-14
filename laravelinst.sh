##########################################################################
#### Script to copy install process explained in codio Laravel Tutorial at
####   https://codio.com/s/docs/specifics/laravel/
##########################################################################
 
#### Instructions
 
#### Option 1.
#### From the Codio Dashboard, create a new project and select the Git Tab
#### and then paste the following URL into the box
####          https://gist.github.com/4aa73a3258ef2c5538aa.git
#### Give your project a name and click Create.
 
#### Option 2. 
#### From the Codio Dashboard, create a new Empty template project.
#### Open a Terminal window from the Tools->Terminal window
#### Copy the contents of this file to a file called 'laravelinst.sh' in the root of your machines file system
 
#### Then run the script in the terminal window by typing
 
####           bash laravelinst.sh 

#### End of Instructions
##########################################################################
 
echo
echo "     START OF AUTOMATED INSTALL"
echo

# set the hostname variable
CODIO_HOST=`cat /etc/hostname`  

# set colour output = echo -e '\E[1;33;44m' 
# remove colour = ; tput sgr0
# See http://www.tldp.org/LDP/abs/html/colorizing.html for colour codes

 

echo -e '\E[1;33;44m' "Install php mysql apache and composer services"; tput sgr0 
parts install php5 php5-apache2 mysql composer

echo -e '\E[1;33;44m' "Start the apache and mysql services"; tput sgr0
parts start apache2 mysql

echo -e '\E[1;33;44m' "Install Laravel"; tput sgr0
composer create-project laravel/laravel --prefer-dist
mv laravel/{*,.*} ~/workspace
rm laravel -r

echo -e '\E[1;33;44m' "rename server.php in the root of the project to index.php"; tput sgr0
mv server.php index.php


echo -e '\E[1;33;44m' "......Laravel Installed!"; tput sgr0
echo -
echo To get to your Laravel site, open your browser and go to - 
echo
echo      http://"$CODIO_HOST".codio.io:3000
echo "or" 
echo from the Preview menu - the right most Codio menu and  select 
echo the drop down menu and check New Browser Tab and select Box URL.
echo Note: Do not set the Inside Codio option as this Laravel 
echo scaffold does not allow it to run in an IFrame.