class DefaultEventhandlers;

class CfgPatches 
{
	class EMonkeys_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "EMonkeys_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class EMonkeys_System
	{
		tag = "EMonkeys";
		class GPS
		{
			file = "\EMonkeys_server\Functions\eMonkeys\gps";
			class gpsTracker {};
			class gpsScannerOpen {};
			class gpsMarker {};
			class gpsDelete {};
		};
		
		class Antihack
		{
			file = "\EMonkeys_server\Functions\eMonkeys\Antihack";
			class Veriable {};
			class impoundItem {};
			class TutorialCam {};
		};
		
		class Fuelstation
		{
			file = "\EMonkeys_server\Functions\eMonkeys\Fuelstation";
			class fillFuelstation {};
			class fuelMenu {};
			class fuelMenuAir {};
			class fuelstationOwnerMenu {};
			class nearestVehicleFuel {};
			class robFuelstation {};
			class startAirVehicleFueling {};
			class startVehicleFueling {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\EMonkeys_server\Functions\Systems";
			class managesc {};
			class federalUpdate {};
		};
	};
};


class CfgRemoteExec
{
	class Functions
	{
		mode = 0;
		jip = 0;
	};
	
	class Commands
	{
		mode = 0;
	};
};