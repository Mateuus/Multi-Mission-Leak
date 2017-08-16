#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retrieves a vehicle from a players garage
*/

_spawn = DS_spawnPoint;
_spawnMax = (count(DS_spawnPoint));
_spawnIndex = 0;
_vehTextureArray = [];

{
	if(count(nearestObjects[(getMarkerPos (_spawn select _spawnIndex)),["Car","Ship","Air","Tank"],5]) > 0)then{_spawnIndex = _spawnIndex + 1};
}forEach DS_spawnPoint;
if(_spawnIndex >= _SpawnMax)exitwith{hint "There is no spawn point free at this time"};
_spawn = (_spawn select _spawnIndex);

//Clean up any nearby remains
_nearbyRemains = (nearestObjects[(getMarkerPos _spawn),["Land_HumanSkeleton_F"],20]);
{
	deleteVehicle _x;
}forEach _nearbyRemains;

_vehInfo = lbData[1501,(lbCurSel 1501)];
_totalIndex = (lbValue[1501,(lbCurSel 1501)]);

_vehicle = (call compile format["%1",_vehInfo]) select 0;
_index = (call compile format["%1",_vehInfo]) select 1;

_vehicleArray = [];
{
	if((getPlayerUID player) isEqualTo (_x select 0))then {
		_vehicleArray pushBack _x;
	};
}forEach DS_rentals;

_className = (_vehicleArray select _totalIndex) select 1;
_side = (_vehicleArray select _totalIndex) select 2;
_textureIndex = (_vehicleArray select _totalIndex) select 3;
_boot = (_vehicleArray select _totalIndex) select 4;
_defaultArray = (_vehicleArray select _totalIndex) select 5;
_plate = (_vehicleArray select _totalIndex) select 6;
_price = (_vehicleArray select _totalIndex) select 7;

_action = [
	format ["Because of the location your vehicle was impounded at, the retrieval price is $%1",[_price] call DS_fnc_numberText],
	"Retrieve Vehicle",
	"Retrieve",
	"Cancel"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to retrieve this vehicle, after a restart it will return to your garage"};
[_price,true,false] call DS_fnc_handleMoney;

_sp = (getMarkerPos _spawn);
_dir = (markerDir _spawn);
_pid = (getPlayerUID player);
_name = (name player);
_unit = player;
closeDialog 0;

_vehicle = createVehicle [_className,_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle"};

_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2)+0.3];

_vehicle setDir _dir;
_vehicle allowDamage true;
DS_keyRing pushBack _vehicle;
_vehicle lock 2;
_vehicle setVariable ["vehicleTexture",_textureIndex,true];

if(_textureIndex > 99)then
	{
	_vehTextureArray = ["extras\textures\vehicles\repaintWeed.jpg","extras\textures\vehicles\repaintChrome.jpg","extras\textures\vehicles\black.paa"];
	_vehTexture = (_vehTextureArray select (_textureIndex - 100));
	[_vehicle,3,[_vehTexture]] call DS_fnc_globalTexture;
	_vehTextureArray = [];
	}
	else
	{
	_vehTextureArray = [_className,true,playerSide] call DS_fnc_vehicleTextures;
	};

if(!(_vehTextureArray isEqualTo []))then
	{
	_vehTexture = (_vehTextureArray select _textureIndex);
	if(count(_vehTexture) > 1)then
		{
		if(count(_vehTexture) > 2)then
			{
			[_vehicle,3,_vehTexture] call DS_fnc_globalTexture;
			}
			else
			{
			[_vehicle,2,_vehTexture] call DS_fnc_globalTexture;
			};
		}
		else
		{
		[_vehicle,1,_vehTexture] call DS_fnc_globalTexture;
		};
	};
	
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
if(_plate > -1)then {
	_vehicle setVariable["dbInfo",[_pid,_plate],true];
};

_vehicle setVariable["sirens",false,true];
_vehicle setVariable ["boot",_boot,true];
_vehicle setVariable["boot_open",false,true];
[_vehicle] spawn DS_fnc_clearVehAmmo;

switch(playerside)do
	{
	case west:
		{
		[_vehicle] spawn DS_fnc_setUpVeh;
		_vehicle setVariable ["policeVehicle",true,true];
		};
	case independent:
		{
		_vehicle setVariable ["wlCivVehicle",true,true];
		_vehicle setVariable ["setUp",1,true];
		[_vehicle] spawn DS_fnc_setUpVeh;
		};
	case civilian:
		{
		if(((_defaultArray)select 9) == 5)then
			{
			_vehicle setVariable ["setUp",5,true];
			[_vehicle,5] spawn DS_fnc_setUpVeh;
			};
		if(((_defaultArray)select 9) == 4)then
			{
			_vehicle setVariable ["setUp",4,true];
			[_vehicle,4] spawn DS_fnc_setUpVeh;
			};
		if(((_defaultArray)select 9) == 0)then
			{
			_vehicle setVariable ["setUp",0,true];
			[_vehicle,0] spawn DS_fnc_setUpVeh;
			};
		if(((_defaultArray)select 9) == 1)then
			{
			_vehicle setVariable ["setUp",1,true];
			_vehicle setVariable ["special",true,true];
			[_vehicle,1] spawn DS_fnc_setUpVeh;
			};
		};
	};
_spawnString = "Your vehicle is ready!\n\n\nUpgrades added...\n\n";

if(((_defaultArray)select 0) == 1)then
	{
	_vehicle setVariable["extraspace",true,true];
	_spawnString = _spawnString + "Upgraded Storage Bonus\n";
	};
if(((_defaultArray)select 0) == 2)then
	{
	_vehicle setVariable["extraspaceAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Storage Bonus\n";
	};
if(((_defaultArray)select 1) == 1)then
	{
	_vehicle setVariable["fuel",true,true];
	_spawnString = _spawnString + "Upgraded Fuel Usage Bonus\n";
	};
if(((_defaultArray)select 1) == 2)then
	{
	_vehicle setVariable["fuelAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Fuel Usage Bonus\n";
	};
if(((_defaultArray)select 2) == 1)then
	{
	_vehicle setVariable["security",true,true];
	_spawnString = _spawnString + "Upgraded Security Bonus\n";
	};
if((((_defaultArray)select 2) == 2)&&(!(playerSide isEqualTo west)))then
	{
	_vehicle setVariable["securityAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Security Bonus\n";
	};
if(((_defaultArray)select 3) == 1)then
	{
	_vehicle setVariable["thermal",true,true];
	_spawnString = _spawnString + "Thermal Enabled\n\n\n";
	_vehicle disableTIEquipment false;
	};
if(((_defaultArray)select 3) == 2)then
	{
	_vehicle setVariable["thermal",true,true];
	_vehicle setVariable["bulletProof",true,true];
	_spawnString = _spawnString + "Thermal Enabled\n\n\nBulletProof Body\n\n\n";
	_vehicle disableTIEquipment false;
	};

if((((_defaultArray)select 8) == 1)&&(typeOf _vehicle == "O_Truck_03_covered_F"))then
	{
	_vehicle setVariable["CCU",true,true];
	_spawnString = _spawnString + "Civilian Command Unit\n\n\n";
	};

if(((_defaultArray)select 8) == 2)then
	{
	_vehicle setVariable["GCU",true,true];
	_spawnString = _spawnString + "Gang Command Unit\n\n\n";
	};

if(((_defaultArray)select 4) == 2)then
	{
	_vehicle setVariable["insurance2",true,true];
	_spawnString = _spawnString + "Insurance X 2\n\n\n";
	};

if(((_defaultArray)select 4) == 1)then
	{
	_vehicle setVariable["insurance1",true,true];
	_spawnString = _spawnString + "Insurance X 1\n\n\n";
	};
if(((_defaultArray)select 5) > 0)then
	{
	_vehicle setVariable["airBags",(_defaultArray select 5),true];
	_spawnString = _spawnString + format ["Airbags X %1\n\n\n",((_defaultArray select 5)/2)];
	};
if(((_defaultArray)select 6) > 0)then
	{
	_vehicle setVariable["vehAmmo",true,true];
	_spawnString = _spawnString + format ["Extra Ammo\n\n\n",((_defaultArray select 5)/2)];
	};
if(((_defaultArray)select 7) > 0)then
	{
	_vehicle setVariable["vehAnimal",true,true];
	_spawnString = _spawnString + format ["Vehicle Animal Sensors\n\n\n",((_defaultArray select 5)/2)];
	};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 14)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 55)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((player getVariable ["security",false])&&((DS_infoArray select 19) > 28)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) > 10)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 17))then
	{
	_vehicle setVariable ["fuel",true,true];
	_spawnString = _spawnString + "Quest enabled Fuel Upgrade\n\n\n";
	};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 19))then
	{
	_vehicle setVariable ["security",true,true];
	_spawnString = _spawnString + "Quest enabled Security Upgrade\n\n\n";
	};
if((player getVariable ["security",false])&&((DS_infoArray select 19) > 29))then
	{
	_vehicle setVariable ["securityAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Security Upgrade\n\n\n";
	};

if((player getVariable ["medic",false])&&((DS_infoArray select 10) > 24))then
	{
	_vehicle setVariable ["securityAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Security Upgrade\n\n\n";
	};

if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 46)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["vehAnimal",true,true];
	_spawnString = _spawnString + "Quest enabled Animal Repellent Upgrade\n\n\n";
	};

if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 51))then
	{
	_vehicle setVariable ["fuelAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Fuel Upgrade\n\n\n";
	};
if((player getVariable ["medic",false])&&((DS_infoArray select 10) > 17)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if(DS_realMode)then
	{
	_vehicle setVariable ["realMode",true,true];
	_spawnString = _spawnString + "Realistic mode locks\n\n\n";
	};
if(((DS_infoArray select 31) > 1)&&(playerside == civilian)&&(!(_vehicle getVariable["GCU",false])))then
	{
	_vehicle setVariable ["CCU",true,true];
	_spawnString = _spawnString + "CCU Abilities\n\n\n";
	};

switch(DS_perkLevel)do
	{
	case 1: {_vehicle setVariable["extraspace1",true,true];_spawnString = _spawnString + "Perk Level 1 Storage Bonus";};
	case 2: {_vehicle setVariable["extraspace2",true,true];_spawnString = _spawnString + "Perk Level 2 Storage Bonus";};
	case 3: {_vehicle setVariable["extraspace3",true,true];_spawnString = _spawnString + "Perk Level 3 Storage Bonus";};
	case 4: {_vehicle setVariable["extraspace4",true,true];_spawnString = _spawnString + "Perk Level 4 Storage Bonus";};
	case 5: {_vehicle setVariable["extraspace5",true,true];_spawnString = _spawnString + "Perk Level 5 Storage Bonus";};
	};

if(_spawnString == "Your vehicle is ready!\n\n\nUpgrades added...\n\n")then
	{
	_spawnString = "Your vehicle is ready";
	};
hint format ["%1",_spawnString];


if(((typeOf _vehicle) == "B_MRAP_01_F")&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
	{
	_vehTextureArray = ["extras\textures\vehicles\hp.jpg","extras\textures\vehicles\hp_b.jpg"];
	[_vehicle,2,_vehTextureArray] call DS_fnc_globalTexture;
	};

if(((typeOf _vehicle) == "C_SUV_01_F")&&(playerSide isEqualTo civilian)&&((_textureIndex) == 4))then
	{
	_vehicle setVariable ["taxi",true,true];
	};

if(_vehicle isKindOf "Air")then {
	[_vehicle] spawn DS_fnc_airVehicleEH
};

{
	if(((getPlayerUID player) isEqualTo (_x select 0))&&(_className isEqualTo (_x select 1))&&(_side isEqualTo (_x select 2))&&(_boot isEqualTo (_x select 4))&&(_defaultArray isEqualTo (_x select 5))&&(_plate isEqualTo (_x select 6)))then {
		DS_rentals set [_forEachIndex,-1];
	};
}forEach DS_rentals;

DS_rentals = DS_rentals - [-1];
publicVariable "DS_rentals";

_vehicle spawn {
	sleep 5;
	_this setDamage 0;
};
