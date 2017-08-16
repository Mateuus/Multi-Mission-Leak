/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;
_price = [_type] call EMonkeys_fnc_licensePrice;
_license = [_type,0] call EMonkeys_fnc_licenseType;

if(EMonkeys_c164 < _price) exitWith {hint format["Du hast nicht genug %1€ für %2.",[_price] call EMonkeys_fnc_numberText,_license select 1];};
EMonkeys_c164 = EMonkeys_c164 - _price;
titleText[format["Du hast eine(n) %1 für €%2 gekauft.", _license select 1,[_price] call EMonkeys_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];

_log = _license select 0;

if("license_civ_log" == _log) exitWith   
{     
 [] spawn Emonkeys_fnc_IgiLoadInit;
hint "Logistik System ist geladen!"
};

_invisible = _license select 0;
if("license_civ_invisible" == _invisible) exitWith   
{     
	player setVariable["invisible",false];
	hint "Du bist jetzt Unsichtbar für andere!"
};