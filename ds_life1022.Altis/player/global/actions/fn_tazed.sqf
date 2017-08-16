/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs when a player is tazed by a cop or whitelisted civilian
*/

params [
	["_player",objNull,[objNull]],
	["_shooter",objNull,[objNull]],
	["_damage",false,[false]]
];

if((isNull _player)||(isNull _shooter))exitWith{player allowDamage true;DS_tazed = false;};

if(((_shooter isKindOf "Man")||(typeOf (vehicle _shooter) in ["I_APC_Wheeled_03_cannon_F","O_G_Offroad_01_armed_F","B_HMG_01_high_F"]))&&(alive player))then {
	if(!DS_tazed) then {
		DS_tazed = true;
		DS_curWep_h = currentWeapon player;

		player allowDamage false;
		player action ["SwitchWeapon",player,player,100];
		player switchCamera cameraView;
		player setVariable ["surrender",true,true];
		if(_damage)then{player setDamage 0.5;};

		private _obj = "Land_ClutterCutter_small_F" createVehicle [0,0,0];
		_obj setPosATL (getPosATL _player);

		private _targets = allPlayers select {(_x distance player) < 300};
		[player,"stun"] remoteExecCall ["DS_fnc_playSounds",_targets];
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["DS_fnc_animSync",_targets];

		private _shooterName = _shooter getVariable ["name",name _shooter];
		private _playerName = if((DS_realEstateArray select 14) == 0)then{_player getVariable ["name",name _player]}else{"someone"};
		[0,format ["%1 has tazed %2",_shooterName,_playerName],false,2] remoteExecCall ["DS_fnc_globalMessage",[west,independent]];

		_playerName = _player getVariable ["name",name _player];
		[0,format ["%1 has tazed %2",_shooterName,_playerName]] remoteExecCall ["DS_fnc_globalMessage",(group player)];

		_player attachTo [_obj,[0,0,0]];

		[true] call DS_fnc_disableUserInput;

		uiSleep 5;
		private _time = diag_tickTime + 10;
		waitUntil {(diag_tickTime > _time)||(player getVariable ["restrained",false])};

		[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["DS_fnc_animSync",_targets];

		if(!(player getVariable ["escorted",false]))then{detach player;};

		deleteVehicle _obj;

		player setVariable ["surrender",false,true];
		player allowDamage true;

		[false] call DS_fnc_disableUserInput;

		DS_tazed = false;
	};
} else {
	sleep 2;
	_player allowDamage true;
	DS_tazed = false;
};