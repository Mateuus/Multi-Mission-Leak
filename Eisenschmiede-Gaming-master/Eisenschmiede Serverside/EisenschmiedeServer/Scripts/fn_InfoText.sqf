#include "..\script_macros.hpp"

if(FETCH_CONST(ES_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

disableSerialization;
_mode = _this select 0;

_dialog = findDisplay 13337;
_tochangeText = _dialog displayCtrl 1400;
_tochangeText = ctrlText _tochangeText;

switch (_mode) do
{
	case 0:
	{
		InfoColor = "FF0000";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || ROT", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Rot";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};

	case 1:
	{
		InfoColor = "0000FF";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || BLAU", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Blau";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};

	case 2:
	{
		InfoColor = "00FF00";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || GRÜN", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Grün";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};

	case 3:
	{
		InfoColor = "FFFF00";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || GELB", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Gelb";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
	
	case 4:
	{
		InfoColor = "FF00FF";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || ROSA", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Rosa";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
	
	case 5:
	{
		InfoColor = "FFFFFF";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || WEISS", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Weiss";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
	
	case 6:
	{
		InfoColor = "FF8000";
		publicVariable "InfoColor";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || ORANG", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text: Orange";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
	
	case 7:
	{
		InfoColor = "FFFFFF";
		publicVariable "InfoColor";
		InfoText = "www.Eisenschmiede-Gaming.de";
		publicVariable "InfoText";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_NowText = InfoText;
		(CONTROL(13337,1000)) ctrlSetText _NowText;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || %3", player getVariable["realname",name player], getPlayerUID player, InfoText];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat format ["[ArtemTooL]: Info Text: %1", InfoText];
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
	
	case 8:
	{
		_Text = _tochangeText;
		InfoText = _Text;
		publicVariable "InfoText";
		[[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;
		_NowText = InfoText;
		(CONTROL(13337,1000)) ctrlSetText _NowText;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || %3", player getVariable["realname",name player], getPlayerUID player, InfoText];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat format ["[ArtemTooL]: Info Text: %1", InfoText];
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};

	case 9:
	{
		_NowText = InfoText;
		(CONTROL(13337,1000)) ctrlSetText _NowText;
		_toLog = format ["Name: %1 || UID: %2 || InfoText Menu || GEÖFFNET", player getVariable["realname",name player], getPlayerUID player];
		["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		systemChat "[ArtemTooL]: Info Text Geöffnet";
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
	};
};