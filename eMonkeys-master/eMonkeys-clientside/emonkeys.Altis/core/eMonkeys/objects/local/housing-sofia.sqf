/*
	File: housing-sofia.sqf
	Author: KOMA
	Edited: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:54 | Housing Sofia
*/

_initCodes =[];

//OLD
//Haus 23
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [24764.684, 19099.063, -0.20705496];
	_vehicle_001 = _this;
	_this setDir -861.879;
	_this setPos [24764.684, 19099.063, -0.20705496];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_23"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [24766.9, 19095.1, 0.13460907];
	_vehicle_002 = _this;
	_this setVehicleVarName "house_23";
	house_23 = _this;
	_this setDir 669.39;
	_this setPos [24766.9, 19095.1, 0.13460907];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_23""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_23"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_23"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 24
_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [24786.029, 19138.295, -0.26122209];
	_vehicle_003 = _this;
	_this setDir -1037.29;
	_this setPos [24786.029, 19138.295, -0.26122209];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_24"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [24784.801, 19143.4, 0.22456318];
	_vehicle_004 = _this;
	_this setVehicleVarName "house_24";
	house_24 = _this;
	_this setDir 848.014;
	_this setPos [24784.801, 19143.4, 0.22456318];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_24""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_24"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_24"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 28
_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [23509.301, 21177, 0.82785147];
	_vehicle_005 = _this;
	_this setVehicleVarName "house_28";
	house_28 = _this;
	_this setDir 15.0755;
	_this setPos [23509.301, 21177, 0.82785147];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_28""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_28"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_28"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [23509.521, 21172.914, -0.1538123];
	_vehicle_006 = _this;
	_this setDir 16.0056;
	_this setPos [23509.521, 21172.914, -0.1538123];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_28"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 91
_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25680.498, 21348.918];
	_vehicle_007 = _this;
	_this setDir -44.2504;
	_this setPos [25680.498, 21348.918];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_91"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25675.65, 21353.416, 0.23235515];
	_vehicle_008 = _this;
	_this setVehicleVarName "house_91";
	house_91 = _this;
	_this setDir 43.9078;
	_this setPos [25675.65, 21353.416, 0.23235515];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_91""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_91"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_91"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 92
_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25668.6, 21334];
	_vehicle_009 = _this;
	_this setDir -44.2504;
	_this setPos [25668.6, 21334];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_92"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25662.061, 21340.895, 0.0056121945];
	_vehicle_010 = _this;
	_this setVehicleVarName "house_92";
	house_92 = _this;
	_this setDir 43.9078;
	_this setPos [25662.061, 21340.895, 0.0056121945];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_92""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_92"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_92"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 93
_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25707.342, 21347.379, -0.30048025];
	_vehicle_011 = _this;
	_this setDir 134;
	_this setPos [25707.342, 21347.379, -0.30048025];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_93"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25716.039, 21339.373, 0.28489515];
	_vehicle_012 = _this;
	_this setVehicleVarName "house_93";
	house_93 = _this;
	_this setDir 43.9078;
	_this setPos [25716.039, 21339.373, 0.28489515];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_93""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_93"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_93"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 94
_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25728.467, 21392.502];
	_vehicle_013 = _this;
	_this setDir -45.7269;
	_this setPos [25728.467, 21392.502];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_94"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25725.646, 21397.881, 0.19451578];
	_vehicle_014 = _this;
	_this setVehicleVarName "house_94";
	house_94 = _this;
	_this setDir 43.9078;
	_this setPos [25725.646, 21397.881, 0.19451578];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_94""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_94"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_94"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 95
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25753.393, 21391.658];
	_vehicle_015 = _this;
	_this setDir 226.519;
	_this setPos [25753.393, 21391.658];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_95"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25749.361, 21386.434, 0.41316622];
	_vehicle_016 = _this;
	_this setVehicleVarName "house_95";
	house_95 = _this;
	_this setDir -45.3625;
	_this setPos [25749.361, 21386.434, 0.41316622];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_95""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_95"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_95"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 96
_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25802, 21465.301, -0.33524436];
	_vehicle_017 = _this;
	_this setDir -406.347;
	_this setPos [25802, 21465.301, -0.33524436];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_96"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25793.6, 21473.4, 0.19785434];
	_vehicle_018 = _this;
	_this setVehicleVarName "house_96";
	house_96 = _this;
	_this setDir -134.794;
	_this setPos [25793.6, 21473.4, 0.19785434];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_96""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_96"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_96"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 97
_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25780.1,21446.1,0];
	_vehicle_019 = _this;
	_this setDir -406.347;
	_this setPos [25780.1,21446.1,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_97"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25773.5,21452.9,0];
	_vehicle_020 = _this;
	_this setVehicleVarName "house_97";
	house_97 = _this;
	_this setDir -134.794;
	_this setPos [25773.5,21452.9,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_97""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_97"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_97"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 98
_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25752.004, 21421.482];
	_vehicle_021 = _this;
	_this setDir -316.916;
	_this setPos [25752.004, 21421.482];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_98"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25755.975, 21426.668, 0.34238482];
	_vehicle_022 = _this;
	_this setVehicleVarName "house_98";
	house_98 = _this;
	_this setDir -45.3625;
	_this setPos [25755.975, 21426.668, 0.34238482];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_98""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_98"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_98"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 99
_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25750.1, 21359.9, -0.11560141];
	_vehicle_023 = _this;
	_this setDir -317.343;
	_this setPos [25750.1, 21359.9, -0.11560141];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_99"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25756.316, 21366.623, 0.42860922];
	_vehicle_024 = _this;
	_this setVehicleVarName "house_99";
	house_99 = _this;
	_this setDir -45.7898;
	_this setPos [25756.316, 21366.623, 0.42860922];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_99""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_99"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_99"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 100
_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25614.148, 21349.186];
	_vehicle_025 = _this;
	_this setDir 134.694;
	_this setPos [25614.148, 21349.186];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_100"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25620.301, 21342, 0.50209898];
	_vehicle_026 = _this;
	_this setVehicleVarName "house_100";
	house_100 = _this;
	_this setDir 48.3051;
	_this setPos [25620.301, 21342, 0.50209898];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_100""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_100"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_100"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 101
_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25669.719, 21308.799];
	_vehicle_027 = _this;
	_this setDir -226.648;
	_this setPos [25669.719, 21308.799];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_101"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25677.803, 21304.309, 0.25878707];
	_vehicle_028 = _this;
	_this setVehicleVarName "house_101";
	house_101 = _this;
	_this setDir 135.684;
	_this setPos [25677.803, 21304.309, 0.25878707];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_101""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_101"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_101"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 102
_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25574.496, 21341.402, -0.13051389];
	_vehicle_029 = _this;
	_this setDir 45.9703;
	_this setPos [25574.496, 21341.402, -0.13051389];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_102"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25576.6, 21347.4, 0.081556894];
	_vehicle_030 = _this;
	_this setVehicleVarName "house_102";
	house_102 = _this;
	_this setDir 44.1628;
	_this setPos [25576.6, 21347.4, 0.081556894];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_102""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_102"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_102"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 103
_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25638.779, 21274.586, -0.10529197];
	_vehicle_031 = _this;
	_this setDir -226.648;
	_this setPos [25638.779, 21274.586, -0.10529197];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_103"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25646.301, 21279.4, -0.032397557];
	_vehicle_032 = _this;
	_this setVehicleVarName "house_103";
	house_103 = _this;
	_this setDir 135.684;
	_this setPos [25646.301, 21279.4, -0.032397557];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_103""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_103"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_103"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//NEW
//Haus 163
_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25599.975, 21362.287, 0.22839558];
	_vehicle_033 = _this;
	_this setVehicleVarName "house_163";
	house_163 = _this;
	_this setDir -46.264549;
	_this setPos [25599.975, 21362.287, 0.22839558];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_163"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25593.146, 21360.785, 0.38871405];
	_vehicle_034 = _this;
	_this setDir -44.991573;
	_this setPos [25593.146, 21360.785, 0.38871405];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_163""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_163"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_163"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 164
_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25655.273, 21355.828, -1.1444092e-005];
	_vehicle_035 = _this;
	_this setDir -132.84097;
	_this setPos [25655.273, 21355.828, -1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_164"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25652.854, 21349.967, 0.2920627];
	_vehicle_036 = _this;
	_this setDir -40.840893;
	_this setVehicleVarName "house_164";
	house_164 = _this;
	_this setPos [25652.854, 21349.967, 0.2920627];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_164""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_164"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_164"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 165
_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25651.9, 21388.281, 0.19135071];
	_vehicle_037 = _this;
	_this setDir -8.3217249;
	_this setPos [25651.9, 21388.281, 0.19135071];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_165"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25649.143, 21392.77, 0.27261654];
	_vehicle_038 = _this;
	_this setVehicleVarName "house_165";
	house_165 = _this;
	_this setDir -40.840893;
	_this setPos [25649.143, 21392.77, 0.27261654];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_165""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_165"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_165"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 166
_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25581.861, 21386.125, 0.18685338];
	_vehicle_039 = _this;
	_this setDir -135.50758;
	_this setPos [25581.861, 21386.125, 0.18685338];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_166"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25582.965, 21379.074, 0.49835077];
	_vehicle_040 = _this;
	_this setVehicleVarName "house_166";
	house_166 = _this;
	_this setDir -135.01295;
	_this setPos [25582.965, 21379.074, 0.49835077];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_166""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_166"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_166"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 167
_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25734.283, 21250.223, 0.26315454];
	_vehicle_041 = _this;
	_this setDir -43.676861;
	_this setPos [25734.283, 21250.223, 0.26315454];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_167"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25735.369, 21257.623, 0.22487541];
	_vehicle_042 = _this;
	_this setVehicleVarName "house_167";
	house_167 = _this;
	_this setDir -134.71111;
	_this setPos [25735.369, 21257.623, 0.22487541];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_167""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_167"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_167"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 168
_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25741.338, 21257.072, 0.3910625];
	_vehicle_043 = _this;
	_this setDir -47.637833;
	_this setPos [25741.338, 21257.072, 0.3910625];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_168"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25742.404, 21264.521, 0.18466197];
	_vehicle_044 = _this;
	_this setVehicleVarName "house_168";
	house_168 = _this;
	_this setDir -134.64873;
	_this setPos [25742.404, 21264.521, 0.18466197];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_168""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_168"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_168"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 169
_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25761.271, 21333.434, 0.13021709];
	_vehicle_045 = _this;
	_this setDir -137.04248;
	_this setPos [25761.271, 21333.434, 0.13021709];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_169"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25762.525, 21326.348, 0.46061632];
	_vehicle_046 = _this;
	_this setVehicleVarName "house_169";
	house_169 = _this;
	_this setDir -134.64873;
	_this setPos [25762.525, 21326.348, 0.46061632];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_169""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_169"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_169"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 170
_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25545.965, 21246.662, 0.00020599365];
	_vehicle_047 = _this;
	_this setDir -319.22043;
	_this setPos [25545.965, 21246.662, 0.00020599365];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_170"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25549.543, 21255.227, 0.14442404];
	_vehicle_048 = _this;
	_this setVehicleVarName "house_170";
	house_170 = _this;
	_this setDir -136.87946;
	_this setPos [25549.543, 21255.227, 0.14442404];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_170""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_170"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_170"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 171
_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25511.244, 21250.59, -6.4849854e-005];
	_vehicle_049 = _this;
	_this setDir -495.60855;
	_this setPos [25511.244, 21250.59, -6.4849854e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_171"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25506.43, 21249.215, 0.20459199];
	_vehicle_050 = _this;
	_this setVehicleVarName "house_171";
	house_171 = _this;
	_this setDir -137.22845;
	_this setPos [25506.43, 21249.215, 0.20459199];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_171""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_171"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_171"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 172
_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25433.695, 21429.713, 1.9073486e-005];
	_vehicle_051 = _this;
	_this setDir -672.01428;
	_this setPos [25433.695, 21429.713, 1.9073486e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_172"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [25446.084, 21438.754, 0.20328246];
	_vehicle_052 = _this;
	_this setVehicleVarName "house_172";
	house_172 = _this;
	_this setDir -147.33287;
	_this setPos [25446.084, 21438.754, 0.20328246];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_172""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_172"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_172"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Restlicher Schrott
_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createvehiclelocal [25827.3,21427.9,0];
	_vehicle_053 = _this;
	_this setDir -44.7493;
	_this setPos [25827.3,21427.9,0];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [23507.1, 21156.801];
	_vehicle_054 = _this;
	_this setDir -258.503;
	_this setPos [23507.1, 21156.801];
	_this allowDamage false;  
	_this enableSimulation false;
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;