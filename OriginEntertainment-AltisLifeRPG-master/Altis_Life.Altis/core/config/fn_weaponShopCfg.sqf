#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{

	case "cop2_basic":
	{
		switch(true) do
		{
			case (playerSide != east): {"You not a cop!"};
			case (__GETC__(life_cop2level) == 1):
			{
				["Recruit Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};

			case (__GETC__(life_cop2level) == 2):
			{
				["Patrol Officer Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]
					]
				];
			};

			case (__GETC__(life_cop2level) == 3):
			{
				["Sergeant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]						
					]
				];
			};
			case (__GETC__(life_cop2level) == 4):
			{
				["Lieutenant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]	
					]
				];
			};
			case (__GETC__(life_cop2level) == 5):
			{
				["Captain Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],						
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]	
					]
				];
			};
			case (__GETC__(life_cop2level) == 6):
			{
				["Swat Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],	
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],	
						["muzzle_snds_H","6.5mm Suppressor",40000 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]							
					]
				];
			};
		};
	};
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You not a cop!"};
			case (__GETC__(life_coplevel) == 1):
			{
				["Recruit Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};

			case (__GETC__(life_coplevel) == 2):
			{
				["Patrol Officer Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]	
					]
				];
			};

			case (__GETC__(life_coplevel) == 3):
			{
				["Sergeant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]							
					]
				];
			};
			case (__GETC__(life_coplevel) == 4):
			{
				["Lieutenant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]	
					]
				];
			};
			case (__GETC__(life_coplevel) == 5):
			{
				["Captain Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],						
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]	
					]
				];
			};
			case (__GETC__(life_coplevel) == 6):
			{
				["Swat Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],	
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],	
						["muzzle_snds_H","6.5mm Suppressor",40000 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellBlue","Teargas",1000 * life_donDis]							
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100 * life_donDis],
						["Binocular",nil,150 * life_donDis],
						["ToolKit",nil,250 * life_donDis],
						["Medikit","Med Kit",150 * life_donDis],
						["NVGoggles_INDEP",nil,1200 * life_donDis],
						["B_AssaultPack_blk",nil,3000 * life_donDis]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Rebel Weapon Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_INDEP","Green Night Vision Goggles",1000 * life_donDis],
						["NVGoggles","Brown Night Vision Goggles",1000 * life_donDis],
						
						["hgun_Rook40_F","Rook-40 9mm",5000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],		
						
						["hgun_PDW2000_F","PDW2000 9 mm",10000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],

						["hgun_Pistol_heavy_02_F","Zubr .45",35000 * life_donDis],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",500 * life_donDis],	
						
						["arifle_Mk20C_F","Mk20C 5.56 mm (C)",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],
						
						["arifle_TRG20_F","TRG-20 5.56mm",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],

						["arifle_TRG21_F","TRG-21 5.56mm",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],
						
						["arifle_Katiba_F","Katiba 6.5mm",65000 * life_donDis],
						["30Rnd_65x39_caseless_green","6.5mm 30Rnd STANAG Mag",500 * life_donDis],
						
						["SMG_01_F","Vermin SMG .45 ACP",70000 * life_donDis],
						["30Rnd_45ACP_Mag_SMG_01",".45 ACP 30Rnd Vermin Mag",500 * life_donDis],
						
						["srifle_DMR_01_F","Rahim 7.62mm",100000 * life_donDis],
						["10Rnd_762x51_Mag","7.62mm 10Rnd Mag",500 * life_donDis],
						
						["srifle_EBR_F","Mk18 ABR 7.62mm",120000 * life_donDis],
						["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",500 * life_donDis],
	
						["acc_flashlight","Flashlight",500 * life_donDis],						
						["optic_ACO_grn","ACO (Green)",10000 * life_donDis],
						["optic_Aco","ACO (Red)",10000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["optic_Holosight","MK17 Holosight",25000 * life_donDis],
						["optic_Arco","ARCO scope",20000 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],

						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellRed",nil,1000 * life_donDis],
						["SmokeShellGreen",nil,1000 * life_donDis],
						["SmokeShellYellow",nil,1000 * life_donDis],
						["SmokeShellPurple",nil,1000 * life_donDis],
						["SmokeShellOrange",nil,1000 * life_donDis],
						["HandGrenade",nil,50000 * life_donDis]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Firearms Shop",
					[
						["hgun_Rook40_F","Rook-40 9mm",5000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],				
						
						["hgun_PDW2000_F","PDW2000 9 mm",20000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",1000 * life_donDis],	
					
						["optic_ACO_grn","ACO (Green)",2500 * life_donDis],
						["optic_Aco","ACO (Red)",2500 * life_donDis]						
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_INDEP","Green Night Vision Goggles",1000 * life_donDis],
						["NVGoggles","Brown Night Vision Goggles",1000 * life_donDis],
						
						["hgun_Rook40_F","Rook-40 9mm",5000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],		
						
						["hgun_PDW2000_F","PDW2000 9 mm",10000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],

						["hgun_Pistol_heavy_02_F","Zubr .45",35000 * life_donDis],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",500 * life_donDis],	
						
						["arifle_Mk20C_F","Mk20C 5.56 mm (C)",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],
						
						["arifle_TRG20_F","TRG-20 5.56mm",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],

						["arifle_TRG21_F","TRG-21 5.56mm",50000 * life_donDis],
						["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",500 * life_donDis],
			
						["acc_flashlight","Flashlight",500 * life_donDis],						
						["optic_ACO_grn","ACO (Green)",10000 * life_donDis],
						["optic_Aco","ACO (Red)",10000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["optic_Holosight","MK17 Holosight",25000 * life_donDis],
						["optic_Arco","ARCO scope",20000 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],

						["SmokeShell",nil,1000 * life_donDis],
						["SmokeShellRed",nil,1000 * life_donDis],
						["SmokeShellGreen",nil,1000 * life_donDis],
						["SmokeShellYellow",nil,1000 * life_donDis],
						["SmokeShellPurple",nil,1000 * life_donDis],
						["SmokeShellOrange",nil,1000 * life_donDis],
						["HandGrenade",nil,50000 * life_donDis]
					]
				];
			};
		};
	};
	
	case "vigilante":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_vigilante): {"You don't have a Vigilante license!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Vigilante Shop",
					[
						["SMG_02_F","Sting 9mm",45000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",1000 * life_donDis],	
						["acc_flashlight","Flashlight",500 * life_donDis],							
						["optic_ACO_grn","ACO (Green)",5000 * life_donDis],
						["optic_Aco","ACO (Red)",5000 * life_donDis]					
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) < 3):
			{
				["Altis General Store",
					[
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],	
						["ToolKit","Tool Kit",500 * life_donDis],
						["FirstAidKit","FirstAid Kit",500 * life_donDis],
						["NVGoggles","Night Vision Goggles",1000 * life_donDis],
						["Binocular",nil,1000 * life_donDis],
						["Chemlight_red","Red Chemlight",5000 * life_donDis],
						["Chemlight_yellow","Yellow Chemlight",5000 * life_donDis],
						["Chemlight_green","Green Chemlight",5000 * life_donDis],
						["Chemlight_blue","Blue Chemlight",5000 * life_donDis]
					]
				];
			};
			case (__GETC__(life_donator) > 2):
			{
				["Altis Donator General Store",
					[
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],	
						["ToolKit","Tool Kit",500 * life_donDis],
						["FirstAidKit","FirstAid Kit",500 * life_donDis],
						["NVGoggles","Night Vision Goggles",1000 * life_donDis],
						["Binocular",nil,1000 * life_donDis],
						["Chemlight_red","Red Chemlight",5000 * life_donDis],
						["Chemlight_yellow","Yellow Chemlight",5000 * life_donDis],
						["Chemlight_green","Green Chemlight",5000 * life_donDis],
						["Chemlight_blue","Blue Chemlight",5000 * life_donDis],
						["Rangefinder",nil,300 * life_donDis]
					]
				];
			};
		};
	};
};