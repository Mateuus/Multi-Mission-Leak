/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends the player to jail
*/

private["_policeBankCash","_parsed","_halfTime","_canBail","_ret","_bad","_time","_bail","_esc","_countDown","_jailDuration","_bailTime","_bailString","_reasonString","_time","_bailCounter","_dead","_seconds","_rand","_holding","_myCash","_jailLogged","_bigBail","_bounty","_myCash"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amountString = [_this,1,"",[""]] call BIS_fnc_param;
_reasonString = [_this,2,"",[""]] call BIS_fnc_param;
_jailLogged = _this select 3;
_cop = _this select 4;

_myCash = 0;
_bigBail = false;
_canBail = false;
_dead = false;
_bailString = "No";
_bailCounter = 0;
_holding = false;
_rand = round random 10;
[(DS_coin/4),true] remoteExec ["HUNT_fnc_policeBank",2];
_myCash = DS_coin;
_policeBankCash = (_myCash/4);
if(_policeBankCash > 200000)then {_policeBankCash = 200000;};
[_policeBankCash,true] remoteExec ["HUNT_fnc_policeBank",2];
DS_coin = 0;
DS_jail_info = [false,false,false,false,false,false];
DS_jailed = true;
DS_canWork = true;
[4,_amountString] spawn DS_fnc_locationRecord;
player setVariable ["jailed",DS_jailed,true];

player allowDamage false;
player setDamage 0;
player forceWalk true;

_bounty = (DS_wanted_stats select 0);
if(!isNil "_cop")then {
	[0,_unit,_bounty] remoteExec ["DS_fnc_getBounty",_cop];
};

if(player getVariable ["DS_sick_infection",false])then {
	player setVariable ["DS_sick_infection",false,true];
	[12] call DS_fnc_alterStats;
	player setDamage 0;
};

_parsed = (parseNumber(_amountString));
_jailDuration = (_parsed*60);

//Fail safe to reduce a sentence to 15 minutes if civ doesnt have a rebel training
if((!DSL_rebel)&&(!DSL_rebelVeh)&&(_jailDuration > 1200))then {_jailDuration = 1200;};

//Fail safe incase 25 minutes but no Rebel Veh Training
if((!DSL_rebelVeh)&&(_jailDuration > 1740))then {
	if(DSL_rebelAdv)then {
		_jailDuration = 1500;
	} else {
		_jailDuration = 1200;
	};
};

if(_jailLogged)then {
	[0,format ["%1 has been sent to jail for %2 minutes because they either logged or glitched out of jail or restraints",name _unit,_amountString],false,0] remoteExecCall ["DS_fnc_globalMessage",-2];

	_parsed = (parseNumber(_amountString));
	_jailDuration = (_parsed*60);
	DS_jailed = true;
	player setVariable ["jailed",DS_jailed,true];
} else {
	if((DSL_rebelVeh)&&((DS_infoArray select 17) == 15))then { [2] call DS_fnc_questCompleted };
};

DS_realEstateArray set [14,0];
if(_jailDuration < 301)then {
	titleText ["", "BLACK FADED", 5];
	player setPos (getMarkerPos "jail_marker_holding");
	sleep 5;
	titleText ["", "BLACK IN", 5];
	if(player distance (getMarkerPos "jail_marker_holding") > 40)then {
		player setPos (getMarkerPos "jail_marker_holding");
	};
} else {
	titleText ["", "BLACK FADED", 5];
	player setPos (getMarkerPos "jail_marker_main");
	sleep 5;
	titleText ["", "BLACK IN", 5];
	if(player distance (getMarkerPos "jail_marker_main") > 40)then {
		player setPos (getMarkerPos "jail_marker_main");
	};
};

removeHeadGear player;
removeVest player;
player addUniform "U_C_Commoner1_2";

DS_bailValue = _jailDuration * 60;

if((DS_item_spyDocs > 9)&&((DS_infoArray select 17) == 34))then {
	["spyDocs",false,10] call DS_fnc_handleInventory;
	sleep 5;
	hint "A jail release card has been added to your inventory so you can escape";
	systemChat "A jail release card has been added to your inventory so you can escape";
	["jailBreak",true,1] call DS_fnc_handleInventory;
	[2] call DS_fnc_questCompleted;
	sleep 10;
};

if((DSL_rebel)||(DSL_rebelVeh))then {_bigBail = true;DS_bailValue = DS_bailValue*2;systemChat "Because you had Rebel Training, you were deemed a greater risk, therefore your bail was doubled";};

_seconds = _jailDuration*5;
_jailDuration = time + _jailDuration;
_bailTime = _jailDuration - 50;
_halfTime = time + (_jailDuration/2);

player setVariable["restrained",false,true];
player setVariable["escorted",false,true];
player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";

DS_drunk = 0;

if(DS_item_heroinp > 0)then{["DS_item_heroinp",false,DS_item_heroinp] call DS_fnc_handleInventory};
if(DS_item_weedp > 0)then{["DS_item_weedp",false,DS_item_weedp] call DS_fnc_handleInventory};
if(DS_item_cocainep > 0)then{["DS_item_cocainep",false,DS_item_cocainep] call DS_fnc_handleInventory};
if(DS_item_heroinu > 0)then{["DS_item_heroinu",false,DS_item_heroinu] call DS_fnc_handleInventory};
if(DS_item_weedu > 0)then{["DS_item_weedu",false,DS_item_weedu] call DS_fnc_handleInventory};
if(DS_item_cocaineu > 0)then{["DS_item_cocaineu",false,DS_item_cocaineu] call DS_fnc_handleInventory};
if(DS_item_illegalRelicu > 0)then{["DS_item_illegalRelicu",false,DS_item_illegalRelicu] call DS_fnc_handleInventory};
if(DS_item_illegalRelicp > 0)then{["DS_item_illegalRelicp",false,DS_item_illegalRelicp] call DS_fnc_handleInventory};
if(DS_item_hydro > 0)then{["DS_item_hydro",false,DS_item_hydro] call DS_fnc_handleInventory};
if(DS_item_sodium > 0)then{["DS_item_sodium",false,DS_item_sodium] call DS_fnc_handleInventory};
if(DS_item_hydroPack > 0)then{["DS_item_hydroPack",false,DS_item_hydroPack] call DS_fnc_handleInventory};
if(DS_item_sodiumPack > 0)then{["DS_item_sodiumPack",false,DS_item_sodiumPack] call DS_fnc_handleInventory};
if(DS_item_meth > 0)then{["DS_item_meth",false,DS_item_meth] call DS_fnc_handleInventory};
if(((DS_infoArray select 17) != 34)&&(DS_item_spyDocs > 0))then{["DS_item_spyDocs",false,DS_item_spyDocs] call DS_fnc_handleInventory};
if(DS_item_goldBar > 0)then{["DS_item_goldBar",false,DS_item_goldBar] call DS_fnc_handleInventory};
if(DS_item_goldBarMedium > 0)then{["DS_item_goldBarMedium",false,DS_item_goldBarMedium] call DS_fnc_handleInventory};
if(DS_item_goldBarLarge > 0)then{["DS_item_goldBarLarge",false,DS_item_goldBarLarge] call DS_fnc_handleInventory};
if(DS_item_ziptie > 0)then{["DS_item_ziptie",false,DS_item_ziptie] call DS_fnc_handleInventory};
if(DS_item_battery > 0)then{["DS_item_battery",false,DS_item_battery] call DS_fnc_handleInventory};
if(DS_item_cracker > 0)then{["DS_item_cracker",false,DS_item_cracker] call DS_fnc_handleInventory};
if(DS_item_bpGunLynx > 0)then{["DS_item_bpGunLynx",false,DS_item_bpGunLynx] call DS_fnc_handleInventory};
if(DS_item_gunLynx > 0)then{["DS_item_gunLynx",false,DS_item_gunLynx] call DS_fnc_handleInventory};
if(DS_item_gunLynxAdv > 0)then{["DS_item_gunLynxAdv",false,DS_item_gunLynxAdv] call DS_fnc_handleInventory};
if(DS_item_bpAmmoLynx > 0)then{["DS_item_bpAmmoLynx",false,DS_item_bpAmmoLynx] call DS_fnc_handleInventory};
if(DS_item_ammoLynx > 0)then{["DS_item_ammoLynx",false,DS_item_ammoLynx] call DS_fnc_handleInventory};
if(DS_item_ammoLynxAdv > 0)then{["DS_item_ammoLynxAdv",false,DS_item_ammoLynxAdv] call DS_fnc_handleInventory};
if(DS_item_bpAmmoRpg > 0)then{["DS_item_bpAmmoRpg",false,DS_item_bpAmmoRpg] call DS_fnc_handleInventory};
if(DS_item_ammoRpg > 0)then{["DS_item_ammoRpg",false,DS_item_ammoRpg] call DS_fnc_handleInventory};
if(DS_item_ammoRpgAdv > 0)then{["DS_item_ammoRpgAdv",false,DS_item_ammoRpgAdv] call DS_fnc_handleInventory};
if(DS_item_ied > 0)then{["DS_item_ied",false,DS_item_ied] call DS_fnc_handleInventory};
if(DS_item_bpGunRpg > 0)then{["DS_item_bpGunRpg",false,DS_item_bpGunRpg] call DS_fnc_handleInventory};
if(DS_item_gunRpg > 0)then{["DS_item_gunRpg",false,DS_item_gunRpg] call DS_fnc_handleInventory};
if(DS_item_bpGun3gl > 0)then{["DS_item_bpGun3gl",false,DS_item_bpGun3gl] call DS_fnc_handleInventory};
if(DS_item_gun3gl > 0)then{["DS_item_gun3gl",false,DS_item_gun3gl] call DS_fnc_handleInventory};
if(DS_item_bpGunNavid > 0)then{["DS_item_bpGunNavid",false,DS_item_bpGunNavid] call DS_fnc_handleInventory};
if(DS_item_gunNavid > 0)then{["DS_item_gunNavid",false,DS_item_gunNavid] call DS_fnc_handleInventory};
if(DS_item_c4 > 0)then{["DS_item_c4",false,DS_item_c4] call DS_fnc_handleInventory};
if(DS_item_armour > 0)then{["DS_item_armour",false,DS_item_armour] call DS_fnc_handleInventory};
if(DS_item_idChanger > 0)then{["DS_item_idChanger",false,DS_item_idChanger] call DS_fnc_handleInventory};
if(DS_item_blackfoot > 0)then{["DS_item_blackfoot",false,DS_item_blackfoot] call DS_fnc_handleInventory};
if(DS_item_norecoil > 0)then{["DS_item_norecoil",false,DS_item_norecoil] call DS_fnc_handleInventory};
if(DS_item_pawnee > 0)then{["DS_item_pawnee",false,DS_item_pawnee] call DS_fnc_handleInventory};
if(DS_item_ammoRpg7Adv > 0)then{["DS_item_ammoRpg7Adv",false,DS_item_ammoRpg7Adv] call DS_fnc_handleInventory};
if(DS_item_ammoRpg7 > 0)then{["DS_item_ammoRpg7",false,DS_item_ammoRpg7] call DS_fnc_handleInventory};
if(DS_item_gunSpmg > 0)then{["DS_item_gunSpmg",false,DS_item_gunSpmg] call DS_fnc_handleInventory};
if(DS_item_armourAdv > 0)then{["DS_item_armourAdv",false,DS_item_armourAdv] call DS_fnc_handleInventory};
if(DS_item_gunRpg7 > 0)then{["DS_item_gunRpg7",false,DS_item_gunRpg7] call DS_fnc_handleInventory};

DS_jailed = true;
player setVariable ["jailed",DS_jailed,true];

_esc = false;
_bail = false;
_jailDuration = _jailDuration + 10;

titleText ["You have been arrested, wait your time out. If you attempt to respawn or reconnect your time will increase!","PLAIN"];
removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);

player unassignItem "ItemMap";
player removeItem "ItemMap";

if(DS_illegalMoney > 0)then {
	systemChat format ["Because of your crimes the bank has confiscated $%1 from your bank account",DS_illegalMoney];
	[DS_illegalMoney,true,false] call DS_fnc_handleMoney;
	[0,format ["The criminal %1 has just had $%2 deducted from his bank account and deposited into the police bank",name player,DS_illegalMoney]] remoteExecCall ["DS_fnc_globalMessage",west];
	[DS_illegalMoney,true] remoteExec ["HUNT_fnc_policeBank",2];
	DS_illegalMoney = 0;
};

if((DS_infoArray select 17) > 25)then {_jailDuration = _jailDuration - 60;};
//if(DS_realMode)then {_jailDuration = (_jailDuration*0.75);};

while{true} do {
	if((round(_jailDuration - time)) > 0)then {
		_countDown = [(_jailDuration - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format ["Time Remaining:<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/><t color='#FF0000'>Can pay bail:</t> %3<br/><br/><br/><t color='#FF0000'>Bail Price:</t> $%2<br/><br/><t color='#FF0000'>Reason for Jail</t><br/>%4",_countDown,[DS_bailValue] call DS_fnc_numberText,_bailString,_reasonString];
	};

	if(!(isForcedWalk player))then {
		player forceWalk true;
	};

	if(DS_jail_info select 0)then {
		_jailDuration = _jailDuration + 120;
		DS_jail_info set [0,false];
	};

	if(DS_jail_info select 1)then {
		_jailDuration = _jailDuration + 60;
		DS_jail_info set [1,false];
	};

	if(DS_jail_info select 2)then {
		_jailDuration = _jailDuration - 30;
		DS_jail_info set [2,false];
	};

	if(DS_jail_info select 3)then {
		_jailDuration = _jailDuration - 60;
		DS_jail_info set [3,false];
	};

	if(DS_jail_info select 4)then {
		_jailDuration = _jailDuration - 120;
		DS_jail_info set [4,false];
	};

	if((_bailCounter > _seconds/2)&&(!_canBail))then {
		_bailString = "Yes";
		DS_jail_info set [5,true];
		_canBail = true;
	};

	if((player distance (getMarkerPos "jail_marker_main") > 50)&&(player distance (getMarkerPos "jail_marker_holding") > 30))exitWith {
		_esc = true;
		[] call DS_fnc_compileData;
		sleep 2;
		player forceWalk false;
	};

	if(!alive player)exitWith {
		//[] call DS_fnc_compileData;
		sleep 2;
		_dead = true;
		player forceWalk false;
	};

	if(DS_bailValue < 1)exitWith {
		_bail = true;
		//[] call DS_fnc_compileData;
		sleep 2;
		player forceWalk false;
	};

	if((round(_jailDuration - time)) < 1)exitWith {hint "";player forceWalk false;};
	if(!alive player && ((round(_jailDuration - time)) > 0))exitWith {
		[] call DS_fnc_compileData;
		sleep 2;
		player forceWalk false;
	};

	if(_bigBail)then{DS_bailValue = DS_bailValue - 8;}else{DS_bailValue = DS_bailValue - 4;};
	if(DS_bailValue < 100)then{DS_bailValue = 100;};

	sleep 0.2;

	_bailCounter = _bailCounter + 1;
	if((_bailCounter%300) == 0)then {
		_tempVal = (round(_jailDuration - time));
		DS_realEstateArray set [7,_tempVal];
		[] call DS_fnc_compileData;
	};

	if(DS_jailRelease)exitWith {
		[] call DS_fnc_compileData;
		sleep 2;
		player forceWalk false;
	};
};

if((DS_realEstateArray select 7) > 0)then {DS_realEstateArray set [7,0];};

if(DS_jailRelease)exitWith {
	sleep 2;

	DS_jailRelease = false;
	DS_jailed = false;
	DS_coin = _myCash;
	DS_bailValue = 0;

	player setVariable ["jailed",DS_jailed,true];
	player allowDamage true;
	player forceWalk false;

	player linkItem "ItemMap";
	player linkItem "ItemGPS";

	player setPos (getMarkerPos "respawn_civilian");

	[20,true] spawn DS_fnc_handleMoral;
	[0] call DS_fnc_removeLicenses;
	[] spawn DS_fnc_removeCharges;
	[] spawn DS_fnc_menuSpawnScreen;
	[] call DS_fnc_compileData;
};

switch(true)do {
	case (_bail): {
		DS_jailed = false;
		DS_bailValue = 0;
		DS_coin = _myCash;
		//[] call DS_fnc_compileData;

		hint "You have paid your bail and are now free";
		player setPos (getMarkerPos "respawn_civilian");
		player linkItem "ItemMap";
		player linkItem "ItemGPS";
		player allowDamage true;
		[20,true] spawn DS_fnc_handleMoral;
		[0] call DS_fnc_removeLicenses;
		[] spawn DS_fnc_removeCharges;
		[] spawn DS_fnc_menuSpawnScreen;
	};

	case (_esc): {
		if((player distance (getMarkerPos "jobMarker30") > 80)&&(player distance (getMarkerPos "jobMarker2") > 80)&&(player distance (getMarkerPos "jobMarker4") > 80)&&(player distance (getMarkerPos "jobMarker9") > 80)&&(player distance (getMarkerPos "jobMarker12") > 80)&&(repairJail getVariable ["closed",false]))exitWith {
			[player,"30","Glitching out of jail",true,objNull] spawn DS_fnc_jail;
		};

		DS_jailed = false;

		hint "You have escaped from jail, you still retain your previous crimes and now have a count of escaping jail";
		[0,format ["%1 has escaped from jail!",name player]] remoteExecCall ["DS_fnc_globalMessage",-2];
		if((player distance repairJail < 500)&&((DS_infoArray select 17) == 25))then { [2] call DS_fnc_questCompleted };

		player linkItem "ItemMap";
		player linkItem "ItemGPS";
		player allowDamage true;

		["901"] spawn DS_fnc_addCharge;
		[40,false] spawn DS_fnc_handleMoral;
	};

	case ((alive player)&&(!_esc)&&(!_bail)): {
		DS_jailed = false;
		//[] call DS_fnc_compileData;
		hint "You have served your time in jail and have been released";
		sleep 2;

		player setPos (getMarkerPos "respawn_civilian");
		player linkItem "ItemMap";
		player linkItem "ItemGPS";
		player allowDamage true;

		DS_coin = _myCash;
		[30,true] spawn DS_fnc_handleMoral;
		[0] call DS_fnc_removeLicenses;
		[] spawn DS_fnc_removeCharges;
		[] call DS_fnc_menuSpawnScreen;
	};

	case (_dead): {
		player linkItem "ItemMap";
		player allowDamage true;
		[] spawn DS_fnc_removeCharges;
	};
};

player setVariable ["jailed",DS_jailed,true];
DS_bailValue = 0;
player allowDamage true;
player forceWalk false;
sleep 5;
[] call DS_fnc_compileData;