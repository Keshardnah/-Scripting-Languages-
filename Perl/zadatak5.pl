#!/usr/bin/perl -w

if(@ARGV < 1){
	die "Mora se kao argument predati datoteka.";
}

$otvorena = open DATOTEKA, "<", $ARGV[0];
if(! $otvorena){
	die "Datoteka nije otvorena za citanje.";
}

$prosao_redak = 0;
while(<DATOTEKA>){
	chomp;
	if(! m/^\#/){
		if($prosao_redak == 1){
			@lista_fak = split /\;/, $_;
		}
		else{
			@lista_stud = split /\;/, $_;
			$jmbag = shift(@lista_stud);
			$prezime = shift(@lista_stud);
			$ime = shift(@lista_stud);
			my $i = 0;
			$suma = 0;
			foreach $ocjena (@lista_stud){
				if(! ($ocjena eq "-")){
					$suma += $ocjena * $lista_fak[$i];
				}
				$i +=1;
			}
			$jmbag_prez{$jmbag} = $prezime;
			$jmbag_ime{$jmbag} = $ime;
			$jmbag_suma{$jmbag} = $suma;
		}	
	}
	$prosao_redak +=1;
}

close DATOTEKA;

print "Lista po rangu:\n";
print "-------------------\n";
$i = 0;
foreach $kljuc (reverse (sort { $jmbag_suma{$a} <=> $jmbag_suma{$b} or $a <=> $b } keys %jmbag_suma)){
	$i +=1;
	printf ("%d. %s, %s (%s)  : %.2f\n", $i, $jmbag_prez{$kljuc}, $jmbag_ime{$kljuc}, $kljuc, $jmbag_suma{$kljuc});
}

