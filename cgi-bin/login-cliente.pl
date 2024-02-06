#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new; 
my $db_name = 'banca';
my $db_user = 'root';
my $db_pass = '60782999';
my $db_host = 'localhost';
my $dsn = "DBI:mysql:database=$db_name;host=$db_host;port=3306";
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, PrintError => 0 });

my $user = $cgi->param('email');
my $secret = $cgi->param('password');

my $sql = "SELECT * FROM clientes WHERE correo=? AND dni=?";
my $sth = $dbh->prepare($sql);
$sth->execute($user, $secret);

print "Content-Type: text/plain\n\n";
if(defined(my $row = $sth->fetchrow_array)){
    print "OK";
    $sth->finish;
    $dbh->disconnect;
}else{
    print "notOK";
    $sth->finish;
    $dbh->disconnect;
}