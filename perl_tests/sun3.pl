  use DateTime;
  use DateTime::Event::Sunrise;

  # generating DateTime objects from a DateTime::Event::Sunrise object
  my $sun_Kyiv = DateTime::Event::Sunrise->new(longitude => +30.85,  # 30°51'E
                                               latitude  => +50.45); # 50°27'N
  for (12, 13, 14) {
    my $dt_yapc_eu = DateTime->new(year      => 2013,
                                   month     =>    8,
                                   day       =>   $_,
                                   time_zone => 'Europe/Kiev');
    say "In Kyiv (50°27'N, 30°51'E) on ", $dt_yapc_eu->ymd, " sunrise occurs at ", $sun_Kyiv->sunrise_datetime($dt_yapc_eu)->hms,
                                                         " and sunset occurs at ", $sun_Kyiv->sunset_datetime ($dt_yapc_eu)->hms;
  }

  # generating DateTime objects from DateTime::Set objects
  my $sunrise_Austin = DateTime::Event::Sunrise->sunrise(longitude => -94.73,  # 97°44'W
                                                         latitude  => +30.3);  # 30°18'N
  my $sunset_Austin  = DateTime::Event::Sunrise->sunset (longitude => -94.73,
                                                         latitude  => +30.3);
  my $dt_yapc_na_rise = DateTime->new(year      => 2013,
                                      month     =>    6,
                                      day       =>    3,
                                      time_zone => 'America/Chicago');
  my $dt_yapc_na_set = $dt_yapc_na_rise->clone;
  say "In Austin (30°18'N, 97°44'W), sunrises and sunsets are";
  for (1..3) {
    $dt_yapc_na_rise = $sunrise_Austin->next($dt_yapc_na_rise);
    $dt_yapc_na_set  = $sunset_Austin ->next($dt_yapc_na_set);
    say $dt_yapc_na_rise, ' ', $dt_yapc_na_set;
  }

  # If you deal with a polar location
  my $sun_in_Halley = DateTime::Event::Sunrise->new(
                                 longitude => -26.65, # 26°39'W
                                 latitude  => -75.58, # 75°35'S
                                 precise   => 1,
                                 );
  my $Alex_arrival = DateTime->new(year  => 2006, # approximate date, not necessarily the exact one
                                   month =>    1,
                                   day   =>   15,
                                   time_zone => 'Antarctica/Rothera');
  say $Alex_arrival->strftime("Alex Gough (a Perl programmer) arrived at Halley Base on %Y-%m-%d.");
  if ($sun_in_Halley->is_polar_day($Alex_arrival)) {
    say "It would be days, maybe weeks, before the sun would set.";
  }
  elsif ($sun_in_Halley->is_polar_night($Alex_arrival)) {
    say "It would be days, maybe weeks, before the sun would rise.";
  }
  else {
    my $sunset = $sun_in_Halley->sunset_datetime($Alex_arrival);
    say $sunset->strftime("And he saw his first antarctic sunset at %H:%M:%S.");
  }
