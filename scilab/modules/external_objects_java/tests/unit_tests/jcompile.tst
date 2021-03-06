//
//  Copyright (C) 2013 - S/E - Sylvestre Ledru
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.
//
//
// <-- JVM MANDATORY -->
//

c = jcompile("Test", ["public class Test {";
"public int field;";
"public Test(int n) {";
"field = n;";
"}";
"}";]);
assert_checkequal(jgetclassname(c),"Test");

t = c.new(128);
v = jgetfield(t, "field");

// or easier
//junwraprem(t.field)

jremove c t v;


fd = mopen(TMPDIR+"/HelloWorld.java","wt");
mputl(["public class HelloWorld {"
"public static String getHello() {"
"return ""Hello World !!"";"
"}"
"}"],fd);
mclose(fd);

jcompile(TMPDIR+"/HelloWorld.java")
jimport HelloWorld;
assert_checkequal(HelloWorld.getHello(), "Hello World !!");

directory=SCI+"/modules/external_objects_java/examples/com/foo/";
// Compile of all them
jcompile(ls(directory + "/*.java"))

jimport("com.foo.HouseFactory")
house = HouseFactory.basicHouse();

assert_checkequal(house.toString(), "This is a house painted in white, has a white door, and 1 windows");

assert_checkequal(jgetclassname(house), "com.foo.House");
jimport("com.foo.CircularWindow");
newWindow = CircularWindow.new(0.5);

house.addWindow(newWindow);
assert_checkequal(house.toString(), "This is a house painted in white, has a white door, and 2 windows");

jimport("com.foo.Color");

jimport("com.foo.Door");
newDoor = Door.new(Color.RED);
house.replaceDoor(newDoor);

assert_checkequal(house.toString(), "This is a house painted in white, has a red door, and 2 windows");

