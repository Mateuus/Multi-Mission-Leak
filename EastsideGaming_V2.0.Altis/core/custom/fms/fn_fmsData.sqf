/*
	Autor: Basti
	File: fn_fmsData.sqf
	
	This File was written for Eastside-Gaming.de you are not allowed to use this file!
*/
disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_namectrl = _display displayCtrl 1002;
_kurzctrl = _display displayCtrl 1005;
_gebietctrL = _display displayCtrl 1101;
_rangctrl = _display displayCtrl 1008;
_countctrl = _display displayCtrl 1010;
_data = _tree tvData (_this select 0);
_str = _data;
if ((_data isEqualTo "") || (_data isEqualTo "space")) then {
  _str = "default";
};

_name = getText(missionConfigFile >> "CfgFMS" >> "cop" >> _str >> "name");
_kurz = getText(missionConfigFile >> "CfgFMS" >> "cop" >> _str >> "kurz");
_gebiet = getText(missionConfigFile >> "CfgFMS" >> "cop" >> _str >> "gebiet");
_rang = getText(missionConfigFile >> "CfgFMS" >> "cop" >> _str >> "rang");
_count = {((_x getVariable ["fms",[0,"pups"]]) select 1) isEqualTo _str}count allPlayers;
_namectrl ctrlSetText format ["%1",_name];
_kurzctrl ctrlSetText format ["%1",_kurz];
_gebietctrL ctrlSetText format ["%1",_gebiet];
_rangctrl ctrlSetText format ["ab %1",_rang];
lbClear _countctrl;
{
	if(_count isEqualTo 0) exitWith {
		_index = _countctrl lbadd format["%1", "Keine Einheit"];
		_countctrl lbSetData[(lbSize _countctrl) - 1, "space"];
	};
	if(!((_x getVariable ["fms",[]]) isEqualTo [])) then {
			_index = _countctrl lbadd format["%1 (%2)", _x getVariable["realname",name player], _x getVariable ["rankaus","Polizist"]];
			_countctrl lbSetData[(lbSize _countctrl) - 1, "space"];
		};
}foreach playableUnits;