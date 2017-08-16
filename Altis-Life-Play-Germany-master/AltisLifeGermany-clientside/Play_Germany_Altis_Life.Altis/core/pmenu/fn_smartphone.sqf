#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex

*/
private["_display","_units","_type","_data","_rowData","_msg","_provIdx","_adminHint"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;

disableSerialization;

if(!("ItemRadio" in (assignedItems  player))) exitWith {hint "Du besitzt kein Handy!"; closeDialog 0;};
if(!([] call PG_fnc_providerAvailable)) exitWith {hint "Du benötigst eine SIM Karte!";};
if(!([] call PG_fnc_providerNetworkAvailable)) exitWith {hint "Du hast keinen Empfang!";};

hint format["BSUS TapPhone Unlimited, \nAltisOS Version 3.4\n\nEmpfang: gut\nProvider: %1", (player getVariable "mobile_provider")];

waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;

life_smartphoneTarget = objNull;

ctrlEnable[887892,false];

switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		{
			if(alive _x) then
			{
				if (_x != player || FETCH_CONST(life_adminlevel) > 1) then {
	                _provIdx = [(_x getVariable ["mobile_provider",""]), PGSERV_mobile_providers] call TON_fnc_index;

	                switch(side _x) do
					{
						case west: {_type = "Polizei"};
						case civilian: {_type = "Zivilist"};
						case independent: {_type = "Notarzt/ALAC"};
						case east: {_type = "ASF"};
					};

	                _adminHint = "";
	                if (_provIdx == -1) then
	                {
	                    _adminHint = " [no SIM]";
	                };

	                if (_provIdx != -1 || FETCH_CONST(life_adminlevel) > 0 || life_hsd == "thw") then {
						_cPlayerList lbAdd format["%1 (%2)%3",_x getVariable["realname", name _x],_type,_adminHint];
						_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
	                };
	            };
			};
		} forEach playableUnits;

        lbSort _cPlayerList;

		/* [[getPlayerUID player, player],"TON_fnc_msgRequest",false] spawn life_fnc_MP; */
		ctrlEnable[887892,false];
	};

	case 2:
	{
		ctrlEnable[887892,true];
	};

};