/*
Search Words: 
electric chair sitting
*/

player setPos [8779.13,6719.67,0];
player setDir 278.47;


player playMoveNow "BasicDriver";


uiSleep 1;

player setPos [8779.13,6719.67,0];
player setDir 278.47;


player playMoveNow "BasicDriver";

while {animationState player == "BasicDriver"} do
    {
	    uiSleep 1;
		player setPos [8779.13,6719.67,0];
		player setDir 278.47;
	};