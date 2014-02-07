#!/usr/bin/perl -w

use English;
use Mail::Sender;


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

$_=`whoami`;
chop;
$person = $_;


## Change these variables
$simdir = "lab3b";
$assignment="ece4263_lab3b";
#$target_dir = "/home/reese/ece4263/lab_submissions/$person";
@files = ("$simdir/lab3.elib", "$simdir/report.pdf");   # for file check

#$clean_cmd = "/home/reese/bin/altera_clean $simdir";

#####



$maxsize = 1000000;



$fail = 0;
if (!-e $simdir) {
    printf "Expecting a directory named $simdir\n. File not submitted.\n";
    exit(1);
}

# clean directory
#printf "Cleaning  directory $simdir of unnecessary files...\n ";
#`$clean_cmd`;

foreach $file (@files) {
 
    
    printf "Checking existence of: $file \n";
    if (!(-e $file)) {
	printf STDERR "Can't find file: $file\n";
	$fail = 1;
    }

}

if ($fail) {
    printf STDERR "File Existence check failed, project not submitted \n";
    exit(-1);
}




printf STDERR "Creating zip archive...\n";

$zipname = $person . "_" . $simdir;

if (-e "$zipname.zip") {
$cmd = "rm $zipname.zip";
&execute_cmd($cmd);
}


$cmd = "zip -r $zipname.zip $simdir";


&execute_cmd($cmd);

if (!(-e "$zipname.zip")) {
    printf STDERR "Zip file creation failed. Internal error, send email to reese\@ece.msstate.edu \n";
    printf STDERR "Homework not submitted.\n";
    exit(-1);
}

@fstats = stat("$zipname.zip");

$fsize =  $fstats[7];
if ($fsize > $maxsize) {
    print STDERR "Your ZIP file ($zipname.zip) submission is too big (> $maxsize bytes) \n";
    print STDERR "Make sure only ESSENTIAL files are in the $simdir directory. \n";
    print STDERR "Homework not submitted.\n";
    exit(-1);
}
  




printf STDERR "Mailing Zip Archive...\n";


$from_address = "$person\@msstate.edu";
$to_address = "reese\@ece.msstate.edu";


$sender = new Mail::Sender {smtp => "mailhost.ece.msstate.edu",from =>$from_address};


$sender->MailFile({to=> $to_address,
subject => $assignment,
msg => "Attached is the zip archive for the ECE 4263 submission",
file => "$zipname.zip" });

$sender->MailFile({to=> $from_address,
subject => $assignment,
msg => "Attached is the zip archive for the ECE 4263 submission",
file => "$zipname.zip" });


`rm -f $zipname.zip`;


printf STDERR "Project submitted. Mailed to both $from_address  and $to_address\n";

