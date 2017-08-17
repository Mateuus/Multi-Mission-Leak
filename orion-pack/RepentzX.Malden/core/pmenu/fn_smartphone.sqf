#include "..\..\script_macros.hpp"
private["_display","_units","_rowData","_msg"];

params [
	["_type",0],
	["_data",0,["",[],0]]
];

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
ctrlShow[1201,false];
ctrlShow[2401,false];
switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		{
			if(alive _x && _x != player) then
			{
				switch(side _x) do
				{
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "Med"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;

		[getPlayerUID player, player] remoteExecCall ["TON_fnc_msgRequest",2];
		ctrlShow[1201,false];
		ctrlShow[2401,false];
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
		ctrlShow[1201,true];
		ctrlShow[2401,true];
		ctrlShow[12011,false];
	};
	case 3:
	{
		lbClear _cMessageList;
		[player] remoteExecCall ["TON_fnc_cleanupMessages",2];
	};
};
