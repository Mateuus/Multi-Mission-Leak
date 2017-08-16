#include "..\..\script_macros.hpp"
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = SEL(_this,3);

if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_varName,_sideFlag);

if(CASH < _price) exitWith {[format[ "Du hast keine $%1 für einen %2",[_price] call life_fnc_numberText, _displayName]] spawn life_fnc_nachricht;};
SUB(CASH,_price);

titleText[format[ "Du hast einen %1 für $%2 gekauft",  _displayName,[_price] call life_fnc_numberText],"PLAIN"];
SVAR_MNS [_varName,true];