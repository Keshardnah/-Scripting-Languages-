#!/usr/bin/perl -w

print "Upisite niz znakova:\n";
chomp($niz = <STDIN>);
print "Upisite broj ponavljanja niza:\n";
chomp($n = <STDIN>);

$_ = $n;
while(m/\D/){
	print "Broj ponavljanja mora biti broj:\n";
	chomp($n = <STDIN>);
	$_ = $n;
}

while($n > 0){
	print "$niz\n";
	$n -=1;
}
