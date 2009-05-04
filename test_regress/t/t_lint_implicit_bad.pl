#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2008 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

top_filename("t/t_lint_implicit.v");

compile (
	 v_flags2 => ["--lint-only"],
	 fails=>1,
	 expect=>
'%Warning-IMPLICIT: t/t_lint_implicit.v:\d+: Signal definition not found, creating implicitly: b
%Warning-IMPLICIT: Use .* to disable this message.
%Warning-IMPLICIT: t/t_lint_implicit.v:\d+: Signal definition not found, creating implicitly: nt0
%Error: Exiting due to.*',
	 ) if $Self->{v3};

ok(1);
1;

