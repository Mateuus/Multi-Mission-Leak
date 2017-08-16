/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Starts truck driving jobs depending on trucking level
*/
private["_startCost","_fired","_speedWarning","_test","_curLevel","_typeStr","_type","_newmarker","_markerlocation","_lastLoc","_counter","_expectedTime","_pass","_payment","_sp","_randomVeh","_vehArray","_vehicle","_veh","_tempNum","_attachment","_vehAttachmentArray","_maxDistance","_minDistance","_attachment2","_attachment3","_attachment4","_attachment5","_attachment6"];

_curLevel = (DS_infoArray select 28);
_typeStr = "";
_type = 0;
_lastLoc = (position player);
_sp = (DS_spawnPoint select 0);
_pass = false;
_counter = 0;
_expectedTime = 0;
_speedWarning = 0;
_fired = false;

//if(DS_perkLevel < 1)exitwith{hint "This job is only for people with a perk level of 1 or more, get this by playing at least 50 hours on the server"};

_truckdeliveryarray  =
[
getmarkerpos "civ_gar_1_1_1_2_1_1",getmarkerpos "hospital_2_1",
getmarkerpos "oilp_1",getmarkerpos "f",
getmarkerpos "Gas1_1_1",getmarkerpos "bv_1_2_1_1_1",
getmarkerpos "Gas1_1",getmarkerpos "Gas1_1_1_1",
getmarkerpos "bv_1",getmarkerpos "airshop",
getmarkerpos "bv_1_2",getmarkerpos "Gas1_1_1_2",
getmarkerpos "car1_2_1_1",getmarkerpos "oilp_1_3_1_1",
getmarkerpos "Gas1_1_1_2_1",getmarkerpos "hospital_2",
getmarkerpos "powerMarker",getmarkerpos "kavTruck_1_1",
getmarkerpos "f_1",getmarkerpos "bv_1_1",
getmarkerpos "oilp_1_2",getmarkerpos "Gas1_1_1_2_1_1_1_1",
getmarkerpos "bv_1_1_1",getmarkerpos "civ_truck_5",
getmarkerpos "hospital_3",getmarkerpos "air_54",
getmarkerpos "salt"
];

if(isNil {DS_truckDriver})then{DS_truckDriver = false;};
if(DS_truckDriver) exitwith {hint "You already have a mission started, if you have only just completed one please wait 10 seconds before beginning a new one"};
DS_truckDriver = true;

switch(_curLevel)do
	{
	case 0:
		{
		_typeStr = "Small load, short distance";
		_type = 0;
		_minDistance = 100;
		_maxDistance = 3000;
		_vehArray = ["C_Offroad_01_F"];
		_vehAttachmentArray = ["Land_Portable_generator_F","Land_CargoBox_V1_F","Land_BarrelSand_F"];
		_expectedTime = 15;
		_payment = 7000;
		};
	case 1:
		{
		_typeStr = "Small load, medium";
		_type = 0;
		_minDistance = 3000;
		_maxDistance = 10000;
		_vehArray = ["C_Offroad_01_F"];
		_vehAttachmentArray = ["Land_Portable_generator_F","Land_CargoBox_V1_F","Land_BarrelSand_F"];
		_expectedTime = 45;
		_payment = 12000;
		};
	case 2:
		{
		_typeStr = "Medium load, short distance";
		_type = 0;
		_minDistance = 100;
		_maxDistance = 4000;
		_vehArray = ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"];
		_vehAttachmentArray = ["Land_Portable_generator_F","Land_CargoBox_V1_F","Land_BarrelSand_F","Land_GarbageContainer_closed_F","Land_BeachBooth_01_F"];
		_expectedTime = 20;
		_payment = 15000;
		};
	case 3:
		{
		_typeStr = "Medium load, Medium distance";
		_type = 0;
		_minDistance = 4000;
		_maxDistance = 10000;
		_vehArray = ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"];
		_vehAttachmentArray = ["Land_Portable_generator_F","Land_CargoBox_V1_F","Land_BarrelSand_F","Land_GarbageContainer_closed_F","Land_BeachBooth_01_F"];
		_expectedTime = 40;
		_payment = 20000;
		};
	case 4:
		{
		_typeStr = "Medium load, Long distance";
		_type = 0;
		_minDistance = 10000;
		_maxDistance = 20000;
		_vehArray = ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"];
		_vehAttachmentArray = ["Land_Portable_generator_F","Land_CargoBox_V1_F","Land_BarrelSand_F","Land_GarbageContainer_closed_F","Land_BeachBooth_01_F"];
		_expectedTime = 100;
		_payment = 25000;
		};
	case 5:
		{
		_typeStr = "Heavy load, Medium distance";
		_type = 0;
		_minDistance = 4000;
		_maxDistance = 12000;
		_vehArray = ["I_Truck_02_transport_F"];
		_vehAttachmentArray = ["Land_Device_assembled_F","Land_Carousel_01_F","Land_Atm_02_F","Land_CncShelter_F","Land_spp_Mirror_F","Land_PowLines_Transformer_F","Land_fs_price_F"];
		_expectedTime = 140;
		_payment = 30000;
		};
	case 6:
		{
		_typeStr = "Heavy load, Long distance";
		_type = 0;
		_minDistance = 10000;
		_maxDistance = 20000;
		_vehArray = ["I_Truck_02_transport_F"];
		_vehAttachmentArray = ["Land_Device_assembled_F","Land_Carousel_01_F","Land_Atm_02_F","Land_CncShelter_F","Land_spp_Mirror_F","Land_PowLines_Transformer_F","Land_fs_price_F"];
		_expectedTime = 220;
		_payment = 40000;
		};
	case 7:
		{
		_typeStr = "Fragile load, Medium distance";
		_type = 0;
		_minDistance = 5000;
		_maxDistance = 13000;
		_vehArray = ["B_Truck_01_transport_F"];
		_vehAttachmentArray = ["Land_Grave_V3_F","Land_Maroula_F","C_SUV_01_F","C_Van_01_box_F","B_Heli_Light_01_F"];
		_expectedTime = 140;
		_payment = 42000;
		};
	case 8:
		{
		_typeStr = "Fragile load, Long distance";
		_type = 0;
		_minDistance = 10000;
		_maxDistance = 25000;
		_vehArray = ["B_Truck_01_transport_F"];
		_vehAttachmentArray = ["Land_Grave_V3_F","Land_Maroula_F","C_SUV_01_F","C_Van_01_box_F","B_Heli_Light_01_F"];
		_expectedTime = 220;
		_payment = 50000;
		};
	case 9:
		{
		_typeStr = "Scrap Metal load, Short distance";
		_type = 0;
		_minDistance = 1000;
		_maxDistance = 4000;
		_vehArray = ["O_Truck_03_transport_F"];
		_vehAttachmentArray = ["Land_Scrap_MRAP_01_F","Land_Wreck_Van_F","Land_Wreck_Ural_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Plane_Fighter_03_wreck_F","Land_Wreck_Offroad_F"];
		_expectedTime = 30;
		_payment = 53000;
		};
	case 10:
		{
		_typeStr = "Scrap Metal load, Medium distance";
		_type = 0;
		_minDistance = 4000;
		_maxDistance = 12200;
		_vehArray = ["O_Truck_03_transport_F"];
		_vehAttachmentArray = ["Land_Scrap_MRAP_01_F","Land_Wreck_Van_F","Land_Wreck_Ural_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Plane_Fighter_03_wreck_F","Land_Wreck_Offroad_F"];
		_expectedTime = 80;
		_payment = 57000;
		};
	case 11:
		{
		_typeStr = "Scrap Metal load, Long distance";
		_type = 0;
		_minDistance = 12200;
		_maxDistance = 25000;
		_vehArray = ["O_Truck_03_transport_F"];
		_vehAttachmentArray = ["Land_Scrap_MRAP_01_F","Land_Wreck_Van_F","Land_Wreck_Ural_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Plane_Fighter_03_wreck_F","Land_Wreck_Offroad_F"];
		_expectedTime = 200;
		_payment = 65000;
		};
	case 12:
		{
		_typeStr = "Wide Load, Short distance";
		_type = 0;
		_minDistance = 1000;
		_maxDistance = 7000;
		_vehArray = ["B_Truck_01_mover_F"];
		_vehAttachmentArray = ["Land_Chapel_Small_V1_F","Land_dp_transformer_F","Land_FuelStation_Build_F","Land_fs_roof_F","Land_wpp_Turbine_V2_F","Land_Medevac_house_V1_F"];
		_expectedTime = 50;
		_payment = 70000;
		};
	case 13:
		{
		_typeStr = "Wide Load, Medium distance";
		_type = 0;
		_minDistance = 7000;
		_maxDistance = 14000;
		_vehArray = ["B_Truck_01_mover_F"];
		_vehAttachmentArray = ["Land_Chapel_Small_V1_F","Land_dp_transformer_F","Land_FuelStation_Build_F","Land_fs_roof_F","Land_wpp_Turbine_V2_F","Land_Medevac_house_V1_F"];
		_expectedTime = 150;
		_payment = 77000;
		};
	case 14:
		{
		_typeStr = "Wide Load, Long distance";
		_type = 0;
		_minDistance = 12000;
		_maxDistance = 25000;
		_vehArray = ["B_Truck_01_mover_F"];
		_vehAttachmentArray = ["Land_Chapel_Small_V1_F","Land_dp_transformer_F","Land_FuelStation_Build_F","Land_fs_roof_F","Land_wpp_Turbine_V2_F","Land_Medevac_house_V1_F"];
		_expectedTime = 260;
		_payment = 85000;
		};
	};

hint format ["You are currently at level %1, this means you will be doing %2 deliveries.",_curLevel,_typeStr];
systemchat format ["You are currently at level %1, this means you will be doing %2 deliveries.",_curLevel,_typeStr];

_action = [
	format ["Warning! VDMing people or damaging stuff with your trucks load will result in disciplinary action by the admins. You have to complete %1 more jobs to be promoted",(((DS_infoArray select 27)-6)*-1)],
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{DS_truckDriver = false;};
_startCost = (round(_payment/5));
if((DS_infoArray select 13) < 29)then
	{
	_action = [
		format ["This mission cost $%1 to begin. You have to complete %2 more jobs to be promoted",[_startCost] call DS_fnc_numberText,(((DS_infoArray select 27)-6)*-1)],
		"Warning!",
		"Pay",
		"No Thanks"
	] call BIS_fnc_guiMessage;
	};
if(((DS_infoArray select 13) < 29)&&(!_action))exitwith{DS_truckDriver = false;};

//Spawn in Vehicle
			if(count(nearestObjects[(getMarkerPos _sp),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";DS_truckDriver = false;};
			if([_startCost,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to begin this mission";DS_truckDriver = false;};
			[_startCost,true,false] call DS_fnc_handleMoney;
			_randomVeh = (floor(random(count _vehArray)));
			_veh = (_vehArray select _randomVeh);
			_vehicle = createVehicle [_veh, (getMarkerPos _sp), [], 0, "NONE"];
			waitUntil {!isNil "_vehicle"};
			_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
			_vehicle lock 2;
			clearWeaponCargoGlobal _vehicle;
			clearMagazineCargoGlobal _vehicle;
			clearItemCargoGlobal _vehicle;
			DS_keyRing pushBack _vehicle;
			_vehicle setVariable["boot_open",true,true];
			//Spawn in attachment
			if(typeOf _vehicle in ["C_Offroad_01_F","C_Van_01_transport_F"])then
				{
				_randomVeh = (floor(random(count _vehAttachmentArray)));
				_veh = (_vehAttachmentArray select _randomVeh);
				_attachment = _veh createVehicle [0,0,0];
				_attachment attachTo[_vehicle,[0,-1.8,-0.2]]; 
				};
			if(typeOf _vehicle in ["I_Truck_02_transport_F"]) then
				{
				_randomVeh = (floor(random(count _vehAttachmentArray)));
				_veh = (_vehAttachmentArray select _randomVeh);
				_attachment = _veh createVehicle [0,0,0];
				_attachment attachTo[_vehicle,[0,-1.3,0.5]]; 
				};
			if(typeOf _vehicle in ["B_Truck_01_transport_F"]) then
				{
				_randomVeh = (floor(random(count _vehAttachmentArray)));
				_veh = (_vehAttachmentArray select _randomVeh);
				_attachment = _veh createVehicle [0,0,0];
				_attachment attachTo[_vehicle,[0,-1.3,1.3]]; 
				};
			if(typeOf _vehicle in ["O_Truck_03_transport_F"])then
				{
				_randomVeh = (floor(random(count _vehAttachmentArray)));
				_veh = (_vehAttachmentArray select _randomVeh);
				_attachment = _veh createVehicle [0,0,0];
				_attachment attachTo[_vehicle,[0,-2.3,1.1]]; 
				};
			if(typeOf _vehicle in ["B_Truck_01_mover_F"])then
				{
				_attachment = "Land_Cargo40_cyan_F" createVehicle [0,0,0];
				_attachment attachTo[_vehicle,[2.5,-7.7,0.8]];
				_attachment setDir 90;

				_attachment2 = "Land_Cargo40_cyan_F" createVehicle [0,0,0];
				_attachment2 attachTo[_vehicle,[-2.5,-7.7,0.8]];
				_attachment2 setDir 90;

				_attachment3 = "Land_Cargo40_cyan_F" createVehicle [0,0,0];
				_attachment3 attachTo[_vehicle,[0,-7.7,0.8]];
				_attachment3 setDir 90;

				_randomVeh = (floor(random(count _vehAttachmentArray)));
				_veh = (_vehAttachmentArray select _randomVeh);
				
				_attachment4 = _veh createVehicle [0,0,0];
				_attachment4 attachTo[_vehicle,[0,-5.7,3.8]];
				_attachment4 setDir 90;

				_attachment5 = "B_UGV_01_F" createVehicle [0,0,0];
				_attachment5 attachTo[_vehicle,[2.0,-10.7,0.2]];

				_attachment6 = "B_UGV_01_F" createVehicle [0,0,0];
				_attachment6 attachTo[_vehicle,[-2.5,-10.7,0.2]];
				
				_attachment2 setVariable["truckerJunk",true,true];
				_attachment2 lock 2;
				_attachment2 setVariable["trunk_in_use",true,true];
				_attachment3 setVariable["truckerJunk",true,true];
				_attachment3 lock 2;
				_attachment3 setVariable["trunk_in_use",true,true];
				_attachment4 setVariable["truckerJunk",true,true];
				_attachment4 lock 2;
				_attachment4 setVariable["trunk_in_use",true,true];
				_attachment5 setVariable["truckerJunk",true,true];
				_attachment5 lock 2;
				_attachment5 setVariable["trunk_in_use",true,true];
				_attachment6 setVariable["truckerJunk",true,true];
				_attachment6 lock 2;
				_attachment6 setVariable["trunk_in_use",true,true];
				};
			_attachment setVariable["truckerJunk",true,true];
			_attachment lock 2;
			_attachment setVariable["trunk_in_use",true,true];
			
		//Create finish point and marker
		_newmarker = (floor(random(count _truckdeliveryarray)));
		_markerlocation = (_truckdeliveryarray select _newmarker);
			//Pick a new marker if it is too far away for this level
			while{((_lastLoc distance _markerlocation > _maxDistance)||(_lastLoc distance _markerlocation < _minDistance))} do
			{
			_newmarker = (floor(random(count _truckdeliveryarray)));
			_markerlocation = (_truckdeliveryarray select _newmarker);
			};
		_currentpoint = _markerlocation;
		_markerobj = createmarkerlocal ["truckdeliverymarker",[0,0]];
		_markername = "truckdeliverymarker";
		_markerobj setmarkershapelocal "Icon";
		//"patrolmarker" setMarkerBrushLocal "solid";
		"truckdeliverymarker" setmarkertypelocal "hd_warning";
		"truckdeliverymarker" setmarkercolorlocal "colorblack";
		"truckdeliverymarker" setmarkersizelocal [1, 1];
		"truckdeliverymarker" setmarkertextlocal "Cargo Delivery";
		_markername Setmarkerposlocal _markerlocation;

		sleep 5;
		systemchat "Your delivery point has been marked on your map, the speed in which you deliver will affect your payment";
		hint "Your delivery point has been marked on your map, the speed in which you deliver will affect your payment";
		
		while{true}do
			{
			if(((_vehicle distance g51 < 500)||(_vehicle distance hosp1_1_3_1_1 < 500)||(_vehicle distance kavAtm_1_2_1 < 500)||(_vehicle distance kavAtm_1_2_1_1 < 500))&&(speed (_vehicle) > 60)&&(_curLevel > 11))then{_speedWarning = _speedWarning + 1;systemchat "You are driving too fast through a town, slow down or risk being fired!";hint "You are driving too fast through a town, slow down or risk being fired!";player say3D "dingDong";titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];};
			if(_speedWarning > 3)exitwith{_fired = true;};
			if(_vehicle distance _markerlocation < 20) then {hint "Remain here for 30 seconds while the cargo is unloaded";sleep 30;};
			if(_vehicle distance _markerlocation < 20)exitwith{_pass = true;};
			if(!alive _vehicle)exitwith{_pass = false;};
			if((getPos (_vehicle) select 2) > 10)then{_vehicle setDamage 1;};
			sleep 10;
			_counter = _counter + 1;
			};
			
		if(_fired)exitWith	
			{
			player say3D "fail";
			titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
			hint "You have been fired from your job for driving too fast with a wide load on";
			systemchat "You have been fired from your job for driving too fast with a wide load on";
			sleep 10;
			titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
			hint "Pull over and exit your vehicle, it will delete in 10 seconds";
			systemchat "Pull over and exit your vehicle, it will delete in 10 seconds";
			{	
			  deleteVehicle _x;
			} forEach attachedObjects _vehicle;
			sleep 10;
			titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
			deleteVehicle _vehicle;
			_tempNum = (DS_infoArray select 27);
			if(_tempNum > 0)then{_tempNum = _tempNum - 1;};
			DS_infoArray set [27,_tempNum];
			[] call DS_fnc_compileData;
			};
			
		if(!_pass)exitwith
			{
			deleteVehicle _attachment;
			hint "Your delivery job has been cancelled because the cargo was destroyed";
			systemchat "Your delivery job has been cancelled because the cargo was destroyed";
			DS_truckDriver = false;
			_tempNum = (DS_infoArray select 27);
			if(_tempNum > 0)then{_tempNum = _tempNum - 1;};
			DS_infoArray set [27,_tempNum];
			[] call DS_fnc_compileData;
			};
		//deleteVehicle _attachment;
			{	
			  deleteVehicle _x;
			} forEach attachedObjects _vehicle;
			//deleteVehicle _vehicle;
		deleteMarkerLocal "truckdeliverymarker";
		player say3D "dingDong";
		systemchat "Delivery complete, payment is paid once you return the delivery vehicle to any depot";
		hint "Delivery complete, payment is paid once you return the delivery vehicle to any depot";
		
		while{true}do
			{
			if(_vehicle distance (getMarkerPos "jobs1_3") < 20)exitwith{_pass = true;};
			if(_vehicle distance (getMarkerPos "jobs1_2") < 20)exitwith{_pass = true;};
			if(_vehicle distance (getMarkerPos "jobs1") < 20)exitwith{_pass = true;};
			if(_vehicle distance (getMarkerPos "jobs1_1") < 20)exitwith{_pass = true;};
			if(!alive _vehicle)exitwith{_pass = false;};
			sleep 10;
			};
			
		
		if(!_pass) exitwith {DS_truckDriver = false;};
		[100,true] spawn DS_fnc_moralAlter;
		if(_counter > _expectedTime)then
			{
			systemchat format ["you have completed your delivery and returned the vehicle. A payment of $%1 has been deposited into your bank account",[_payment] call DS_fnc_numberText];
			hint format ["you have completed your delivery and returned the vehicle. A payment of $%1 has been deposited into your bank account",[_payment] call DS_fnc_numberText];
			_tempNum = (DS_infoArray select 27) + 1;
			DS_infoArray set [27,_tempNum];
			[_payment,true,true] call DS_fnc_handleMoney;
			}
			else
			{
			systemchat format ["You have completed your delivery and returned the vehicle faster than expected. A payment of $%1 and a speed bonus of $%2 has been deposited into your bank account",[_payment] call DS_fnc_numberText,[(round(_payment/2))] call DS_fnc_numberText];
			hint format ["You have completed your delivery and returned the vehicle faster than expected. A payment of $%1 and a speed bonus of $%2 has been deposited into your bank account",[_payment] call DS_fnc_numberText,[(round(_payment/2))] call DS_fnc_numberText];
			_tempNum = (DS_infoArray select 27) + 1;
			DS_infoArray set [27,_tempNum];
			[_payment,true,true] call DS_fnc_handleMoney;
			[(_payment/2),true,true] call DS_fnc_handleMoney;
			};
			
		sleep 10;	
		_tempNum = (DS_infoArray select 28) + 1;
		if(_tempNum > 14)exitWith	
			{
			hint "Good job, you have reached the current max level for this job, you can continue to do this level until new levels are created";
			systemchat "Good job, you have reached the current max level for this job, you can continue to do this level until new levels are created";
			[] call DS_fnc_compileData;
			DS_truckDriver = false;
			deleteVehicle _vehicle;
			if((DS_infoArray select 13) == 31)then
				{
				[0] call DS_fnc_questCompleted;
				};
			};
		
		_tempNum = (DS_infoArray select 27);
		if(_tempNum > 5)then
			{
			player say3D "success";
			_tempNum = (DS_infoArray select 28) + 1;
			DS_infoArray set [28,_tempNum];
			hint format ["You have been promoted to a level %1 trucker, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 28),[((DS_infoArray select 28)*18000)] call DS_fnc_numberText];
			systemchat format ["You have been promoted to a level %1 trucker, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 28),[((DS_infoArray select 28)*18000)] call DS_fnc_numberText];
			DS_infoArray set [27,0];
			_tempNum = ((DS_infoArray select 28)*18000);
			[_tempNum,true,true] call DS_fnc_handleMoney;
			if((DS_infoArray select 13) == 15)then
				{
				[0] call DS_fnc_questCompleted;
				};
			if((DS_infoArray select 13) == 28)then
				{
				_tempNum = (DS_infoArray select 14) + 1;
				DS_infoArray set [14,_tempNum];
				if((DS_infoArray select 14) > 1)then
					{
					[0] call DS_fnc_questCompleted;
					};
				};
			};
		[] call DS_fnc_compileData;
		DS_truckDriver = false;
		deleteVehicle _vehicle;
