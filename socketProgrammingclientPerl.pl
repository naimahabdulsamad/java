use strict;
use IO::Socket::INET;

my $server = shift;

my $port = shift;

my $socket = IO::Socket::INET->new(
	PeerAddr	=>$server,
	PeerPort	=>$port,
	Proto		=> 'tcp') || die"[!]Can not connect to $server" 
;
print "Establishing connection to $server : $port \n";

while(<STDIN>)
	print $socket $_;
	print scalar <$socket>;

close $socket || die "[!] Can not close connection.../n";

