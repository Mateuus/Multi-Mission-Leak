/*

	Gives selected player key

*/
private["_index", "_uid","_name", "_setarr", "_exdata", "_existing", "_tparr", "_housename","_keys","_owner"];

if( isNull (findDisplay 38700)) exitWith {};
if(eM_action_inUse) exitWith {};

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_housename = [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal;

//////////////////////


eM_action_inUse = true;


_index = lbCurSel 2100;

if(_index == -1) exitWith {eM_action_inUse = false; hint "Nichts ausgewählt."; };

_uid = lbData [2100, _index];
_name = lbText [2100,_index];

if(isNil "_uid") exitWith { eM_action_inUse = false; hint "Ungültige id."; };

//Check uid
_existing = false;
_owner = true;
{
	//ARR schema: [UID,NAME]
	
	if((_x select 0) ==_uid) exitWith
	{
		_existing = true;
	};
}
foreach ([_exdata, "trustedpersons"] call EMonkeys_fnc_houseExtractDataVal);

//Check for owner
if(([_exdata, "owner"] call EMonkeys_fnc_houseExtractDataVal) != (getPlayerUID player)) then
{
	_owner = false;
};

if(_existing) exitWith { hint "Spieler hat bereits einen Schlüssel!"; eM_action_inUse = false; };
if(!_owner) exitWith { hint "Du bist nicht der Haus besitzer"; eM_action_inUse = false; };

//Check more than three Player
_keys = [_exdata, "trustedpersons"] call EMonkeys_fnc_houseExtractDataVal;
if(count _keys >= 3) exitWith {hint "Du hast bereits alle Schlüssel vergeben"}; 

//Modify array
_tparr = [_exdata, "trustedpersons"] call EMonkeys_fnc_houseExtractDataVal;
_tparr set [count _tparr, [_uid, _name ]];

//Call database
hint "Frage Datenbank an ...";

//call command
[ [player ,_housename, _tparr, _name] , "HOUSE_fnc_DBgiveKey" ,false, false] call EMonkeys_fnc_MP;