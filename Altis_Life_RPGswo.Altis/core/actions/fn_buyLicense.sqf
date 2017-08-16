#include "..\..\macros.hpp"
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when purchasing a license. May need to be revised.
*/
private ["_type","_varName","_displayName","_price"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"var");
_varName = LICENSE_VARNAME(_type,_sideFlag);

if(dwf_cash < _price) exitWith {hint format["Dir fehlen %1€ für eine %2",[_price] call DWEV_fnc_numberText,_displayName];};

dwf_cash = dwf_cash - _price;
hint format["Du hast eine %1 für %2€ gekauft.", _displayName,[_price] call DWEV_fnc_numberText];
missionNamespace setVariable[_varName,true];
[5,player,"kauf",format ["%1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",_varName,[_price] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];


[2] call SOCK_fnc_updatePartial;
[6] call SOCK_fnc_updatePartial;
