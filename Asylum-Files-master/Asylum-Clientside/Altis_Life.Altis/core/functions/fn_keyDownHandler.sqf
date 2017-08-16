/*
	File: fn_keyDownHandler.sqf
	Author: Bryan "Tonic" Boardwine and Chronic [MIT]

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_owners","_index","_chance"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
if(visibleMap && (_ctrlKey || _code == 29) && currentChannel != 3) then {_handled = true};
//if (life_action_in_use && _code != 1) exitWith {};

switch (_code) do
{
	//Escape
	case 1:
	{
		if (life_action_in_use) then { life_action_in_use = false; _handled = true; };
		if (life_show_actions) then
		{
			life_show_actions = false;
			removeAllActions player;
			life_actions = [];
		};
	};

	//Driving
	/* case 30: */
	case 31;
	case 32:
	{
		if (life_alcohol_level > 0 && (vehicle player) != player && (driver (vehicle player)) == player) then
		{
			_chance = ((1 - life_alcohol_level) * 100) * 0.5;
			if (floor (random _chance) == 0) then { _handled = true; };
		};
	};
	//F Key
	case 33:
	{
		_veh = vehicle player;

		// if the vehicle's siren object hasn't been initialized, do it now
		if(isNil {_veh getVariable "sirenLogic"}) then {
			_veh setVariable ["sirenLogic", objNull, true];
		};

		// if the siren hasn't already been started, and the player meets the requirements, start it!
		if(playerSide == west && _veh != player && (driver _veh) == player) then {
			if(isNull(_veh getVariable "sirenLogic")) then {
				_veh setVariable ["forcedPhaser", false, false];
				[_veh, false, false, false] call life_fnc_copSiren;
			} else {
				if(_veh getVariable "keyReleased") then {
					[_veh, false, false, false] call life_fnc_copSiren;
				};
			};
			// ignore any other keybindings this key has
			_handled = true;
		};
	};
};
{if(_code in actionKeys format["CommandingMenu%1",_x]) exitWith {_handled = true}} forEach [0,1,2,3,4,5,6,7,8,9];
if(_code in actionKeys "NavigateMenu") then {_handled = true};
if ((_code==47)||(_code==19)||(_code==20)||(_code==34)) then{
	_handled = ((playerSide != west) && ((player getVariable ["restrained",false]) OR (player getVariable ["transporting",false])));
};
if (_code in (actionKeys "TacticalView")) then { _handled = true; };
if (life_brokenLeg && (_code in (actionKeys "MoveUp") || _code in (actionKeys "MoveDown") || _code in (actionKeys "Stand") || _code in (actionKeys "Crouch"))) then { _handled = true; };
if (_code in (actionKeys "GetOver") && speed player > 10) then
{
	[] spawn life_fnc_jump;
	_handled = true;
};
if (_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide")) then
{
	if (currentChannel in [0,1]) then { systemChat format["The Asylum does not allow voice in this channel.", _chan]; _handled = true; };
};
if (_code==41 || _code in (actionKeys "SelectAll") || _code in (actionKeys "SwitchCommand")) then
{
	if (!life_targetTag) then { life_targetTag = true };
	_handled = true;
};
if (_code in ((actionKeys "Diary") + (actionKeys "NetworkPlayers") + (actionKeys "forceCommandingMode") + (actionKeys "menuBack"))) then
{
	_handled = true;
};
if (_code in (actionKeys "Fire") && (getPosASL player) select 2 < 0 && primaryWeapon player != "arifle_sdar_F") then
{
	_handled = true;
};
if (_code in (actionKeys "SitDown") && player getVariable["restrained",false]) then
{
	_handled = true;
};

_handled;
