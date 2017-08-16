/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gang area drug convoys
*/

private["_amount","_startPrice","_payment","_infoArray","_playerCount","_randomSpawn","_vehArray","_randomVeh","_veh","_vehicle","_failed","_marker","_firstMarker","_secondMarker"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};

_payment = 300000;//WIll soon get changing price
_copScore = [] call DS_fnc_getCopScore;
if(_copScore > 25)then
	{
	_payment = (_payment*1.5);
	};
if(_copScore > 45)then
	{
	_payment = (_payment*1.5);
	};
_startPrice = 25000;
if((DS_infoArray select 15) > 29)then{_startPrice = 0};

if(DS_realMode)then{_payment = (_payment*1.5);};

switch(DS_missionSync)do
	{
	case 0: {_infoArray = ["jobMarker110","jobMarker103"]};
	case 1: {_infoArray = ["jobMarker105","jobMarker112"]};
	case 2: {_infoArray = ["jobMarker102","jobMarker101"]};
	case 3: {_infoArray = ["jobMarker100","jobMarker108"]};
	case 4: {_infoArray = ["jobMarker108","jobMarker104"]};
	case 5: {_infoArray = ["jobMarker106","jobMarker104"]};
	case 6: {_infoArray = ["jobMarker109","jobMarker107"]};
	case 7: {_infoArray = ["jobMarker107","jobMarker111"]};
	case 8: {_infoArray = ["jobMarker111","jobMarker105"]};
	case 9: {_infoArray = ["jobMarker110","jobMarker107"]};
	case 10: {_infoArray = ["jobMarker100","jobMarker103"]};
	case 11: {_infoArray = ["jobMarker112","jobMarker100"]};
	case 12: {_infoArray = ["jobMarker108","jobMarker106"]};
	};

_firstMarker = _infoArray select 0;
_secondMarker = _infoArray select 1;
if(isNil "_firstMarker")then{_infoArray set [0,"jobMarker110"];};
if(isNil "_secondMarker")then{_infoArray set [1,"jobMarker103"];};

switch(DS_perkLevel)do
	{
	case 1:
		{
		_playerCount = 18;
		};
	case 2:
		{
		_playerCount = 16;
		};
	case 3:
		{
		_playerCount = 14;
		};
	case 4:
		{
		_playerCount = 12;
		};
	case 5:
		{
		_playerCount = 10;
		};
	case 0:
		{
		_playerCount = 20;
		};
	};
if(((playersNumber west)+(playersNumber civilian)+(playersNumber independent)) < _playerCount)exitwith{hint format ["There needs to be at least %1 people online for you do start this mission",_playerCount]};

_action = [
	format ["This mission requires $%2 to begin and pays $%1 upon completion. It involves picking up drugs from a boat at sea and dropping it to another. Are you sure you wish to continue?",[_payment] call DS_fnc_numberText,[_startPrice] call DS_fnc_numberText],
	"Water Drugs Convoy",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action )exitwith{};
_action = [
	"If you at any point gain too much elevation during this mission (Such as flying) the mission will fail, you must only drive land vehicles and boats. Understand that any vehicle you enter while this mission is active can be destroyed by police",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
_action = [
	"You can not be inside of a vehicle with anybody else also doing a water convoy mission, you must have your own boat to continue",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
if([_startPrice,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $15k in your bank to begin this mission"};
[_startPrice,true,false] call DS_fnc_handleMoney;
DS_convoy = true;

player setVariable ["doingConvoy",true,true];

_markerLocation = (getMarkerPos (_infoArray select 0));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your drug pickup point to collect the drugs","Drug Pickup Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

[] spawn
	{
	sleep (random 600) + 900;
	["483"] spawn DS_fnc_addCharge;
	};

hint "You must travel to the drug pick up point in the ocean to collect the product - Remember no flying!";
systemchat "You must travel to the drug pick up point in the ocean to collect the product - Remember no flying!";

DS_currentTask1 = "Drug Convoy Captain - Phase One";
DS_currentTask2 = "You must drive (Land vehicles and Boats) to your marked pickup point in the ocean, once there remain in place while your boat is filled with drugs";

_failCounter = 0;
_warn = false;

while{true}do
	{
	_crew = (crew (vehicle player));
	{
		if((_x != player)&&(_x getVariable ["doingConvoy",false]))then
			{
			_warn = true;
			};
	}forEach _crew;
	if(_warn)then
		{
		player say3D "fail";
		hint "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		systemchat "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		_failCounter = _failCounter + 1;
		};
	if(_failCounter > 5)exitWith{_failed = true;};
	if(player distance _markerLocation < 25)exitwith{_failed = false;};
	if ((getPos (player) select 2) > 20) exitwith {_failed = true};
	if((!alive player)||(player distance spawnIsland < 250))exitwith{_failed = true;};
	if((vehicle player) isKindOf "Ship")then{(vehicle player) setVariable ["convoy_truck",true,true];};
	sleep 10;
	};

player removeSimpleTask DS_convoyTask;

if(_failed)exitwith
	{
	player setVariable ["doingConvoy",false,true];
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	};

player say3D "dingDong";
hint "You have filled your boat with drugs, you must now drop them off at the drop point marked on your map";
systemchat "You have filled your boat with drugs, you must now drop them off at the drop point marked on your map";

DS_currentTask1 = "Drug Convoy Captain - Final Phase";
DS_currentTask2 = "You must drive your (Land vehicles and Boats) to the marked area in the ocean to deliver your drugs and receive payment.";

_markerLocation = (getMarkerPos (_infoArray select 1));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your drug drop off point to deliver the drugs","Drug Drop Off Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

_failCounter = 0;
_warn = false;

while{true}do
	{
	_crew = (crew (vehicle player));
	{
		if((_x != player)&&(_x getVariable ["doingConvoy",false]))then
			{
			_warn = true;
			};
	}forEach _crew;
	if(_warn)then
		{
		player say3D "fail";
		hint "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		systemchat "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		_failCounter = _failCounter + 1;
		};
	if(_failCounter > 5)exitWith{_failed = true;};
	sleep 10;
	if(player distance _markerLocation < 25)exitwith{_failed = false;};
	if ((getPos (player) select 2) > 20) then {_failed = true;};
	};

player removeSimpleTask DS_convoyTask;

if(_failed)exitwith
	{
	player setVariable ["doingConvoy",false,true];
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	};
player say3D "success";

hint format ["You have dropped of the drugs at this area and been paid $%1",_payment];
systemchat format ["You have dropped of the drugs at this area and been paid $%1",_payment];
[_payment,false,true] call DS_fnc_handleMoney;
//[] call DS_fnc_compileData;

player removeSimpleTask DS_convoyTask;
[25,false] spawn DS_fnc_moralAlter;
DS_convoy = false;
DS_currentTask1 = "";

sleep 5;

_amount = [] call DS_fnc_getCopScore;
_amount = (_amount*10000);
[_amount] spawn DS_civ_payGangAccount;

if(DS_tokenMission == 11)then
	{
	DS_tokenMission = -1;
	[100,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};