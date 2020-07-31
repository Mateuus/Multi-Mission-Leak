#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type"];

disableSerialization;

//waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 1501;
if(player getVariable["restrained",false] || player getVariable["tied",false]) exitWith {["Jak uzyjesz telefonu z rekoma za plecami?", false] spawn domsg; closedialog 0;};

	ctrlSetText [3003, ""];
	lbClear _units;
	_units lbAdd format["EMS Units"];
	_units lbAdd format["The Police"];
	_units lbAdd format["The Admins"];
	if((__GETC__(life_adminlevel) > 1)) then
	{
		_units lbAdd format["EVERYONE"];
	};
	{
		if(!(_x getVariable["dead",FALSE]) && _x != player) then
		{
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case east: {_type = "Civ"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "Med"};
			};
			if (uniform _x IN ["U_C_Scientist","TRYK_U_B_woodR_CombatUniformTshirt"]) then {
			} else {
				_units lbAdd format["%1",_x getVariable["realname",name _x]];
				_units lbSetData [(lbSize _units)-1,str(_x)];
			};
		};
	} foreach playableUnits;

	_amountofsms = count tablet_inbox;
	_units2 = _display displayCtrl 1500;
	{
		_arrnumber = _forEachIndex;
		_sendplayer = _x select 0;
		_message = _x select 1;
		_date = _x select 2;
		if ((_date select 4) < 10) then {
			_mins = format ["0%1",(_date select 4)];
		} else { 
			_mins = (_date select 4)
		};
		_datecomp = format ["(%6) %1-%2-%3 | %4:%5",(_date select 2),(_date select 1),(_date select 0),(_date select 3),(_date select 4),name player];
		_units2 lbAdd _datecomp;
	} foreach tablet_inbox;
	[_amountofsms] spawn fnc_smsmenuopen;
	[] spawn sms_getinbox;
	lbSetCurSel [1500, 0];
	lbSetCurSel [1501,0];



