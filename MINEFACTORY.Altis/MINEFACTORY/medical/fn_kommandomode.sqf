private["_mode","_totenliste"];_mode = [_this,0,0,[0]] call BIS_fnc_param;_totenliste = lbData[13526,lbCurSel (13526)];
_totenliste = call compile format["%1", _totenliste];
if(isNil "_totenliste") exitwith {};
if(isNull _totenliste) exitWith {};switch (_mode) do {	case 1:	{		[1,profileName] remoteExec ["life_fnc_spielernotiz",_totenliste];	};	case 2: 	{		[2] remoteExec ["life_fnc_spielernotiz",_totenliste];	};};closeDialog 0;