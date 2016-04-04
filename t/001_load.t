# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Comodo::DCV' ); }

my $object = Comodo::DCV->new ();
isa_ok ($object, 'Comodo::DCV');


