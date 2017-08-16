/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Triggered when a player fires a weapon or throws a grenade
*/
private["_ammoType","_ammo","_player","_civ"];
_player = _this select 0;
_ammoType = _this select 4; 
_ammo = _this select 6;

if(_ammoType == "GrenadeHand_stone")then 
	{
	_ammo spawn 
		{
		private["_position"];
		while {!isNull _this} do 
			{
			_position = getPosATL _this;
			sleep 0.1;
			};
			[[_position],"DS_fnc_flash",true,false] spawn BIS_fnc_MP;
		};
	};
//--------------------------------------------------IF SOMETHING GOES CRAZY, GO HERE---------------------------------------------------	
/*	
if(_ammoType == "SmokeShellGreen")then 
	{
	_ammo spawn 
		{
		private["_position"];
		sleep 3;
		_position = getPosASL _this;
		//systemchat format ["%1 || %2",_position,_this];
		[[_position,15],"DS_fnc_tearGas",true,false] spawn BIS_fnc_MP;
		};
	};
*/	
	
if(_ammoType == "SmokeShellGreen") then 
	{
	_ammo spawn
		{
		sleep 3;
		[[_this,15],"DS_fnc_tearGas",true,false] spawn DS_fnc_MP;
		};
	};

/*	
if(_ammoType == "Smoke_82mm_AMOS_White") then 
	{
	sleep 3;
	[[_ammo,50],"DS_fnc_tearGas",true,false] spawn DS_fnc_MP;
	};
*/	
if((DS_pistolsOnly)&&(!(_ammoType in ["GrenadeHand_stone","SmokeShellGreen"])))then
	{
	if((!(_ammoType in ["B_9x21_Ball","B_45ACP_Ball"]))||((_this select 1) in ["SMG_02_F","30Rnd_45ACP_Mag_SMG_01","SMG_02_ACO_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F","hgun_PDW2000_F"]))then
		{
		systemchat "Pistols Only Event! Ammo Deleted!!";
		hint "Pistols Only Event! Ammo Deleted!!"; 
		deleteVehicle _ammo;
		};
	};

if((((playerSide) != west)&&(!(player getVariable ["security",false])))&&((player distance (getMarkerPos "civ_spawn_1") < 800))&&(!(_ammoType in ["Sub_F_Signal_Green","Sub_F_Signal_Red"])))then
	{

	deleteVehicle _ammo;
	
	if(DS_safezone_shooting > 2)exitwith
		{
		DS_safezone_shooting = 0;
		removeAllWeapons player;
		[[0,format["%1 has just lost his weapons for shooting in a safezone",(name _player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		titleText ["You have just lost your weapons for shooting in a safezone", "plain down"];
		hint "You have just lost your weapons for shooting in a safezone";
		};

	if((player distance (getMarkerPos "civ_spawn_1") < 600)||(player distance (getMarkerPos "auctionHouse") < 600))then
		{
		DS_safezone_shooting = DS_safezone_shooting + 1;
		hint format ["Do not shoot in a safezone! \n(Warning %1 / 3)",DS_safezone_shooting];
		};
	};
	
if((player distance (getMarkerPos "auctionHouse") < 500)&&(!(_ammoType in ["Sub_F_Signal_Green","Sub_F_Signal_Red"])))then
	{
	if(((date select 3) > 6)&&((date select 3) < 20))then
		{
		deleteVehicle _ammo;
		
		if(DS_safezone_shooting > 2)exitwith
			{
			DS_safezone_shooting = 0;
			removeAllWeapons player;
			[[0,format["%1 has just lost his weapons for shooting in a safezone",(name _player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
			titleText ["You have just lost your weapons for shooting in a safezone", "plain down"];
			hint "You have just lost your weapons for shooting in a safezone";
			};

		if((player distance (getMarkerPos "civ_spawn_1") < 600)||(player distance (getMarkerPos "auctionHouse") < 600))then
			{
			DS_safezone_shooting = DS_safezone_shooting + 1;
			hint format ["Do not shoot in a safezone! \n(Warning %1 / 3)",DS_safezone_shooting];
			};
		};
	};
	
if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE])||(DS_jailed))then 
	{
	deleteVehicle _ammo;
	};
