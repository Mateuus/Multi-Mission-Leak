/*
	File: fn_drugtestAction.sqf
	Author: Mario
	
	Description:
	Test for Drugusage.
*/

private["_unit","_dText","_weed","_cocaine"];

_unit = cursorTarget;
if(isNull _unit) exitWith {};

hint "Testing...";
uisleep 2;

if(player distance _unit > 5 || ((!alive player) || (player getVariable["onkill",FALSE])) || !alive _unit) exitWith {hint "Test failed."};

if(_unit getVariable["drug_weed",false]) then { _weed = "Positiv"; } else { _weed = "Negativ"; };
if(_unit getVariable["drug_cocaine",false]) then { _cocaine = "Positiv"; } else { _cocaine = "Negativ"; };

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'>Cannabis: </t>%2<br/><t color='#FFD700'>Kokain: </t>%3<br/><br/><t color='#FF0000'>%4</t>"
,name _unit,_weed,_cocaine];