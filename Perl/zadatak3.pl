#!/usr/bin/perl -w

sub ispis_datum{
		print "\n";
		if($datum[1] eq "Jan"){
			print " Datum: $datum[2]-01-$datum[0]\n";
		}
		if($datum[1] eq "Feb"){
			print " Datum: $datum[2]-02-$datum[0]\n";
		}
		if($datum[1] eq "Mar"){
			print " Datum: $datum[2]-03-$datum[0]\n";
		}
		if($datum[1] eq "Apr"){
			print " Datum: $datum[2]-04-$datum[0]\n";
		}
		if($datum[1] eq "May"){
			print " Datum: $datum[2]-05-$datum[0]\n";
		}
		if($datum[1] eq "Jun"){
			print " Datum: $datum[2]-06-$datum[0]\n";
		}
		if($datum[1] eq "Jul"){
			print "Datum: $datum[2]-07-$datum[0]\n";
		}
		if($datum[1] eq "Aug"){
			print " Datum: $datum[2]-08-$datum[0]\n";
		}
		if($datum[1] eq "Sept"){
			print "Datum: $datum[2]-09-$datum[0]\n";
		}
		if($datum[1] eq "Oct"){
			print " Datum: $datum[2]-10-$datum[0]\n";
		}
		if($datum[1] eq "Nov"){
			print " Datum: $datum[2]-11-$datum[0]\n";
		}
		if($datum[1] eq "Dec"){
			print " Datum: $datum[2]-12-$datum[0]\n";
		}

		print " sat : broj pristupa\n";
		print "-------------------------------\n";
}

foreach $sati (0..23){
	$lista[$sati] = 0;
}

while(<>){
	chomp;

	if(eof || ($_ eq "")){
		&ispis_datum;
		foreach $sati (0..23){
			printf ("  %02d : %d\n", $sati, $lista[$sati]);
			$lista[$sati] = 0;
		}
	}
	
	@a = split /\[/, $_;
	$b = $a[1];
	@c = split /\:/, $b;
	$dat = $c[0];
	$sat = $c[1];

	@datum = split /\//, $dat;
	
	$lista[$sat] +=1;	
}	
