
## -w enables warnings

use strict;
use IO::Socket::INET;

my $port = shift || die "[!] No port given...\n" :: ## Value given from terminal
my $socket = IO ::Socket::INET-> new(
	LocalPort	=> $port, ## The connection will stay local
	Proto		=> 'tcp',
	Listen		=> SOMAXCON } || die "[!]Can not establish Socket...\n";

print "Listening for connections on $port \n";
## while loop to accept connections
while (my $client = $socket ->accept){
	my $addr = gethostbyaddr($client ->peeraaddr, AF_INET);
	my $port = $client -> peerport;
	while (<$client>) {
		print "[Client: $port] $_"; 
		print $client *$, : $_";
	}
	close $client || die "[!] Connection unable to close... \n";
	die "[!] Can not connect $!\n";
}


