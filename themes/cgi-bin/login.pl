#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $db_name   = 'banca';
my $db_user   = 'max';
my $db_pass   = '60782999';
my $db_host   = 'localhost';
my $dsn = "DBI:mysql:database=$db_name;host=$db_host";
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, PrintError => 0 });

my $user = $cgi->param('usuario');
my $secret = $cgi->param('clave');

my $sql = "SELECT * FROM usuarios WHERE usuario=? AND clave=?";
my $sth = $dbh->prepare($sql);
$sth->execute();

if(my $row = $sth->fetchrow_hashref){
    $dbh->disconnect;
    print $cgi->redirect('main.html');
}else{
    $dbh->disconnect;
    print $cgi->redirect('clientes.html');
}
print $cgi->end_html;