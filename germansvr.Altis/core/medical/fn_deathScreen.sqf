/*
    File: fn_deathScreen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles stuff being displayed on the death screen while
    it is currently active.
*/

/*
//Vanilla

private ["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
    _nearby = if (([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
    _medicsOnline ctrlSetText format [localize "STR_Medic_Online",independent countSide playableUnits];
    _medicsNear ctrlSetText format [localize "STR_Medic_Near",_nearby];
    sleep 1;
    (isNull (findDisplay 7300))
};
*/

//Stigs Version (Distanzmessung)
/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine (edit by Stig)
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
diag_log "Debug: fn_deathScreen start";
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = "";
	_d = 99999999;
	{
	if((_this distance _x < _d) AND (side _x == independent) AND (_x != player))then
		{
		_d = _this distance _x;
		};
	} foreach allPlayers;
	
	if(_d==99999999)then{
		_nearby = "Kein Sanitäter im Dienst";
	} else {
	_nearby = format ["Entfernung des nächsten Sanitäters: %1 Meter",ceil _d];
	};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[independent] call life_fnc_playerCount];
	((findDisplay 7300) displayCtrl 7305) ctrlSetText _nearby;
	sleep 0.5;
	(isNull (findDisplay 7300))
};