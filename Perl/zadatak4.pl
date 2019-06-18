#!/usr/bin/perl -w

sub ispis{
	$jmbag = $lista[0];
	$prezime = $lista[1];
	$ime = $lista[2];
	print "$jmbag $prezime $ime - PROBLEM: $datum_poc $pocetak --> $datum_zaklj $zakljucano\n";
}
while(defined($redak = <>)){
	chomp($redak);
	@lista = split /\;/, $redak;
	$termin = $lista[3];
	$zakljucano = $lista[4];
	@termin_lista = split /\s+/, $termin;
	$pocetak = $termin_lista[1];
	$datum_poc = $termin_lista[0];
	@zakljucano_lista = split /\s+/, $zakljucano;
	$zakljucano = $zakljucano_lista[1];
	$datum_zaklj = $zakljucano_lista[0];

	if(! ($datum_poc eq $datum_zaklj)){
		&ispis;
	}
	else{
		@pocetak_lista = split /\:/, $pocetak;
		$pocetak_sek = ($pocetak_lista[0] * 3600) + ($pocetak_lista[1] * 60);
		@zakljucano_lis = split /\:/, $zakljucano;
		$zakljucano_sek = ($zakljucano_lis[0] * 3600) +
					($zakljucano_lis[1] * 60) +
					($zakljucano_lis[2]);
		if(($zakljucano_sek - $pocetak_sek) > 3600){
			&ispis;
		}
	}	
}
