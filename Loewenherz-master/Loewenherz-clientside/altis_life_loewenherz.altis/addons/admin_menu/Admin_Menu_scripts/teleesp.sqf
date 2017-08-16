/*
Teleport / Esp Radar Map for Arma III reworked by Blackd0g

[Benefits]:

- configurable through menu opened by key combination (set "musekeys" to "true")
- multitreading - each marker lives it's own "lhm" until off
- show tents, players, vehicles, dead bodies, nearby animals
- nice icons
- configurable icons colors
- configurable preload options
- scalable icons
- built-in esp w player tags
- built-in teleport
- icons support direction show (but it is some kind bugged due high ping values)
- when players are in vehicle their names are shown in column like:
	- Vehiclename
	  > PlayerName1
	  > PlayerName2
	  > PlayerName3
	  > PlayerName4
- vehicles has real ingame names on map
- autoadding map/GPS if selected and not in inventory
- etc :)

[Defects]:
- can freeze while scanning objects on first execution

[How to use]:

1) You NEED map or gps (change "mautoaddmap" or "mautoaddgps" to true)
2) Open GPS if You have it
2) Exec script
3) \0/ Profit! :)

[Controls]:
F2 key = Show options menu
ALT + LMB click on map = Teleport You and Your vehicle in place You clicked
If you switch Teleport to "All" all player will be portet to the choosen location.
*/

private ["_map"];

_map = ObjNull;

if ((call lhm_adminlevel) < 1) exitWith {};

[["admin",(format["%1 with UID %2 is using Tele/ESP Tool",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;

// Configuration
if (isNil "musekeys") then {musekeys = true;};	//use keys combinations to show and toggle options
if (isNil "shai") then {shai = false;};  	//Show ai on start
if (isNil "sht") then {sht = false;};		//Show tents on start
if (isNil "bbox") then {bbox = false;};		//Show AmmoBox on start
if (isNil "spi") then {spi = false;};		//Show players on HUD (ESP) on start
if (isNil "mgpsm") then {mgpsm = true;};  	//Move gps and remove it's fckn frame
if (isNil "tpe") then {tpe = true;};		//Use built-in teleport /all or yourself
if (isNil "sveh") then {sveh = true;};		// Show Vehicles on start

mautoaddmap = true;								//Add map on start (GPS or MAP nesessary for functionality)
mautoaddgps = false;							//Add map on start (GPS or MAP nesessary for functionality)

ptxt = format ["You (Admin :%1)",name player];	//Text to identify You on map/gps. Leave blank ("") if You want to see only black icon

pmc = [0, 0, 1 , 1];						//Player icon color
aic = [1, 0, 1, 1];							// AI icon color
pdmc = [1, 0, 0, 1];						//HUD player text color
vmc = [0.0980392, 0.0980392, 0.439216, 1];	//Vehicle icon color
tmc = [0.294118, 0, 0.509804, 1];			//Tent icon color
bbc = [1, 0, 1, 1];							// Box Color
_mapside = 25000;							//Size of map (longest x or y) in meters


// End of configuration

disableSerialization;
//_minimap = (uinamespace getvariable "BIS_RscMiniMapSmall") displayCtrl 101;
//_minimap_frame = (uinamespace getvariable "BIS_RscMiniMapSmall") displayCtrl 101000;
_mm_w = 0.35;
_mm_h = 0.301;

moptions =
{
	mapopt =
	[
	["",true],
	["Toggle MAP options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
	[format["Built-in HUD(ESP): %1",spi], [2], "", -5, [["expression", "spi = !spi;"]], "1", "1"],
	[format["Switch Teleport Self/All: %1",tpsa], [3], "", -5, [["expression", "tpe = !tpe;if(tpe) then {tpsa=""Self"";} else {tpsa=""All"";}"]], "1", "1"],
	//[format["Show Tents/Stashes: %1",sht], [4], "", -5, [["expression", "sht = !sht;"]], "1", "1"],
	[format["Show AmmoBoxes: %1",bbox], [5], "", -5, [["expression", "bbox = !bbox;"]], "1", "1"],
	[format["Show Vehicles: %1",sveh], [6], "", -5, [["expression", "sveh = !sveh;"]], "1", "1"]
	];
	showCommandingMenu "#USER:mapopt";
};

if(tpe) then {tpsa="Self";} else {tpsa="All";};

if (isnil "mapm") then
{
	if (mautoaddmap and !("ItemMap" in items player)) then {player addweapon "ItemMap";};
	if (mautoaddgps and !("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
	mapm = true;
	plist = [];
	vlist = [];
	cList = [];
	aList = [];
	sList = [];
	dList = [];
	bList = [];
	maphalf = _mapside/2; mapscanrad = sqrt (2*maphalf*maphalf);
	_map = (findDisplay 12) displayCtrl 51;

	titleText ["Loading Admin Map... add Icons ...","PLAIN DOWN"];titleFadeOut 2;
	sleep 2;

	//helicrashes = nearestObjects [[maphalf,maphalf],[ "Land_Wreck_Heli_Attack_01_F","Land_Wreck_Heli_Attack_02_F"],mapscanrad];
	//tents = nearestObjects [[maphalf,maphalf],[],mapscanrad];

	if mgpsm then
	{
	   // _minimap_frame ctrlShow false;				//hide gps frame
		//_mm_x = (SafeZoneW + SafeZoneX) - (_mm_w + 0.005); 	//bottom right
		//_mm_y = (SafeZoneH + SafeZoneY) - (_mm_h + 0.005); 	//bottom right
		//_mm_x = SafeZoneX + 0.005; 				//top left
		//_mm_y = SafeZoney + 0.005; 				//top left
		_mm_x = (SafeZoneW + SafeZoneX) - (1 - 0.555); 		//move left a bit (to not cover main right icons)
		_mm_y = (SafeZoneH + SafeZoneY) - (1 - 0.480); 		//move left a bit (to not cover main right icons)
	   // _minimap ctrlsetposition [_mm_x, _mm_y, _mm_w, _mm_h];
	   // _minimap ctrlcommit 0.01;
	};
	titleText ["Adding map markers...","PLAIN DOWN"];titleFadeOut 3;
	_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call drawic;"];

	// _minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call drawic;"];
	if musekeys then
	{
		F2_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3C) then {call moptions;};"];
	};

	sleep 0.1;
}
else
{
	mapm = nil;

	//_map ctrlremoveeventhandler ["Draw", _mapdraw];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F2_EH];

	plist = [];
	vlist = [];
	cList = [];
	aList = [];
	sList = [];
	dList = [];
	bList = [];
	moptions = nil;

	if mgpsm then
	{
		_mm_x = (SafeZoneW + SafeZoneX) - (1 - 0.625);
		_mm_y = (SafeZoneH + SafeZoneY) - (1 - 0.480);
		//_minimap_frame ctrlShow true;
		//_minimap ctrlsetposition [_mm_x, _mm_y, _mm_w, _mm_h];
		//_minimap ctrlcommit 0.01;
	};

	sleep 0.5;
	titleText ["ESP and Markers removed...","PLAIN DOWN"];titleFadeOut 3;
};

keyctrl =
{

};

drawic =
{
	if (!isnil "mapm") then
	{

		private["_ctrl"];
		_ctrl =  _this select 0;
		_iscale = (1 - ctrlMapScale _ctrl) max .1;

		_irad = 30;
		_color = [0, 0, 1, 1];
		_icon = ""; // VehicleIcon

		//if sht then {{if (!isnull _x) then {_ctrl drawIcon ["\ca\ui\data\markers\waypoint.paa", tmc, getPosASL _x, 30, 30, 0, "", 1];};} foreach tents;};

		{
			if (!isnull _x and sveh) then
			{
				_icon = getText(configFile >> "CfgVehicles" >> typeOf _x >> "icon");_irad = 30;
				if (_x iskindof "Air") then {_irad = 40;};
				_ctrl drawIcon [_icon, vmc, getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
			};
		} foreach (Entities "LandVehicle"+ Entities "Air" + Entities"Ship");

		{
			if ((!isnull _x) and (getPlayerUID _x != "") and !(vehicle _x != _x)) then
			{
				if (_x == player) then {_color = [0, 0, 0, 1];} else {_color = pmc;};
				_ctrl drawIcon ["\A3\ui_f\data\map\VehicleIcons\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1]; // Icons Player
			};
		} foreach Entities "CAManBase";

	};

};

// Teleport
portal =
{
	if (!isnil "mapm") then
	{
		if(tpe) then {
			if ((_this select 1)) then
			{
				_pos = _this select 0;
				(vehicle player) setpos [_pos select 0, _pos select 1, 0];
				_myPos = player getVariable["lastPos",[]];
				if (count _myPos > 0) then {player setVariable["lastPos",getPosATL player];player setVariable["lastPos",[]];};
				openMap [false, false];onMapSingleClick "";
		}
			else {onMapSingleClick "";};
		} else {
			if ((_this select 1)) then
			{
				_pos = _this select 0;
				{
				_master = _x;
				if ((_master == vehicle _master) && (isPlayer _master)) then
					{
					_master setPosATL _pos;
					};
				} forEach playableUnits;

				openMap [false, false];onMapSingleClick "";
				cutText ["porting all Players..." + str(_pos),"PLAIN DOWN",1];
				tpe = true;
			}
			else {onMapSingleClick "";};
		};
	};
};

// ESP RADAR
playerESP =
{
	private["_nearUnits"];
	_nearUnits = (position (vehicle player)) nearEntities [["Man", "AllVehicles"], 1200];
	{
		if((vehicle player) distance (vehicle _x) < 1200 && isPlayer (vehicle _x) && _x != player) then
		{
		drawIcon3D["",[1, 0, 0, 1],[visiblePosition (vehicle _x) select 0,visiblePosition (vehicle _x) select 1,(getPosATL (vehicle _x) select 2)+2],0.1,0.1,45,(format["%2 : %1m",round((vehicle player) distance (vehicle _x)),name (vehicle _x)]),1,0.03,"PuristaMedium"]
		};
	} foreach _nearUnits;
};

// Main cicle
waituntil
{
	if (!isnil "mapm") then
	{
		// ESP Radar
		if (spi) then
		{
			[] spawn
				{

					while {!isnil "mapm" and spi} do
					{
						if(isNil "LHM_ESPTOOL") then
						{
						LHM_ESPTOOL = ["lhmesp","onEachFrame","playerESP"] call BIS_fnc_addStackedEventHandler;
						lhm_ID_PlayerTags = ["lhm_PlayerTags","onEachFrame","lhm_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
						};
					 sleep 1;
					};
				// Delete ESP Markers
				["lhmesp", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				LHM_ESPTOOL = nil;
				true
				};
		};

		// Activate Teleport
		if ((visiblemap) and (tpe))then
		{
			onMapSingleClick "[_pos, _alt] call portal;";
		};

		// Show Vehicles on MAP
		{
			if (!(_x in vList) and (sveh) and (visibleMap)) then
			{

				private ["_pos", "_mkr"];
				_pos = getPos _x;
				_mkr = createMarkerLocal [format ["VHC%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 10, _pos select 1, 0]];
				_mkr setMarkerTextLocal format["%1", gettext (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName')];
				_mkr setMarkerTypeLocal "waypoint";
				_mkr setMarkerColorLocal "ColorRed";
				_mkr setMarkerSizeLocal [0,0];
				vList pushBack _x;
				[_x, _mkr] spawn
				{
					private ["_u", "_m"];
					_u = _this select 0;
					_m = _this select 1;
					_nc = _this select 2;
					while {!isNil "mapm" and sveh} do
					{
						_m setMarkerPosLocal ([(getPos _u select 0) + 10, getPos _u select 1, 0]);
						sleep 0.01;
					};
					deleteMarkerLocal _m;
					if (_u in vList) then
					{
						vList set [(vList find _u), -1];
						vList = vList - [-1];

					};
					true;
				};
			};

		// Show Crew in Vehicles
			if (count (crew _x) > 0) then
			{

				{
					if (!(_x in cList) and (alive _x) and (getPlayerUID _x != "") and (visibleMap)) then
					{
						private ["_pos", "_mkr", "_vhc"];
						_vhc = vehicle _x;
						_pos = getPos _x;
						_mkr = createMarkerLocal [format ["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 1, _pos select 1, 0]];
						_mkr setMarkerTextLocal format[">%1", name _x];
						_mkr setMarkerTypeLocal "waypoint";
						_mkr setMarkerColorLocal "ColorBlue";
						_mkr setMarkerSizeLocal [0,0];

						cList pushBack _x;
						[_x, _mkr,_vhc] spawn
						{
							private ["_u", "_m","_pc"];
							_u = _this select 0;
							_m = _this select 1;
							while {!isnil "mapm" and (alive _u) and (vehicle _u != _u) and (getPlayerUID _u != "")} do
							{
								_pc = ((crew vehicle _u) find _u);
								_m setMarkerPosLocal ([(getPos _u select 0) + 10, (getPos _u select 1) - (10 + _pc*10), 0]);
								sleep 0.01;
							};
							deleteMarkerLocal _m;
							if (_u in cList) then
							{
								cList set [(cList find _u), -1];
								cList = cList - [-1];
							};
							true;
						};
					};
				}forEach crew _x;
			};
		} forEach (Entities "LandVehicle"+ Entities "Air" + Entities"Ship");

		// Show Ammoboxes
		{
			if (!(_x in bList) and (bbox) and (visibleMap)) then
			{
				private ["_pos", "_mkr"];
				_pos = getPos _x;
				_mkr = createMarkerLocal [format ["BOX%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 10, _pos select 1, 0]];
				_mkr setMarkerTextLocal format["AmmoBox: %1", gettext (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName')];
				_mkr setMarkerTypeLocal "waypoint";
				_mkr setMarkerColorLocal "ColorYellow";
				_mkr setMarkerSizeLocal [0,0];
				bList pushBack _x;
				[_x, _mkr] spawn
				{
					private ["_u", "_m"];
					_u = _this select 0;
					_m = _this select 1;
					_nc = _this select 2;
					while {!isNil "mapm" and bbox} do
					{
						_m setMarkerPosLocal ([(getPos _u select 0) + 10, getPos _u select 1, 0]);
						sleep 0.5;
					};
					deleteMarkerLocal _m;
					if (_u in bList) then
					{
						bList set [(bList find _u), -1];
						bList = bList - [-1];

					};
					true;
				};
			};
		} forEach (Entities "Reammobox_F");
		// Show Myself on MAP
		{
			if (!(_x in pList) and (vehicle _x == _x) and (getPlayerUID _x != "") and (visibleMap)) then
			{
				private ["_pos", "_mkr"];
				_pos = getPos _x;
				_isAdmin = _x getVariable ["isAdmin",false];
				_mkr = createMarkerLocal [format ["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 10, _pos select 1, 0]];
				_mkr setMarkerTypeLocal "waypoint";
				_mkr setMarkerSizeLocal [0,0];
				_mkr setMarkerColorLocal "ColorBlue";
				_mkr setMarkerTextLocal format ["%1", name _x];

				if (_x == player) then
				{
					_mkr setMarkerColorLocal "ColorYellow";
					_mkr setMarkerTextLocal ptxt;
				};

				 if (_isAdmin) then
				{
					_mkr setMarkerColorLocal "ColorYellow";
					_mkr setMarkerTextLocal format ["Admin: %1",name _x];
				};

				pList pushBack _x;
				[_x, _mkr] spawn
				{
					private ["_u", "_m"];
					_u = _this select 0;
					_m = _this select 1;
					while {!isnil "mapm" and (alive _u) and (vehicle _u == _u) and (getPlayerUID _u != "") } do
					{
						_m setMarkerPosLocal ([(getPos _u select 0) + 10, getPos _u select 1, 0]);
						sleep 0.01;
					};
					deleteMarkerLocal _m;
					if (_u in pList) then
					{
						pList set [(pList find _u), -1];
						pList = pList - [-1];

					};
					true;
				};
			};
		} forEach Entities "CAManBase";
		sleep 0.1;
	};
	(isnil "mapm")
};
["lhmesp", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
LHM_ESPTOOL = nil;

