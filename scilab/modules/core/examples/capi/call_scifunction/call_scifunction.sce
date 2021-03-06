// =============================================================================
// Allan CORNET - DIGITEO - 2009
// This file is released under the 3-clause BSD license. See COPYING-BSD.
// =============================================================================
files=["sci_call_scifunc.c"];
ilib_build("callscifunc",["call_scifunc","sci_call_scifunc"],files,[]);
// =============================================================================
exec loader.sce;
// =============================================================================
function r = scilabfoo(x,y)
    r = x + y;
endfunction
// =============================================================================
v = call_scifunc(30,12,scilabfoo);
disp("result : " + string(v));
v = call_scifunc(300,120,scilabfoo);
disp("result : " + string(v));
// =============================================================================
ulink();
// =============================================================================

