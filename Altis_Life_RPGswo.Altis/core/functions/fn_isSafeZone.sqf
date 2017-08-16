/*
	File: fn_isSafeZone.sqf
	Author: MarkusSR1984
	
	Description:
	Prüft ob sich der Spieler in einer Absoluten Safezone befinden und gibt true oder false zurück
*/

_return = false;

switch (worldName) do 
{
	case "Altis":
	{
		if(player distance (getMarkerPos "trigger_kavala_markt_weis") < 115) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "trigger_pyrgos_markt") < 75) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "HQ_ka_100") < 100) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "trigger_pyrgos_HQ") < 75) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "trigger_casino") < 60) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "trigger_paintball") < 65) exitWith {_return = true; _return;};
	};

	case "Tanoa":
	{
		if(player distance (getMarkerPos "trigger_georgetown_weiß") < 85) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "HQ_gt_100") < 100) exitWith {_return = true; _return;};
		if(player distance (getMarkerPos "trigger_bambi") < 600) exitWith {_return = true; _return;};
	};
	
};



_return;