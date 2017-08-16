/* 
EMP VEHICLE SCRIPT
File: empinit.sqf
Author: DemoCore
Date: 2014.05.05
Version: 1.01

Disclaimer: 
This script was made for E-Monkeys.com

To use: 
1. Call this sqf
2. Don't forget to import the description.ext stuff
*/

maxLightSize = 8;
empCooldown = 200; //Emp cooldown in Sekunden
warnCooldown = 8; //Emp cooldown in Sekunden
empDistance = 250; //Distanz auf die emp funktioniert
waitTimeUpdateEmpList = 2; //Sekunden zwischen den updates des fensters (nur die Liste)
timeUntinFilanEmpExecution = 15; //Zeit um beispielweise den Helikopter zu landen.
allowedVehicles = ["I_Heli_light_03_unarmed_F", "O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","B_Heli_Transport_03_unarmed_F"];
targetBlackList = [""];

fnc_setHit = { 
	_toEmp = _this select 0; 
	if (local _toEmp) then 
	{ 
		_engineName = getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name");
		_toEmp setHit [_engineName, 1.0];
		//_toEmp setHitPointDamage ["hitEngine", 1.0];
	} 
	else 
	{ 
		PVSetHit = _this; 
		publicVariable "PVSetHit"; 
	}; 
}; 
PVSetHit = nil;
"PVSetHit" addPublicVariableEventHandler 
{ 
	_toEmp = _this select 1 select 0; 
	if (local _toEmp) then 
	{ 
		_engineName = getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name");
		_toEmp setHit [_engineName, 1.0];
	}; 
};


execVM "core\eMonkeys\emp\empHandlers.sqf";




MISSION_ROOT = call { 
private "_arr"; 
_arr = toArray __FILE__; 
_arr resize (count _arr - 11); 
toString _arr 
};