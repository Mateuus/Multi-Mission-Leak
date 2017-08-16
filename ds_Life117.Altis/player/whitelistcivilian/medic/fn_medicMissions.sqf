/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Mechanic Missions
*/
private["_payment","_currentJob","_currentMissionText","_sleep","_infoArray","_playerCount","_randomSpawn","_vehArray","_randomVeh","_veh","_vehicle","_failed","_markerojb","_fail"];
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
if(DS_fuelMission)exitwith{hint "You already have a mission active";};
DS_fuelMission = true;
_fail = false;

_randomSpawn =
[
getmarkerpos "mechMission1",getmarkerpos "mechMission2",getmarkerpos "mechMission3",getmarkerpos "mechMission4",
getmarkerpos "mechMission5",getmarkerpos "mechMission6",getmarkerpos "mechMission7",getmarkerpos "mechMission8",
getmarkerpos "mechMission9",getmarkerpos "mechMission10",getmarkerpos "mechMission11",getmarkerpos "mechMission12",
getmarkerpos "mechMission13",getmarkerpos "mechMission14",getmarkerpos "mechMission15",getmarkerpos "mechMission16",
getmarkerpos "mechMission17",getmarkerpos "mechMission18",getmarkerpos "mechMission19",getmarkerpos "mechMission20",
getmarkerpos "mechMission21",getmarkerpos "mechMission22",getmarkerpos "mechMission23",getmarkerpos "civ_gar_1_1_1_2_1_1",
getmarkerpos "p26",getmarkerpos "carbomb2",getmarkerpos "p44",getmarkerpos "camTest1",
getmarkerpos "s39",getmarkerpos "gfdgdc"
];	

if((DS_infoArray select 10) < 11)then
	{
	_currentJob = "Quickly travel to a nearby area and remove the human remains found there";
	_vehArray = ["Land_HumanSkeleton_F"];
	_currentMissionText = "You are nearby your job, simply search around the marked area for the human remains and clean them up as per normal";
	_sleep = 1;
	_payment = 25000;
	};
	
if(((DS_infoArray select 10) > 10)&&((DS_infoArray select 10) < 21))then
	{
	_currentJob = "Pick up a patient and take him to hospital (You must be in a ambulance truck)";
	_vehArray = ["C_man_shorts_1_F_euro","C_man_p_beggar_F_afro","C_man_polo_4_F_afro","C_Driver_1_white_F","C_man_1_1_F","C_man_polo_2_F_asia","C_man_polo_6_F","C_scientist_F"];
	_currentMissionText = "You are nearby the victim, simply search around the marked area for him and he will enter your vehicle";
	_sleep = 1;
	_payment = 50000;
	};
	
if(((DS_infoArray select 10) > 20)&&((DS_infoArray select 10) < 29))then
	{
	_currentJob = "Travel to a crash site marked on your map and clean up any remains you see";
	_vehArray = ["I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"];
	_currentMissionText = "You are nearby the crash site, clean up the human remains found nearby";
	_sleep = 1;
	_payment = 75000;
	};
	
if((DS_infoArray select 10) > 28)then
	{
	_currentJob = "Travel to the crash site marked on your map of a vehicle carrying highly poisonous gas ";
	_vehArray = ["I_Truck_02_transport_F","B_Truck_01_fuel_F","O_Truck_03_repair_F","B_Truck_01_box_F","I_Truck_02_covered_F"];
	_currentMissionText = "You are nearby the crash site, Keep people clear for the next 10 minutes, they will get hurt if they come too close";
	_sleep = 1;
	_payment = 125000;
	};

_action = [
		format ["You current job will be to %1",_currentJob],
		"Accept Job",
		"Accept",
		"Decline"
	] call BIS_fnc_guiMessage;
if(!_action )exitwith{};

hint "Your job has been marked on your map";
systemchat "Your job has been marked on your map";

_newmarker = (floor(random(count _randomSpawn)));
_markerlocation = (_randomSpawn select _newmarker);	
while{(player distance _markerlocation > 7000)}do
	{
	_newmarker = (floor(random(count _randomSpawn)));
	_markerlocation = (_randomSpawn select _newmarker);	
	};
deleteMarkerLocal "patrolmarker";
_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
_markername = "patrolmarker";
_markerobj setmarkershapelocal "Icon";
"patrolmarker" setmarkertypelocal "hd_warning";
"patrolmarker" setmarkercolorlocal "colorblack";
"patrolmarker" setmarkersizelocal [1, 1];
"patrolmarker" setmarkertextlocal "Current Medic Mission";
_markername Setmarkerposlocal _markerlocation;	

while{true}do
	{
	if((((DS_infoArray select 10) > 20)&&((DS_infoArray select 10) < 29))&&(player distance _markerlocation < 400))exitwith{};
	if(player distance _markerlocation < 100)exitwith{};
	sleep 5;
	};
	
_randomVeh = (floor(random(count _vehArray)));
_veh = (_vehArray select _randomVeh);	

if(((DS_infoArray select 10) > 20)&&((DS_infoArray select 10) < 29))then
	{
	while{true}do
		{
		if(count(nearestObjects[_markerlocation,["Car","Ship","Air"],50]) != 0)then{hint "There is a vehicle or person blocking your missions vehicle from spawning, 50m around the marker must be clear"};
		if(count(nearestObjects[_markerlocation,["Car","Ship","Air"],48]) == 0)exitwith{};
		sleep 5;
		};
	};

_vehicle = createVehicle [_veh, _markerlocation, [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable ["medicMission1",true,true];

player say3D "dingDong";	
hint format ["%1",_currentMissionText];
systemchat format ["%1",_currentMissionText];

if((DS_infoArray select 10) > 28)then
	{
	deleteMarkerLocal "patrolmarker";
	_vehicle setVectorUp [0,0,-30];
	_vehicle setDamage 0.9;
	_vehicle setHitPointDamage["HitLFWheel",1];  
	_vehicle setHitPointDamage["HitLF2Wheel",1];  
	_vehicle setHitPointDamage["HitRFWheel",1];
	_vehicle allowDamage false;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	
	_counter = 600;
	
	while{true}do
		{
		_smoke = "SmokeShellGreen" createVehicle getPos _vehicle;
		sleep 10;
		{
		if((!(_x getVariable ["medic",false]))&&(_x distance _vehicle < 100))then
			{
			[[],"DS_fnc_areaDamage",_x,false] spawn BIS_fnc_MP;
			};
		}forEach playableUnits;
		sleep 50;
		_counter = _counter - 60;
		if(_counter == 0)exitwith{};
		if(player distance _vehicle > 250)exitwith{hint "You went too far from the crash scene";_fail = true;};
		hint format ["The area will be safe again in roughly %1 seconds",_counter];
		};
	
	player say3D "success";	
	hint format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	DS_medicMission = false;
	DS_fuelMission = false;
	deleteVehicle _vehicle;
	if((DS_infoArray select 10) == 29)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	_fail = true;
	};	
if(_fail)exitwith{};

if(((DS_infoArray select 10) > 20)&&((DS_infoArray select 10) < 29))then
	{
	deleteMarkerLocal "patrolmarker";	
	_vehicle setDamage 1;
	_sp = [(getpos _vehicle select 0) + 10, (getpos _vehicle select 1) + 6, getpos _vehicle select 2];
	_sp1 = [(getpos _vehicle select 0) + 14, (getpos _vehicle select 1) + 10, getpos _vehicle select 2];
	_sp2 = [(getpos _vehicle select 0) - 3, (getpos _vehicle select 1) - 12, getpos _vehicle select 2];
	_remains1 = createVehicle ["Land_HumanSkeleton_F", _sp, [], 0, "NONE"];
	_remains2 = createVehicle ["Land_HumanSkeleton_F", _sp1, [], 0, "NONE"];
	_remains3 = createVehicle ["Land_HumanSkeleton_F", _sp2, [], 0, "NONE"];
	_remains1 setVariable ["medicMission1",true,true];
	_remains2 setVariable ["medicMission1",true,true];
	_remains3 setVariable ["medicMission1",true,true];
	waitUntil{DS_medicMission};
	player say3D "success";	
	hint format ["You job has been completed, you have been paid $%1. Remember to pick up any remaining remains as well",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1. Remember to pick up any remaining remains as well",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	DS_medicMission = false;
	DS_fuelMission = false;
	if((DS_infoArray select 10) == 26)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	_fail = true;
	};
if(_fail)exitwith{};

if(((DS_infoArray select 10) > 10)&&((DS_infoArray select 10) < 21))then
	{
	doStop _vehicle;
	_vehicle setDamage 0.9;
	_vehicle allowDamage false;
	while{true}do
		{
		if(((player distance _vehicle) < 10)&&(typeOf (vehicle player) == "C_Van_01_box_F"))exitwith{};
		hint "Get close to the victim and he will enter your truck";
		if(typeOf (vehicle player) != "C_Van_01_box_F")then{hint "You must be in an ambulance truck to pick up the victim";};
		sleep 10;
		};
	deleteVehicle _vehicle;
	_vehicle = (vehicle player);
	hint "The victim is in your ambulance, now rush to the nearest hospital and drop him off";
	systemchat "The victim is in your ambulance, now rush to the nearest hospital and drop him off";
	deleteMarkerLocal "patrolmarker";
	while{true}do
		{
		if((player distance hosp2 < 50)||(player distance hosp1 < 50)||(player distance hosp1_2 < 50))exitwith{};
		if(!alive player)exitwith{_fail = true;};
		if(!alive _vehicle)exitwith{_fail = true;};
		sleep 10;
		};
	if(_fail)exitwith{};	
	DS_medicMission = false;
	DS_fuelMission = false;
	player say3D "success";	
	hint format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 10) == 20)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	_fail = true;
	};
if(_fail)exitwith{};

waitUntil{DS_medicMission};

deleteMarkerLocal "patrolmarker";	
DS_medicMission = false;
DS_fuelMission = false;

if((DS_infoArray select 10) < 11)exitWith
	{
	player say3D "success";	
	hint format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1.",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 10) == 10)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	};

	/*
	
_vehicle setVariable ["mechanicMission",false,true];
_position = (position _vehicle);

disableSerialization;
_title = "Working On Vehicle";
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;
_fail = false;
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
	if(player distance _vehicle > 70) exitwith {};
	if(_cP >= 1 OR !alive player) exitWith {};
	if(!alive _vehicle)exitwith{};
	if(_vehicle distance _position > 20)exitwith{};
	};
	
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{_fail = true;};
if(player distance _vehicle > 70) then {hint "You moved too far from the vehicle so your mission was cancelled";_fail = true;};
if(!alive _vehicle) then {hint "The vehicle you were meant to fix has been destroyed, therefore you have failed your job";_fail = true;};
if(_vehicle distance _position > 20) then {hint "The vehicle you were meant to fix has been moved further damaging it, therefore you have failed your job";_fail = true;};

if(!_fail)then
	{
	player say3D "success";	
	hint format ["You job has been completed, you have been paid $%1. The vehicle will be impounded shortly",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1. The vehicle will be impounded shortly",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 23) == 19)then
		{
		_tempNum = DS_infoArray select 24;
		_tempNum = _tempNum + 1;
		DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 24) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 23) == 20)then
		{
		_tempNum = DS_infoArray select 24;
		_tempNum = _tempNum + 1;
		DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 24) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 23) == 21)then
		{
		_tempNum = DS_infoArray select 24;
		_tempNum = _tempNum + 1;
		DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 24) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 23) == 22)then
		{
		_tempNum = DS_infoArray select 24;
		_tempNum = _tempNum + 1;
		DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 24) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	};
	
sleep 5;
deleteVehicle _vehicle;
deleteMarkerLocal "patrolmarker";	
DS_mechanicMission = false;
DS_fuelMission = false;

*/
