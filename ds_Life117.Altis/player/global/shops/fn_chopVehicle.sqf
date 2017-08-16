/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	returns price of selected vehicle depending on perk level and player side
*/

private["_vehicle","_copCar","_mcu","_sleep"];

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_vehicle = nearestObjects [getPos player,["Car","Truck","Air"],25];
_vehicle = _vehicle select 0;
if(_vehicle getVariable ["policeVehicle",false])then{_copCar = true}else{_copCar = false};
if(count(crew _vehicle) != 0)exitwith{hint "You can not chop a vehicle with people inside of it";DS_doingStuff = false};
if(_vehicle getVariable ["bulletProof",false])then{DS_price = 2000000};
if(_vehicle getVariable ["packed",false])then{DS_price = 1000000};
if(_vehicle getVariable ["vehAmmo",false])then{DS_price = DS_price + 200000};
if(_vehicle getVariable ["fuelAdv",false])then{DS_price = DS_price + 50000};
if(_vehicle getVariable ["extraspaceAdv",false])then{DS_price = DS_price + 60000};
if(_vehicle getVariable ["securityAdv",false])then{DS_price = DS_price + 100000};
if(_vehicle getVariable ["vehAnimal",false])then{DS_price = DS_price + 10000};
closeDialog 0;
_sleep = 0.45;
if((DS_infoArray select 15) > 34)then
	{
	_sleep = (_sleep/2);
	};

disableSerialization;
_title = "Chopping Vehicle";
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;

while {true} do
	{
	
	sleep _sleep;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance _vehicle > 30) exitwith {};
	if(_cP >= 1 OR !alive player) exitWith {};
	if(!alive player)exitwith{};
	if(DS_tazed)exitwith{};
	if(!alive _vehicle)exitwith{};
	if([getPos player,75,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};
	if([getPos player,75,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};
	};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if([getPos player,75,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
if([getPos player,75,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
if(!alive player)exitwith{DS_doingStuff = false;};
if(DS_tazed)exitwith{DS_doingStuff = false;};
if(player distance _vehicle > 30) exitwith {hint "You moved to far from the vehicle";DS_doingStuff = false;};
if(!alive _vehicle)exitwith{hint "Chopping cancelled because the vehicle was destroyed";DS_doingStuff = false;};
if(count(crew _vehicle) > 0)exitwith{hint "You can't chop a vehicle that has somebody inside of it";DS_doingStuff = false};

if(_vehicle getVariable["isMCU",false])then
	{
	police_command_unitActive = false;
	publicVariable "police_command_unitActive";
	};
[[player,_vehicle],"HUNT_fnc_chopVeh",false,false] spawn BIS_fnc_MP;
hint "You will be paid soon for chopping this vehicle";
waitUntil {(!alive _vehicle)};
DS_doingStuff = false;
systemchat format ["You have been paid $%1 for chopping this vehicle",[DS_price] call DS_fnc_numberText];
hint format ["You have been paid $%1 for chopping this vehicle",[DS_price] call DS_fnc_numberText];
[DS_price,false,true] call DS_fnc_handleMoney;
["527"] spawn DS_fnc_addCharge;
DS_doingStuff = false;
if((DS_infoArray select 15) == 10)then
	{
	[1] call DS_fnc_questCompleted;
	};
if((_copCar)&&((DS_infoArray select 15) == 26))then
	{
	_tempNum = (DS_infoArray select 16);
	_tempNum = _tempNum + 1;
	DS_infoArray set [16,_tempNum];
	if((DS_infoArray select 16) > 2)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 15) == 34)then
	{
	_tempNum = (DS_infoArray select 16);
	_tempNum = _tempNum + 1;
	DS_infoArray set [16,_tempNum];
	if((DS_infoArray select 16) > 9)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};