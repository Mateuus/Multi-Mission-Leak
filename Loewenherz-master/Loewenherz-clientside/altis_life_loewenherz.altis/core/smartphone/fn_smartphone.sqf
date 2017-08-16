#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex

*/
private["_display","_units","_type","_data","_rowData","_msg"];
_type = param [0,0];
_data = param [1,0,["",[],0]];


disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format[localize"STR_SMARTPHONE_HEADER"];
ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
ctrlEnable[887892,false];
switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		if((call lhm_adminlevel) > 1) then
		{
			switch(side player) do
			{
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "Med"};
				case east: {_type = "Sec"};
			};
			_cPlayerList lbAdd format["%1 (%2)",player getVariable["realname", name player],_type];
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(player)];
		};
		{
			if(alive _x && _x != player) then
			{
				switch(side _x) do
				{
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "Med"};
					case east: {_type = "Sec"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		lbSort[_cPlayerList,"ASC"];

		[[getPlayerUID player, player],"lhm_fnc_msgRequest",false] call lhm_fnc_mp;
		ctrlEnable[887892,false];
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
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		lhm_smartphoneTarget = call compile format["%1",_target];
	};
	case 3:
	{
		_result = ["Sind Sie sicher, dass Sie alle Nachrichten löschen möchten ? Dies kann nicht rückgängig gemacht werden!", "Alle Nachrichten löschen", true, true] call BIS_fnc_guiMessage;
		waituntil{ str _result == "true" or  str _result == "false"};
		if(_result) then {
			lbClear _cMessageList;
			[[player],"lhm_fnc_cleanupMessages",false] call lhm_fnc_mp;
			Hint "Alle Nachrichten gelöscht";
			};

	};
	case 4:
	{
		createDialog "lhm_smartphone_schreiben";
		ctrlSetText[88886, format["Nachricht an: %1",name lhm_smartphoneTarget]];
		if((__GETC__(lhm_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
};
