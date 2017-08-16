#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex

*/
private["_display","_units","_type","_data","_rowData","_msg"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;

disableSerialization;

if(!("ItemRadio" in (assignedItems  player))) exitWith {hint "Du besitzt kein Handy!"; closeDialog 0;};

waitUntil {!isNull findDisplay 88811};
_display = findDisplay 88811;

_cMessageList = _display displayCtrl 88812;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["Von:         Nachricht:"];
ctrlEnable[887892,false];

if (isNil "PG_smartphoneHistory") then { PG_smartphoneHistory = [];};

switch(_type) do
{
	case 0:
	{
        // dialog onLoad
		//[[getPlayerUID player, player],"TON_fnc_msgRequest",false] spawn life_fnc_MP;

        {
            _msg = _x select 3;

            if (count(toArray _msg) >= 15) then {
                _msg = [_msg, 15] call KRON_StrLeft;
                _msg = _msg + " ...";
            };

            _cMessageList lnbAddRow[_x select 2, _msg];
            _cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_x)];
        } foreach PG_smartphoneHistory;
	};
	case 1:
	{
        // called for every message when SQL using
        if (true) exitWith {};

        _msg = [_data select 2,15] call KRON_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
		_cMessageList lnbAddRow[_data select 3,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
	};

	case 3:
	{
        // clear the history
        //[[player],"TON_fnc_cleanupMessages",false] spawn life_fnc_MP;

		lbClear _cMessageList;
		PG_smartphoneHistory = [];
	};
};