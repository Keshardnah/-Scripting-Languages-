#!/usr/bin/perl -w

print "Upisi niz brojeva za listu:\n";
chomp($niz = <STDIN>);

@lista = split /\s+/, $niz;

foreach $elem (@lista){
	if($elem =~ m/\D/){
		die "Niz mora biti samo od brojeva\n";
	}
}

foreach $broj (@lista){
	$suma +=$broj;
}

$broj = @lista;
$aritm = $suma/$broj;
print "Aritmeticka sredina od @lista je $aritm\n";
