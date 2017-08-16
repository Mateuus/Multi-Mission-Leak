/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Processes Meth
*/

private ["_tempNum","_processed","_pos"];

_processed = 0;
_pos = (position player);

if(!isNull objectParent player) exitWith {hint 'You can not process while in a vehicle';};
if(DS_mining)exitwith{hint 'You are already processing';};
if((DS_item_sodium < 1)||(DS_item_hydro < 1))exitwith{hint "You do not have the required ingredients for this\n\nYou need Sodium Hydroxide and Hydrochloric Acid\n\nBoth of these items are found at the Telos and Sofia hospitals, free of charge"};
DS_mining = true;

	_upp = "Processing Crystal Meth";
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

while{true} do
	{
		//if((player_questLog select 2) > 29)then{sleep 0.15}else{sleep 0.3};
		sleep 0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _pos > 10) exitWith {};
		if(!isNull objectParent player) exitWith {};
	};

	"progressBar" cutText ["","PLAIN"];
	player playActionNow "stop";

	if(player distance _pos > 10) exitWith {hint "You need to stay within 10m to process."; "progressBar" cutText ["","PLAIN"]; DS_mining = false;};
	if(!isNull objectParent player) exitWith {hint "You can not process while inside a vehicle."; "progressBar" cutText ["","PLAIN"]; DS_mining = false;};

while{true} do
	{
	if((DS_item_sodium > 0)&&(DS_item_hydro > 0))then
		{
		_processed = _processed + 1;
		["DS_item_sodium",false,1] call DS_fnc_handleInventory;
		["DS_item_hydro",false,1] call DS_fnc_handleInventory;
		};
	if((DS_item_sodium < 1)||(DS_item_hydro < 1))exitwith{};
	};

["DS_item_meth",true,_processed] call DS_fnc_handleInventory;

"progressBar" cutText ["","PLAIN"];
titleText[format["You have processed %1 Crystal Meth",_processed],"PLAIN"];
DS_mining = false;
if(DS_tokenMission == 18)then
	{
	DS_tokenMission = -1;
	[100,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
	
if((DS_infoArray select 15) == 22)then { [1] call DS_fnc_questCompleted };

if((DS_infoArray select 15) == 41)then {
	_tempNum = (DS_infoArray select 16) + _processed;
	if(_tempNum > 299)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};