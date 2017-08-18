//This Script Is Executed On Startup
//Below You Can Place Normal ServerSide Code To Be Executed




//Below Is An Example Of Code Executed ClientSide
//Notice The Slightly Different Format
_1st = "

waituntil {Time > 5};
titleText [format [""Welcome to MyServer, %1"", name player], ""PLAIN""];

";

_l1 = "logic" createUnit [[1,1,1], (createGroup sideLogic), format ["[] spawn {%1}", _1st], 0.5, "corporal"];