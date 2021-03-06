// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 140 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=140
//
// <-- Short Description -->
//     4th input is invalid (waiting for real or complex matrix) seems to be a bug


zaehler=poly([0,0,1],"z","coeff");
nenner=poly([1.3435,0.855],"z","coeff");
sys=syslin("d",zaehler./nenner);
execstr("plzr(sys);", "errcatch");

[msg, num, x, y] = lasterror();
if (msg<>msprintf(gettext("%s: Wrong value of input argument #%d: Proper system expected.\n"), "plzr", 1)) | (num<>10000) then pause, end
