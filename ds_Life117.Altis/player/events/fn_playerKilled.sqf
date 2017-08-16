/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Runs when a player is killed
*/
private ["_bounty","_player","_killer","_cop"];
disableSerialization;
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_donator = DS_perkLevel;
_cop = false;
DS_deadbody = _player;
if(playerSide == west)then{_cop = true};
[] spawn DS_fnc_NLR;
//Save position for NLR timer and kill distance
DS_deadPos = (position player);
//Display killMessage to the server
if(_killer != _player)then
	{
	[_killer] spawn DS_fnc_killMessages;
	};
//Display kill information to the killer	

if((player getVariable ["policeSquad",""]) == "Sharp Shooter")then
	{
	if(DS_sharpShooter != 0)then
		{
		DS_sharpShooter = 0;
		_items = uniformItems player;
		player forceAddUniform DS_sharpShooterUniform;
			{
				player addItem _x;
			}forEach _items;
		[] call DS_fnc_stamina;
		[] call DS_fnc_copUniform;
		};
	};

if(isNull _killer)then
	{
	DS_killer = "";
	};

if(!isNull _killer && {_killer != _player})then
	{
	if(!(player getVariable ["security",false]))then
		{
		DS_removeWanted = true;
		};
	DS_killer = (name _killer);
	[[_player,DS_headShot,DS_deadPos,_cop],"DS_fnc_killInfo",_killer,false] spawn BIS_fnc_MP;
	if((side _killer) == west)then
		{
		DS_realEstateArray set [15,0];
		_bounty = (DS_wanted_stats select 0);
		if(_bounty > 0)then
			{
			[[1,player,_bounty], "DS_fnc_getBounty",_killer,false] spawn BIS_fnc_MP;
			};
		};
	};	
//Punish somebody if they kill a person in custody (Civilian or police custody)	
if(((_player getVariable["cuffed",FALSE])||(_player getVariable["cuffedVeh",FALSE])||(_player getVariable["Escorted",FALSE]))&&((side _killer) == civilian)&&(!isNull _killer))then
	{
	if(_player != _killer)then
		{
		[[1,player],"DS_fnc_punishKiller",_killer,false] spawn BIS_fnc_MP;
		};
	};	
//Sync data as an empty civilian incase someone logs to try and save their gearSlotDataif(playerside == civilian)then
if(playerside == civilian)then
	{
	[] spawn DS_fnc_compileData;
	};
//Set unit variables
_player setVariable["deadguy",TRUE,TRUE];
_player setVariable["Revive",TRUE,TRUE]; 
_player setVariable["name",profileName,TRUE]; 
_player setVariable["cuffed",FALSE,TRUE];
_player setVariable["Escorted",FALSE,TRUE];
_player setVariable["cuffedVeh",FALSE,TRUE];
_player setVariable["surrender",FALSE,TRUE]; 
//Cancel headshot status of player with high morality
if((DS_headShot)&&(DS_moral > 900))then{DS_headShot = false;};
//Set to revivable and inform player if he was head shotted
if(DS_headShot)then
	{
	_player setVariable["Headshot",TRUE,TRUE];
	systemchat "HEAD SHOT";
	};
//Punish killers morality
if((_killer != _player)&&(!isNull _killer))then
	{
	if(DS_moral > 200)then
		{
		[[2,(name _killer)],"DS_fnc_punishKiller",_killer,false] spawn BIS_fnc_MP;
		};
	};
////
//Put resawn thread counter here
////	
////
//Setup and Run the death camera (Flying through the sky and such)
////	
//Set killer wanted
if(!isNull _killer && {_killer != _player} && {side _killer != west} && {alive _killer}) then 
	{
	[["522"],"DS_fnc_addCharge",_killer,false] spawn DS_fnc_MP;
	};	
//If player is killed by a cop
if(((side _killer) == west)&&(playerSide != west)) then 
	{	
	DS_copRecieve = _killer;
	[[3],"DS_fnc_alterStats",_killer,false] spawn BIS_fnc_MP;
	};
//Drop your items and money
if((playerside) == civilian)then
	{
	_handle = [_player] spawn DS_civ_dropItems;
	DS_currentWeight = 0;
	waitUntil {scriptDone _handle};
	if(DSL_rebelAdv) then
		{
		DSL_rebel = true;
		DSL_rebelAdv = false;
		DS_rebelAdv_removed = true;
		}
		else
		{
		DSL_rebel = false;
		DS_rebelAdv_removed = false;
		};
	DSL_rebelVeh = false;
	};


//Update the HUD?
//Manage escape?
//Remove rebel trainings and such	

if(playerside == west)then
	{
	_timesDied = DS_infoArray select 9;
	_timesDied = _timesDied - 1;
	DS_infoArray set [9,_timesDied];
	
	if((DS_infoArray select 9) < 1)then
		{
		_player setVariable["Revive",false,TRUE];
		RemoveAllWeapons player;
		{player removeMagazine _x;} foreach (magazines player);
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeGoggles player;
		removeHeadGear player;
		{
			player unassignItem _x;
			player removeItem _x;
		} foreach (assignedItems player);
		};
	[] call DS_cop_saveCopGear;
	};

//Lose driving licenses if driving/flying and die
if(((driver (vehicle player) == player)&&((vehicle player) isKindOf "landVehicle")&&(playerside == civilian))&&((DSL_car)||(DSL_truck)))then
	{
	systemchat "Because you died while driving you have lost your driving licenses";
	DSL_car = false;
	DSL_truck = false;
	};
	
if(((driver (vehicle player) == player)&&((vehicle player) isKindOf "Air")&&((side player) == civilian))&&(DSL_air))then
	{
	systemchat "Because you died while driving an air vehicle, you have lost your pilots licenses";
	DSL_air = false;
	};	
	
createDialog "deathMenu";
	
_player spawn
{
	private["_maxTime","_respawn","_Timer"];
	disableSerialization;
	_respawn = ((findDisplay 666670) displayCtrl 2400);
	_Timer = ((findDisplay 666670) displayCtrl 2403);
	_moral = (round(55-(DS_moral/20)));
	_maxTime = time + 11 + (_moral);
	_respawn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format["Respawn Available in: %1 (WARNING - Do Not Disconnect)",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	//waitUntil {!life_action_in_use};
	_respawn ctrlEnable true;
	_Timer ctrlSetText "You can now respawn";
};	
	
[] spawn DS_fnc_deathCam;	
DS_armour = 0;
player setVariable["mechanic",FALSE,TRUE];
player setVariable["medic",FALSE,TRUE];




	
	
	
	
	
	
	
	
	
	
	
	