#!/usr/bin/perl -w

# prije pokretanja skripte, pokrenuti:
# export LC_ALL=hr_HR.UTF-8
use open ':locale';
use locale;

if(@ARGV < 1){
	die "Mora se kao argument predati prefiks.";
}

$prefiks = pop(@ARGV);

while(<>){
	chomp;
	$_ = "\L$_\E";
	@rijeci_sa_prefiksom = m/\b(\w{$prefiks})/g;
	foreach $rijec (@rijeci_sa_prefiksom){
		$prefiks_br{$rijec} +=1;
	}
}

foreach $kljuc (sort { $a cmp $b } keys %prefiks_br){
	print "$kljuc : $prefiks_br{$kljuc}\n";
}
