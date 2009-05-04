#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2009 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

top_filename("t/t_trace_ena.v");

compile (
	 v_flags2 => [$Self->{v3}?'-trace -sp':''],
	 );

execute (
	 check_finished=>1,
	 );

if ($Self->{v3}) {
    # Note more checks in _cc.pl
    file_grep     ("$Self->{obj_dir}/simx.vcd", qr/\$enddefinitions/x);
}

ok(1);
1;
