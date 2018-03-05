# Program:	ping.pl
# Author:	RJ Podeschi
# Date:		MArch 5, 2018
#
# Purpose:
# Program to ping workstations in the classroom
# If the ping is successful, a message is sent to the screen
# Program assumes a Class C address (w.x.y.z) where w.x.y is the network portion of the IP address
# The “z” octet will be incremented from 1 to 254 with a for loop unless otherwise directed 

use Net::Ping; # Loads the Net library
$p = Net::Ping->new(); # Creates a new ping object with the default settings

$class_IP = "192.16.0"; # Network ID

for ($z=1; $z<255; $z++) {
    $wkstation = "$class_IP.$z"; # Creates the host to be scanned for this iteration of the for loop
    print "Looking for live systems to attack, Trying $wkstation \n"; #Displays status message
    system("notify-send '$wkstation is ready to attack!'") if $p->ping($wkstation); # Sends message if ping is successful
}
