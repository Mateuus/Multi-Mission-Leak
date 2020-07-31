/*
	File: fn_respawned.sqf
	
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
life_death = 2;
//Reset our weight and other stuff
player setVariable["dead",nil,TRUE];
player setVariable["mapVisible",nil,true];
life_use_atm = TRUE;
life_show_actions = false;
["Add","Food",100] spawn fnc_sustain;
["Add","Drink",100] spawn fnc_sustain;
["cash","set",0] call life_fnc_handleCash;  //Make sure we don't get our cash back.
life_carryWeight = 0;
player playMove "amovpercmstpsnonwnondnon";
player allowdamage true;
player setVariable ["tf_unable_to_use_radio", false];
while{true} do {
	if(dialog) then {closeDialog 0;};
	if(!dialog) exitwith {};
};


player setpos (getMarkerPos "respawn_west_1");


[player,"Revive",nil] call life_fnc_broadcastCheck;
[player,"name",nil] call life_fnc_broadcastCheck;
[player,"Reviving",nil] call life_fnc_broadcastCheck;
[player,"restrained",nil] call life_fnc_broadcastCheck;
[player,"restrained2",nil] call life_fnc_broadcastCheck;

im_dead = false;
player setVariable ["tf_voiceVolume", 1, true];
//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case east: {
		_handle = [] spawn life_fnc_civLoadout;
	};	
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
[player,false] call life_fnc_dropItems;



//Bad boy
if(life_is_arrested) exitWith {
	[localize "STR_Jail_Suicide", false] spawn domsg;
	[false,false,life_arrestMinutes,life_arrestReason] spawn life_fnc_jailSetup;
	
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[player,life_copRecieve,true] remoteExecCall ["life_fnc_wantedBounty",2];
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",2];
};
[] execVM "statusBar.sqf";

[] spawn {
	sleep 1;
	[player,""] remoteExecCall ["life_fnc_animsync"];
};
