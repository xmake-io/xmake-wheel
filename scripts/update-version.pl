#!/usr/bin/env -S perl -pi
BEGIN {
    exit if scalar @ARGV == 0;
    $version =
`curl -s https://api.github.com/repos/xmake-io/xmake/releases/latest | jq -r .tag_name`;
    chomp $version;
    $version =~ s/^v//;
    $sha =
`curl -s https://github.com/xmake-io/xmake/releases/download/$version/xmake-$version.tar.gz | sha256sum`;
    chomp $sha;
    $sha =~ s/\s*-//;
}

s/(?<=version = ")[^"]+/$version/;
s/(?<=  "version": ")[^"]+/$version/;
s/(?<=    add_versions\("v)[^"]+/$version/;
s/(?<=    add_versions\("v$version", ")[^"]+/$sha/;
