#!/usr/bin/env perl
use warnings;
use 5.012;
use DateTime;
use DateTime::Event::Sunrise;

my $dt = DateTime->new( year => 2018, month => 01, day => 15, time_zone => 'America/Los_Angeles' );
#my $dt = DateTime->new( year => 2018, month => 01, day => 15 );

my $sunrise_span = DateTime::Event::Sunrise ->new (
                    longitude => '47.6062',
                    latitude =>  '-122.3321',
                    altitude =>  '2',
                    iteration => '1' );
                    

#my $sunrise_sunset_span = DateTime::Event::Sunrise ->new (
#                    longitude => '47.6062',
#                    latitude =>  '-122.3321',
#                    altitude =>  '2',
#                    iteration => '1' );

my $both_times = $sunrise_span->sunrise_sunset_span( $dt );

say "Sunrise is: " , $both_times->start->datetime;
say "Sunset is: " , $both_times->end->datetime;

# Sunrise is: 2010-12-22T04:11:20  
# Sunset is: 2010-12-22T15:22:01
