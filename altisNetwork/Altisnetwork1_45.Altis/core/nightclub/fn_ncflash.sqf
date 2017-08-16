/* 
	File: fn_ncflash.sqf
	Author: Maxi
	Date: 2/12/15
	Desc: main file for the strobe..
*/

_trueorfalse = nc_light getVariable["ncstrobe",FALSE];

if(_trueorfalse) then {
	hint "Turning off strobe. This may take a second.";
	nc_light setVariable["ncstrobe",FALSE,TRUE];
} else {
	nc_light setVariable["ncstrobe",TRUE,TRUE];
	[[nc_light,perrys_stage],"life_fnc_ncFlashOn",true,false] spawn life_fnc_MP;
};