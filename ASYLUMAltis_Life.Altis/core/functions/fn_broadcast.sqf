/*
	File: fn_broadcast.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Broadcast system used in the life mission for multi-notification purposes.
*/
private["_type","_message"];
_type = [_this,0,0,[[],0]] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;
if(_message == "") exitwith {};

if(typeName _type == "ARRAY") then
{
	for "_i" from 0 to (count _type)-1 do
	{
		switch((_type select _i)) do
		{
			case 0: {systemChat _message};
			case 1: {hint parseText format["%1", _message]};
			case 2: {titleText[format["%1",_message],"PLAIN"];}
		};
	};
}
	else
{
	switch (_type) do
	{
		case 0: {systemChat _message};
		case 1: {hint parseText format["%1", _message]};
		case 2: {titleText[format["%1",_message],"PLAIN"];}
	};
};

switch (_message) do
{
	case "THE RACE BEGINS IN: 3": { playSound "racebeep1"; };
	case "THE RACE BEGINS IN: 2": { playSound "racebeep1"; };
	case "THE RACE BEGINS IN: 1": { playSound "racebeep1"; };
	case "GO GO GO!": { playSound "racebeep2"; };
};