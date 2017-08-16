

private ["_siren","_display","_strText_Programm"];



_siren = nearestObject[getpos player,"Land_Loudspeakers_F"];


disableSerialization;
_display = findDisplay 2578;
_strText_Programm = _display displayCtrl 1100;
Programm_dialog pushback parsetext "LHM >> Siren >> Playing Warning Signal.<br/>";
if(count Programm_dialog >= 4) then
	{
		Programm_dialog deleteat 0;
	};

_strText_Programm ctrlSetStructuredText composeText Programm_dialog;


{


	[[_siren,"bankalarm"],"lhm_fnc_say3d",true,false] call lhm_fnc_mp;
	sleep 25;
	} foreach [1,2,3,4];