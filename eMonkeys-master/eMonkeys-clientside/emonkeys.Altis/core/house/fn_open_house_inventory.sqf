//Function zum öffnen des Inventardialogs. Hier werden alle wichtigen Funktionen zusammengeführt
//Parameter [das Haus des Spielers]

//wörk wörk >_
private ["_house","_handle","_get_db_gear"];

dbgear = [];//damit man später prüfen kann ob überhaupt etwas geschrieben wurde 
dbgear_set = false; //init für check variable
//Ist der Spieler der Besitzer des Hauses oder hat er einen Schlüssel?

_house = _this select 0;
_house_args = _this select 1;
_house_data = _this select 2;

//hint _house_data;


_house_data call EMonkeys_fnc_houseExtractData;
hintSilent "Exdata parsed";
_exdata = EMonkeys_housetest;
if (count _exdata == 0) exitWith { hint "Konnte Haus nicht laden."; };


missionNameSpace setVariable ["house_current_exdata", _exdata];

_name =  [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal;

_canview = true;
if( [_exdata, "owned"] call EMonkeys_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call EMonkeys_fnc_houseExtractDataVal) != getPlayerUID player) then //if player not owner
	{
		_canview = false;
	};
};


/////////////////////// Access only 
//
_isaccessonly = !(EMonkeys_housetest call EMonkeys_fnc_houseBelongsToPlayer);

_canview = _exdata call EMonkeys_fnc_houseCanAccess; //replaced by EMonkeys_fnc_houseCanAccess
//
///////////////////////

///////////////////////
//Other vars
if(!_canview) exitWith
{
	hint "Das Haus gehort dir nicht!";
	};

if( [_name] call EMonkeys_fnc_houseIsInuse ) exitWith
{
	hint "Jemand anderes greift bereits auf das Haus zu!";
};


[_name, true] call EMonkeys_fnc_houseSetInuse;


//Hole mir das Gear aus Spieler und DB 

playergear = [player] call create_playergear_array;
[[player,_house],"house_inventory_fnc_get_db_gear",false,false] call EMonkeys_fnc_MP;
waitUntil {dbgear_set};
waitUntil {!isNil "dbgear"};
//Oeffne den Dialog
_i = 0;
for [{_i},{_i<=5},{_i = _i+1}] do //5 Sekunden Zeit für das System das Gear aus der DB zu holen
{
	if (count dbgear > 0 && dbgear_set) exitWith{};//warte bis das Db Gear da ist -> double check

};
if (_i == 5) exitWith {hint "Timeout bei der Datenbankverbindung"}; //da waren wir wohl zu langsam
_ok = createdialog "houseInventoryplayer";
waitUntil{!isNull(findDisplay 3500)};
waitUntil{isNull(findDisplay 3500)}; //Warte bis Dialog zu
if (count dbgear > 0) then { //Letzte Chance Bullshit abzufangen
	[_house,dbgear] call update_dbgear_array;
	hint "Deine Daten wurden gesendet.";
};
dbgear = [];
[_name, false] call EMonkeys_fnc_houseSetInuse;
[] call SOCK_fnc_updateRequest;

