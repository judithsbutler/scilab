// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Pierre Lando
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 7024 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7024
//
// <-- Short Description -->
// Error messages from twinkle was not standard.

ierr = execstr("twinkle()", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong number of input arguments: %d or %d expected.\n"), "twinkle", 1, 2) then pause, end

ierr = execstr("twinkle(1)", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong type for input argument #%d: Graphic handle expected.\n"), "twinkle", 1) then pause, end

ierr = execstr("twinkle(1, 6)", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong type for input argument #%d: Graphic handle expected.\n"), "twinkle", 1) then pause, end

ierr = execstr("twinkle(gcf(), ""a string"")", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong type for input argument #%d: Scalar expected.\n"), "twinkle", 2) then pause, end
