/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Runs police patrol script
*/

private ["_payment","_distance","_markername","_markerobj","_startLoc","_markerArray","_newmarker","_markerlocation"];

if(DS_copPatrol)exitwith{hint "You already have a patrol active"};
DS_copPatrol = true;	
_markerArray = [getmarkerpos "bv",getmarkerpos "f",getmarkerpos "bv_1_2_1_1_1_1",getmarkerpos "g_1",getmarkerpos "Gas1",getmarkerpos "Police CP_1_1_1",getmarkerpos "Gas1_1",getmarkerpos "Gas1_1_1_1",getmarkerpos "Gas1_1_1",
				getmarkerpos "oilp_1_3_1",getmarkerpos "bv_1_2_2",getmarkerpos "boat_2_1",getmarkerpos "civ_gar_1_1",getmarkerpos "powerMarker",getmarkerpos "Gas1_1_1_2",getmarkerpos "f_1_1_1",getmarkerpos "Gas1_1_1_1",getmarkerpos "g",
				getmarkerpos "bankDoor",getmarkerpos "gun_store_1_1",getmarkerpos "Police CP_1_1_1_1",getmarkerpos "hospital_2",getmarkerpos "gt_1",getmarkerpos "jailInfo_1",getmarkerpos "Gas1_1_1_2_1_1",getmarkerpos "Gas1_1_1_2_1_1_1",getmarkerpos "Gas1_1_1_2_1_1_1_1",
				getmarkerpos "bankDoor",getmarkerpos "Police CP_1_1",getmarkerpos "carbomb6",getmarkerpos "con1",getmarkerpos "Gas1_1_1_2_1_1_1_1_1",getmarkerpos "gun_store_1_1_1",getmarkerpos "civ_gar_1_1_1",getmarkerpos "hospital_3",getmarkerpos "rock_1"];
_startLoc = getPos player;
_distance = 0;

_randomEvent =
	{
	//Random event every other waypoint
	//TODO
	};

while{true}do
	{
	_newmarker = (floor(random(count _markerArray)));
	_markerlocation = (_markerArray select _newmarker);	
	while{((_startLoc distance _markerlocation < 1000)||(_startLoc distance _markerlocation > 5000))}do
		{
		_newmarker = (floor(random(count _markerArray)));
		_markerlocation = (_markerArray select _newmarker);	
		};
	_startLoc = _markerlocation;
	deleteMarkerLocal "patrolmarker";
	_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
	_markername = "patrolmarker";
	_markerobj setmarkershapelocal "Icon";
	"patrolmarker" setmarkertypelocal "hd_warning";
	"patrolmarker" setmarkercolorlocal "colorblack";
	"patrolmarker" setmarkersizelocal [1, 1];
	"patrolmarker" setmarkertextlocal "Patrol point";
	_markername Setmarkerposlocal _markerlocation;	

	systemchat "Your patrol point has been added to your map";
	hint "Your patrol point has been added to your map";
	_distance = (player distance _markerlocation);
	while{true}do
		{
		if(player distance _markerlocation < 20)exitwith{};
		sleep 10;
		};
	
	_payment = _distance*1.5;
	if((DS_infoArray select 21) > 17)then{_payment = round(_payment*1.5);};
	systemchat format ["You have been paid $%1 for patrolling. Your next patrol point will be added shortly",[_payment] call DS_fnc_numberText];
	hint format ["You have been paid $%1 for patrolling. Your next patrol point will be added shortly",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	sleep 10;
	if((DS_infoArray select 21) == 17)then
		{
		_tempNum = DS_infoArray select 22;
		_tempNum = _tempNum + 1;
		DS_infoArray set [22,_tempNum];
		if((DS_infoArray select 22) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 21) == 23)then
		{
		_tempNum = DS_infoArray select 22;
		_tempNum = _tempNum + 1;
		DS_infoArray set [22,_tempNum];
		if((DS_infoArray select 22) > 49)then
			{
			[3] call DS_fnc_questCompleted;
			[[(getPlayerUID player),west,"Car","C_SUV_01_F",true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
			};
		};
	};
