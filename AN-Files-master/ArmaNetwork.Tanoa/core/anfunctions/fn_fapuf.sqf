#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex

*/
private["_display","_units","_rowData","_msg"];

params [
	["_type",0,[0]],
	["_data",0,["",[],0]]
];

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
switch(_type) do
{
	case 0:
	{
		_display displaySetEventHandler ["KeyDown","_this call life_fnc_displayHandler"];
		ctrlEnable[2400,false];
		ctrlEnable[2401,false];
		if(isNil "SmartPhoneList" OR {count SmartPhoneList > 0}) then {SmartPhoneList = [];};
		lbClear _cPlayerList;
		{
			if(alive _x && {_x != player}) then
			{
				switch(side _x) do
				{
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "Med"};
				};
				SmartPhoneList pushBack [(_x getVariable["realname", name _x]),_type,str(_x)];
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach allPlayers;

		[(getPlayerUID player), player] remoteExecCall ["TON_fnc_msgRequest",2];
		ctrlShow[1201,false];
	};
	case 1:
	{
		_msg = [_data select 2,40] call KRON_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
		_cMessageList lnbAddRow[_data select 3,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
	};
	case 2:
	{
		ctrlEnable[2400,true];
	};
	case 3:
	{
		lbClear _cMessageList;
		[player] remoteExecCall ["TON_fnc_cleanupMessages",2];
	};
};
