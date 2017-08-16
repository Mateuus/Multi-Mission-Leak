/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Catches rookie script kidlets
*/

if((isEngineOn (vehicle player))&&(vehicle player isKindOf "Tank")&&((typeOf (vehicle player) != "I_APC_Wheeled_03_cannon_F")))exitWith {
	deleteVehicle (vehicle player);
	[0,format["%1 was just seen in a hacked in vehicle (A Tank), please report him to the admins",name player],false,1] remoteExecCall ["DS_fnc_globalMessage",-2];
	player setDamage 1;
};

while {true} do {
	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	[(name player),"spawned in money on them"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];

	if(!DSL_haxor)then {
		DSL_haxor = true;[] call DS_fnc_complileData;
	};

	sleep 30;

	if((life_cash == 0)&&(life_atmcash == 0))exitWith{};
};