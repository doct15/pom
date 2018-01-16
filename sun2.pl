#!/usr/bin/env perl
use warnings;
use 5.012;
use DateTime;
use DateTime::Event::Sunrise;

# generating DateTime objects from a DateTime::Event::Sunrise object
#my $sun_Kyiv = DateTime::Event::Sunrise->new(longitude => +30.85,  # 30°51'E
#                                             latitude  => +50.45); # 50°27'N

my $sun_Seattle = DateTime::Event::Sunrise->new(longitude => '+47.620422',
                                                latitude  => '-122.349358',
                                                precise => '1');

for (14, 15, 16) {
  #my $dt_yapc_eu = DateTime->new(year      => 2018,
  #                               month     =>    1,
  #                               day       =>   $_,
  #                               time_zone => 'Europe/Kiev');

  my $dt_yapc_us = DateTime->new(year      => 2018,
                                 month     =>    1,
                                 day       =>   $_,
                                 time_zone => 'America/Los_Angeles');                                 

  #say "Sunrise: " , $sun_Kyiv->sunrise_datetime($dt_yapc_eu)->hms;
  #say "Sunrise: " , $sun_Seattle->sunrise_datetime($dt_yapc_us)->hms;
  
  #say "In Kyiv (50°27'N, 30°51'E) on ", $dt_yapc_eu->ymd, " sunrise occurs at ", $sun_Kyiv->sunrise_datetime($dt_yapc_eu)->hms, " and sunset occurs at ", $sun_Kyiv->sunset_datetime($dt_yapc_eu)->hms;
  say "In Seattle on ", $dt_yapc_us->ymd, " sunrise occurs at ", $sun_Seattle->sunrise_datetime($dt_yapc_us)->hms, " and sunset occurs at ", $sun_Seattle->sunset_datetime($dt_yapc_us)->hms;

}


