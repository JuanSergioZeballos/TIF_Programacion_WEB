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

my $name = $cgi->param('name2');
my $email = $cgi->param('email2');
my $password = $cgi->param('password2');

my @name_parts = split(/\s+/, $name);

if (@name_parts < 3) {
    print "Content-Type: text/plain\n\n";
    print "nameNotOk";
    $dbh->disconnect;
    die; 
}
my ($nombre, $paterno, $materno) = @name_parts;

my $sql = "INSERT INTO clientes (nombres, paterno, materno, correo, dni, usuario_id) VALUES (?, ?, ?, ?, ?, ?)";
my $sth = $dbh->prepare($sql);
$sth->execute($nombre, $paterno, $materno, $email, $password, 1);

print "Content-Type: text/plain\n\n";
print "OK";
$sth->finish;
$dbh->disconnect;