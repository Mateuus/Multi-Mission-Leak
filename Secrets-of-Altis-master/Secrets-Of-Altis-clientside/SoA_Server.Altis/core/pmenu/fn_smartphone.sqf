#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex
	
*/
private["_display","_units","_type","_data","_rowData","_msg","_cTitle","_phoneicon"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;


disableSerialization;
//waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_ui = uiNameSpace getVariable ['playerHUD',displayNull];
_phoneicon = _ui displayCtrl 60;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["Von:                 Nachricht:"];
ctrlEnable[887892,false];
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
		
		[getPlayerUID player, player] remoteExecCall ["SOA_fnc_msgRequest",2];
		ctrlEnable[888782,false];
		ctrlEnable[888789,false];
		ctrlEnable[888790,false];
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
		ctrlEnable[888782,true];
		ctrlEnable[888789,true];
		ctrlEnable[888790,true];
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		life_smartphoneTarget = call compile format["%1",_target];
	};
	case 3:
	{
		lbClear _cMessageList;
		[player] remoteExecCall ["SOA_fnc_cleanupMessages",2];
	};
	case 4:
	{
		if(life_netzhacked) exitWith {hint "Altis-Talk ist zurzeit nicht verfügbar. Kein Netz.";};
		createDialog "Life_smartphone_schreiben";
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	case 5:
	{
		if(isNull life_smsTarget) exitWith {hint "Keine Person ausgewählt!"};
		_msg = format["[NOTRUF] AHW-Mitarbeiter %1 wurde ihrem Notfall zugeordnet. Bitte gedulden Sie sich, bis dieser am Standort eingetroffen ist.",name player];
		_msg2 = format["AHW-Mitarbeiter %1 wurde dem Notruf von %2 zugeordnet und ist nun im Einsatz!",name player, name life_smsTarget];
		[2,_msg] remoteExecCall ["life_fnc_broadcast",life_smsTarget];
		[1,_msg2] remoteExecCall ["life_fnc_broadcast",independent];
	};
	case 6:
	{
		if(isNull life_smsTarget) exitWith {hint "Keine Person ausgewählt!"};
		_msg = format["[AUFTRAG] Mechaniker %1 wurde ihrem Auftrag zugeordnet. Bitte gedulden Sie sich, bis dieser am Standort eingetroffen ist.",name player];
		_msg2 = format["Mechaniker %1 wurde dem Auftrag von %2 zugeordnet und ist nun im Einsatz!",name player, name life_smsTarget];
		[2,_msg] remoteExecCall ["life_fnc_broadcast",life_smsTarget];
		[1,_msg2] remoteExecCall ["life_fnc_broadcast",independent];
	};
	case 7:
	{
		if(life_netzhacked) exitWith {hint "Altis-Talk ist zurzeit nicht verfügbar. Kein Netz."; playsound "notavailable"};
		if((player getvariable "life_callactive1") OR (player getvariable "life_callactive2")) exitWith {hint "Du führst bereits ein Gespräch!"};
		if(isNull life_smartphoneTarget) exitWith {hint "Keine Person ausgewählt!"};
		if(life_beatgeld < 1000) exitWith {hint "Dein Bargeld reicht für das gewünschte Gespräch nicht aus."};
		if(life_callinUse1 && life_callinUse2) exitWith {
			hint "Alle Leitungen sind besetzt!";
			playsound "CallDenied";
		};
		[player,1] remoteExec ["life_fnc_callAction",life_smartphoneTarget];
	};
	case 8:
	{
		if(life_netzhacked) exitWith {hint "Altis-Talk ist zurzeit nicht verfügbar. Kein Netz."; playsound "notavailable"};
		if((player getvariable "life_callactive1") OR (player getvariable "life_callactive2")) exitWith {hint "Du führst bereits ein Gespräch!"};
		if(isNull life_smartphoneTarget) exitWith {hint "Keine Person ausgewählt!"};
		if(life_guthaben < 1000) exitWith {hint "Dein Guthaben reicht für das gewünschte Gespräch nicht aus."};
		if(life_callinUse1 && life_callinUse2) exitWith {
			hint "Alle Leitungen sind besetzt!";
			playsound "CallDenied";
		};
		[player,0] remoteExec ["life_fnc_callAction",life_smartphoneTarget];
	};
};