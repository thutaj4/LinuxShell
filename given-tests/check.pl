#!/usr/bin/perl

use strict;

my $PART1 = 1;
my $PART2 = 2;

###########################################
# Parse Command Line Arguments
# [B/I] [Binary] [Input file] [Num Jobs] [History] [Background] [OUTPUT]
###########################################
if( scalar(@ARGV) < 6 ) {
    print "ERROR: Not enough arguments\n";
    exit -1;
}

my $isbatch        = ($ARGV[0] =~ /b/i ? 1 : 0);
my $binary         = $ARGV[1];
my $input          = $ARGV[2];
my $num_jobs       = int($ARGV[3]);
my $num_history    = int($ARGV[4]);
my $num_background = int($ARGV[5]);
my $exp_output     = $ARGV[6];

my $which_part     = ($input =~ /part1/i ? $PART1 : $PART2);

my $true_cmd;

###########################################
# Diagnostics
###########################################
print "-"x70 . "\n";
print "Running the command:\n";
if( $isbatch ) {
    print "\tshell\$ $binary $input\n";
} else {
    print "\tshell\$ $binary < $input\n";
}

###########################################
# Run the command and gather all output
###########################################
my @output;
if( $isbatch ) {
    $true_cmd = "$binary $input";
    @output = `$binary $input 2>&1`;
} else {
    $true_cmd = "$binary < $input";
    @output = `$binary < $input 2>&1`;
}

###########################################
# Display the output
###########################################
if( $which_part == $PART2 ) {
    print "m"x70 . "\n";
    print "True Output\n";
    print "m"x70 . "\n";
    system($true_cmd);
    print "m"x70 . "\n";
    print "m"x70 . "\n";
}
###########################################

###########################################
# Check the final totals
###########################################
my $num_errors = 0;
my $num;
my $found_num_jobs = 1;
my $found_num_jobs_bg = 1;
my $found_num_jobs_h = 1;

foreach my $line (@output) {

    if( $line =~ /Total number of jobs/i ) {
        if( $line =~ /history/i ) {
            $line =~ /\d+/;
            $num = $&;
            $found_num_jobs_h = 0;

            if( int($num) != $num_history ) {
                printf("Error: The number of jobs (history) reported was expected to be %d, but was reported as %d\n", $num_history, $num);
                ++$num_errors;
            }
        }
        elsif( $line =~ /background/i ) {
            $line =~ /\d+/;
            $num = $&;
            $found_num_jobs_bg = 0;

            if( int($num) != $num_background ) {
                printf("Error: The number of jobs (background) reported was expected to be %d, but was reported as %d\n", $num_background, $num);
                ++$num_errors;
            }
        }
        else {
            $line =~ /\d+/;
            $num = $&;
            $found_num_jobs = 0;

            if( int($num) != $num_jobs ) {
                printf("Error: The number of jobs (total) reported was expected to be %d, but was reported as %d\n", $num_jobs, $num);
                ++$num_errors;
            }
        }
    }
}

if( 1 == $found_num_jobs ) {
    printf("Error: Did not find the output for the \"Total number of jobs\"\n");
    ++$num_errors;
}
if( 1 == $found_num_jobs_h ) {
    printf("Error: Did not find the output for the \"Total number of jobs in history\"\n");
    ++$num_errors;
}
if( 1 == $found_num_jobs_bg ) {
    printf("Error: Did not find the output for the \"Total number of jobs in background\"\n");
    ++$num_errors;
}

if( 0 == $num_errors ) {
    printf("Passed: Job totals\n");
}
else {
    printf("Failed! $num_errors Errors!\n");
    #exit ($num_errors * -1);
    exit 0;
}

###########################################
# Check the content of the output
#  - Part 1 only
###########################################
my @all_exp = ();
if( $PART1 == $which_part ) {
    #
    # Extract all of the 'Job' lines from the output
    #
    if( !open(EXPECTED, "<", $exp_output) ) {
        print "Error: Failed open the expected output file: [$exp_output]\n";
        exit -1;
    }

    while( my $line = <EXPECTED> ) {
        chomp($line);
        if( $line =~ /Job\s*\d+/ ) {
            my $exp = $& . $';   #';
            $exp = $exp;
            push(@all_exp, $exp);
        }
    }

    close(EXPECTED);

    #
    # Find each of those lines in the actual output
    #
    for(my $ith = 0; $ith < scalar(@all_exp); ++$ith) {
        my $exp = $all_exp[$ith];

        if( 0 != find_match($exp) ) {
            printf("Error: Did not find the exact output below for Job ".($ith+1).".\n");
            printf("\t$exp\n");
            ++$num_errors;
        }
    }

    if( 0 == $num_errors ) {
        printf("Passed: Output Content\n");
    }
    else {
        printf("Failed! $num_errors Errors in the output!\n");
        return $num_errors * -1;
    }

}

if( defined($exp_output) ) {
    ;
}

exit 0;

sub find_match() {
    my $exp = shift(@_);
    $exp =~ s/:/ /g;
    my @exp_strings = split(/\s+/, $exp);
    my $found_one = 0;
    my $found_all = 0;

    foreach my $line (@output) {
        chomp($line);
        $line =~ s/:/ /g;

        my @line_strings = split(/\s+/, $line);
        #print "-"x70 . "\n";
        #printf("Compare:\n\t$line\n\t$exp\n");

        $found_all = 0;
        foreach my $e (@exp_strings) {

            $found_one = 0;
            foreach my $l (@line_strings) {
                if( $e eq $l ) {
                    $found_one = 1;
                    last;
                }
            }
            # If this line does not match, then keep looking on the next line
            if( 0 == $found_one ) {
                last;
            }
            else {
                ++$found_all;
            }
        }

        # If this line does not match all of the expected tokens, then keep looking on the next line
        if( $found_all != scalar(@exp_strings) ) {
            $found_all = 0;
        }
        else {
            $found_all = 1;
            last;
        }
    }

    #print "z"x70 . " ($found_all)\n";

    # If we found all of the tokens then return success, otherwise error
    if( 0 == $found_all ) {
        return -1;
    }
    else {
        return 0;
    }
}
