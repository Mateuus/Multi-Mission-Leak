/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Escorts the player's target
*/

private ["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(!isNull (player getVariable["escortedPlayer",objNull])) exitWith {};
if((isNil "_unit")||(isNull _unit)||(!isPlayer _unit)) exitWith {};
if(_unit getVariable ["escortCooldown",false])exitwith{hint "This player can not be escorted so soon in combat";};
if(!(_unit getVariable ["restrained",false]))exitwith{hint "The player must be restrained to be escorted";};
if((!((side _unit) isEqualTo west))&&([player,15,west] call DS_fnc_nearbyPlayers)&&(!(player getVariable ["security",false]))) exitWith {titleText["You can not do this with a cop so nearby","PLAIN"];};

_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["escorted",true,true];

player setVariable ["escorting",true,true];
player setVariable ["escortedPlayer",_unit,true];

player reveal _unit;

[_unit] spawn
    {
    _unit = _this select 0;
    waitUntil {!(_unit getVariable ["escorted",false])};
    player setVariable ["escorting",false,true];
    player setVariable ["escortedPlayer",nil,true];
    };