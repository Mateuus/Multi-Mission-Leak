/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Crafts Items
*/

private ["_bluePrint","_longName","_fail","_temp","_action","_random","_pos","_infoArray","_sleep","_fastCraft","_oneUse"];
_bluePrint = _this select 0;
_fail = false;
_longName = format ["DS_item_%1",_bluePrint];
_pos = (position player);
_oneUse = ["bpWeaponsAir","bpWeaponsLand","bpBlackfoot","bpVehSUV"];
_infoArray = [];
_fastCraft = ["bpAmmoLynx","bpAmmoRpg","mattCpu","mattSmallBattery","mattCircuitBoard","mattBronze","mattCrystalGlass","mattSteel","mattTreatedLumber"];
_noBp = ["mattnorecoil","mattCpu","mattSmallBattery","mattCircuitBoard","mattBronze","mattCrystalGlass","mattSteel","mattTreatedLumber"];
if(_bluePrint in _fastCraft)then{_sleep = 0.05}else{_sleep = 0.2};
if(_bluePrint in _oneUse)then{_sleep = 0.4};
if((DS_infoArray select 13) > 39)then { _sleep = (_sleep/2) };
//High enough quest?
if((_bluePrint == "mattnorecoil")&&((DS_infoArray select 15) < 42))exitwith{hint "You need to complete the Meth Head part 2 quest to craft this item"};
if((_bluePrint == "bpWeaponsAir")&&((DS_infoArray select 17) < 37))exitwith{hint "You must complete the DAR Pawnee quest to craft this item"};
if((_bluePrint == "bpWeaponsLand")&&((DS_infoArray select 17) < 25))exitwith{hint "You must complete the Craft a Lynx quest to craft this item"};
if((_bluePrint == "bpVehSUV")&&((DS_infoArray select 17) < 28))exitwith{hint "You must complete the take battery quest to craft this item"};
if((_bluePrint == "bpBlackfoot")&&((DS_infoArray select 17) < 39))exitwith{hint "You must complete the Terrorist Mission quest to craft this item"};
if(!([_longName,"matt"] call DS_fnc_strInStr))then
	{
	if(missionNameSpace getVariable _longName < 1)exitwith{hint "You do not have this blueprint, purchase it from the blue print shop";_fail = true};
	};
if(_fail)exitwith{};
_infoArray = [_bluePrint] call DS_civ_craftConfig;
if(_infoArray isEqualTo [])exitwith{};//woops
//First lets make sure the play has all the needed items
{
	_temp = format ["DS_item_%1",(_x select 0)];
	if(missionNameSpace getVariable _temp < (_x select 1))then{_fail = true};
}forEach (_infoArray select 5);
if(_fail)exitwith{hint "You are lacking all the needed items to create this item"};
//Lets make sure they know what they're doing
_action = [
	"Crafting this item will remove all the needed items from your inventory, continue?",
	"Crafting",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
{
	_temp = format ["DS_item_%1",(_x select 0)];
	if(missionNameSpace getVariable _temp < (_x select 1))then{_fail = true};
}forEach (_infoArray select 5);
if(_fail)exitwith{hint "You are lacking all the needed items to create this item"};
if(DS_mining)exitwith{hint "Something is preventing you doing this, if you feel this is a bug please report it"};
DS_mining = true;
_random = random 100;
//Progress bar
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Crafting %2 (1%1)...","%",(_infoArray select 0)];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Crafting %3 (%2%1)...","%",round(_cp*100),(_infoArray select 0)];
	if(_cP >= 1) exitWith {};
	if(!alive player)exitwith{};
	if(player distance _pos > 5)exitwith{};
	if(DS_tazed)exitwith{};
};
DS_mining = false;
"progressBar" cutText ["","PLAIN"];
if(!alive player)exitwith{};
if(player distance _pos > 5)exitwith{systemchat "You moved too far away"};
if(DS_tazed)exitwith{};
//Take the ingredients off them
if(!([_longName,"matt"] call DS_fnc_strInStr))then
	{
	if(missionNameSpace getVariable _longName < 1)exitwith{hint "You do not have this blueprint, purchase it from the blue print shop";_fail = true};
	};
if(_fail)exitwith{};
if(_bluePrint in _oneUse)then
	{
	[_bluePrint,false,1] call DS_fnc_handleInventory;
	};
{
	[(_x select 0),false,(_x select 1)] call DS_fnc_handleInventory;
}forEach (_infoArray select 5);
if((_random < ((_infoArray select 4)*(DS_infoArray select 30)))&&((!(_bluePrint == "bpVehSUV"))&&(!(_bluePrint == "bpBlackfoot"))))then
	{
	player say3D "success";
	systemchat format ["Congratulations, you have created an advanced version of this item. A %1 has been added to your inventory",(_infoArray select 2)];
	hint format ["Congratulations, you have created an advanced version of this item. A %1 has been added to your inventory",(_infoArray select 2)];
	_temp = format ["%1Adv",(_infoArray select 7)];
	[_temp,true,1] call DS_fnc_handleInventory;
	[13] call DS_fnc_alterStats;
	[13] call DS_fnc_alterStats;
	[13] call DS_fnc_alterStats;
	}
	else
	{
	player say3D "dingDong";
	if((_bluePrint != "bpVehSUV")&&(_bluePrint != "bpBlackfoot"))then
		{
		systemchat format ["Your %1 has been crafted and added to your inventory",(_infoArray select 0)];
		hint format ["Your %1 has been crafted and added to your inventory",(_infoArray select 0)];
		[(_infoArray select 7),true,1] call DS_fnc_handleInventory;
		}
		else
		{
		systemchat format ["Your %1 has been crafted and added to your vehicle garage",(_infoArray select 0)];
		hint format ["Your %1 has been crafted and added to your vehicle garage",(_infoArray select 0)];
		if(_bluePrint == "bpVehSUV")then
			{
			[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true] remoteExec ["HUNT_fnc_vehicleRewards",2];
			};
		if(_bluePrint == "bpBlackfoot")then
			{
			[(getPlayerUID player),civilian,"Air","B_Heli_Attack_01_F"] remoteExec ["HUNT_fnc_vehicleRewards",2];
			};
		};
	[13] call DS_fnc_alterStats;
	};

if((DS_infoArray select 13) == 8)then {
	[0] call DS_fnc_questCompleted;
};
if((_bluePrint == "bpGunLynx")&&((DS_infoArray select 17) == 24))then { [2] call DS_fnc_questCompleted };