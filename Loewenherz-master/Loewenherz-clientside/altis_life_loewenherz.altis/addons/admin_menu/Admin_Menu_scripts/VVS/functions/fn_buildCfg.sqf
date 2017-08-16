/*
	File: fn_buildCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Builds our configuration arrays for vehicles to display.
	
	0: classname
	1: scope
	2: picture
	3: displayname
	4: vehicleclass
	5: side
	6: faction

	edited by [TF]def 2015 09 20 (0.4.1)
*/
_Cfg = configFile >> "CfgVehicles";

//Setup our final arrays.
VVS_pre_Car = [];
VVS_pre_Air = [];
VVS_pre_Ship = [];
VVS_pre_Armored = [];
VVS_pre_Autonomous = [];
VVS_pre_Support = [];

//Skim over and make sure VVS_x isn't built for a pre-made vehicle list.
if(count VVS_Car > 0) then {VVS_pre_Car = VVS_Car;};
// def 2015 09 19>
if(count VVS_Air > 0) then {VVS_pre_Air = VVS_Air;};
if(count VVS_Ship > 0) then {VVS_pre_Ship = VVS_Ship;};
// def 2015 09 20>
// <def 2015 09 20
if(count VVS_Armored > 0) then {VVS_pre_Armored = VVS_Armored;};
// <def 2015 09 19
if(count VVS_Autonomous > 0) then {VVS_pre_Autonomous = VVS_Autonomous;};
if(count VVS_Support > 0) then {VVS_pre_Support = VVS_Support;};

if(VVS_Premade_List) exitWith {}; //No need to waste CPU processing time as the mission designer already setup a list.

for "_i" from 0 to (count _Cfg)-1 do
{
	_class = _Cfg select _i;
	if(isClass _class) then
	{
		_className = configName _class;
		if(_className != "") then
		{
		//	systemChat _className;
			_cfgInfo = [_className] call VVS_fnc_cfgInfo;
			//systemChat str(_cfgInfo);
			if(count _cfgInfo > 0) then
			{
				_scope = _cfgInfo select 1;
				_picture = _cfgInfo select 2;
				_displayName = _cfgInfo select 3;
				_vehicleClass = _cfgInfo select 4;
				_side = _cfgInfo select 5;	
				_superClass = _cfgInfo select 7;    

// 1) ADD YOUR OWN VEHICLE CLASS AT THE END OF CLASSES ARRAY ON THE NEXT STRING:
				if(_scope >= 2 && _picture != "" && _displayName != "" && _vehicleClass in ["Car","Ship","Air","Armored","Submarine","Autonomous","Support","rhs_vehclass_apc","rhs_vehclass_ifv","rhs_vehclass_car","rhs_vehclass_truck","rhs_vehclass_tank","rhs_vehclass_artillery","rhs_vehclass_radar","rhs_vehclass_targeting","rhs_vehclass_launcher","rhs_vehclass_aircraft","rhs_vehclass_helicopter","rhs_vehclass_aa"] // << ADD YOUR VEHICLE CLASS AT THE END OF THE CLASSES ARRAY ","YOUR CLASS"]
				&& !(_className in VVS_R_Car) && !(_superClass in VVS_R_Car)
				&& !(_className in VVS_R_Air) && !(_superClass in VVS_R_Air)
				&& !(_className in VVS_R_Ship) && !(_superClass in VVS_R_Ship)
				&& !(_className in VVS_R_Armored) && !(_superClass in VVS_R_Armored)
				&& !(_className in VVS_R_Autonomous) && !(_superClass in VVS_R_Autonomous)
				&& !(_className in VVS_R_Support) && !(_superClass in VVS_R_Support)
				) then
				{
// def 2015 09 20>
// 2) THEN ADD YOUR OWN VEHICLE CLASS AT THE END OF PREFFERED SUBCLASSE ARRAY ON ONE OF THE NEXT STRINGS:
// FOR EXAMPLE, YOU WANT TO ADD CLASS "AIR2" TO AIR VEHICLE SPAWNER. ADD IT ON LINE 83 RIGHT AFTER "rhs_vehclass_helicopter".

		// CARS and trucks
					if ((count VVS_Car == 0) && (_vehicleClass in ["Car","rhs_vehclass_car","rhs_vehclass_truck"])) then
					{ VVS_pre_Car pushBack _classname; };
		// SHIPS and Submarines
					if ((count VVS_Ship == 0) && (_vehicleClass in ["Ship","Submarine"])) then
					{ VVS_pre_Ship pushBack _classname; };
		// AIR
					if ((count VVS_Air == 0) && (_vehicleClass in ["Air","rhs_vehclass_aircraft","rhs_vehclass_helicopter"])) then
					{ VVS_pre_Air pushBack _classname; };
		// ARMORED (TANKS, APC, IFV, ARTILLERY)
					if ((count VVS_Armored == 0) && (_vehicleClass in ["Armored","rhs_vehclass_tank","rhs_vehclass_apc","rhs_vehclass_ifv","rhs_vehclass_artillery"])) then
					{ VVS_pre_Armored pushBack _classname; };
		// Autonomous and rhs AA
					if ((count VVS_Autonomous == 0) && (_vehicleClass in ["Autonomous","rhs_vehclass_aa"])) then
					{ VVS_pre_Autonomous pushBack _classname; };
		// Support, rhs radar, rhs launcher, rhs targeting
					if ((count VVS_Support == 0) && (_vehicleClass in ["Support","rhs_vehclass_radar","rhs_vehclass_launcher","rhs_vehclass_targeting"])) then
					{ VVS_pre_Support pushBack _classname; };
// <def 2015 09 20
				};
			};
		};
	};
};