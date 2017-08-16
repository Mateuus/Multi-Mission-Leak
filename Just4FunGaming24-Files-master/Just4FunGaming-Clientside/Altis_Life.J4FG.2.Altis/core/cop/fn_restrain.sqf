// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _unit = param[0, objNull, [objNull]];
if(isNull _unit) exitWith {};

if( player getVariable["restrained", false] ) exitWith {};
player setVariable["restrained", true, true];

[getPlayerUID player, 6, format ["Wurde von %1 (%2) gefesselt @ %3", name _unit, getPlayerUID _unit, mapGridPosition _unit]] remoteExec ["XYDB_fnc_log", XYDB];

// remove gps & map
player unassignItem "itemMAP";
player unassignItem "itemGPS";
// remove player from group
private _oldGroupID = (group player) getVariable["gang.id", -1];
if( _oldGroupID >= 0 && { (count units group player) > 1 } ) then {
    [player] joinSilent (createGroup civilian);
};

titleText[ format[ "Du wurdest von %1 gefangen genommen", _unit getVariable[ "realName", name _unit ]], "PLAIN"];
player playMove "amovpercmstpsnonwnondnon_ease";

private _time = time;

while { (player getVariable ["restrained", false]) && (alive player) } do {

    if( (vehicle player) == player && { !((animationState player) isEqualTo "amovpercmstpsnonwnondnon_ease") } ) then {
        player playMove "amovpercmstpsnonwnondnon_ease";
    };

    if( (vehicle player) != player && { driver(vehicle player) == player } ) then {
        player action["eject", vehicle player];
    };

    // Check if there are still players nearby after 5 Minutes...
    if( (time - _time) > 300 && ( { _x != player && alive _x && player distance _x < 50 && !(_x getVariable["restrained", false]) } count playableUnits <= 0 ) ) exitWith {
        hint "Du bist unbeobachtet und konntest deine Fesseln lösen";
    };
};

if( !("itemMAP" in (items player)) ) then {
    player addItem "itemMAP";
};
player assignItem "itemMAP";

if( !("itemGPS" in (items player) ) ) then {
    player addItem "itemGPS";
};
player assignItem "itemGPS";

if( _oldGroupID >= 0 ) then {
    private _gang = [_oldGroupID] call XY_fnc_searchMyGang;
    if( !(isNull _gang) ) then {
        [player] joinSilent _gang;
    };
};

if( alive player ) then {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
    [player, "cuff"] remoteExec ["say3D", -2];
    titleText["Dir wurden die Handschellen abgenommen, du kannst dich nun frei bewegen", "PLAIN"];
    detach player;
};

player setVariable ["restrained", false, true];
player setVariable ["escorting", false, true];
player setVariable ["transporting", false, true];