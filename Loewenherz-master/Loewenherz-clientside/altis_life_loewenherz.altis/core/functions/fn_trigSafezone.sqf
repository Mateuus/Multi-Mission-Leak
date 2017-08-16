/*
	File: fn_trigSafezone.sqf
	Author: Mario
	
	Description:
	Set the Safezone Flag
	
	// Trigger Example
	class Item6
		{
			position[]={3612.1538,10.236745,13095.709};
			a=250;
			b=250;
			activationBy="CIV";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="safezone_trigger_kavala";
			expCond="(vehicle player in thislist)";
			expActiv="[""enter"",""Kavala""] call lhm_fnc_trigSafezone;";
			expDesactiv="[""exit"",""Kavala""] call lhm_fnc_trigSafezone;";
			class Effects
			{
			};
		};
*/
private["_state","_message"];

_state = _this select 0;
_message = _this select 1;

switch (_state) do
{
	case "enter": {
		hint parseText format["<t color='#FF0000'><t size='2'>Safezone Info</t></t><br/>Du betrittst Safezone %1",_message];
		player setVariable["inSafezone", true, true];
	};
	case "exit": {
		hint parseText format["<t color='#FF0000'><t size='2'>Safezone Info</t></t><br/>Du verlaesst Safezone %1",_message];
		player setVariable["inSafezone", false, true];
	};
};