#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;
use utf8;
use JSON::XS;
use Encode qw/encode_utf8 decode_utf8/;

my (@a, @b);
my $before = "あ";
my $i = 1;
my $json = {};

while (<>) {
	chomp;
	my $x = decode_utf8 $_;
	@b = split //, $x;
	unless ($b[0] =~ /[ぁぃぅぇぉっゃゅょゎゐゑ]/) {
		if ($before eq $b[0]) {
			push @a, $x;
		} else {
			say $i . " " . encode_utf8 $before;
			$before = $b[0];
			$json->{$_} = 1 for @a;
			open FILE,'>', $i . '.json' or die;
				print FILE encode_json($json);
			close FILE;
			@a = ();
			$json = {};
			push @a, $x;
			$i++;
		}
	}
}