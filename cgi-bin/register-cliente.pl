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

my $name = $cgi->param('name');
my $password = $cgi->param('password');
my $email = $cgi->param('email');

print "$name,$password,$email";

my @name_parts = split(/\s+/, $nombreCompleto);

if (@nombre_parts < 3) {
    print "Content-Type: text/plain\n\n";
    print "nameNotOk";
    die;
}
my ($nombre, $apellido_paterno, $apellido_materno) = @nombre_parts;

my $sql = "INSERT INTO clientes (nombre, paterno, materno, correo, dni) VALUES (?, ?, ?, ?, ?)";
my $sth = $dbh->prepare($sql);
$sth->execute($nombre, $apellido_paterno, $apellido_materno, $email, $password);

print "Content-Type: text/plain\n\n";
print "OK";
$sth->finish;
$dbh->disconnect;