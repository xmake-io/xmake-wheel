#!/usr/bin/env -S perl -pi
BEGIN {
    exit if scalar @ARGV == 0;
    $version =
`curl -s https://api.github.com/repos/xmake-io/xmake/releases/latest | jq -r .tag_name`;
    chomp $version;
    $version =~ s/^v//;
}

s/(?<=version = ")[^"]+/$version/;
s/(?<=__version__ = ")[^"]+/$version/;
s/(?<=  "version": ")[^"]+/$version/;
