/*
	File: strassen-maker.sqf
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:27 | Straßenzeichen
*/

//Kavala
//Zebrastreifen
_vehicle_00 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3617.2188, 13111.733, 0.0185];
	_vehicle_00 = _this;
	_this setDir 3.9472799;
	_this setPos [3617.2188, 13111.733, 0.0185];
	_this setObjectTexture [0,"core\textures\map\zebrastreifen.paa"];
	[_this, -90.4,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_000 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3651.2878, 13135.387, 0.029999999];
	_vehicle_000 = _this;
	_this setDir -87.368958;
	_this setPos [3651.2878, 13135.387, 0.029999999];
	_this setObjectTexture [0,"core\textures\map\zebrastreifen.paa"];
	[_this, -90.5,0] call BIS_fnc_setPitchBank;
	_this enableSimulation false;
	_this allowDamage false;
};

//Geschwindigkeiten
_vehicle_001 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3620.53,13075.1,0.0185];
	_vehicle_001 = _this;
	_this setDir 3.5;
	_this setPos [3620.53,13075.1,0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3618.12,13159.6,0.0185];
	_vehicle_002 = _this;
	_this setDir 191;
	_this setPos [3618.12,13159.6,0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3836.75,13501.8,0.0185];
	_vehicle_003 = _this;
	_this setDir 235;
	_this setPos [3836.75,13501.8,0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3368.9006, 12583.387, 0.11];
	_vehicle_004 = _this;
	_this setDir 212;
	_this setPos [3368.9006, 12583.387, 0.11];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3385.6306, 12585.887, 0.0185];
	_vehicle_005 = _this;
	_this setDir 32;
	_this setPos [3385.6306, 12585.887, 0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [3863.19,13504,0.038];
	_vehicle_006 = _this;
	_this setDir 55;
	_this setPos [3863.19,13504,0.038];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

//Sofia
//Geschwindigkeiten
_vehicle_007 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [25846.7,21495.5,-0.07];
	_vehicle_007 = _this;
	_this setDir 243;
	_this setPos [25846.7,21495.5,-0.07];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [25479.117, 21166.273, 0.0185];
	_vehicle_008 = _this;
	_this setDir 233.5;
	_this setPos [25479.117, 21166.273, 0.0185];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [25864.1,21489.8,0.15];
	_vehicle_009 = _this;
	_this setDir 63;
	_this setPos [25864.1,21489.8,0.15];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [25501.518, 21166.973, 0.097000003];
	_vehicle_010 = _this;
	_this setDir 53;
	_this setPos [25501.518, 21166.973, 0.097000003];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

//Zebrastreifen
_vehicle_011 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [25712.8,21363.4,0.0185];
	_vehicle_011 = _this;
	_this setDir 45;
	_this setPos [25712.8,21363.4,0.0185];
	_this setObjectTexture [0,"core\textures\map\zebrastreifen.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

//Athira
//Geschwindigkeiten
_vehicle_012 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [14245.4,18234.8,0.1185];
	_vehicle_012 = _this;
	_this setDir 332;
	_this setPos [14245.4,18234.8,0.1185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [14240.2,18223.7,0.038];
	_vehicle_013 = _this;
	_this setDir 153;
	_this setPos [14240.2,18223.7,0.038];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [13804.639, 18632.521, 0.1985];
	_vehicle_014 = _this;
	_this setDir 58;
	_this setPos [13804.639, 18632.521, 0.1985];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [13790.237, 18634.922, 0.06];
	_vehicle_015 = _this;
	_this setDir 238;
	_this setPos [13790.237, 18634.922, 0.06];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

//Pyrgos
//Geschwindigkeiten
_vehicle_016 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [17042.8,12897.8,0.1185];
	_vehicle_016 = _this;
	_this setDir 225;
	_this setPos [17042.8,12897.8,0.1185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [17063,12898.7,0.038];
	_vehicle_017 = _this;
	_this setDir 44;
	_this setPos [17063,12898.7,0.038];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [17142.984, 12667.136, 0.0185];
	_vehicle_018 = _this;
	_this setDir 280;
	_this setPos [17142.984, 12667.136, 0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [17158.785, 12650.436, 0.108];
	_vehicle_019 = _this;
	_this setDir 100;
	_this setPos [17158.785, 12650.436, 0.108];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [16823.379, 12360.777, 0.0185];
	_vehicle_020 = _this;
	_this setDir 345;
	_this setPos [16823.379, 12360.777, 0.0185];
	_this setObjectTexture [0,"core\textures\map\50.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "UserTexture10m_F" createvehiclelocal [16815.9,12347.4,0.038];
	_vehicle_021 = _this;
	_this setDir 165;
	_this setPos [16815.9,12347.4,0.038];
	_this setObjectTexture [0,"core\textures\map\120.paa"];
	[_this, -90,0] call BIS_fnc_setPitchBank;
	_this allowDamage false;
	_this enableSimulation false;
};

//Werbetafeln
//Kavala
_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_Billboard_F" createvehiclelocal [4365.373, 13950.146, -1.3037437];
	_vehicle_022 = _this;
	_this setDir 114.39501;
	_this setPos [4365.373, 13950.146, -1.3037437];
	_this setObjectTexture [0,"core\textures\map\billboards\billboard_werbung.paa"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

//Todeskurve
_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_Billboard_F" createvehiclelocal [8724.7061, 15933.478, -0.4293783];
	_vehicle_023 = _this;
	_this setDir 33.533085;
	_this setPos [8724.7061, 15933.478, -0.4293783];
	_this setObjectTexture [0,"core\textures\map\billboards\billboard_feuerwehr.paa"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

//Airport Terminal
_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Billboard_F" createvehiclelocal [14620.652, 16775.588, -1.0135781];
	_vehicle_024 = _this;
	_this setDir -46.669498;
	_this setPos [14620.652, 16775.588, -1.0135781];
	_this setObjectTexture [0,"core\textures\map\billboards\billboard_werbung.paa"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

//Athira
_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_Billboard_F" createvehiclelocal [13949.966, 18695.629, -1.0161428];
	_vehicle_025 = _this;
	_this setDir 67.593506;
	_this setPos [13949.966, 18695.629, -1.0161428];
	_this setObjectTexture [0,"core\textures\map\billboards\billboard_werbung.paa"];
	_this setvectorup [0,0,1];
	_this allowDamage false;
	_this enableSimulation false;
};