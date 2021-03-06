// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13192 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=13192
//
// <-- Short Description -->
// Horner function returned an error message when the input arguments did not
// have the same size.

s = %s;
H = [1/s; 1/s; 1/(s+1)];
f = [1+%i 1/(1-s)];
expectedN = [1 1-5*s+10*s^2-10*s^3+5*s^4-s^5; 1 1-5*s+10*s^2-10*s^3+5*s^4-s^5; 1 1-5*s+10*s^2-10*s^3+5*s^4-s^5];
expectedD = [1+%i 1-4*s+6*s^2-4*s^3+s^4; 1+%i 1-4*s+6*s^2-4*s^3+s^4; 2+%i 2-9*s+16*s^2-14*s^3+6*s^4-s^5];
expected = expectedN./expectedD;
res = horner(H,f);
assert_checkequal(res, expected);
