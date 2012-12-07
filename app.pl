#!/usr/bin/env perl
#
# A template for whipping up graphical interfaces for little applications.
#
# David Houghton, Dec 5, 2012

use Modern::Perl;
use Data::Section -setup;
use Dancer;

my ( $v1, $v2 ) = usage(@ARGV);

# CONFIG

set template => 'Template_toolkit';

#set logger   => 'console';
#set log      => 'core';
#set warnings => 1;

# INIT

my $template   = __PACKAGE__->section_data('template');
my $css        = ${ __PACKAGE__->section_data('css') };
my $javascript = ${ __PACKAGE__->section_data('javascript') };

# ROUTES

get '/' => sub {

    # react to old params
    my $p1 = param('p1');
    save($p1);

    # prepare something new

    # send
    my $t = engine 'template';
    return $t->render(
        $template,
        {
            title      => $0,
            javascript => $javascript,
            css        => $css
        }
    );
};

# START

dance;

# LOGIC

# validate args here and return useful stuff
sub usage {
    return @_;
}

# stash away good stuff we got from user
sub save {
}

# STYLE AND LAYOUT

__DATA__

__[ template ]__

<html>
<head><title><% title %></title>
<style type="text/css">
<% css %>
</style>
<script type="text/javascript">
<% javascript %>
</script>
</head>
<body onload="embellish()">
<h1><% title %></h1>
</body>
</html>

__[ javascript ]__
// add callbacks
function embellish() {
}

__[ css ]__
body {
    margin: 1em 5%;
}
body > h1 {
    display: table;
    margin: auto;
}
