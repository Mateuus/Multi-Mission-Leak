/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

[] call life_fnc_seizePlayerWeaponAction;

//Give them a jail uniform
_jail_uniform = uniform player;
_jail_backpack = backpack player;
_jail_vest = vest player;
_jail_headgear = headgear player;
removeUniform player;
removeBackpack player;
removeVest player;
removeHeadgear player;
player forceAddUniform "U_B_CombatUniform_mcam_vest";

[] spawn
{
    while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam_vest"};
        (uniform player) setObjectTextureGlobal [0, "textures\medic_uniform.paa"]; 
        waitUntil {uniform player != "U_B_CombatUniform_mcam_vest"}; 
    };
};

player setDamage 0;
life_thirst = 100;
life_hunger = 100;

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 20000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then
	{
		//sleep (10 * 60);
		//50% of time
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//sleep (5 * 60);
		//20% of time
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Time Remaining:\n %1\n\nCan pay Bail: %3\nBail Amount: $%2",_countDown,[life_bail_amount] call life_fnc_numberText];
		}
		else
		{
			hintSilent format["Time Remaining:\n %1\n",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 180) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format["%1 has escaped from jail!",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		//return their stuff
		removeUniform player;
		player forceAddUniform _jail_uniform;
		player forceAdduniform _jail_backpack;
		player forceAdduniform _jail_vest;
		player forceAdduniform _jail_headgear;
		[5] call SOCK_fnc_updatePartial;
	};
};