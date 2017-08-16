/*
	File: housing-kavala.sqf
	Author: KOMA
	Edited: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com
	
	Information: Objekte:139 | Housing Kavala
*/

_initCodes =[];

//OLD
//Haus 01
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_i_House_Big_02_V1_F" createvehiclelocal [3584.7661, 13638.209, 0.092602491];
	_vehicle_001 = _this;
	_this setDir -444.067;
	_this setPos [3584.7661, 13638.209, 0.092602491];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3581.6035, 13641.909, 3.6844525];
	_vehicle_002 = _this;
	_this setVehicleVarName "house_01";
	house_01 = _this;
	_this setDir 95.3489;
	_this setPos [3581.6035, 13641.909, 3.6844525];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_01""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_01"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_01"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3601.731, 13623.208];
	_vehicle_003 = _this;
	_this setDir -445.829;
	_this setPos [3601.731, 13623.208];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_01"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 02
_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3705.1433, 13234.244, 0.32069182];
	_vehicle_004 = _this;
	_this setDir -148.319;
	_this setPos [3705.1433,13234.244,0.32069182];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_02"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this ="Land_ShelvesWooden_F" createvehiclelocal [3696.05, 13229.3, 0.44027442];
	_vehicle_005 = _this;
	_this setVehicleVarName "house_02";
	house_02 = _this;
	_this setDir 182.353;
	_this setPos [3696.05, 13229.3, 0.44027442];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_02""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_02"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_02"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 03
_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3691.5217, 13258.688, 0.094744682];
	_vehicle_006 = _this;
	_this setDir -325.936;
	_this setPos [3691.5217, 13258.688, 0.094744682];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_03"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3688.7981, 13266.278, 0.49268156];
	_vehicle_007 = _this;
	_this setVehicleVarName "house_03";
	house_03 = _this;
	_this setDir 206.785;
	_this setPos [3688.7981, 13266.278, 0.49268156];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_03""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_03"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_03"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 04
_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3711.7424, 13250.307, 0.26540953];
	_vehicle_008 = _this;
	_this setDir -330.125;
	_this setPos [3711.7424, 13250.307, 0.26540953];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_04"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3709.3201, 13256.7, 0.57678956];
	_vehicle_009 = _this;
	_this setVehicleVarName "house_04";
	house_04 = _this;
	_this setDir 213.908;
	_this setPos [3709.3201, 13256.7, 0.57678956];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_04""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_04"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_04"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 05
_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3600.6653, 13259.834, 0.30017385];
	_vehicle_010 = _this;
	_this setDir -405.454;
	_this setPos [3600.6653, 13259.834, 0.30017385];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_05"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3594.2676, 13259.058, 1.0135627];
	_vehicle_011 = _this;
	_this setVehicleVarName "house_05";
	house_05 = _this;
	_this setDir 405.798;
	_this setPos [3594.2676, 13259.058, 1.0135627];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_05""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_05"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_05"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
_this enableSimulation false; _this allowDamage false;};

//Haus 06
_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3550.4663, 13242.699, 0.18253857];
	_vehicle_012 = _this;
	_this setDir -321.674;
	_this setPos [3550.4663, 13242.699, 0.18253857];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_06"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3554.0569, 13251.186, 0.24598813];
	_vehicle_013 = _this;
	_this setVehicleVarName "house_06";
	house_06 = _this;
	_this setDir 536.048;
	_this setPos [3554.0569, 13251.186, 0.24598813];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_06""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_06"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_06"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 07
_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3565.2805, 13195.984, 0.067955337];
	_vehicle_014 = _this;
	_this setDir -584.929;
	_this setPos [3565.2805, 13195.984, 0.067955337];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_07"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3574.01, 13191.7, 0.23218183];
	_vehicle_015 = _this;
	_this setVehicleVarName "house_07";
	house_07 = _this;
	_this setDir 670.906;
	_this setPos [3574.01, 13191.7, 0.23218183];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_07""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_07"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_07"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 08
_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3600.916, 13617.898, 0.061734267];
	_vehicle_016 = _this;
	_this setDir -445.829;
	_this setPos [3600.916, 13617.898, 0.061734267];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_08"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3569.7112, 13617.163, 0.23780577];
	_vehicle_017 = _this;
	_this setVehicleVarName "house_08";
	house_08 = _this;
	_this setDir 94.3372;
	_this setPos [3569.7112, 13617.163, 0.23780577];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_08""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_08"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_08"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 09
_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3601,13128.8,0];
	_vehicle_018 = _this;
	_this setDir -904.955;
	_this setPos [3601,13128.8,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_09"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3598.8401, 13113.2, 0.46044371];
	_vehicle_019 = _this;
	_this setVehicleVarName "house_09";
	house_09 = _this;
	_this setDir 186.785;
	_this setPos [3598.8401, 13113.2, 0.46044371];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_09""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_09"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_09"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 10
_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3590.2673, 13156.539, 0.48656294];
	_vehicle_021 = _this;
	_this setDir -820.58423;
	_this setPos [3590.2673, 13156.539, 0.48656294];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3584.2656, 13154.271, 0.83194387];
	_vehicle_022 = _this;
	_this setDir 168.105;
	_this setPos [3584.2656, 13154.271, 0.83194387];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_10""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_10"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 11
_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3683.2, 13092.4, 0.52489388];
	_vehicle_023 = _this;
	_this setDir -269.624;
	_this setPos [3683.2, 13092.4, 0.52489388];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3692.304, 13087.485, 0.30602658];
	_vehicle_024 = _this;
	_this setVehicleVarName "house_11";
	house_11 = _this;
	_this setDir 180.036;
	_this setPos [3692.304, 13087.485, 0.30602658];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_11""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_11"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 12
_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3604.65,13078.3,0];
	_vehicle_025 = _this;
	_this setDir -445.016;
	_this setPos [3604.65,13078.3,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3596.7, 13081.5, 0.18774046];
	_vehicle_026 = _this;
	_this setVehicleVarName "house_12";
	house_12 = _this;
	_this setDir 164.658;
	_this setPos [3596.7, 13081.5, 0.18774046];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_12""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_12"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 13
_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3385.9175, 13224.736, 0.67234218];
	_vehicle_027 = _this;
	_this setVehicleVarName "house_13";
	house_13 = _this;
	_this setDir -132.053;
	_this setPos [3385.9175, 13224.736, 0.67234218];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_13""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_13"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3383.6143, 13224.285, 0.11897796];
	_vehicle_028 = _this;
	_this setDir -577.293;
	_this setPos [3383.6143, 13224.285, 0.11897796];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 14
_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3373.0117, 13215.783];
	_vehicle_029 = _this;
	_this setDir -577.293;
	_this setPos [3373.0117, 13215.783];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3378.0547, 13218.338, 0.56018662];
	_vehicle_030 = _this;
	_this setVehicleVarName "house_14";
	house_14 = _this;
	_this setDir -132.053;
	_this setPos [3378.0547, 13218.338, 0.56018662];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_14""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_14"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 15
_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3355.3164, 13195.282, 0.23342198];
	_vehicle_031 = _this;
	_this setVehicleVarName "house_15";
	house_15 = _this;
	_this setDir -38.3659;
	_this setPos [3355.3164, 13195.282, 0.23342198];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_15""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_15"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3350.4585, 13198.189, 0.28843299];
	_vehicle_032 = _this;
	_this setDir -577.569;
	_this setPos [3350.4585, 13198.189, 0.28843299];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 16
_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3405.1621, 13241.082, 0.31517291];
	_vehicle_033 = _this;
	_this setVehicleVarName "house_16";
	house_16 = _this;
	_this setDir -132.053;
	_this setPos [3405.1621, 13241.082, 0.31517291];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_16""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_16"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_16"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3402.8315, 13240.764];
	_vehicle_034 = _this;
	_this setDir -586.059;
	_this setPos [3402.8315, 13240.764];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_16"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 17
_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3452.04, 13288.1, 0.42049891];
	_vehicle_035 = _this;
	_this setVehicleVarName "house_17";
	house_17 = _this;
	_this setDir -143.976;
	_this setPos [3452.04, 13288.1, 0.42049891];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_17""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_17"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_17""]; "];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3447.7122, 13290.131, 0.30569774];
	_vehicle_036 = _this;
	_this setDir -953.007;
	_this setPos [3447.7122, 13290.131, 0.30569774];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_17"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 18
_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3504.77, 13253, 0.4105286];
	_vehicle_037 = _this;
	_this setVehicleVarName "house_18";
	house_18 = _this;
	_this setDir 40.7439;
	_this setPos [3504.77, 13253, 0.4105286];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_18""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_18"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_18"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3503.1599, 13259.5, 0.45321348];
	_vehicle_038 = _this;
	_this setDir -495.943;
	_this setPos [3503.1599, 13259.5, 0.45321348];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_18"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 19
_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3468.7151, 12769.146, 0.7529403];
	_vehicle_039 = _this;
	_this setVehicleVarName "house_19";
	house_19 = _this;
	_this setDir -151.148;
	_this setPos [3468.7151, 12769.146, 0.7529403];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_19""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_19"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_19"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3471.2488, 12762.821];
	_vehicle_040 = _this;
	_this setDir -687.091;
	_this setPos [3471.2488, 12762.821];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_19"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 20
_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3697.29, 11643.2];
	_vehicle_041 = _this;
	_this setDir -773.97284;
	_this setPos [3697.29, 11643.2];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_20"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3696.8799, 11656.2, 0.23439816];
	_vehicle_042 = _this;
	_this setVehicleVarName "house_20";
	house_20 = _this;
	_this setDir 670.906;
	_this setPos [3696.8799, 11656.2, 0.23439816];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_20""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_20"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_20"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 21
_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3636.5593, 11631.198, -0.20364331];
	_vehicle_043 = _this;
	_this setDir -486.732;
	_this setPos [3636.5593, 11631.198, -0.20364331];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_21"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3635.6399, 11627.6, 0.30842414];
	_vehicle_044 = _this;
	_this setVehicleVarName "house_21";
	house_21 = _this;
	_this setDir 683.627;
	_this setPos [3635.6399, 11627.6, 0.30842414];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_21""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_21"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_21"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 22
_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3624.1646, 11567.96, -0.11954528];
	_vehicle_045 = _this;
	_this setDir -406.779;
	_this setPos [3624.1646, 11567.96, -0.11954528];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_22"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3611.4268, 11579.839, 0.75102848];
	_vehicle_046 = _this;
	_this setVehicleVarName "house_22";
	house_22 = _this;
	_this setDir 763.204;
	_this setPos [3611.4268, 11579.839, 0.75102848];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_22""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_22"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_22"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 25
_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [4690.4688, 21357.43, 0.93649399];
	_vehicle_047 = _this;
	_this setDir 441.357;
	_this setPos [4690.4688, 21357.43, 0.93649399];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_25"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [4696.9199, 21352.5, 0.64690036];
	_vehicle_048 = _this;
	_this setVehicleVarName "house_25";
	house_25 = _this;
	_this setDir 442.42;
	_this setPos [4696.9199, 21352.5, 0.64690036];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_25""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_25"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_25"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 26
_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3572.21, 13230.2, 0.32780984];
	_vehicle_049 = _this;
	_this setDir -681.286;
	_this setPos [3572.21, 13230.2, 0.32780984];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_26""]; this setVectorUp [0,0,1]"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3575.1101, 13236.1, 0.37731498];
	_vehicle_050 = _this;
	_this setVehicleVarName "house_26";
	house_26 = _this;
	_this setDir 574.548;
	_this setPos [3575.1101, 13236.1, 0.37731498];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_26""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_26"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_26"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 27
_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [4669.1738, 21385.881];
	_vehicle_051 = _this;
	_this setDir 440.828;
	_this setPos [4669.1738, 21385.881];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_27"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [4691.667, 21384.736, 0.83422214];
	_vehicle_052 = _this;
	_this setVehicleVarName "house_27";
	house_27 = _this;
	_this setDir 344.023;
	_this setPos [4691.667, 21384.736, 0.83422214];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_27""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_27"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_27"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 29
_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3428.9299, 12635.331, 0.4305605];
	_vehicle_053 = _this;
	_this setVehicleVarName "house_29";
	house_29 = _this;
	_this setDir -420.247;
	_this setPos [3428.9299, 12635.331, 0.4305605];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_29""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_29"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_29"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3421.1863, 12635.747, -0.10216966];
	_vehicle_054 = _this;
	_this setDir -1319.45;
	_this setPos [3421.1863, 12635.747, -0.10216966];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_29"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 30
_vehicle_055 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3594.18,13041.9,0];
	_vehicle_055 = _this;
	_this setDir -856.13;
	_this setPos [3594.18,13041.9,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_30""]; this setVectorUp [0,0,1]"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3588.96, 13034.7, 1.132145];
	_vehicle_056 = _this;
	_this setVehicleVarName "house_30";
	house_30 = _this;
	_this setDir 399.704;
	_this setPos [3588.96, 13034.7, 1.132145];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_30""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_30"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_30"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 31
_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [8564.6074, 18168.971];
	_vehicle_057 = _this;
	_this setVehicleVarName "house_31";
	house_31 = _this;
	_this setDir -237.365;
	_this setPos [8564.6074, 18168.971];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_31""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_31"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_31"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [8568.8369, 18169.957];
	_vehicle_058 = _this;
	_this setDir -474.983;
	_this setPos [8568.8369, 18169.957];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_31"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 32
_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [4128.3359, 12421.812, 0.33170086];
	_vehicle_059 = _this;
	_this setVehicleVarName "house_32";
	house_32 = _this;
	_this setDir -733.894;
	_this setPos [4128.3359, 12421.812, 0.33170086];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_32""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_32"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_32"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_060 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [4144.1,12445.3,0];
	_vehicle_060 = _this;
	_this setDir -1242.14;
	_this setPos [4144.1,12445.3,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_32"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 33
_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [4079.1399, 12471.9, 0.23288377];
	_vehicle_061 = _this;
	_this setVehicleVarName "house_33";
	house_33 = _this;
	_this setDir -320.816;
	_this setPos [4079.1399, 12471.9, 0.23288377];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_33""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_33"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_33"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_062 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [4095.9326, 12469.647, -0.20376202];
	_vehicle_062 = _this;
	_this setDir -856.87207;
	_this setPos [4095.9326, 12469.647, -0.20376202];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_33"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 34
_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3567.3601, 13112.7, 0.32832062];
	_vehicle_063 = _this;
	_this setVehicleVarName "house_34";
	house_34 = _this;
	_this setDir -108.051;
	_this setPos [3567.3601, 13112.7, 0.32832062];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_34""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_34"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_34"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
_this enableSimulation false; _this allowDamage false;};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3564.4011, 13121.468, 0.30689031];
	_vehicle_064 = _this;
	_this setDir -917.082;
	_this setPos [3564.4011, 13121.468, 0.30689031];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_34"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 35
_vehicle_065 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3703.2053, 13016.627, 0.66940701];
	_vehicle_065 = _this;
	_this setVehicleVarName "house_35";
	house_35 = _this;
	_this setDir 22.6717;
	_this setPos [3703.2053, 13016.627, 0.66940701];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_35""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_35"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_35"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3710.4399, 13019, 0.11865745];
	_vehicle_066 = _this;
	_this setDir -786.359;
	_this setPos [3710.4399, 13019, 0.11865745];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_35"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 36
_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3650.2219, 12913.352, 0.51149464];
	_vehicle_067 = _this;
	_this setVehicleVarName "house_36";
	house_36 = _this;
	_this setDir -1.81408;
	_this setPos [3650.2219, 12913.352, 0.51149464];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_36""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_36"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_36"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_068 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3656.6382, 12916.468];
	_vehicle_068 = _this;
	_this setDir -810.845;
	_this setPos [3656.6382, 12916.468];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_36"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 37
_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3539.8999, 13076, 0.81034434];
	_vehicle_069 = _this;
	_this setVehicleVarName "house_37";
	house_37 = _this;
	_this setDir 133.862;
	_this setPos [3539.8999, 13076, 0.81034434];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_37""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_37"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_37"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3537.3706, 13070.16, -0.034035951];
	_vehicle_070 = _this;
	_this setDir -675.169;
	_this setPos [3537.3706, 13070.16, -0.034035951];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_37"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 38
_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3510.6399, 13055.7, 0.101136];
	_vehicle_071 = _this;
	_this setVehicleVarName "house_38";
	house_38 = _this;
	_this setDir 45.5787;
	_this setPos [3510.6399, 13055.7, 0.101136];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_38""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_38"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_38"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_072 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3510.0701, 13064.3, 0.20525748];
	_vehicle_072 = _this;
	_this setDir -855.313;
	_this setPos [3510.0701, 13064.3, 0.20525748];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_38"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 39
_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3479.6201, 13177.4, 0.25187525];
	_vehicle_073 = _this;
	_this setDir -539.39;
	_this setPos [3479.6201, 13177.4, 0.25187525];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_39"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3479.99, 13171.7, 0.15844452];
	_vehicle_074 = _this;
	_this setVehicleVarName "house_39";
	house_39 = _this;
	_this setDir 357.45;
	_this setPos [3479.99, 13171.7, 0.15844452];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_39""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_39"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_39"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 40
_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3474.89,13201.8,0];
	_vehicle_075 = _this;
	_this setVehicleVarName "house_40";
	house_40 = _this;
	_this setDir 90.0152;
	_this setPos [3474.89,13201.8,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_40""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_40"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_40"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_076 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3477.15,13195.6,0];
	_vehicle_076 = _this;
	_this setDir -719.016;
	_this setPos [3477.15,13195.6,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_40"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 41
_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3487.78,13200.3,0];
	_vehicle_077 = _this;
	_this setVehicleVarName "house_41";
	house_41 = _this;
	_this setDir 90.0152;
	_this setPos [3487.78,13200.3,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_41""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_41"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_41"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3487.3,13195.9,0];
	_vehicle_078 = _this;
	_this setDir -1077.85;
	_this setPos [3487.3,13195.9,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_41"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 42
_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3508.8301, 13161.1, 0.15116604];
	_vehicle_079 = _this;
	_this setDir -405.186;
	_this setPos [3508.8301, 13161.1, 0.15116604];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_42"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_080 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3504.45, 13164.9, 0.46855667];
	_vehicle_080 = _this;
	_this setVehicleVarName "house_42";
	house_42 = _this;
	_this setDir 491.654;
	_this setPos [3504.45, 13164.9, 0.46855667];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_42""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_42"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_42"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 43
_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3445.1899, 13150.2, 0.075181931];
	_vehicle_081 = _this;
	_this setDir -318.066;
	_this setPos [3445.1899, 13150.2, 0.075181931];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_43"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3447.4399, 13155.4, 0.61807603];
	_vehicle_082 = _this;
	_this setVehicleVarName "house_43";
	house_43 = _this;
	_this setDir 578.774;
	_this setPos [3447.4399, 13155.4, 0.61807603];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_43""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_43"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_43"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 44
_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3450.9299, 13144.1, 0.1523478];
	_vehicle_083 = _this;
	_this setDir -318.066;
	_this setPos [3450.9299, 13144.1, 0.1523478];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_44"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setvectorup [0,0,1];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_084 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3456.1499, 13147.9, 0.4320994];
	_vehicle_084 = _this;
	_this setVehicleVarName "house_44";
	house_44 = _this;
	_this setDir 675.267;
	_this setPos [3456.1499, 13147.9, 0.4320994];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_44""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_44"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_44"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 45
_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3621.1,13033.3,0];
	_vehicle_085 = _this;
	_this setDir -988.287;
	_this setPos [3621.1,13033.3,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_45""]; this setVectorUp [0,0,1]"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3632.3899, 13034.9, 0.54905266];
	_vehicle_086 = _this;
	_this setVehicleVarName "house_45";
	house_45 = _this;
	_this setDir 267.547;
	_this setPos [3632.3899, 13034.9, 0.54905266];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_45""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_45"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_45"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 46
_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3515.8999, 13187.3, 0.35719216];
	_vehicle_087 = _this;
	_this setVehicleVarName "house_46";
	house_46 = _this;
	_this setDir -228.628;
	_this setPos [3515.8999, 13187.3, 0.35719216];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_46""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_46"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_46"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];this enablesimulation false; this allowdamage false;"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_088 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3514.07,13182,0];
	_vehicle_088 = _this;
	_this setDir -1037.66;
	_this setPos [3514.07,13182,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_46"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 47
_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3563.15,13137,0];
	_vehicle_089 = _this;
	_this setDir -733.225;
	_this setPos [3563.15,13137,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_47""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_090 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3554.46, 13136.7, 0.41293168];
	_vehicle_090 = _this;
	_this setVehicleVarName "house_47";
	house_47 = _this;
	_this setDir 436.422;
	_this setPos [3554.46, 13136.7, 0.41293168];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_47""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_47"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_47"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 48
_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3528.1299, 13134.5, 0.0681137];
	_vehicle_091 = _this;
	_this setDir -676.269;
	_this setPos [3528.1299, 13134.5, 0.0681137];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_48""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_092 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [3531.2542, 13143.085, 0.91011602];
	_vehicle_092 = _this;
	_this setVehicleVarName "house_48";
	house_48 = _this;
	_this setDir 493.378;
	_this setPos [3531.2542, 13143.085, 0.91011602];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_48""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_48"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_48"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 49
_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3709.1086, 13034.826, 0.96792251];
	_vehicle_093 = _this;
	_this setVehicleVarName "house_49";
	house_49 = _this;
	_this setDir 22.6717;
	_this setPos [3709.1086, 13034.826, 0.96792251];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_49""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_49"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_49"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3714.8857, 13038.033, 0.45850191];
	_vehicle_094 = _this;
	_this setDir -786.359;
	_this setPos [3714.8857, 13038.033, 0.45850191];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_49""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 50
_vehicle_095 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3719.2747, 13049.873, 0.53206867];
	_vehicle_095 = _this;
	_this setVehicleVarName "house_50";
	house_50 = _this;
	_this setDir 284.621;
	_this setPos [3719.2747, 13049.873, 0.53206867];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_50""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_50"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_50"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3723.5566, 13050.891, 0.12801798];
	_vehicle_096 = _this;
	_this setDir -798.672;
	_this setPos [3723.5566, 13050.891, 0.12801798];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_50""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 51
_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3689.25, 12992.3, 0.44342718];
	_vehicle_097 = _this;
	_this setVehicleVarName "house_51";
	house_51 = _this;
	_this setDir -71.099;
	_this setPos [3689.25, 12992.3, 0.44342718];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_51""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_51"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_51"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3691.0527, 13001.09, 0.4211311];
	_vehicle_098 = _this;
	_this setDir -887.356;
	_this setPos [3691.0527, 13001.09, 0.4211311];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_51""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 52
_vehicle_099 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3674.5449, 12998.355, 0.78733665];
	_vehicle_099 = _this;
	_this setVehicleVarName "house_52";
	house_52 = _this;
	_this setDir -71.099;
	_this setPos [3674.5449, 12998.355, 0.78733665];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_52""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_52"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_52"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3681.9399, 13005.6, 0.33358923];
	_vehicle_100 = _this;
	_this setDir -887.356;
	_this setPos [3681.9399, 13005.6, 0.33358923];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_52""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 53
_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [3651.0581, 13004.577, 0.54645735];
	_vehicle_101 = _this;
	_this setVehicleVarName "house_53";
	house_53 = _this;
	_this setDir -71.099;
	_this setPos [3651.0581, 13004.577, 0.54645735];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_53""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_53"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_53"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_102 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3654.3401, 13011, 0.92026973];
	_vehicle_102 = _this;
	_this setDir -887.356;
	_this setPos [3654.3401, 13011, 0.92026973];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_53""];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//NEW
//Haus 147
_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3563.1946, 12505.553, 0.21035826];
	_vehicle_103 = _this;
	_this setVehicleVarName "house_147";
	house_147 = _this;
	_this setDir -46.268204;
	_this setPos [3563.1946, 12505.553, 0.21035826];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_147""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_147"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_147"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3562.1292, 12514.777, 1.4389052];
	_vehicle_104 = _this;
	_this setDir 133.75917;
	_this setPos [3562.1292, 12514.777, 1.4389052];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_147""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 148
_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3560.5779, 12506.08, 0.9429757];
	_vehicle_105 = _this;
	_this setVehicleVarName "house_148";
	house_148 = _this;
	_this setDir -47.204739;
	_this setPos [3560.5779, 12506.08, 0.9429757];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_148""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_148"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_148"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3557.3118, 12505.624, 0.82273513];
	_vehicle_106 = _this;
	_this setDir 133.75917;
	_this setPos [3557.3118, 12505.624, 0.82273513];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_148""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 149
_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3571.0322, 12471.017, 0.27187836];
	_vehicle_107 = _this;
	_this setVehicleVarName "house_149";
	house_149 = _this;
	_this setDir -45.819199;
	_this setPos [3571.0322, 12471.017, 0.27187836];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_149""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_149"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_149"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3570.6318, 12479.183, 1.1181246];
	_vehicle_108 = _this;
	_this setDir 133.75917;
	_this setPos [3570.6318, 12479.183, 1.1181246];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_149""];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 150
_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3567.0732, 12465.807, 0.57060283];
	_vehicle_109 = _this;
	_this setVehicleVarName "house_150";
	house_150 = _this;
	_this setDir -138.72581;
	_this setPos [3567.0732, 12465.807, 0.57060283];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_150""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_150"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_150"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3565.1997, 12470.486, 1.0011811];
	_vehicle_110 = _this;
	_this setDir 133.9115;
	_this setPos [3565.1997, 12470.486, 1.0011811];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_150""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 151
_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3527.084, 12471.026, 0.71175873];
	_vehicle_111 = _this;
	_this setVehicleVarName "house_151";
	house_151 = _this;
	_this setDir -170.87427;
	_this setPos [3527.084, 12471.026, 0.71175873];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_151""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_151"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_151"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3526.0203, 12477.844, 1.0012251];
	_vehicle_112 = _this;
	_this setDir 276.82864;
	_this setPos [3526.0203, 12477.844, 1.0012251];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_151""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 152
_vehicle_113 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3511.2129, 12472.679, 0.80300659];
	_vehicle_113 = _this;
	_this setVehicleVarName "house_152";
	house_152 = _this;
	_this setDir -259.74127;
	_this setPos [3511.2129, 12472.679, 0.80300659];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_152""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_152"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_152"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3515.6118, 12476.593, 0.89851397];
	_vehicle_114 = _this;
	_this setDir 192.48618;
	_this setPos [3515.6118, 12476.593, 0.89851397];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_152""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 153
_vehicle_115 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3497.4172, 12476.419, 0.35007158];
	_vehicle_115 = _this;
	_this setVehicleVarName "house_153";
	house_153 = _this;
	_this setDir -260.84888;
	_this setPos [3497.4172, 12476.419, 0.35007158];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_153""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_153"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_153"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3497.106, 12480.986, 0.43691549];
	_vehicle_116 = _this;
	_this setDir 190.60422;
	_this setPos [3497.106, 12480.986, 0.43691549];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_153""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 154
_vehicle_117 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3488.52, 12475.346, 0.73773098];
	_vehicle_117 = _this;
	_this setVehicleVarName "house_154";
	house_154 = _this;
	_this setDir -171.60188;
	_this setPos [3488.52, 12475.346, 0.73773098];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_154""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_154"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_154"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3487.0559, 12482.607, 0.78818667];
	_vehicle_118 = _this;
	_this setDir 188.14786;
	_this setPos [3487.0559, 12482.607, 0.78818667];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_154""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 155
_vehicle_119 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3499.6636, 12423.497, 1.1138358];
	_vehicle_119 = _this;
	_this setVehicleVarName "house_155";
	house_155 = _this;
	_this setDir -171.60188;
	_this setPos [3499.6636, 12423.497, 1.1138358];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_155""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_155"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_155"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3496.7622, 12417.64, 0.26327232];
	_vehicle_120 = _this;
	_this setDir 370.11789;
	_this setPos [3496.7622, 12417.64, 0.26327232];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_155""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 156
_vehicle_121 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3522.3752, 12413.894, 0.5717659];
	_vehicle_121 = _this;
	_this setVehicleVarName "house_156";
	house_156 = _this;
	_this setDir -157.04945;
	_this setPos [3522.3752, 12413.894, 0.5717659];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_156""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_156"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_156"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3526.1936, 12407.793, 0.085275009];
	_vehicle_122 = _this;
	_this setDir 383.77234;
	_this setPos [3526.1936, 12407.793, 0.085275009];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_156""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 157
_vehicle_123 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3552.3474, 12395.036, 0.53288209];
	_vehicle_123 = _this;
	_this setVehicleVarName "house_157";
	house_157 = _this;
	_this setDir -73.524643;
	_this setPos [3552.3474, 12395.036, 0.53288209];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_157""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_157"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_157"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3559.4321, 12394.765, 0.43054283];
	_vehicle_124 = _this;
	_this setDir 374.05078;
	_this setPos [3559.4321, 12394.765, 0.43054283];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_157""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 158
_vehicle_125 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3576.2769, 12400.387, 0.20296584];
	_vehicle_125 = _this;
	_this setVehicleVarName "house_158";
	house_158 = _this;
	_this setDir -75.819328;
	_this setPos [3576.2769, 12400.387, 0.20296584];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_158""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_158"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_158"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3577.1482, 12394.352, -1.1444092e-005];
	_vehicle_126 = _this;
	_this setDir 376.24948;
	_this setPos [3577.1482, 12394.352, -1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_158""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 159
_vehicle_127 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3642.1768, 12339.379, -6.8664551e-005];
	_vehicle_127 = _this;
	_this setDir 338.37198;
	_this setPos [3642.1768, 12339.379, -6.8664551e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_159""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3638.4275, 12339.025, 0.38807884];
	_vehicle_128 = _this;
	_this setVehicleVarName "house_159";
	house_159 = _this;
	_this setDir -75.819328;
	_this setPos [3638.4275, 12339.025, 0.38807884];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_159""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_159"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_159"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 160
_vehicle_129 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3659.6304, 12345.916, 1.5258789e-005];
	_vehicle_129 = _this;
	_this setDir 338.37198;
	_this setPos [3659.6304, 12345.916, 1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_160""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3654.478, 12352.012, 0.075560175];
	_vehicle_130 = _this;
	_this setVehicleVarName "house_160";
	house_160 = _this;
	_this setDir -109.33175;
	_this setPos [3654.478, 12352.012, 0.075560175];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_160""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_160"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_160"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 161
_vehicle_131 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3677.6677, 12353.077];
	_vehicle_131 = _this;
	_this setDir 338.37198;
	_this setPos [3677.6677, 12353.077];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_161""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3676.5723, 12360.629, 0.14632626];
	_vehicle_132 = _this;
	_this setVehicleVarName "house_161";
	house_161 = _this;
	_this setDir -109.33175;
	_this setPos [3676.5723, 12360.629, 0.14632626];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_161""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_161"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_161"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 162
_vehicle_133 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal  [3695.356, 12359.207, -4.196167e-005];
	_vehicle_133 = _this;
	_this setDir 338.37198;
	_this setPos [3695.356, 12359.207, -4.196167e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_162""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal  [3700.1526, 12364.248, 0.25638273];
	_vehicle_134 = _this;
	_this setVehicleVarName "house_162";
	house_162 = _this;
	_this setDir -19.642153;
	_this setPos [3700.1526, 12364.248, 0.25638273];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_162""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_162"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_162"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Lampen
_vehicle_135 = objNull;
if (true) then
{
	_this = "Land_LampStreet_small_F" createvehiclelocal [4113.73,12484.1,0];
	_vehicle_135 = _this;
	_this setDir -38.475;
	_this setPos [4113.73,12484.1,0];
	_this allowDamage false;
};

_vehicle_136 = objNull;
if (true) then
{
	_this = "Land_LampStreet_small_F" createvehiclelocal [4131.62,12456.8,0];
	_vehicle_136 = _this;
	_this setDir -120.571;
	_this setPos [4131.62,12456.8,0];
	_this allowDamage false;
};

_vehicle_137 = objNull;
if (true) then
{
	_this = "Land_LampStreet_small_F" createvehiclelocal [4085.67,12458.1,0];
	_vehicle_137 = _this;
	_this setDir -50.2801;
	_this setPos [4085.67,12458.1,0];
	_this allowDamage false;
};

_vehicle_138 = objNull;
if (true) then
{
	_this = "Land_LampStreet_small_F" createvehiclelocal [4164.13,12426.7,0];
	_vehicle_138 = _this;
	_this setDir 61.4168;
	_this setPos [4164.13,12426.7,0];
	_this allowDamage false;
};

_vehicle_139 = objNull;
if (true) then
{
	_this = "Land_LampStreet_small_F" createvehiclelocal [4112.92,12429.2,0];
	_vehicle_139 = _this;
	_this setDir -25.1573;
	_this setPos [4112.92,12429.2,0];
	_this allowDamage false;
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;

EMonkeys_loadmap4 = true;