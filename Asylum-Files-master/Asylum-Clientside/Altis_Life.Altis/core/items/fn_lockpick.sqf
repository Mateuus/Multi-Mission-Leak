/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: Skalicon & Paratus

	Description:
	Main functionality for lockpicking a car or restrained player.
*/
private["_unit","_dice","_uid","_owners","_chance","_alarmSound"];
_unit = cursorTarget;
if(player distance getmarkerPos "courtroom" < 75) exitWith {};
if (life_action_in_use) exitWith {};
if((!(_unit isKindOf "LandVehicle"))&&!(_unit isKindOf "Air")&&!(_unit isKindOf "Ship")&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "You cannot lockpick this unit."};
if(player distance _unit > 7) exitWith {hint "You need to be within 7 meters!"};
if(_unit in life_vehicles) exitWith {hint "This vehicle is already in your keychain."};
if (!(55 in life_talents) && ((_unit isKindOf "LandVehicle") || (_unit isKindOf "Air"))) exitWith {hint "Lockpicking vehicles requires talent, which you don't have."};
if (!(57 in life_talents) && (typeOf _unit) in ["I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","O_MRAP_02_F","B_MRAP_01_F", "I_MRAP_03_F"]) exitWith {hint "You don't have the talent to lockpick such a heavy vehicle."};
if (!(58 in life_talents) && (_unit isKindOf "Air")) exitWith {hint "Lockpicking helicopters requires talent, which you don't have."};
if (_unit getVariable ["digiLock", false]) exitWith {hint "This vehicle has a digital lock and cannot be picked!"};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

_isMilitary = (typeOf _unit) in ["O_MRAP_02_F","B_MRAP_01_F", "I_MRAP_03_F"];

_dice = random(100);
_alarmSound = "caralarm";
_chance = 20;
if(_isMilitary) then {
	_chance = 5;
};
if (_unit isKindOf "Air") then{
	_chance = 10;
	_alarmSound = "airalarm";
};
if (56 in life_talents) then { _chance = _chance + 10; };
if(15 in life_honortalents && license_civ_bounty) then {_chance = _chance + 10};

if (!(_unit isKindOf "Man")) then
{
	_vInfo = _unit getVariable["dbInfo",[]];
	if ((_vInfo select 3)) then
	{
		[[_unit, _alarmSound, 50], "life_fnc_playSound", true, false] spawn life_fnc_MP;
		[[Str(life_wanted),name player,8],"life_fnc_clientMessage",west,false] spawn life_fnc_MP;
	};
};
_upp = "Lockpicking";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
life_action_in_use = true;
_delay = 0.05;
if(13 in life_honortalents && license_civ_bounty) then {_delay = _delay - 0.01};
if(14 in life_honortalents && license_civ_bounty) then {_delay = _delay - 0.02};
_success = false;
animRepeat = true;
[] spawn {
	while{animRepeat} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"};
		sleep 1;
	};
};
while{true} do
{
	sleep _delay;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(!life_action_in_use || player distance _unit > 10) exitWith {hint "The lockpicking process has failed"};
};
animRepeat = false;
5 cutText ["","PLAIN"];
life_action_in_use = false;
player playActionNow "Stop";
if(!_success) exitWith {};
if (_unit isKindOf "Man") then {
	if(_dice < _chance) then
	{
		titleText["You have unrestrained this player.","PLAIN"];
		[nil,nil,nil,_unit] spawn life_fnc_unrestrain;
		if (!(playerSide == west) && !(_unit getVariable["isCivRestrained",false])) then {
		serv_killed = [player,"141"];
		publicVariableServer "serv_killed";
		};
	}
	else
	{
		titleText["The lockpick broke.","PLAIN"];
		//[[0,format["%1 was seen trying to lockpick %2's handcuffs.",name player,name _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	};
} else {
	//[[0,format["%1 was seen trying to lockpick a %2.",name player,getText(configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName")]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	if(_dice <= _chance) then
	{
		titleText["You now have keys to this vehicle.","PLAIN"];
		life_vehicles set[count life_vehicles,_unit];

		_uid = getPlayerUID player;
		_owners = _unit getVariable "vehicle_info_owners";
		_owners set[count _owners,[_uid,name player]];
		_unit setVariable["vehicle_info_owners",_owners,true];

		if (!(playerSide == west)) then {
			_chance = 0;
			if(_unit getVariable "dbInfo" select 0 in life_bounty_uid) then {
				_chance = switch(true) do {
					case(21 in life_honortalents): {30};
					case(20 in life_honortalents): {20};
					case(19 in life_honortalents): {10};
				};
			};
			if(random 100 < _chance) exitWith {};
			serv_killed = [player,"487"];
			publicVariableServer "serv_killed";
		};
		//[[63, player, format["Picked lock of %1", typeOf _unit]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		if((!(_unit isKindOf "LandVehicle"))) then { life_experience = life_experience + 30; }
		else { life_experience = life_experience + 40; };
	}
	else
	{
		if (!(playerSide == west)) then {
			serv_killed = [player,"215"];
			publicVariableServer "serv_killed";
		};
		titleText["The lockpick broke.","PLAIN"];
		//[[62, player, format["Attempted to pick lock of %1 but failed", typeOf _unit]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};