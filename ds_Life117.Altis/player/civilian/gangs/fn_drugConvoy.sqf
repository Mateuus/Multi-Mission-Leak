/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Gang area drug convoys
*/
private["_infoArray","_playerCount","_randomSpawn","_vehArray","_randomVeh","_veh","_vehicle","_failed","_markerojb"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};

switch(true)do
	{
	case (player distance (getMarkerPos "gang_area_2") < 100): {_infoArray = ["gang_area_3_1"]};
	case (player distance (getMarkerPos "gang_area_3_1") < 100): {_infoArray = ["gang_area_2_1"]};
	case (player distance (getMarkerPos "gang_area_2_1") < 100): {_infoArray = ["gang_area_2"]};
	};

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

_randomSpawn =
[
getmarkerpos "methExplosion_1",getmarkerpos "g_2_1",getmarkerpos "convoyMarker1",getmarkerpos "convoyMarker2",
getmarkerpos "convoyMarker3",getmarkerpos "convoyMarker4",getmarkerpos "convoyMarker5"
];	
	
_action = [
		"This mission requires $15k to begin and pays $250k upon completion. It involves driving into the Rebel Area, Are you sure you wish to continue?",
		"Drugs Convoy",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action )exitwith{};
_action = [
		format ["Air Lifting your convoy will cause it to blow up, Understand?",[(_endPoint select 2)] call DS_fnc_numberText,[_endPoint select 3] call DS_fnc_numberText,_endPoint select 1],
		"Warning",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};	
if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point"};
if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
if([15000,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $15k in your bank to begin this mission"};
[15000,true,false] call DS_fnc_handleMoney;
DS_convoy = true;	

deleteMarkerLocal "convoymarker";
_newmarker = (floor(random(count _randomSpawn)));
_markerlocation = (_randomSpawn select _newmarker);
_markerobj = createmarkerlocal ["convoymarker",[0,0]];
_markername = "convoymarker";
"convoymarker" setmarkertypelocal "hd_warning";
"convoymarker" setmarkercolorlocal "colorblack";
"convoymarker" setmarkersizelocal [1, 1];
"convoymarker" setmarkertextlocal "Drug Pickup Point";
_markername Setmarkerposlocal _markerlocation;
[] spawn	
	{
	sleep (random 600) + 900;
	["483"] spawn DS_fnc_addCharge;
	};
_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];
_randomVeh = (floor(random(count _vehArray)));
_veh = (_vehArray select _randomVeh);
_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable["convoy_truck",true,true];
_vehicle lock 2;
DS_keyRing set[count DS_keyRing,_vehicle];
_vehicle setVariable["boot_open",true,true];
hint "You must travel to the drug pick up point in the Rebel Area to pick up your load of drugs";
systemchat "You must travel to the drug pick up point in the Rebel Area to pick up your load of drugs";
while{true}do
	{
	if(_vehicle distance _markerlocation < 25)exitwith{_failed = false;};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	sleep 10;
	};
	if(_failed)exitwith
	{
	DS_convoy = false;
	player say3D "fail";
	deleteMarkerLocal "convoymarker";
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	deleteVehicle _vehicle;
	};
player say3D "dingDong";	
hint "You have filled your truck with drugs, you must now drop them off at the gang area marked on your map";
systemchat "You have filled your truck with drugs, you must now drop them off at the gang area marked on your map";
_markerlocation = (getmarkerpos (_infoArray select 0));
deleteMarkerLocal "convoymarker";	
_markerobj = createmarkerlocal ["convoymarker",[0,0]];
_markername = "convoymarker";
"convoymarker" setmarkertypelocal "hd_warning";
"convoymarker" setmarkercolorlocal "colorblack";
"convoymarker" setmarkersizelocal [1, 1];
"convoymarker" setmarkertextlocal "Drug Drop Off Point";
_markername Setmarkerposlocal _markerlocation;

while{true}do
	{
	sleep 10;
	if(_vehicle distance _markerlocation < 25)exitwith{_failed = false;};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	};
	
if(_failed)exitwith
	{
	DS_convoy = false;
	player say3D "fail";
	deleteMarkerLocal "convoymarker";
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	deleteVehicle _vehicle;
	};
player say3D "success";

hint "You have dropped of the drugs at this area and been paid $250k";
systemchat "You have dropped of the drugs at this area and been paid $250k";
[250000,false,true] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;

deleteMarkerLocal "convoymarker";
[25,false] spawn DS_fnc_moralAlter;
sleep 5;
hint "The truck will now delete";
systemchat "The truck will now delete";
sleep 8;
deleteVehicle _vehicle;
DS_convoy = false;
if((DS_infoArray select 15) == 4)then
	{
	[1] call DS_fnc_questCompleted;
	};
if((DS_infoArray select 15) == 19)then
	{
	_tempNum = (DS_infoArray select 16) + 1;
	DS_infoArray set [16,_tempNum];
	if((DS_infoArray select 16) > 2)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};
