#include "..\..\macros.hpp"
/*

	file: fn_smartphoneSearch.sqf
	Author: Silex

*/
private["_display","_units","_type","_data","_rowData","_msg"];
_type = param [0,0];
_data = param [1,0,["",[],0]];

if !("ItemRadio" in assignedItems player) then {closeDialog 0; Hint "Du hast kein Smartphone!"};

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["Von:                 Nachricht:"];
ctrlEnable[887892,false];
switch(_type) do
{
	case 0:
	{

		[] call DWEV_fnc_smartphoneSearch;

		if (isNil "DWEV_smartfone_messages") then // EDIT by Markus (Die Nachrichten nur ein mal aus der DB holen. Ansonsten mit einer lokalen Variable Arbeiten)
		{

			[getPlayerUID player, player] remoteExec ["GHB_fnc_msgRequest",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		}
		else
		{
			[1,DWEV_smartfone_messages] spawn DWEV_fnc_smartphone;
		};

		ctrlEnable[887892,false];
	};
	case 1:
	{
		{
			_msg = [_x select 2,40] call KRON_StrLeft;
			_rowData = [_x select 0, _x select 1, _x select 2, _x select 3];
			_cMessageList lnbAddRow[_x select 3,format["%1 ...",_msg]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		} count _data; // EDIT by Markus (Nachrichten in einem Einzigen Netzwerkpaket Empfangen)
		DWEV_smartfone_messages = _data; // EDIT by Markus (Das Empfangene Paket lokal abspeichern um es nicht jedes mal aus der DB holen zu müssen)

	};
	case 2:
	{
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		DWEV_smartphoneTarget = call compile format["%1",_target];
	};

	case 4:
	{
		createDialog "DWEV_smartphone_schreiben";
		ctrlSetText[88886, format["Nachricht an: %1",getPlayerDName(DWEV_smartphoneTarget)]];
		if((__GETC__(DWEV_adminlevel) < 2)) then //Ab S
		{
			ctrlShow[888897,false];
		};
	};
};
