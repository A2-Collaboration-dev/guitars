#!/usr/bin/perl
use strict;
use warnings;

my $TAG = shift @ARGV or die "Provide songname";

my %data;
while(my $line = <DATA>) {
  chomp $line;
  my($tag, $ythash, $start, $length) = split(/\s+/,$line);
  $data{$tag} = [$ythash, $start, $length];
}
if($TAG eq "list") {
	print "$_\n" for keys %data;
} else {
	my $cmdline = sprintf("mpv --no-video ytdl://%s --start %.2f --length %.2f", @{$data{$TAG}});
	system($cmdline);
}


__DATA__
Ramstein 	W3q8Od5qJio	16.5  5
TeenSpirit	hTWKbfoikeg    9  5
ChopSuey	CSvFpBOe8eY   30  5
TheDarkness tKjZuykKY1I   11  8
