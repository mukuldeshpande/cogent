#!/usr/bin/perl -w 

use English;


@tech_list=("tsmc035", "tsmc025","65nm_bulk");

$delay_testbench = "delay.scs";
$logfile = "t.log";
$tech_def = "tech.scs";

$result_file = "delay_results.txt";

open(OUTPUT, ">$result_file") || die "Cannot open file $result_file for writing\n";

foreach $tech (@tech_list) {

    print "Running test for $tech\n";
    #modify tech.scs file for this technology
    open(OUTPUT2, ">$tech_def") || die "Cannot open file $tech_def for writing\n";
    print OUTPUT2 "include \"$tech.scs\"\n";
    close(OUTPUT2);
    $cmd = "spectre $delay_testbench > $logfile";
    &execute_cmd($cmd);
    &parse_result();
}


sub parse_result {
    my($words);
    my($more_words);
    open(INPUT,$logfile)||die "Cannot open file $tech_def for writing\n";
    while (<INPUT>){
	chop;    #remove line feed at end
	if (/Transient Analysis/) {  #look for line with this pattern
	    @words=split;  #split on white space
	    $tran_name = $words[2];
	}

	if (/Total time required for tran analysis/) {  #look for line with this pattern
	    &print_results(); #print the result
	}

	if (/dut_tplh_value/) {  #look for line with this word
	    @words=split('=',$_);  #split it on '='
	    $tplh_delay = &convert_to_ps($words[1]);  #covert to ps
	}
	if (/dut_tphl_value/) {
	    @words=split('=',$_);
	    $tphl_delay = &convert_to_ps($words[1]);  #covert to ps
	}
	if (/SIMPARMS/) {  #look for line with this word
	  @words = split(' ',$_);  #split it on space
	  @more_words = split('=',$words[1]);
          $vdd = $more_words[1];
	  @more_words = split('=',$words[2]);
          $lambda = $more_words[1];
	  @more_words = split('=',$words[3]);
          $p_mult = $more_words[1];
      }
	    
    }
}

sub print_results {

   print OUTPUT ("$tech $tran_name vdd $vdd lambda $lambda p_mult $p_mult  tplh $tplh_delay  tphl $tphl_delay  \n");

}


## get rid of ".s" at end of delay value, convert to ps
sub convert_to_ps{
    my($parm) = @_;
    my(@lwords);
    $_=$parm;
    @lwords=split;   #split on white space, the leading word is the number
    return($lwords[0]/1.0e-12);
}

sub execute_cmd {
    my($this_cmd) = pop(@_);
    my($pid);

    printf "Executing '$cmd' \n";
    $pid = open (LAST,"$cmd |");
    while (<LAST>) {
	print $_;
    }
    close(LAST);
}
