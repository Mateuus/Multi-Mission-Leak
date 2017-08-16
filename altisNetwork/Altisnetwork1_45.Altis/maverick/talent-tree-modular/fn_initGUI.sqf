scriptName "fn_initGUI";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_initGUI.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_initGUI.sqf"

if (isServer && !hasInterface) exitWith {};

0 spawn compileFinal preprocessFileLineNumbers "maverick\talent-tree-modular\gui\_init.sqf";