#!/usr/bin/perl
 
# stripgutenberg.pl < in.txt > out.txt
#
# designed for piping
# Written by Andrew Dunbar (hippietrail), released into the public domain, Dec 2010
 
use strict;
 
my $debug = 0;
 
my $state = 'beginning';
my $print = 0;
my $printed = 0;
 
while (1) {
    $_ = <>;
 
    last unless $_;
    
    # strip UTF-8 BOM
    if ($. == 1 && index($_, "\xef\xbb\xbf") == 0) {
        $_ = substr($_, 3);
    }
 
    if ($state eq 'beginning') {
        if (/^(The Project Gutenberg [Ee]Book( of|,)|Project Gutenberg's )/) {
            $state = 'normal pg header';
            $debug && print "state: beginning -> normal pg header\n";
            $print = 0;
        } elsif (/^$/) {
            $state = 'beginning blanks';
            $debug && print "state: beginning -> beginning blanks\n";
        } else {
            die "unrecognized beginning: $_";
        }
    } elsif ($state eq 'normal pg header') {
        if (/^\*\*\*\ ?START OF TH(IS|E) PROJECT GUTENBERG EBOOK,? /) {
            $state = 'end of normal header';
            $debug && print "state: normal pg header -> end of normal pg header\n";
        } else {
            # body of normal pg header
        }
    } elsif ($state eq 'end of normal header') {
        if (/^(Produced by|Transcribed from)/) {
            $state = 'post header';
            $debug && print "state: end of normal pg header -> post header\n";
        } elsif (/^$/) {
            # blank lines
        } else {
            $state = 'etext body';
            $debug && print "state: end of normal header -> etext body\n";
            $print = 1;
        }
    } elsif ($state eq 'post header') {
        if (/^$/) {
            $state = 'blanks after post header';
            $debug && print "state: post header -> blanks after post header\n";
        } else {
            # multiline Produced / Transcribed
        }
    } elsif ($state eq 'blanks after post header') {
        if (/^$/) {
            # more blank lines
        } else {
            $state = 'etext body';
            $debug && print "state: blanks after post header -> etext body\n";
            $print = 1;
        }
    } elsif ($state eq 'beginning blanks') {
        if (/<!-- #INCLUDE virtual=\"\/include\/ga-books-texth\.html\" -->/) {
            $state = 'header include';
            $debug && print "state: beginning blanks -> header include\n";
        } elsif (/^Title: /) {
            $state = 'aus header';
            $debug && print "state: beginning blanks -> aus header\n";
        } elsif (/^$/) {
            # more blanks
        } else {
            die "unexpected stuff after beginning blanks: $_";
        }
    } elsif ($state eq 'header include') {
        if (/^$/) {
            # blanks after header include
        } else {
            $state = 'aus header';
            $debug && print "state: header include -> aus header\n";
        }
    } elsif ($state eq 'aus header') {
        if (/^To contact Project Gutenberg of Australia go to http:\/\/gutenberg\.net\.au$/) {
            $state = 'end of aus header';
            $debug && print "state: aus header -> end of aus header\n";
        } elsif (/^A Project Gutenberg of Australia eBook$/) {
            $state = 'end of aus header';
            $debug && print "state: aus header -> end of aus header\n";
        }
    } elsif ($state eq 'end of aus header') {
        if (/^((Title|Author): .*)?$/) {
            # title, author, or blank line
        } else {
            $state = 'etext body';
            $debug && print "state: end of aus header -> etext body\n";
            $print = 1;
        }
    } elsif ($state eq 'etext body') {
        # here's the stuff
        if (/^<!-- #INCLUDE virtual="\/include\/ga-books-textf\.html" -->$/) {
            $state = 'footer';
            $debug && print "state: etext body -> footer\n";
            $print = 0;
        } elsif (/^(\*\*\* ?)?end of (the )?project/i) {
            $state = 'footer';
            $debug && print "state: etext body -> footer\n";
            $print = 0;
        }
    } elsif ($state eq 'footer') {
        # nothing more of interest
    } else {
        die "unknown state '$state'";
    }
 
    if ($print) {
        print;
        ++$printed;
    } else {
        $debug && print "## $_";
    }
}