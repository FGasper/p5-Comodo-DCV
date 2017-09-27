#!/usr/bin/env perl

use strict;
use warnings;

use Comodo::DCV ();
use Crypt::Format ();

my $stdin = do { local $/; <STDIN> };

if (!length $stdin) {
    die "Need a CSR!";
}

if ($stdin =~ m<\A----->) {
    print "Parsing PEM …$/";
    $stdin = Crypt::Format::pem2der($stdin);
}
else {
    print "Didn’t receive PEM; assuming that this is DER …$/";
}

my ($fname, $content) = Comodo::DCV::get_filename_and_contents($stdin);

print "$/Path (relative to document root):$/.well-known/pki-validation/$fname$/";
print $/;
print "Content:$/$content$/";
