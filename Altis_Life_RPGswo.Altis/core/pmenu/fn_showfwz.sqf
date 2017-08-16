#include "..\..\macros.hpp"

private["_index","_data","_status","_player"];
_index = param [0,0];

disableSerialization;
waitUntil {!isNull findDisplay IDC_FW_Zentral_Display};
_display = findDisplay IDC_FW_Zentral_Display;
_cMessageList = _display displayCtrl IDC_FW_Zentral_MessageList;
_cMessageShow = _display displayCtrl IDC_FW_Zentral_MessageShow;
_cMessageHeader = _display displayCtrl IDC_FW_Zentral_MessageHeader;
_data = (DWEV_fwzentral_messages select _index);
_player = _data select 1;
_status = "[OFFLINE]";

	if((_player getVariable["realname",name _player] != "HC_1") && ([getPlayerUID _player] call DWEV_fnc_isUIDActive)) then //TODO: ist onlione?
	{
		_status = "[ONLINE]";
		DWEV_fwzentral_Target = _data;
		DWEV_fwzentral_Target pushBack _index;
		ctrlEnable[887892,true];
	};

_cMessageHeader ctrlSetText format["%1 %2 meldete:",_data select 0,_status];
_cMessageShow ctrlSetText format["%1",_data select 3];
