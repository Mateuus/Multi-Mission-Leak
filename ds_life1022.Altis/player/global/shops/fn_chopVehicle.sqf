/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	returns price of selected vehicle depending on perk level and player side
*/

private["_tempNum","_vehicle","_copCar","_mcu","_sleep","_startPod"];

if(DS_doingStuff)exitwith{};
_vehicle = nearestObjects [player,["Car","Truck","Air","Ship"],25];
_vehicle = _vehicle select 0;
_startPod = getPos _vehicle;
if((_vehicle getVariable ["GCU",false])&&((typeOf _vehicle == "O_APC_Wheeled_02_rcws_F")||(typeOf _vehicle == "O_APC_Wheeled_02_rcws_F")||(typeOf _vehicle == "O_Truck_03_covered_F")))exitwith{hint "This vehicle can not be chopped"};
if((_vehicle getVariable ["CCU",false])&&((typeOf _vehicle == "O_APC_Wheeled_02_rcws_F")||(typeOf _vehicle == "O_APC_Wheeled_02_rcws_F")||(typeOf _vehicle == "O_Truck_03_covered_F")))exitwith{hint "This vehicle can not be chopped"};
if(_vehicle getVariable ["policeVehicle",false])then{_copCar = true}else{_copCar = false};
//if(count(crew _vehicle) != 0)exitwith{hint "You can not chop a vehicle with people inside of it";DS_doingStuff = false};
if(_vehicle getVariable ["convoy_truck",false])exitwith{hint "You can not chop a convoy vehicle";DS_doingStuff = false};
if(_vehicle getVariable ["bulletProof",false])then{DS_price = 2000000};
if(_vehicle getVariable ["packed",false])then{DS_price = 2000000};
if(_vehicle getVariable ["vehAmmo",false])then{DS_price = DS_price + 200000};
//if(_vehicle getVariable ["fuelAdv",false])then{DS_price = DS_price + 50000};
if(_vehicle getVariable ["extraspaceAdv",false])then{DS_price = DS_price + 60000};
if(_vehicle getVariable ["securityAdv",false])then{DS_price = DS_price + 100000};
//if(_vehicle getVariable ["vehAnimal",false])then{DS_price = DS_price + 10000};
closeDialog 0;
DS_doingStuff = true;
_sleep = 0.45;
if((DS_infoArray select 15) > 33)then
	{
	_sleep = (_sleep/2);
	};

if(_vehicle getVariable ["noChop",false])exitWith
	{
	hint "This vehicle can not be chopped";
	};

if(typeOf _vehicle == "C_Kart_01_Blu_F")then
	{
	_sleep = 3;
	};

disableSerialization;
_title = "Chopping Vehicle";
"progressBar" cutRsc ["DS_progress","PLAIN"];
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
		"progressBar" cutRsc ["DS_progress","PLAIN"];
		_ui = uiNamespace getVariable "DS_progress";
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
	if([getPos player,75,west,true] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};
	};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if([getPos player,75,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
if([getPos player,75,west,true] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
if(!alive player)exitwith{DS_doingStuff = false;};
if(DS_tazed)exitwith{DS_doingStuff = false;};
if(player distance _vehicle > 30) exitwith {hint "You moved to far from the vehicle";DS_doingStuff = false;};
if(!alive _vehicle)exitwith{hint "Chopping cancelled because the vehicle was destroyed";DS_doingStuff = false;};
if(_startPod distance _vehicle > 30)exitwith{hint "Chopping cancelled because the vehicle was moved";DS_doingStuff = false;};
if(typeOf _vehicle == "C_Kart_01_Blu_F")exitwith
	{
	hint "Chop Failed - Somebody is nearby you";
	};
{
	_x action ["getOut", _vehicle];
}forEach (crew _vehicle);



if(_vehicle getVariable["isMCU",false])then
	{
	police_command_unitActive = false;
	publicVariable "police_command_unitActive";
	_amount = [] call DS_fnc_getCopScore;
	_amount = (_amount*30000);
	[_amount] spawn DS_civ_payGangAccount;
	DS_crimeRate = DS_crimeRate + 1.1;
	publicVariable "DS_crimeRate";
	};
if(_vehicle getVariable["isMCUWater",false])then
	{
	police_command_unitActive = false;
	publicVariable "police_command_unitActive";
	_amount = [] call DS_fnc_getCopScore;
	_amount = (_amount*30000);
	[_amount] spawn DS_civ_payGangAccount;
	DS_crimeRate = DS_crimeRate + 1.1;
	publicVariable "DS_crimeRate";
	};
if(typeOf _vehicle == "I_APC_Wheeled_03_cannon_F")then
	{
	DS_crimeRate = DS_crimeRate + 1.5;
	publicVariable "DS_crimeRate";
	};
sleep 1;
[player,_vehicle] remoteExec ["HUNT_fnc_chopVeh",2];
hint "You will be paid soon for chopping this vehicle";
waitUntil {(!alive _vehicle)};
DS_doingStuff = false;
if(((DS_infoArray select 15) > 46)&&(_copCar))then
	{
	DS_price = (DS_price*2);
	};
if((miscInfoArray select 8)&&((_vehicle getVariable["isMCU",false])||(typeOf _vehicle == "I_APC_Wheeled_03_cannon_F")))then{DS_price = DS_price*2;};
systemchat format ["You have been paid $%1 for chopping this vehicle",[DS_price] call DS_fnc_numberText];
hint format ["You have been paid $%1 for chopping this vehicle",[DS_price] call DS_fnc_numberText];
[DS_price,false,true] call DS_fnc_handleMoney;
["527"] spawn DS_fnc_addCharge;
DS_doingStuff = false;

if((DS_infoArray select 15) == 10)then { [1] call DS_fnc_questCompleted };

if((_copCar)&&((DS_infoArray select 15) == 30))then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 4)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if((DS_infoArray select 15) == 33)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 9)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if((_copCar)&&((DS_infoArray select 15) == 46)&&(typeOf _vehicle) in ["O_MRAP_02_F","B_MRAP_01_F","O_MRAP_02_hmg_F","B_MRAP_01_hmg_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_F","I_MRAP_03_hmg_F"])then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 4)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if(((typeOf _vehicle) in ["O_MRAP_02_F","B_MRAP_01_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","B_MRAP_01_hmg_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_F"])&&(_copCar)&&(DS_tokenMission == 12))then {
	DS_tokenMission = -1;
	[100,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
};

if((_vehicle getVariable["isMCU",false])&&(DS_tokenMission == 11))then {
	DS_tokenMission = -1;
	[500,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
};