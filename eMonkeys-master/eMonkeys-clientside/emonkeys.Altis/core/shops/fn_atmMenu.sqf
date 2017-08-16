/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if(!eM_use_atm) exitWith {["Bankautomat",["Dein Konto wurde gesperrt"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
//if(EMonkeys_atmUsed >= 5) exitWith {["Bankautomat",["Dein Konto wurde für 3 Minuten gesperrt"],"#ADFF2F"] call EMonkeys_fnc_specialText;};

if(!dialog) then
{
	if(!(createDialog "EMonkeys_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.2' image='core\textures\icons\bank.paa'/> %1€<br/><img size='1.1' image='core\textures\icons\money.paa'/> %2€",[EMonkeys_a164] call EMonkeys_fnc_numberText,[EMonkeys_c164] call EMonkeys_fnc_numberText];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case east: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];