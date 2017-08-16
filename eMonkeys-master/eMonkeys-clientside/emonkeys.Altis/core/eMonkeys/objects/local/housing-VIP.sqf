/*
	File: housing-VIP.sqf
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:732 | Housing System VIP
*/

_initCodes =[];

//Haus SD_00
_vehicle_001 = objNull;
if (true) then
{
	_this = "OfficeTable_01_new_F" createvehiclelocal [3840.3369, 17440.506, 3.7101047];
	_vehicle_001 = _this;
	_this setVehicleVarName "SD_00";
	SD_00 = _this;
	_this setDir 137.1003;
	_this setPos [3840.3369, 17440.506, 3.7101047];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_00""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_00"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_00"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3873.6895, 17455.682, -1.9073486e-005];
	_vehicle_002 = _this;
	_this setDir 250.80219;
	_this setPos [3873.6895, 17455.682, -1.9073486e-005];
	_initCodes pushBack [_this,"this addAction [""Villa ..."", EMonkeys_fnc_houseMenu, ""SD_00"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_01
_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22962.219, 18873.057, 0.33872384];
	_vehicle_003 = _this;
	_this setDir 35.107471;
	_this setPos [22962.219, 18873.057, 0.33872384];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_01"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22959.963, 18879.898, 0.41950157];
	_vehicle_005 = _this;
	_this setVehicleVarName "SD_01";
	SD_01 = _this;
	_this setDir 37.531273;
	_this setPos [22959.963, 18879.898, 0.41950157];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_01""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_01"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_01"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_02
_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12677.908, 14390.814, 0.27127925];
	_vehicle_006 = _this;
	_this setDir 155.31235;
	_this setPos [12677.908, 14390.814, 0.27127925];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_02"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12685.054, 14389.48, 0.83734494];
	_vehicle_008 = _this;
	_this setVehicleVarName "SD_02";
	SD_02 = _this;
	_this setDir -25.34868;
	_this setPos [12685.054, 14389.48, 0.83734494];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_02""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_02"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_02"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_03
_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25621.697, 21251.514];
	_vehicle_009 = _this;
	_this setDir 133.6004;
	_this setPos [25621.697, 21251.514];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_03"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25626.496, 21246.09, 0.34053555];
	_vehicle_011 = _this;
	_this setVehicleVarName "SD_03";
	SD_03 = _this;
	_this setDir -44.277546;
	_this setPos [25626.496, 21246.09, 0.34053555];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_03""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_03"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_03"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_04
_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8398.8877, 18241.383];
	_vehicle_012 = _this;
	_this setDir 159.1731;
	_this setPos [8398.8877, 18241.383];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_04"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8362.5811, 18248.156, 0.61550313];
	_vehicle_014 = _this;
	_this setVehicleVarName "SD_04";
	SD_04 = _this;
	_this setDir -18.332481;
	_this setPos [8362.5811, 18248.156, 0.61550313];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_04""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_04"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_04"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

//Haus Heliports
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [8385.0732, 18241.943];
	_vehicle_015 = _this;
	_this setDir -18.65484;
	_this setPos [8385.0732, 18241.943];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3563.4863, 14429.844, 3.8146973e-006];
	_vehicle_016 = _this;
	_this setDir 0.5745247;
	_this setPos [3563.4863, 14429.844, 3.8146973e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12729.116, 14372.674, -4.7683716e-006];
	_vehicle_017 = _this;
	_this setDir 91.270744;
	_this setPos [12729.116, 14372.674, -4.7683716e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [22956.393, 18854.582, 4.2915344e-006];
	_vehicle_018 = _this;
	_this setDir -18.65484;
	_this setPos [22956.393, 18854.582, 4.2915344e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [25630.633, 21233.43, -2.6702881e-005];
	_vehicle_019 = _this;
	_this setDir -18.65484;
	_this setPos [25630.633, 21233.43, -2.6702881e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_05
_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3684.2153, 11562.027, 0.90956002];
	_vehicle_021 = _this;
	_this setDir 42.369984;
	_this setPos [3684.2153, 11562.027, 0.90956002];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_05"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3677.8364, 11565.435, 1.0491645];
	_vehicle_022 = _this;
	_this setVehicleVarName "SD_05";
	SD_05 = _this;
	_this setDir -46.235073;
	_this setPos [3677.8364, 11565.435, 1.0491645];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_05""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_05"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_05"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3686.1125, 11535.948];
	_vehicle_023 = _this;
	_this setDir 42.263889;
	_this setPos [3686.1125, 11535.948];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_06
_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14256.159, 18571.576];
	_vehicle_024 = _this;
	_this setDir 217.4621;
	_this setPos [14256.159, 18571.576];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_06"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14250.396, 18553.141, 0.2831482];
	_vehicle_026 = _this;
	_this setVehicleVarName "SD_06";
	SD_06 = _this;
	_this setDir -50.13913;
	_this setPos [14250.396, 18553.141, 0.2831482];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_06""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_06"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_06"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [14267.153, 18549.482];
	_vehicle_027 = _this;
	_this setDir -324.95859;
	_this setPos [14267.153, 18549.482];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_07
_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12497.344, 14153.415, 0.64526778];
	_vehicle_028 = _this;
	_this setDir 160.93082;
	_this setPos [12497.344, 14153.415, 0.64526778];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_07"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12504.157, 14151.481, 0.78243536];
	_vehicle_030 = _this;
	_this setVehicleVarName "SD_07";
	SD_07 = _this;
	_this setDir -21.439716;
	_this setPos [12504.157, 14151.481, 0.78243536];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_07""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_07"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_07"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12518.384, 14166.98, -9.5367432e-007];
	_vehicle_031 = _this;
	_this setDir -387.59714;
	_this setPos [12518.384, 14166.98, -9.5367432e-007];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_08
_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3646.1196, 11773.896, 0.26905248];
	_vehicle_032 = _this;
	_this setVehicleVarName "SD_08";
	SD_08 = _this;
	_this setDir -25.040585;
	_this setPos [3646.1196, 11773.896, 0.26905248];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_08""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_08"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_08"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3635.0933, 11775.002, 0.3188284];
	_vehicle_033 = _this;
	_this setDir 64.321365;
	_this setPos [3635.0933, 11775.002, 0.3188284];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_08"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3620.2866, 11804.618];
	_vehicle_035 = _this;
	_this setDir 63.829079;
	_this setPos [3620.2866, 11804.618];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_09
_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10244.272, 11278.351, -3.8146973e-005];
	_vehicle_036 = _this;
	_this setDir 128.63412;
	_this setPos [10244.272, 11278.351, -3.8146973e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_09"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10253.606, 11280.119, 0.26946414];
	_vehicle_038 = _this;
	_this setVehicleVarName "SD_09";
	SD_09 = _this;
	_this setDir 38.849422;
	_this setPos [10253.606, 11280.119, 0.26946414];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_09""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_09"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_09"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10232.301, 11276.912];
	_vehicle_039 = _this;
	_this setDir 45.538544;
	_this setPos [10232.301, 11276.912];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_10
_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8309.4326, 10050.281, 0.49070856];
	_vehicle_040 = _this;
	_this setVehicleVarName "SD_10";
	SD_10 = _this;
	_this setDir 58.58419;
	_this setPos [8309.4326, 10050.281, 0.49070856];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_10""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_10"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8308.6807, 10076.8, 6.1035156e-005];
	_vehicle_042 = _this;
	_this setDir 144.42722;
	_this setPos [8308.6807, 10076.8, 6.1035156e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [8294.2188, 10081.352];
	_vehicle_043 = _this;
	_this setDir 50.522068;
	_this setPos [8294.2188, 10081.352];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_11
_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16827.586, 12048.223, -4.7683716e-007];
	_vehicle_044 = _this;
	_this setDir 97.076393;
	_this setPos [16827.586, 12048.223, -4.7683716e-007];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16836.6, 12037.601, 13.08852];
	_vehicle_045 = _this;
	_this setVehicleVarName "SD_11";
	SD_11 = _this;
	_this setDir 96.36734;
	_this setPos [16836.6, 12037.601, 13.08852];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_11""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_11"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16806.145, 12052.394];
	_vehicle_047 = _this;
	_this setDir 87.060753;
	_this setPos [16806.145, 12052.394];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_12
_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10734.352, 10977.359, 1.1708275];
	_vehicle_048 = _this;
	_this setVehicleVarName "SD_12";
	SD_12 = _this;
	_this setDir 59.222733;
	_this setPos [10734.352, 10977.359, 1.1708275];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_12""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_12"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10738.631, 10983.422, -0.00036239624];
	_vehicle_049 = _this;
	_this setDir 239.47783;
	_this setPos [10738.631, 10983.422, -0.00036239624];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10755.906, 10986.108, 7.1525574e-005];
	_vehicle_050 = _this;
	_this setDir -5.5549674;
	_this setPos [10755.906, 10986.108, 7.1525574e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_13
_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16083.059, 16239.271, -0.00032615662];
	_vehicle_051 = _this;
	_this setDir 194.72141;
	_this setPos [16083.059, 16239.271, -0.00032615662];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16081.359, 16233.786, 0.64327091];
	_vehicle_052 = _this;
	_this setVehicleVarName "SD_13";
	SD_13 = _this;
	_this setDir 101.66455;
	_this setPos [16081.359, 16233.786, 0.64327091];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_13""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_13"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16111.714, 16226.356, 1.5258789e-005];
	_vehicle_054 = _this;
	_this setDir 10.36446;
	_this setPos [16111.714, 16226.356, 1.5258789e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_14
_vehicle_055 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16606.217, 19047.781, 0.841263];
	_vehicle_172 = _this;
	_this setVehicleVarName "SD_14";
	SD_14 = _this;
	_this setDir 141.96458;
	_this setPos [16606.217, 19047.781, 0.841263];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_14""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_14"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16601.711, 19023.91];
	_vehicle_056 = _this;
	_this setDir 322.22498;
	_this setPos [16601.711, 19023.91];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16611.48, 19006.23];
	_vehicle_057 = _this;
	_this setDir 227.65063;
	_this setPos [16611.48, 19006.23];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_15
_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11101.145, 22698.238, -1.8119812e-005];
	_vehicle_058 = _this;
	_this setDir 376.46906;
	_this setPos [11101.145, 22698.238, -1.8119812e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11098.635, 22699.686, -0.028908933];
	_vehicle_059 = _this;
	_this setVehicleVarName "SD_15";
	SD_15 = _this;
	_this setDir 105.2287;
	_this setPos [11098.635, 22699.686, -0.028908933];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_15""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_15"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11062.601, 22709.908, 2.8610229e-006];
	_vehicle_061 = _this;
	_this setDir -92.435616;
	_this setPos [11062.601, 22709.908, 2.8610229e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_16
_vehicle_062= objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [7898.4775, 14620.333, -3.0517578e-005];
	_vehicle_062 = _this;
	_this setDir -1.8353986;
	_this setPos [7898.4775, 14620.333, -3.0517578e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7891.8384, 14627.677, 3.0517578e-005];
	_vehicle_063 = _this;
	_this setDir 357.38098;
	_this setPos [7891.8384, 14627.677, 3.0517578e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_16"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7881.6777, 14653.402, 1.7112851];
	_vehicle_064 = _this;
	_this setVehicleVarName "SD_16";
	SD_16 = _this;
	_this setDir 131.1192;
	_this setPos [7881.6777, 14653.402, 1.7112851];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_16""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_16"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_16"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_17
_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21435.277, 16209.177, 0.37837896];
	_vehicle_066 = _this;
	_this setDir 229.57011;
	_this setPos [21435.277, 16209.177, 0.37837896];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_17"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21430.279, 16210.323, 0.47192821];
	_vehicle_067 = _this;
	_this setVehicleVarName "SD_17";
	SD_17 = _this;
	_this setDir 47.789833;
	_this setPos [21430.279, 16210.323, 0.47192821];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_17""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_17"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_17"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21422.84, 16183.867, -3.8146973e-006];
	_vehicle_069 = _this;
	_this setDir 39.893307;
	_this setPos [21422.84, 16183.867, -3.8146973e-006];
	_this enableSimulation false;
	_this allowDamage false; 
};

//Haus SD_18
_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3799.8501, 11598.558, 0.50634152];
	_vehicle_070 = _this;
	_this setDir 224.16698;
	_this setPos [3799.8501, 11598.558, 0.50634152];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_18"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3801.186, 11591.567, 0.49438909];
	_vehicle_071 = _this;
	_this setVehicleVarName "SD_18";
	SD_18 = _this;
	_this setDir 43.720966;
	_this setPos [3801.186, 11591.567, 0.49438909];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_18""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_18"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_18"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3788.832, 11581.858];
	_vehicle_073 = _this;
	_this setDir 39.893307;
	_this setPos [3788.832, 11581.858];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_19
_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3853.1333, 11284.956, 0.40511274];
	_vehicle_074 = _this;
	_this setDir 85.244095;
	_this setPos [3853.1333, 11284.956, 0.40511274];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_19"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3850.8748, 11291.616, 0.44486028];
	_vehicle_075 = _this;
	_this setVehicleVarName "SD_19";
	SD_19 = _this;
	_this setDir -2.4237959;
	_this setPos [3850.8748, 11291.616, 0.44486028];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_19""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_19"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_19"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3871.5364, 11282.023, -6.1988831e-006];
	_vehicle_077 = _this;
	_this setDir -2.5606818;
	_this setPos [3871.5364, 11282.023, -6.1988831e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_20
_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21587.016, 16348.592, -5.7220459e-006];
	_vehicle_078 = _this;
	_this setDir 178.91005;
	_this setPos [21587.016, 16348.592, -5.7220459e-006];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_20"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21580.873, 16343.675, 0.41902626];
	_vehicle_079 = _this;
	_this setVehicleVarName "SD_20";
	SD_20 = _this;
	_this setDir -1.2674992;
	_this setPos [21580.873, 16343.675, 0.41902626];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_20""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_20"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_20"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21608.049, 16357.5];
	_vehicle_081 = _this;
	_this setDir -2.5606818;
	_this setPos [21608.049, 16357.5];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_21
_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [15215.966, 17314.426, -0.020060237];
	_vehicle_082 = _this;
	_this setDir 46.021908;
	_this setPos [15215.966, 17314.426, -0.020060237];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_21"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [15217.653, 17338.225, 0.47696337];
	_vehicle_083 = _this;
	_this setVehicleVarName "SD_21";
	SD_21 = _this;
	_this setDir -42.603039;
	_this setPos [15217.653, 17338.225, 0.47696337];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_21""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_21"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_21"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [15192.264, 17302.199];
	_vehicle_085 = _this;
	_this setDir -42.874229;
	_this setPos [15192.264, 17302.199];
_this enableSimulation false; _this allowDamage false; };

//Haus SD_22
_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9532.8809, 11412.868, 0.10986894];
	_vehicle_086 = _this;
	_this setDir 80.236504;
	_this setPos [9532.8809, 11412.868, 0.10986894];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_22"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9533.1807, 11415.747, 0.3015826];
	_vehicle_087 = _this;
	_this setVehicleVarName "SD_22";
	SD_22 = _this;
	_this setDir -11.491268;
	_this setPos [9533.1807, 11415.747, 0.3015826];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_22""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_22"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_22"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9525.4014, 11446.975, -1.7166138e-005];
	_vehicle_089 = _this;
	_this setDir -285.68481;
	_this setPos [3718.7434, 11452.92, -1.7166138e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_23
_vehicle_090 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12438.759, 15968.452, 0.26978725];
	_vehicle_090 = _this;
	_this setDir 180.54103;
	_this setPos [12438.759, 15968.452, 0.26978725];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_23"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12444.275, 15964.015, 0.39085984];
	_vehicle_091 = _this;
	_this setVehicleVarName "SD_23";
	SD_23 = _this;
	_this setDir 2.8093731;
	_this setPos [12444.275, 15964.015, 0.39085984];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_23""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_23"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_23"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_24
_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9719.7412, 22283.535, 0.81516784];
	_vehicle_093 = _this;
	_this setDir 191.52698;
	_this setPos [9719.7412, 22283.535, 0.81516784];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_24"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9724.2012, 22278.131, 0.6413886];
	_vehicle_094 = _this;
	_this setVehicleVarName "SD_24";
	SD_24 = _this;
	_this setDir 14.318276;
	_this setPos [9724.2012, 22278.131, 0.6413886];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_24""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_24"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_24"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false; 
	_this setvectorup [0,0,1];
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9730.6465, 22306.293];
	_vehicle_096 = _this;
	_this setDir -165.81351;
	_this setPos [9730.6465, 22306.293];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_25
_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9083.9141, 11940.021, 0.47372353];
	_vehicle_097 = _this;
	_this setDir 370.30301;
	_this setPos [9083.9141, 11940.021, 0.47372353];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_25"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9086.7637, 11936.694, 0.79079515];
	_vehicle_098 = _this;
	_this setVehicleVarName "SD_25";
	SD_25 = _this;
	_this setDir 9.1148739;
	_this setPos [9086.7637, 11936.694, 0.79079515];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_25""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_25"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_25"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_26
_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22368.477, 20436.803, 1.2080414];
	_vehicle_100 = _this;
	_this setDir 41.284187;
	_this setPos [22368.477, 20436.803, 1.2080414];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_26"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22377.004, 20441.863, 0.4661079];
	_vehicle_101 = _this;
	_this setVehicleVarName "SD_26";
	SD_26 = _this;
	_this setDir -50.432899;
	_this setPos [22377.004, 20441.863, 0.4661079];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_26""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_26"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_26"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [22394.357, 20421.445];
	_vehicle_103 = _this;
	_this setDir -136.24298;
	_this setPos [22394.357, 20421.445];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_27
_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4071.6021, 12967.197, 0.23004988];
	_vehicle_104 = _this;
	_this setDir 182.11859;
	_this setPos [4071.6021, 12967.197, 0.23004988];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_27"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4077.3689, 12962.781, 0.34268641];
	_vehicle_105 = _this;
	_this setVehicleVarName "SD_27";
	SD_27 = _this;
	_this setDir 2.6558828;
	_this setPos [4077.3689, 12962.781, 0.34268641];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_27""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_27"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_27"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [4073.8943, 12944.205];
	_vehicle_107 = _this;
	_this setDir -90.206528;
	_this setPos [4073.8943, 12944.205];
	_this enableSimulation false;
	_this allowDamage false;
};
//Haus SD_28
_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25733.967, 21217.84, 0.24565253];
	_vehicle_108 = _this;
	_this setVehicleVarName "SD_28";
	SD_28 = _this;
	_this setDir 45.139725;
	_this setPos [25733.967, 21217.84, 0.24565253];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_28""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_28"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_28"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25731.205, 21223.186, -1.5258789e-005];
	_vehicle_109 = _this;
	_this setDir 135.70903;
	_this setPos [25731.205, 21223.186, -1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_28"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [25733.217, 21223.781, 0.14196803];
	_vehicle_110 = _this;
	_this setDir 44.954685;
	_this setPos [25733.217, 21223.781, 0.14196803];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_28"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [25750.936, 21221.836];
	_vehicle_111 = _this;
	_this setDir 135.04909;
	_this setPos [25750.936, 21221.836];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_29
_vehicle_112 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12092.872, 10492.557, 3.8841348];
	_vehicle_112 = _this;
	_this setVehicleVarName "SD_29";
	SD_29 = _this;
	_this setDir 28.715786;
	_this setPos [12092.872, 10492.557, 3.8841348];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_29""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_29"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_29"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12093.373, 10489.129, 0.33753422];
	_vehicle_113 = _this;
	_this setDir 27.517159;
	_this setPos [12093.373, 10489.129, 0.33753422];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_29"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12097.764, 10493.002, 3.9071829];
	_vehicle_114 = _this;
	_this setDir 210.42339;
	_this setPos [12097.764, 10493.002, 3.9071829];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_29"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12081.199, 10473.19, 2.3841858e-007];
	_vehicle_115 = _this;
	_this setDir 206.93269;
	_this setPos [12081.199, 10473.19, 2.3841858e-007];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_30
_vehicle_387 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12398.276, 14253.474, 0.44193947];
	_vehicle_387 = _this;
	_this setVehicleVarName "SD_30";
	SD_30 = _this;
	_this setDir -22.106039;
	_this setPos [12398.276, 14253.474, 0.44193947];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_30""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_30"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_30"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_390 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12391.36, 14255.224, 0.3275241];
	_vehicle_390 = _this;
	_this setDir 160.73689;
	_this setPos [12391.36, 14255.224, 0.3275241];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_30"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_393 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12391.768, 14249.314, 0.78079313];
	_vehicle_393 = _this;
	_this setDir 160.48795;
	_this setPos [12391.768, 14249.314, 0.78079313];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_30"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_396 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12425.968, 14275.414, -5.4359436e-005];
	_vehicle_396 = _this;
	_this setDir 156.23241;
	_this setPos [12425.968, 14275.414, -5.4359436e-005];
	_this enableSimulation false;
	_this allowDamage false;
};


/*
_vehicle_900 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9326.4844, 12146.683, -0.2693992];
	_vehicle_346 = _this;
	_this setDir 141.16386;
	_this setPos [9326.4844, 12146.683, -0.2693992];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_901 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9329.8213, 12149.386, 4.863739e-005];
	_vehicle_349 = _this;
	_this setDir 362.55722;
	_this setPos [9329.8213, 12149.386, 4.863739e-005];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_902 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9333.165, 12152.064, 1.5258789e-005];
	_vehicle_353 = _this;
	_this setDir 141.16386;
	_this setPos [9333.165, 12152.064, 1.5258789e-005];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_903 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9336.4912, 12154.765, 0.12347698];
	_vehicle_354 = _this;
	_this setDir 362.55722;
	_this setPos [9336.4912, 12154.765, 0.12347698];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_904 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9339.7598, 12157.401, -6.6757202e-006];
	_vehicle_357 = _this;
	_this setDir 141.16386;
	_this setPos [9339.7598, 12157.401, -6.6757202e-006];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_905 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9342.7793, 12159.93, 0.13769817];
	_vehicle_358 = _this;
	_this setDir 359.08054;
	_this setPos [9342.7793, 12159.93, 0.13769817];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_906 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9351.7383, 12161.937, -0.065004066];
	_vehicle_361 = _this;
	_this setDir 228.96852;
	_this setPos [9351.7383, 12161.937, -0.065004066];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_907 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9354.625, 12158.739, 0.22000599];
	_vehicle_362 = _this;
	_this setDir 447.50357;
	_this setPos [9354.625, 12158.739, 0.22000599];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_908 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9357.3613, 12155.633, 2.5749207e-005];
	_vehicle_367 = _this;
	_this setDir 228.96852;
	_this setPos [9357.3613, 12155.633, 2.5749207e-005];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_909 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9360.1592, 12152.423, 0.48361567];
	_vehicle_368 = _this;
	_this setDir 450.98026;
	_this setPos [9360.1592, 12152.423, 0.48361567];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_910 = objNull;
if (true) then
{
	_this = "Land_i_House_Big_02_V3_F" createvehiclelocal [9345.334, 12155.087, 0.98746419];
	_vehicle_374 = _this;
	_this setDir -129.46021;
	_this setPos [9345.334, 12155.087, 0.98746419];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_911 = objNull;
if (true) then
{
	_this = "Land_Stone_8m_F" createvehiclelocal [9346.0518, 12162.547, -2.0027161e-005];
	_vehicle_377 = _this;
	_this setDir 141.16386;
	_this setPos [9346.0518, 12162.547, -2.0027161e-005];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_912 = objNull;
if (true) then
{
	_this = "Land_Stone_pillar_F" createvehiclelocal [9349.0713, 12165.074, 0.18097401];
	_vehicle_378 = _this;
	_this setDir 359.08054;
	_this setPos [9349.0713, 12165.074, 0.18097401];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_913 = objNull;
if (true) then
{
	_this = "Land_Stone_4m_F" createvehiclelocal [9361.4102, 12150.765, 0.11228198];
	_vehicle_381 = _this;
	_this setDir 52.946102;
	_this setPos [9361.4102, 12150.765, 0.11228198];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_914 = objNull;
if (true) then
{
	_this = "Land_i_Addon_03_V1_F" createvehiclelocal [9339.2969, 12149.897, -8.5830688e-006];
	_vehicle_383 = _this;
	_this setDir 50.725636;
	_this setPos [9339.2969, 12149.897, -8.5830688e-006];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_915 = objNull;
if (true) then
{
	_this = "Land_i_Garage_V1_F" createvehiclelocal [9349.4277, 12148.003, 0.1545551];
	_vehicle_384 = _this;
	_this setDir -39.298405;
	_this setPos [9349.4277, 12148.003, 0.1545551];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_916 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9337.6055, 12146.814, -6.6757202e-006];
	_vehicle_385 = _this;
	_this setDir 49.896996;
	_this setPos [9337.6055, 12146.814, -6.6757202e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_31""]; "];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_917 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9346.1162, 12155.277, 1.1852338];
	_vehicle_387 = _this;
	_this setDir -39.56966;
	_this setPos [9346.1162, 12155.277, 1.1852338];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_31""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_31"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_31"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_918 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9342.5713, 12158.051, 1.0693916];
	_vehicle_389 = _this;
	_this setDir 49.917915;
	_this setPos [9342.5713, 12158.051, 1.0693916];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_31""]; "];
_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };
*/

//Haus SD_32
_vehicle_398 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14920.603, 17620.348, 0.89389002];
	_vehicle_398 = _this;
	_this setDir 15.780042;
	_this setPos [14920.603, 17620.348, 0.89389002];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_32""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_401 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [14917.31, 17625.443, 1.0594176];
	_vehicle_401 = _this;
	_this setDir 107.49438;
	_this setPos [14917.31, 17625.443, 1.0594176];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_32""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_404 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14913.648, 17620.551, 0.80138141];
	_vehicle_404 = _this;
	_this setVehicleVarName "SD_32";
	SD_32 = _this;
	_this setDir -71.685379;
	_this setPos [14913.648, 17620.551, 0.80138141];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_32""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_32"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_32"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_407 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [14876.004, 17609.723];
	_vehicle_407 = _this;
	_this setDir 391.98215;
	_this setPos [14876.004, 17609.723];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_33
_vehicle_411 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [6448.6133, 11008.039, -6.8664551e-005];
	_vehicle_411 = _this;
	_this setDir 2.3243515;
	_this setPos [6448.6133, 11008.039, -6.8664551e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_33""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_414 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [6443.0708, 11012.654, 0.26981038];
	_vehicle_414 = _this;
	_this setVehicleVarName "SD_33";
	SD_33 = _this;
	_this setDir -177.06453;
	_this setPos [6443.0708, 11012.654, 0.26981038];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_33""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_33"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_33"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_417 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [6450.7173, 11013.497, 0.24783182];
	_vehicle_417 = _this;
	_this setDir 185.33682;
	_this setPos [6450.7173, 11013.497, 0.24783182];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_33""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_421 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [6471.7295, 11015.47];
	_vehicle_421 = _this;
	_this setDir 332.70776;
	_this setPos [6471.7295, 11015.47];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_34
_vehicle_423 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22910.154, 15743.432, 3.5762787e-006];
	_vehicle_423 = _this;
	_this setDir -30.704554;
	_this setPos [22910.154, 15743.432, 3.5762787e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_34""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_426 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22906.68, 15755.804, 0.36422527];
	_vehicle_426 = _this;
	_this setVehicleVarName "SD_34";
	SD_34 = _this;
	_this setDir -177.06453;
	_this setPos [22906.68, 15755.804, 0.36422527];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_34""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_34"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_34"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_429 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [22902.6, 15759.379, 0.44147769];
	_vehicle_429 = _this;
	_this setDir 226.88937;
	_this setPos [22902.6, 15759.379, 0.44147769];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_34""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_432 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [22883.633, 15740.297, -6.4611435e-005];
	_vehicle_432 = _this;
	_this setDir 321.3512;
	_this setPos [22883.633, 15740.297, -6.4611435e-005];
_this allowDamage false;  _this enableSimulation false; _this SetVectorUp [0,0,1]; };

//Haus SD_35
_vehicle_435 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [23979.16, 15444.09, 0.39613193];
	_vehicle_435 = _this;
	_this setDir 91.110283;
	_this setPos [23979.16, 15444.09, 0.39613193];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_35""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_438 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [23991.936, 15447.178, -0.042629331];
	_vehicle_438 = _this;
	_this setVehicleVarName "SD_35";
	SD_35 = _this;
	_this setDir -177.06453;
	_this setPos [23991.936, 15447.178, -0.042629331];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_35""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_35"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_35"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_441 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [23994.096, 15443.985, 0.22068453];
	_vehicle_441 = _this;
	_this setDir 226.88937;
	_this setPos [23994.096, 15443.985, 0.22068453];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_35""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_444 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [24020.26, 15436.338, -5.3405762e-005];
	_vehicle_444 = _this;
	_this setDir 321.3512;
	_this setPos [24020.26, 15436.338, -5.3405762e-005];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_36
_vehicle_447 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25806.141, 21289.551, 0.0002155304];
	_vehicle_447 = _this;
	_this setDir 134.66316;
	_this setPos [25806.141, 21289.551, 0.0002155304];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_36""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_450 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25809.307, 21291.178, 0.0084382668];
	_vehicle_450 = _this;
	_this setVehicleVarName "SD_36";
	SD_36 = _this;
	_this setDir -177.06453;
	_this setPos [25809.307, 21291.178, 0.0084382668];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_36""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_36"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_36"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_453 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [25815.762, 21290.686, 0.33051169];
	_vehicle_453 = _this;
	_this setDir 226.88937;
	_this setPos [25815.762, 21290.686, 0.33051169];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_36""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_456 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [25833.83, 21286.678];
	_vehicle_456 = _this;
	_this setDir 315.49158;
	_this setPos [25833.83, 21286.678];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_37
_vehicle_459 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25568.953, 21417.125, -2.4795532e-005];
	_vehicle_459 = _this;
	_this setDir 222.09418;
	_this setPos [25568.953, 21417.125, -2.4795532e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_37""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_462 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25571.078, 21413.736, 0.39928123];
	_vehicle_462 = _this;
	_this setVehicleVarName "SD_37";
	SD_37 = _this;
	_this setDir -177.06453;
	_this setPos [25571.078, 21413.736, 0.39928123];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_37""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_37"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_37"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_465 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [25567.436, 21409.768, 0.31716147];
	_vehicle_465 = _this;
	_this setDir 223.65732;
	_this setPos [25567.436, 21409.768, 0.31716147];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_37""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_468 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [25549.418, 21430.541, 5.531311e-005];
	_vehicle_468 = _this;
	_this setDir 222.67986;
	_this setPos [25549.418, 21430.541, 5.531311e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_38
_vehicle_471 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4459.2788, 14195.087, 0.22466728];
	_vehicle_471 = _this;
	_this setDir 428.25177;
	_this setPos [4459.2788, 14195.087, 0.22466728];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_38""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_474 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4462.5747, 14198.875, 0.15831211];
	_vehicle_474 = _this;
	_this setVehicleVarName "SD_38";
	SD_38 = _this;
	_this setDir -202.26183;
	_this setPos [4462.5747, 14198.875, 0.15831211];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_38""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_38"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_38"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_477 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4466.9731, 14191.795, 0.28255409];
	_vehicle_477 = _this;
	_this setDir 247.35367;
	_this setPos [4466.9731, 14191.795, 0.28255409];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_38""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_480 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [4444.0928, 14187.387, 0.00010299683];
	_vehicle_480 = _this;
	_this setDir 249.20984;
	_this setPos [4444.0928, 14187.387, 0.00010299683];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_39
_vehicle_483 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10130.287, 11332.173, 0.89430559];
	_vehicle_483 = _this;
	_this setDir 315.25961;
	_this setPos [10130.287, 11332.173, 0.89430559];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_39""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_486 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10123.212, 11330.926, 0.76152909];
	_vehicle_486 = _this;
	_this setVehicleVarName "SD_39";
	SD_39 = _this;
	_this setDir -226.55124;
	_this setPos [10123.212, 11330.926, 0.76152909];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_39""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_39"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_39"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_489 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10128.566, 11331.934, 1.12415];
	_vehicle_489 = _this;
	_this setDir 225.09293;
	_this setPos [10128.566, 11331.934, 1.12415];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_39""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_492 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10110.268, 11308.083, -0.00011253357];
	_vehicle_492 = _this;
	_this setDir 325.80298;
	_this setPos [10110.268, 11308.083, -0.00011253357];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_40
_vehicle_495 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18095.01, 14888.513, 0.19341357];
	_vehicle_495 = _this;
	_this setDir 313.81091;
	_this setPos [18095.01, 14888.513, 0.19341357];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_40""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_498 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18091.758, 14893.901, 0.36021346];
	_vehicle_498 = _this;
	_this setVehicleVarName "SD_40";
	SD_40 = _this;
	_this setDir -227.07071;
	_this setPos [18091.758, 14893.901, 0.36021346];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_40""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_40"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_40"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_501 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18091.553, 14886.214, 0.34762669];
	_vehicle_501 = _this;
	_this setDir 223.62796;
	_this setPos [18091.553, 14886.214, 0.34762669];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_40""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_504 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18083.354, 14865.151, 9.1552734e-005];
	_vehicle_504 = _this;
	_this setDir 310.15833;
	_this setPos [18083.354, 14865.151, 9.1552734e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_41
_vehicle_507 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7473.5723, 16278.372, 0.0043158354];
	_vehicle_507 = _this;
	_this setDir 373.73392;
	_this setPos [7473.5723, 16278.372, 0.0043158354];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_41""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_510 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7476.6011, 16284.182, 0.047360111];
	_vehicle_510 = _this;
	_this setVehicleVarName "SD_41";
	SD_41 = _this;
	_this setDir -227.07071;
	_this setPos [7476.6011, 16284.182, 0.047360111];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_41""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_41"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_41"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_513 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [7471.3208, 16280.013, 0.30504194];
	_vehicle_513 = _this;
	_this setDir 284.68341;
	_this setPos [7471.3208, 16280.013, 0.30504194];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_41""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_516 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [7445.8628, 16272.931, -7.6293945e-005];
	_vehicle_516 = _this;
	_this setDir 374.10315;
	_this setPos [7445.8628, 16272.931, -7.6293945e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_42
_vehicle_520 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3750.7341, 11114.596, 0.45118859];
	_vehicle_520 = _this;
	_this setDir 290.52676;
	_this setPos [3750.7341, 11114.596, 0.45118859];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_42""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_523 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3750.0342, 11107.368, 0.57374638];
	_vehicle_523 = _this;
	_this setVehicleVarName "SD_42";
	SD_42 = _this;
	_this setDir -159.34178;
	_this setPos [3750.0342, 11107.368, 0.57374638];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_42""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_42"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_42"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_526 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [3748.8013, 11112.352, 0.61252677];
	_vehicle_526 = _this;
	_this setDir 379.64655;
	_this setPos [3748.8013, 11112.352, 0.61252677];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_42""]; "];
_this allowDamage false;  _this enableSimulation false; _this SetVectorUp [0,0,1]; };

_vehicle_529 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3758.603, 11128.319, -2.8610229e-006];
	_vehicle_529 = _this;
	_this setDir 289.75934;
	_this setPos [3758.603, 11128.319, -2.8610229e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_43
_vehicle_531 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21475.418, 17263.465, -5.9127808e-005];
	_vehicle_531 = _this;
	_this setDir 319.29352;
	_this setPos [21475.418, 17263.465, -5.9127808e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_43""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_534 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21474.074, 17268.389, 0.30851868];
	_vehicle_534 = _this;
	_this setVehicleVarName "SD_43";
	SD_43 = _this;
	_this setDir -130.11177;
	_this setPos [21474.074, 17268.389, 0.30851868];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_43""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_43"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_43"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_537 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21471.068, 17268.236, 0.3776713];
	_vehicle_537 = _this;
	_this setDir 678.20612;
	_this setPos [21471.068, 17268.236, 0.3776713];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_43""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_540 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21485.291, 17241.869, 1.5258789e-005];
	_vehicle_540 = _this;
	_this setDir 402.75256;
	_this setPos [21485.291, 17241.869, 1.5258789e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_44
_vehicle_543 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20891.51, 17076.613, 0.94265002];
	_vehicle_543 = _this;
	_this setDir 385.96249;
	_this setPos [20891.51, 17076.613, 0.94265002];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_44""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_546 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20891.584, 17082.525, 1.1055169];
	_vehicle_546 = _this;
	_this setVehicleVarName "SD_44";
	SD_44 = _this;
	_this setDir -114.78951;
	_this setPos [20891.584, 17082.525, 1.1055169];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_44""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_44"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_44"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_550 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20897.266, 17077.465, 1.4964372];
	_vehicle_550 = _this;
	_this setDir 657.24084;
	_this setPos [20897.266, 17077.465, 1.4964372];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_44""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_45
_vehicle_555 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20879.789, 17054.105, 0.20164119];
	_vehicle_555 = _this;
	_this setDir 563.99506;
	_this setPos [20879.789, 17054.105, 0.20164119];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_45""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_558 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20886.781, 17052.996, 0.65310955];
	_vehicle_558 = _this;
	_this setVehicleVarName "SD_45";
	SD_45 = _this;
	_this setDir -66.871765;
	_this setPos [20886.781, 17052.996, 0.65310955];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_45""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_45"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_45"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_561 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20876.006, 17049.873, 0.17392485];
	_vehicle_561 = _this;
	_this setDir 745.82281;
	_this setPos [20876.006, 17049.873, 0.17392485];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_45""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_46
_vehicle_564 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20884.711, 17079.684, 3.4332275e-005];
	_vehicle_564 = _this;
	_this setDir 743.5307;
	_this setPos [20884.711, 17079.684, 3.4332275e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_46""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_567 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20880.529, 17083.002, 0.00018692017];
	_vehicle_567 = _this;
	_this setVehicleVarName "SD_46";
	SD_46 = _this;
	_this setDir -64.451019;
	_this setPos [20880.529, 17083.002, 0.00018692017];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_46""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_46"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_46"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_570 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20882.441, 17086.666, 0.10178604];
	_vehicle_570 = _this;
	_this setDir 745.82281;
	_this setPos [20882.441, 17086.666, 0.10178604];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_46""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_47
_vehicle_573 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20816.586, 17101.123, 0.53110355];
	_vehicle_573 = _this;
	_this setDir 893.15143;
	_this setPos [20816.586, 17101.123, 0.53110355];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_47""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_576 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20823.016, 17103.836, 1.0147413];
	_vehicle_576 = _this;
	_this setVehicleVarName "SD_47";
	SD_47 = _this;
	_this setDir 83.443176;
	_this setPos [20823.016, 17103.836, 1.0147413];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_47""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_47"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_47"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_579 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20816.098, 17096.951, 0.62690473];
	_vehicle_579 = _this;
	_this setDir 803.90363;
	_this setPos [20816.098, 17096.951, 0.62690473];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_47""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_582 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20822.496, 17115.789, 0.0001335144];
	_vehicle_582 = _this;
	_this setDir 622.94592;
	_this setPos [20822.496, 17115.789, 0.0001335144];
_this allowDamage false;  _this enableSimulation false; };

//Haus SD_48
_vehicle_586 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25368.527, 21563.387, -0.00027084351];
	_vehicle_586 = _this;
	_this setDir 1041.0493;
	_this setPos [25368.527, 21563.387, -0.00027084351];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_48""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_589 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25361.602, 21565.543, 0.79276776];
	_vehicle_589 = _this;
	_this setVehicleVarName "SD_48";
	SD_48 = _this;
	_this setDir 48.367249;
	_this setPos [25361.602, 21565.543, 0.79276776];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_48""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_48"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_48"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_592 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [25366.424, 21564.002, 1.1669946];
	_vehicle_592 = _this;
	_this setDir 858.91022;
	_this setPos [25366.424, 21564.002, 1.1669946];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_48""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_595 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [25378.029, 21551.471, -0.00018692017];
	_vehicle_595 = _this;
	_this setDir 685.02118;
	_this setPos [25378.029, 21551.471, -0.00018692017];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_49
_vehicle_598 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12781.9, 14286.314, 0.29281735];
	_vehicle_598 = _this;
	_this setDir 1055.1167;
	_this setPos [12781.9, 14286.314, 0.29281735];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_49""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_601 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12778.295, 14288.5, 0.20159361];
	_vehicle_601 = _this;
	_this setVehicleVarName "SD_49";
	SD_49 = _this;
	_this setDir 64.606026;
	_this setPos [12778.295, 14288.5, 0.20159361];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_49""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_49"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_49"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_604 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12784.534, 14292.721, 0.20134303];
	_vehicle_604 = _this;
	_this setDir 964.0224;
	_this setPos [12784.534, 14292.721, 0.20134303];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_49""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_607 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12803.832, 14299.85, -0.00017428398];
	_vehicle_607 = _this;
	_this setDir 696.36298;
	_this setPos [12803.832, 14299.85, -0.00017428398];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_50
_vehicle_613 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14472.608, 19861.191, -8.5830688e-005];
	_vehicle_613 = _this;
	_this setDir 1016.0486;
	_this setPos [14472.608, 19861.191, -8.5830688e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_50""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_616 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14469.692, 19865.072, 0.24760267];
	_vehicle_616 = _this;
	_this setVehicleVarName "SD_50";
	SD_50 = _this;
	_this setDir 71.5103;
	_this setPos [14469.692, 19865.072, 0.24760267];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_50""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_50"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_50"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_619 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [14466.679, 19863.973, 0.41626412];
	_vehicle_619 = _this;
	_this setDir 1017.9321;
	_this setPos [14466.679, 19863.973, 0.41626412];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_50""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_622 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [14507.111, 19864.391, -0.00011253357];
	_vehicle_622 = _this;
	_this setDir 645.93475;
	_this setPos [14507.111, 19864.391, -0.00011253357];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_51
_vehicle_624 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4064.1992, 13356.517, 0.58629918];
	_vehicle_624 = _this;
	_this setDir 845.71808;
	_this setPos [4064.1992, 13356.517, 0.58629918];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_51""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_627 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4066.5803, 13363.053, 0.49381024];
	_vehicle_627 = _this;
	_this setVehicleVarName "SD_51";
	SD_51 = _this;
	_this setDir 36.238701;
	_this setPos [4066.5803, 13363.053, 0.49381024];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_51""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_51"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_51"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_630 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4067.1006, 13357.467, 0.68415403];
	_vehicle_630 = _this;
	_this setDir 1205.6366;
	_this setPos [4067.1006, 13357.467, 0.68415403];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_51""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_633 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [4052.6628, 13369.489];
	_vehicle_633 = _this;
	_this setDir 402.75256;
	_this setPos [4052.6628, 13369.489];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_52
_vehicle_636 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21536.566, 16381.067, 0.54783696];
	_vehicle_636 = _this;
	_this setDir 713.68744;
	_this setPos [21536.566, 16381.067, 0.54783696];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_52""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_639 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21530.029, 16378.521, 0.59343714];
	_vehicle_639 = _this;
	_this setVehicleVarName "SD_52";
	SD_52 = _this;
	_this setDir 83.320107;
	_this setPos [21530.029, 16378.521, 0.59343714];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_52""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_52"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_52"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_642 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21531.605, 16383.954, 0.64819801];
	_vehicle_642 = _this;
	_this setDir 1163.6842;
	_this setPos [21531.605, 16383.954, 0.64819801];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_52""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_645 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21554.143, 16397.443, -0.00016593933];
	_vehicle_645 = _this;
	_this setDir 354.27969;
	_this setPos [21554.143, 16397.443, -0.00016593933];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_53
_vehicle_647 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12772.928, 14282.047, 0.91429013];
	_vehicle_647 = _this;
	_this setDir 694.02576;
	_this setPos [12772.928, 14282.047, 0.91429013];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_53""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_650 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12773.387, 14287.217, 0.42009744];
	_vehicle_650 = _this;
	_this setVehicleVarName "SD_53";
	SD_53 = _this;
	_this setDir 63.758965;
	_this setPos [12773.387, 14287.217, 0.42009744];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_53""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_53"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_53"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_653 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12775.975, 14289.584, 0.35234383];
	_vehicle_653 = _this;
	_this setDir 1235.3433;
	_this setPos [12775.975, 14289.584, 0.35234383];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_53""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_54
_vehicle_655 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8684.8281, 18223.092, 0.2488701];
	_vehicle_655 = _this;
	_this setDir 687.62415;
	_this setPos [8684.8281, 18223.092, 0.2488701];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_54""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_658 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8680.1924, 18217.883, 0.11537632];
	_vehicle_658 = _this;
	_this setVehicleVarName "SD_54";
	SD_54 = _this;
	_this setDir 57.353844;
	_this setPos [8680.1924, 18217.883, 0.11537632];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_54""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_54"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_54"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_661 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [8681.5635, 18223.17, 0.45210761];
	_vehicle_661 = _this;
	_this setDir 1048.6932;
	_this setPos [8681.5635, 18223.17, 0.45210761];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_54""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_55
_vehicle_664 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19509.721, 13277.331, 0.00034332275];
	_vehicle_664 = _this;
	_this setDir 601.72736;
	_this setPos [19509.721, 13277.331, 0.00034332275];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_55""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_667 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19508.338, 13273.746, 0.42810059];
	_vehicle_667 = _this;
	_this setVehicleVarName "SD_55";
	SD_55 = _this;
	_this setDir 62.892235;
	_this setPos [19508.338, 13273.746, 0.42810059];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_55""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_55"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_55"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_670 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19504.34, 13275.503, 0.46390781];
	_vehicle_670 = _this;
	_this setDir 1054.1071;
	_this setPos [19504.34, 13275.503, 0.46390781];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_55""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_678 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19544.197, 13281.859, 0.00015258789];
	_vehicle_678 = _this;
	_this setDir 248.94035;
	_this setPos [19544.197, 13281.859, 0.00015258789];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_56
_vehicle_681 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3461.5945, 13108.413, 0.28570709];
	_vehicle_681 = _this;
	_this setDir 673.87109;
	_this setPos [3461.5945, 13108.413, 0.28570709];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_56""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_684 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3454.4763, 13108.293, 0.52696949];
	_vehicle_684 = _this;
	_this setVehicleVarName "SD_56";
	SD_56 = _this;
	_this setDir 43.486683;
	_this setPos [3454.4763, 13108.293, 0.52696949];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_56""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_56"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_56"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_687 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [3459.3931, 13111.887, 0.6057145];
	_vehicle_687 = _this;
	_this setDir 945.6264;
	_this setPos [3459.3931, 13111.887, 0.6057145];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_56""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_57
_vehicle_690 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8244.0605, 10930.035, 5.1498413e-005];
	_vehicle_690 = _this;
	_this setDir 810.13776;
	_this setPos [8244.0605, 10930.035, 5.1498413e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_57""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_693 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8245.2656, 10927.642, 0.32355618];
	_vehicle_693 = _this;
	_this setVehicleVarName "SD_57";
	SD_57 = _this;
	_this setDir 90.366982;
	_this setPos [8245.2656, 10927.642, 0.32355618];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_57""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_57"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_57"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_696 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [8247.3867, 10929.709, 0.34766254];
	_vehicle_696 = _this;
	_this setDir 989.65765;
	_this setPos [8247.3867, 10929.709, 0.34766254];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_57""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_699 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [8226.9756, 10932.083, 3.6239624e-005];
	_vehicle_699 = _this;
	_this setDir 267.79691;
	_this setPos [8226.9756, 10932.083, 3.6239624e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_58
_vehicle_703 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16495.426, 10037.527, -3.0517578e-005];
	_vehicle_703 = _this;
	_this setDir 672.84033;
	_this setPos [16495.426, 10037.527, -3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_58""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_706 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16487.764, 10037.716, 0.57401305];
	_vehicle_706 = _this;
	_this setVehicleVarName "SD_58";
	SD_58 = _this;
	_this setDir 132.39543;
	_this setPos [16487.764, 10037.716, 0.57401305];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_58""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_58"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_58"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_709 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16492.865, 10037.339, 0.68373823];
	_vehicle_709 = _this;
	_this setDir 1032.0112;
	_this setPos [16492.865, 10037.339, 0.68373823];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_58""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_712 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16493.121, 10019.894, -0.00037479401];
	_vehicle_712 = _this;
	_this setDir 219.82005;
	_this setPos [16493.121, 10019.894, -0.00037479401];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_59
_vehicle_715 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12706.917, 14719.905, 1.335144e-005];
	_vehicle_715 = _this;
	_this setDir 679.6142;
	_this setPos [12706.917, 14719.905, 1.335144e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_59""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_718 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12709.479, 14727.607, 0.27136874];
	_vehicle_718 = _this;
	_this setDir 947.87708;
	_this setPos [12709.479, 14727.607, 0.27136874];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_59""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_721 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12700.731, 14726.387, 0.33847702];
	_vehicle_721 = _this;
	_this setVehicleVarName "SD_59";
	SD_59 = _this;
	_this setDir 136.3891;
	_this setPos [12700.731, 14726.387, 0.33847702];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_59""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_59"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_59"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_724 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12691.748, 14714.692, 5.531311e-005];
	_vehicle_724 = _this;
	_this setDir 320.86758;
	_this setPos [12691.748, 14714.692, 5.531311e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_60
_vehicle_727 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22934.461, 15760.217, -2.2172928e-005];
	_vehicle_727 = _this;
	_this setDir 678.27582;
	_this setPos [22934.461, 15760.217, -2.2172928e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_60""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_730 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [22924.719, 15759.59, 0.26479945];
	_vehicle_730 = _this;
	_this setDir 947.87708;
	_this setPos [22924.719, 15759.59, 0.26479945];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_60""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_733 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22930.666, 15759.684, 0.16653664];
	_vehicle_733 = _this;
	_this setVehicleVarName "SD_60";
	SD_60 = _this;
	_this setDir 136.3891;
	_this setPos [22930.666, 15759.684, 0.16653664];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_60""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_60"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_60"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_736 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [22938.553, 15771.788, 0.00017738342];
	_vehicle_736 = _this;
	_this setDir 320.86758;
	_this setPos [22938.553, 15771.788, 0.00017738342];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_61
_vehicle_739 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19884.725, 11532.622, 7.6293945e-005];
	_vehicle_739 = _this;
	_this setDir 355.44507;
	_this setPos [19884.725, 11532.622, 7.6293945e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_61""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_742 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19887.836, 11536.203, 4.6876197];
	_vehicle_742 = _this;
	_this setDir 896.78461;
	_this setPos [19887.836, 11536.203, 4.6876197];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_61""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_745 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19879.045, 11541.381, 3.8988726];
	_vehicle_745 = _this;
	_this setVehicleVarName "SD_61";
	SD_61 = _this;
	_this setDir 177.7283;
	_this setPos [19879.045, 11541.381, 3.8988726];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_61""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_61"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_61"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_748 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19888.063, 11517.268, -3.8146973e-005];
	_vehicle_748 = _this;
	_this setDir 266.88193;
	_this setPos [19888.063, 11517.268, -3.8146973e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_62
_vehicle_751 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19486.15, 13259.273, 2.6702881e-005];
	_vehicle_751 = _this;
	_this setDir 239.61023;
	_this setPos [19486.15, 13259.273, 2.6702881e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_62""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_754 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19480.475, 13259.12, 0.58949184];
	_vehicle_754 = _this;
	_this setDir 961.66003;
	_this setPos [19480.475, 13259.12, 0.58949184];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_62""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_757 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19478.102, 13254.455, 0.2666043];
	_vehicle_757 = _this;
	_this setVehicleVarName "SD_63";
	SD_63 = _this;
	_this setDir 151.92905;
	_this setPos [19478.102, 13254.455, 0.2666043];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_62""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_62"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_62"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_760 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19488.658, 13268.049, 6.4849854e-005];
	_vehicle_760 = _this;
	_this setDir 280.90594;
	_this setPos [19488.658, 13268.049, 6.4849854e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_63
_vehicle_762 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18551.332, 14670.741, 6.6757202e-005];
	_vehicle_762 = _this;
	_this setDir 399.49936;
	_this setPos [18551.332, 14670.741, 6.6757202e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_63""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_765 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18556.426, 14667.706, 0.35753584];
	_vehicle_765 = _this;
	_this setDir 1029.6885;
	_this setPos [18556.426, 14667.706, 0.35753584];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_63""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_768 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18556.205, 14675.054, 0.63102722];
	_vehicle_768 = _this;
	_this setVehicleVarName "SD_63";
	SD_63 = _this;
	_this setDir 129.69408;
	_this setPos [18556.205, 14675.054, 0.63102722];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_63""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_63"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_63"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_771 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18549.242, 14656.401, 5.7220459e-006];
	_vehicle_771 = _this;
	_this setDir 397.76044;
	_this setPos [18549.242, 14656.401, 5.7220459e-006];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_64
_vehicle_774 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20860.648, 17075.939, 1.1444092e-005];
	_vehicle_774 = _this;
	_this setDir 292.27881;
	_this setPos [20860.648, 17075.939, 1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_64""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_777 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20852.441, 17070.143, 0.26973775];
	_vehicle_777 = _this;
	_this setDir 1013.9841;
	_this setPos [20852.441, 17070.143, 0.26973775];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_64""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_780 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20856.098, 17068.363, 0.26520482];
	_vehicle_780 = _this;
	_this setVehicleVarName "SD_64";
	SD_64 = _this;
	_this setDir 115.50905;
	_this setPos [20856.098, 17068.363, 0.26520482];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_64""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_64"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_64"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_65
_vehicle_783 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19311.73, 16351.739, 0.34824866];
	_vehicle_783 = _this;
	_this setDir 179.39691;
	_this setPos [19311.73, 16351.739, 0.34824866];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_65""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_786 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19314.248, 16350.762, 0.46986935];
	_vehicle_786 = _this;
	_this setDir 990.37878;
	_this setPos [19314.248, 16350.762, 0.46986935];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_65""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_789 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19310.064, 16345.417, 0.38342416];
	_vehicle_789 = _this;
	_this setVehicleVarName "SD_65";
	SD_65 = _this;
	_this setDir 115.50905;
	_this setPos [19310.064, 16345.417, 0.38342416];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_65""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_65"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_65"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_792 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19286.475, 16348.463, 6.4849854e-005];
	_vehicle_792 = _this;
	_this setDir 545.56696;
	_this setPos [19286.475, 16348.463, 6.4849854e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_66
_vehicle_797 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17489.586, 14485.896, -0.00022983551];
	_vehicle_797 = _this;
	_this setDir 135.42444;
	_this setPos [17489.586, 14485.896, -0.00022983551];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_66""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_800 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17492.385, 14482.546, 0.37386009];
	_vehicle_800 = _this;
	_this setDir 943.38269;
	_this setPos [17492.385, 14482.546, 0.37386009];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_66""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_803 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17491.783, 14480.023, 0.35524741];
	_vehicle_803 = _this;
	_this setVehicleVarName "SD_66";
	SD_66 = _this;
	_this setDir 133.68636;
	_this setPos [17491.783, 14480.023, 0.35524741];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_66""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_66"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_66"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus SD_67
_vehicle_806 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4464.7144, 12434.201, 8.7738037e-005];
	_vehicle_806 = _this;
	_this setDir 308.89447;
	_this setPos [4464.7144, 12434.201, 8.7738037e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_67""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_809 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4455.1216, 12432.787, 0.59923196];
	_vehicle_809 = _this;
	_this setDir 938.99603;
	_this setPos [4455.1216, 12432.787, 0.59923196];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_67""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_812 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4455.8501, 12438.286, 0.45027116];
	_vehicle_812 = _this;
	_this setVehicleVarName "SD_67";
	SD_67 = _this;
	_this setDir 39.672989;
	_this setPos [4455.8501, 12438.286, 0.45027116];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_67""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_67"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_67"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_815 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [4473.6328, 12417.992, -7.2479248e-005];
	_vehicle_815 = _this;
	_this setDir 483.69498;
	_this setPos [4473.6328, 12417.992, -7.2479248e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_68
_vehicle_818 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3602.385, 13442.749, 0.49479508];
	_vehicle_818 = _this;
	_this setDir 308.89447;
	_this setPos [3602.385, 13442.749, 0.49479508];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_68""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_821 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [3596.2329, 13441.544, 0.86831683];
	_vehicle_821 = _this;
	_this setDir 938.99603;
	_this setPos [3596.2329, 13441.544, 0.86831683];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_68""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_824 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3599.2109, 13436.238, 0.70156628];
	_vehicle_824 = _this;
	_this setVehicleVarName "SD_68";
	SD_68 = _this;
	_this setDir 40.825848;
	_this setPos [3599.2109, 13436.238, 0.70156628];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_68""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_68"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_68"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_827 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3615.4116, 13459.189, -0.00012588501];
	_vehicle_827 = _this;
	_this setDir 491.297;
	_this setPos [3615.4116, 13459.189, -0.00012588501];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus SD_69
_vehicle_830 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13583.25, 12193.6, -3.6239624e-005];
	_vehicle_830 = _this;
	_this setDir 294.79736;
	_this setPos [13583.25, 12193.6, -3.6239624e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_69""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_833 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [13580.13, 12194.048, 3.3474557];
	_vehicle_833 = _this;
	_this setDir 1012.8867;
	_this setPos [13580.13, 12194.048, 3.3474557];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_69""]; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_836 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13581.946, 12193.059, 3.1042373];
	_vehicle_836 = _this;
	_this setVehicleVarName "SD_69";
	SD_69 = _this;
	_this setDir 113.99442;
	_this setPos [13581.946, 12193.059, 3.1042373];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_69""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_69"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_69"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_839 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [13597.097, 12180.222, 3.2424927e-005];
	_vehicle_839 = _this;
	_this setDir 570.36511;
	_this setPos [13597.097, 12180.222, 3.2424927e-005];
_this allowDamage false;  _this enableSimulation false; };

//Haus SD_70
_vehicle_841 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12823.316, 14297.11, 1.1920929e-005];
	_vehicle_841 = _this;
	_this setDir 329.97061;
	_this setPos [12823.316, 14297.11, 1.1920929e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_70"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_844 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12823.441, 14301.993, 0.12822904];
	_vehicle_844 = _this;
	_this setDir 960.53314;
	_this setPos [12823.441, 14301.993, 0.12822904];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_70"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_847 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12825.861, 14303.235, 0.12507889];
	_vehicle_847 = _this;
	_this setVehicleVarName "SD_70";
	SD_70 = _this;
	_this setDir 113.99442;
	_this setPos [12825.861, 14303.235, 0.12507889];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_70""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_70"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_70"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_71
_vehicle_850 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11462.942, 14114.36, 0.42040062];
	_vehicle_850 = _this;
	_this setDir 482.72769;
	_this setPos [11462.942, 14114.36, 0.42040062];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_71"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_853 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11464.832, 14115.496, 0.53203481];
	_vehicle_853 = _this;
	_this setDir 932.15143;
	_this setPos [11464.832, 14115.496, 0.53203481];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_71"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_856 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11465.111, 14121.249, 0.29412907];
	_vehicle_856 = _this;
	_this setVehicleVarName "SD_71";
	SD_71 = _this;
	_this setDir 33.496269;
	_this setPos [11465.111, 14121.249, 0.29412907];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_71""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_71"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_71"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_859 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11452.677, 14125.984, 1.1444092e-005];
	_vehicle_859 = _this;
	_this setDir 573.83179;
	_this setPos [11452.677, 14125.984, 1.1444092e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_72
_vehicle_862 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22288.244, 22028.055, 4.5776367e-005];
	_vehicle_862 = _this;
	_this setDir 347.39594;
	_this setPos [22288.244, 22028.055, 4.5776367e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_72"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_865 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22288.701, 22032.299, 0.28370225];
	_vehicle_865 = _this;
	_this setVehicleVarName "SD_72";
	SD_72 = _this;
	_this setDir -103.93874;
	_this setPos [22288.701, 22032.299, 0.28370225];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_72""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_72"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_72"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_871 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [22283.908, 22028.738, 0.44551417];
	_vehicle_871 = _this;
	_this setDir 887.15802;
	_this setPos [22283.908, 22028.738, 0.44551417];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_72"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_875 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [22294.139, 21999.725, 0.00012779236];
	_vehicle_875 = _this;
	_this setDir 433.03186;
	_this setPos [22294.139, 21999.725, 0.00012779236];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_73
_vehicle_878 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12146.104, 8440.5508, -7.4386597e-005];
	_vehicle_878 = _this;
	_this setDir 361.20932;
	_this setPos [12146.104, 8440.5508, -7.4386597e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_73"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_881 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12146.005, 8462.5664, 0.45975474];
	_vehicle_881 = _this;
	_this setVehicleVarName "SD_73";
	SD_73 = _this;
	_this setDir -93.335907;
	_this setPos [12146.005, 8462.5664, 0.45975474];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_73""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_73"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_73"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_884 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12137.877, 8463.2354, 0.33869937];
	_vehicle_884 = _this;
	_this setDir 900.66992;
	_this setPos [12137.877, 8463.2354, 0.33869937];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_73"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_887 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12142.274, 8415.8887, 3.8146973e-006];
	_vehicle_887 = _this;
	_this setDir 358.24219;
	_this setPos [12142.274, 8415.8887, 3.8146973e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_74
_vehicle_890 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20306.238, 11645.831, -0.00011444092];
	_vehicle_890 = _this;
	_this setDir 183.39526;
	_this setPos [20306.238, 11645.831, -0.00011444092];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_74"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_893 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20311.672, 11644.656, 0.96305364];
	_vehicle_893 = _this;
	_this setVehicleVarName "SD_74";
	SD_74 = _this;
	_this setDir -86.28511;
	_this setPos [20311.672, 11644.656, 0.96305364];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_74""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_74"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_74"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_896 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20307.326, 11641.315, 0.78080326];
	_vehicle_896 = _this;
	_this setDir 902.94861;
	_this setPos [20307.326, 11641.315, 0.78080326];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_74"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_899 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20399.074, 11570.934, -0.00012588501];
	_vehicle_899 = _this;
	_this setDir 399.04865;
	_this setPos [20399.074, 11570.934, -0.00012588501];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_75
_vehicle_902 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20307.873, 11660.069, 0.26949257];
	_vehicle_902 = _this;
	_this setDir 93.151024;
	_this setPos [20307.873, 11660.069, 0.26949257];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_75"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_905 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20308.85, 11662.945, 0.41857094];
	_vehicle_905 = _this;
	_this setVehicleVarName "SD_75";
	SD_75 = _this;
	_this setDir -172.71317;
	_this setPos [20308.85, 11662.945, 0.41857094];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_75""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_75"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_75"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_908 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20313.398, 11659.907, 0.10494163];
	_vehicle_908 = _this;
	_this setDir 995.35577;
	_this setPos [20313.398, 11659.907, 0.10494163];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_75"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_76
_vehicle_910 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16776.016, 16506.922, -9.3460083e-005];
	_vehicle_910 = _this;
	_this setDir 33.91993;
	_this setPos [16776.016, 16506.922, -9.3460083e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_76"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_913 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16777.873, 16506.621, 0.45266142];
	_vehicle_913 = _this;
	_this setVehicleVarName "SD_76";
	SD_76 = _this;
	_this setDir -146.93272;
	_this setPos [16777.873, 16506.621, 0.45266142];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_76""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_76"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_76"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_916 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16778.721, 16510.133, 0.37585896];
	_vehicle_916 = _this;
	_this setDir 1022.8738;
	_this setPos [16778.721, 16510.133, 0.37585896];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_76"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_919 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16777.422, 16490.568, -0.00032424927];
	_vehicle_919 = _this;
	_this setDir 485.85184;
	_this setPos [16777.422, 16490.568, -0.00032424927];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_77
_vehicle_922 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [5339.0645, 14537.264, -2.6702881e-005];
	_vehicle_922 = _this;
	_this setDir 62.266544;
	_this setPos [5339.0645, 14537.264, -2.6702881e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_77"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_925 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [5344.9971, 14535.125, 0.0056108595];
	_vehicle_925 = _this;
	_this setVehicleVarName "SD_77";
	SD_77 = _this;
	_this setDir -119.60168;
	_this setPos [5344.9971, 14535.125, 0.0056108595];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_77""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_77"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_77"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_928 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [5343.5649, 14537.729, 0.28187543];
	_vehicle_928 = _this;
	_this setDir 1049.5237;
	_this setPos [5343.5649, 14537.729, 0.28187543];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_77"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_931 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [5338.7109, 14557.184, 5.7220459e-005];
	_vehicle_931 = _this;
	_this setDir 418.27756;
	_this setPos [5338.7109, 14557.184, 5.7220459e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_78
_vehicle_933 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12021.627, 12326.214, -9.1552734e-005];
	_vehicle_933 = _this;
	_this setDir 35.36097;
	_this setPos [12021.627, 12326.214, -9.1552734e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_78"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_936 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12020.408, 12330.256, 0.23913023];
	_vehicle_936 = _this;
	_this setVehicleVarName "SD_78";
	SD_78 = _this;
	_this setDir -144.40236;
	_this setPos [12020.408, 12330.256, 0.23913023];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_78""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_78"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_78"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_939 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12025.277, 12328.968, 0.38889188];
	_vehicle_939 = _this;
	_this setDir 1024.1163;
	_this setPos [12025.277, 12328.968, 0.38889188];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_78"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_942 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12001.193, 12306.894, -5.8174133e-005];
	_vehicle_942 = _this;
	_this setDir 306.18246;
	_this setPos [12001.193, 12306.894, -5.8174133e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_79
_vehicle_944 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12918.452, 18053.09, 5.7220459e-006];
	_vehicle_944 = _this;
	_this setDir 123.38637;
	_this setPos [12918.452, 18053.09, 5.7220459e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_79"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_947 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12922.92, 18049.902, 0.32127982];
	_vehicle_947 = _this;
	_this setVehicleVarName "SD_79";
	SD_79 = _this;
	_this setDir -148.75911;
	_this setPos [12922.92, 18049.902, 0.32127982];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_79""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_79"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_79"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_950 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12921.614, 18054.916, 0.42848983];
	_vehicle_950 = _this;
	_this setDir 1021.4174;
	_this setPos [12921.614, 18054.916, 0.42848983];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_79"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_953 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12902.611, 18070.484, -5.7220459e-006];
	_vehicle_953 = _this;
	_this setDir 287.77481;
	_this setPos [12902.611, 18070.484, -5.7220459e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_80
_vehicle_956 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20074.516, 6711.7705, 6.1035156e-005];
	_vehicle_956 = _this;
	_this setDir 42.330173;
	_this setPos [20074.516, 6711.7705, 6.1035156e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_80"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_959 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20098.967, 6720.1689, 0.77343154];
	_vehicle_959 = _this;
	_this setVehicleVarName "SD_80";
	SD_80 = _this;
	_this setDir -145.19794;
	_this setPos [20098.967, 6720.1689, 0.77343154];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_80""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_80"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_80"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_962 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20091.809, 6722.8647, 0.60125035];
	_vehicle_962 = _this;
	_this setDir 1028.5515;
	_this setPos [20091.809, 6722.8647, 0.60125035];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_80"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_965 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20046.873, 6718.5557, -0.00022125244];
	_vehicle_965 = _this;
	_this setDir 132.20706;
	_this setPos [20046.873, 6718.5557, -0.00022125244];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_81
_vehicle_969 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [5758.7998, 14664.877, -1.1444092e-005];
	_vehicle_969 = _this;
	_this setDir 33.066067;
	_this setPos [5758.7998, 14664.877, -1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_81"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_972 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [5762.4077, 14667.488, 0.30192509];
	_vehicle_972 = _this;
	_this setVehicleVarName "SD_81";
	SD_81 = _this;
	_this setDir -147.62733;
	_this setPos [5762.4077, 14667.488, 0.30192509];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_81""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_81"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_81"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_975 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [5759.6694, 14665.052, 0.3158946];
	_vehicle_975 = _this;
	_this setDir 1022.3938;
	_this setPos [5759.6694, 14665.052, 0.3158946];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_81"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_978 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [5759.4795, 14651.457, 5.9127808e-005];
	_vehicle_978 = _this;
	_this setDir 123.83067;
	_this setPos [5759.4795, 14651.457, 5.9127808e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_82
_vehicle_982 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16724.756, 12707.585, -1.9073486e-006];
	_vehicle_982 = _this;
	_this setDir -147.23334;
	_this setPos [16724.756, 12707.585, -1.9073486e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_82"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_985 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16726.268, 12701.661, 0.2750285];
	_vehicle_985 = _this;
	_this setVehicleVarName "SD_82";
	SD_82 = _this;
	_this setDir -241.69031;
	_this setPos [16726.268, 12701.661, 0.2750285];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_82""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_82"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_82"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_988 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16720.707, 12706.262, 0.66310841];
	_vehicle_988 = _this;
	_this setDir 1020.8248;
	_this setPos [16720.707, 12706.262, 0.66310841];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_82"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_83
_vehicle_1003 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16560.416, 16159.241, 0.35934651];
	_vehicle_1003 = _this;
	_this setDir -328.98026;
	_this setPos [16560.416, 16159.241, 0.35934651];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_83"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1006 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16570.383, 16164.074, 0.2336695];
	_vehicle_1006 = _this;
	_this setVehicleVarName "SD_83";
	SD_83 = _this;
	_this setDir -147.51852;
	_this setPos [16570.383, 16164.074, 0.2336695];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_83""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_83"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_83"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1009 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16562.6, 16165.985, 0.47254676];
	_vehicle_1009 = _this;
	_this setDir 1201.506;
	_this setPos [16562.6, 16165.985, 0.47254676];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_83"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1012 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16577.578, 16144.223, 3.7193298e-005];
	_vehicle_1012 = _this;
	_this setDir 306.32074;
	_this setPos [16577.578, 16144.223, 3.7193298e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_84
_vehicle_1016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12553.171, 14190.683, 0.42713818];
	_vehicle_1016 = _this;
	_this setDir -203.67444;
	_this setPos [12553.171, 14190.683, 0.42713818];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_84"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12558.612, 14195.318, 0.65867078];
	_vehicle_1019 = _this;
	_this setVehicleVarName "SD_84";
	SD_84 = _this;
	_this setDir -115.00179;
	_this setPos [12558.612, 14195.318, 0.65867078];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_84""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_84"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_84"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1022 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12553.953, 14184.951, 0.53740007];
	_vehicle_1022 = _this;
	_this setDir 1234.4365;
	_this setPos [12553.953, 14184.951, 0.53740007];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_84"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_85
_vehicle_1028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20187.447, 11458.768, 0.35986871];
	_vehicle_1028 = _this;
	_this setDir -132.13133;
	_this setPos [20187.447, 11458.768, 0.35986871];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_85"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20181.984, 11450.873, 0.10268237];
	_vehicle_1031 = _this;
	_this setVehicleVarName "SD_85";
	SD_85 = _this;
	_this setDir -130.46509;
	_this setPos [20181.984, 11450.873, 0.10268237];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_85""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_85"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_85"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1034 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20180.531, 11459.71, 0.4267652];
	_vehicle_1034 = _this;
	_this setDir 1219.0504;
	_this setPos [20180.531, 11459.71, 0.4267652];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_85"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1037 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20202.926, 11478.971, 7.2479248e-005];
	_vehicle_1037 = _this;
	_this setDir 407.07089;
	_this setPos [20202.926, 11478.971, 7.2479248e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_86
_vehicle_1039 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14760.915, 20740.295, -8.0108643e-005];
	_vehicle_1039 = _this;
	_this setDir -81.324707;
	_this setPos [14760.915, 20740.295, -8.0108643e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_86"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1042 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14756.988, 20743.502, 0.38210416];
	_vehicle_1042 = _this;
	_this setVehicleVarName "SD_86";
	SD_86 = _this;
	_this setDir -80.078957;
	_this setPos [14756.988, 20743.502, 0.38210416];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_86""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_86"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_86"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1045 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [14754.908, 20743.633, 0.38565078];
	_vehicle_1045 = _this;
	_this setDir 1357.4309;
	_this setPos [14754.908, 20743.633, 0.38565078];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_85"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1048 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [14724.634, 20737.371, 4.9591064e-005];
	_vehicle_1048 = _this;
	_this setDir 548.64905;
	_this setPos [14724.634, 20737.371, 4.9591064e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_87
_vehicle_1051 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20854.055, 17098.848, -4.9591064e-005];
	_vehicle_1051 = _this;
	_this setDir 40.003521;
	_this setPos [20854.055, 17098.848, -4.9591064e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_87"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1054 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20866.127, 17092.701, 0.33872542];
	_vehicle_1054 = _this;
	_this setVehicleVarName "SD_87";
	SD_87 = _this;
	_this setDir -64.971458;
	_this setPos [20866.127, 17092.701, 0.33872542];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_87""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_87"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_87"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1057 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20863.869, 17097.156, 0.36555761];
	_vehicle_1057 = _this;
	_this setDir 1376.9742;
	_this setPos [20863.869, 17097.156, 0.36555761];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_87"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_88
_vehicle_1060 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [25655.234, 21325.939, 0.00010108948];
	_vehicle_1060 = _this;
	_this setDir 45.332813;
	_this setPos [25655.234, 21325.939, 0.00010108948];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_88"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1063 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [25659.979, 21327.523, 0.38052136];
	_vehicle_1063 = _this;
	_this setVehicleVarName "SD_88";
	SD_88 = _this;
	_this setDir -42.378185;
	_this setPos [25659.979, 21327.523, 0.38052136];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_88""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_88"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_88"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1066 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [25662.41, 21333.504, 0.29858491];
	_vehicle_1066 = _this;
	_this setDir 1307.605;
	_this setPos [25662.41, 21333.504, 0.29858491];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_88"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_89
_vehicle_1068 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19394.477, 15466.209, 0.30974644];
	_vehicle_1068 = _this;
	_this setDir 2.3515871;
	_this setPos [19394.477, 15466.209, 0.30974644];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_89"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1071 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19398.641, 15469.14, 0.23013607];
	_vehicle_1071 = _this;
	_this setVehicleVarName "SD_89";
	SD_89 = _this;
	_this setDir 0.93713111;
	_this setPos [19398.641, 15469.14, 0.23013607];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_89""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_89"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_89"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1074 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19399.836, 15473.068, 0.34583423];
	_vehicle_1074 = _this;
	_this setDir 1351.5291;
	_this setPos [19399.836, 15473.068, 0.34583423];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_89"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1077 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19386.811, 15423.74, -0.00011444092];
	_vehicle_1077 = _this;
	_this setDir 719.90039;
	_this setPos [19386.811, 15423.74, -0.00011444092];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_90
_vehicle_1079 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13613.232, 14937.078, -4.4822693e-005];
	_vehicle_1079 = _this;
	_this setDir 21.013521;
	_this setPos [13613.232, 14937.078, -4.4822693e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_90"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false; _this allowDamage false; _this setvectorup [0,0,1]; };

_vehicle_1082 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13615.217, 14937.157, 0.35239378];
	_vehicle_1082 = _this;
	_this setVehicleVarName "SD_90";
	SD_90 = _this;
	_this setDir 19.895926;
	_this setPos [13615.217, 14937.157, 0.35239378];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_90""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_90"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_90"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1085 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [13615.198, 14940.785, 0.36517113];
	_vehicle_1085 = _this;
	_this setDir 1370.937;
	_this setPos [13615.198, 14940.785, 0.36517113];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_90"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1088 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [13587.472, 14918.489, -3.3378601e-006];
	_vehicle_1088 = _this;
	_this setDir 719.90039;
	_this setPos [13587.472, 14918.489, -3.3378601e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_91
_vehicle_1091 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3717.0452, 13402.112, 0.31794143];
	_vehicle_1091 = _this;
	_this setDir -143.97911;
	_this setPos [3717.0452, 13402.112, 0.31794143];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_91"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1094 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3703.9287, 13392.218, 1.2117579];
	_vehicle_1094 = _this;
	_this setVehicleVarName "SD_91";
	SD_91 = _this;
	_this setDir -53.915028;
	_this setPos [3703.9287, 13392.218, 1.2117579];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_91""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_91"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_91"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1097 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [3708.0786, 13396.48, 0.92428225];
	_vehicle_1097 = _this;
	_this setDir 1298.7408;
	_this setPos [3708.0786, 13396.48, 0.92428225];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_91"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_92
_vehicle_1100 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20321.152, 18655.49, 0.47834063];
	_vehicle_1100 = _this;
	_this setDir -333.85229;
	_this setPos [20321.152, 18655.49, 0.47834063];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_92"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1103 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20326.936, 18666.777, 0.28926212];
	_vehicle_1103 = _this;
	_this setVehicleVarName "SD_92";
	SD_92 = _this;
	_this setDir -63.395897;
	_this setPos [20326.936, 18666.777, 0.28926212];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_92""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_92"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_92"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1106 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20329.633, 18663.336, 0.27300695];
	_vehicle_1106 = _this;
	_this setDir 1287.0669;
	_this setPos [20329.633, 18663.336, 0.27300695];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_92"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1109 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20341.273, 18650.83, -0.00012969971];
	_vehicle_1109 = _this;
	_this setDir 745.29156;
	_this setPos [20341.273, 18650.83, -0.00012969971];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_93
_vehicle_1112 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19417.936, 15396.804, 4.0054321e-005];
	_vehicle_1112 = _this;
	_this setDir -482.12964;
	_this setPos [19417.936, 15396.804, 4.0054321e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_93"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1115 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19417.492, 15375.814, 0.30600381];
	_vehicle_1115 = _this;
	_this setVehicleVarName "SD_93";
	SD_93 = _this;
	_this setDir -63.395897;
	_this setPos [19417.492, 15375.814, 0.30600381];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_93""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_93"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_93"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1118 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19416.809, 15381.142, 0.40247393];
	_vehicle_1118 = _this;
	_this setDir 1332.4939;
	_this setPos [19416.809, 15381.142, 0.40247393];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_93"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1121 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19434.252, 15400.332, -4.0054321e-005];
	_vehicle_1121 = _this;
	_this setDir 694.39099;
	_this setPos [19434.252, 15400.332, -4.0054321e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_94
_vehicle_1123 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11403.516, 14753.067, -7.6293945e-006];
	_vehicle_1123 = _this;
	_this setDir -473.86682;
	_this setPos [11403.516, 14753.067, -7.6293945e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_94"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1126 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11401.622, 14753.921, 0.38793394];
	_vehicle_1126 = _this;
	_this setDir 1325.1438;
	_this setPos [11401.622, 14753.921, 0.38793394];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_94"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1129 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11399.049, 14752.171, 0.33132857];
	_vehicle_1129 = _this;
	_this setVehicleVarName "SD_94";
	SD_94 = _this;
	_this setDir -25.438583;
	_this setPos [11399.049, 14752.171, 0.33132857];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_94""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_94"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_94"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1132 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11417.217, 14771.842, 0.00013542175];
	_vehicle_1132 = _this;
	_this setDir 692.3678;
	_this setPos [11417.217, 14771.842, 0.00013542175];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_95
_vehicle_1135 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19302.906, 15217.623, 0.00039100647];
	_vehicle_1135 = _this;
	_this setDir -543.3269;
	_this setPos [19302.906, 15217.623, 0.00039100647];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_95"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1138 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19302.213, 15212.625, 0.33081445];
	_vehicle_1138 = _this;
	_this setDir 1346.6289;
	_this setPos [19302.213, 15212.625, 0.33081445];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_95"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1141 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19307.641, 15212.72, 0.16802122];
	_vehicle_1141 = _this;
	_this setVehicleVarName "SD_95";
	SD_95 = _this;
	_this setDir -91.019547;
	_this setPos [19307.641, 15212.72, 0.16802122];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_95""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_95"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_95"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1144 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19318.35, 15216.125, 0.00026702881];
	_vehicle_1144 = _this;
	_this setDir 536.3244;
	_this setPos [19318.35, 15216.125, 0.00026702881];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_96
_vehicle_1147 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [6904.9355, 11131.142, 1.3312018];
	_vehicle_1147 = _this;
	_this setDir -670.4024;
	_this setPos [6904.9355, 11131.142, 1.3312018];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_96"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1150 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [6904.8081, 11137.245, 1.0176401];
	_vehicle_1150 = _this;
	_this setDir 1399.4752;
	_this setPos [6904.8081, 11137.245, 1.0176401];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_96"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1153 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [6899.1235, 11135.233, 0.7380594];
	_vehicle_1153 = _this;
	_this setVehicleVarName "SD_96";
	SD_96 = _this;
	_this setDir -39.226871;
	_this setPos [6899.1235, 11135.233, 0.7380594];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_96""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_96"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_96"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1156 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [6934.4316, 11138.729, -2.9563904e-005];
	_vehicle_1156 = _this;
	_this setDir 687.29413;
	_this setPos [6934.4316, 11138.729, -2.9563904e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_97
_vehicle_1159 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [6908.5947, 11096.771, -1.6212463e-005];
	_vehicle_1159 = _this;
	_this setDir -528.16394;
	_this setPos [6908.5947, 11096.771, -1.6212463e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_97"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1162 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [6906.4463, 11093.832, 0.64670455];
	_vehicle_1162 = _this;
	_this setDir 1452.5752;
	_this setPos [6906.4463, 11093.832, 0.64670455];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_97"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1165 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [6906.6582, 11096.383, 0.56649357];
	_vehicle_1165 = _this;
	_this setVehicleVarName "SD_97";
	SD_97 = _this;
	_this setDir 13.053835;
	_this setPos [6906.6582, 11096.383, 0.56649357];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_97""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_97"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_97"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1168 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [6931.4141, 11092.34, -1.4305115e-005];
	_vehicle_1168 = _this;
	_this setDir 533.80701;
	_this setPos [6931.4141, 11092.34, -1.4305115e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_98
_vehicle_1171 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9491.8154, 15935.529, 1.5258789e-005];
	_vehicle_1171 = _this;
	_this setDir -721.92786;
	_this setPos [9491.8154, 15935.529, 1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_98"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1174 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9489.3213, 15940.966, 0.67001581];
	_vehicle_1174 = _this;
	_this setDir 1437.9761;
	_this setPos [9489.3213, 15940.966, 0.67001581];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_98"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1177 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9497.8564, 15940.492, 0.50825125];
	_vehicle_1177 = _this;
	_this setVehicleVarName "SD_98";
	SD_98 = _this;
	_this setDir -3.2252486;
	_this setPos [9497.8564, 15940.492, 0.50825125];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_98""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_98"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_98"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1180 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9474.8174, 15901.001, -7.6293945e-006];
	_vehicle_1180 = _this;
	_this setDir 354.20041;
	_this setPos [9474.8174, 15901.001, -7.6293945e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_99
_vehicle_1182 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16765.404, 16010.681, 5.6266785e-005];
	_vehicle_1182 = _this;
	_this setDir -670.45288;
	_this setPos [16765.404, 16010.681, 5.6266785e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_99"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1185 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16767.129, 16011.457, 0.24754731];
	_vehicle_1185 = _this;
	_this setDir 1490.2107;
	_this setPos [16767.129, 16011.457, 0.24754731];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_99"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1188 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16767.043, 16017.98, 0.34823629];
	_vehicle_1188 = _this;
	_this setVehicleVarName "SD_99";
	SD_99 = _this;
	_this setDir -74.584885;
	_this setPos [16767.043, 16017.98, 0.34823629];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_99""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_99"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_99"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1191 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16748.523, 15998.176, -2.7656555e-005];
	_vehicle_1191 = _this;
	_this setDir 413.68875;
	_this setPos [16748.523, 15998.176, -2.7656555e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_100
_vehicle_1194 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20341.314, 11592.754, 3.0517578e-005];
	_vehicle_1194 = _this;
	_this setDir -765.51508;
	_this setPos [20341.314, 11592.754, 3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_100"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_1197 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20334.061, 11592.654, 0.11371661];
	_vehicle_1197 = _this;
	_this setDir 1574.1053;
	_this setPos [20334.061, 11592.654, 0.11371661];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_100"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1200 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20336.078, 11596.022, 0.33659124];
	_vehicle_1200 = _this;
	_this setVehicleVarName "SD_100";
	SD_100 = _this;
	_this setDir -134.96274;
	_this setPos [20336.078, 11596.022, 0.33659124];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_100""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_100"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_100"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_101
_vehicle_1206 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [2965.4758, 18526.922, 5.531311e-005];
	_vehicle_1206 = _this;
	_this setDir -777.42554;
	_this setPos [2965.4758, 18526.922, 5.531311e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_101"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1209 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [2956.9617, 18523.951, 0.47517726];
	_vehicle_1209 = _this;
	_this setDir 1561.8263;
	_this setPos [2956.9617, 18523.951, 0.47517726];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_101"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1212 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [2956.2842, 18529.721, 1.4229329];
	_vehicle_1212 = _this;
	_this setVehicleVarName "SD_101";
	SD_101 = _this;
	_this setDir 31.102448;
	_this setPos [2956.2842, 18529.721, 1.4229329];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_101""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_101"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_101"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1216 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3000.05, 18508.262, -3.8146973e-006];
	_vehicle_1216 = _this;
	_this setDir 754.72046;
	_this setPos [3000.05, 18508.262, -3.8146973e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_102
_vehicle_1219 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20360.721, 11791.188, 0.00025558472];
	_vehicle_1219 = _this;
	_this setDir -754.61804;
	_this setPos [20360.721, 11791.188, 0.00025558472];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_102"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1222 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20351.289, 11787.368, 0.61448091];
	_vehicle_1222 = _this;
	_this setDir 1585.2139;
	_this setPos [20351.289, 11787.368, 0.61448091];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_102"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1225 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20354.293, 11797.918, 1.6545385];
	_vehicle_1225 = _this;
	_this setVehicleVarName "SD_102";
	SD_102 = _this;
	_this setDir 54.748798;
	_this setPos [20354.293, 11797.918, 1.6545385];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_102""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_102"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_102"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_103
_vehicle_1228 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10751.509, 12139.736, -0.046372078];
	_vehicle_1228 = _this;
	_this setDir -854.70319;
	_this setPos [10751.509, 12139.736, -0.046372078];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_103"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1231 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10747.156, 12138.269, 0.36648759];
	_vehicle_1231 = _this;
	_this setDir 1575.2643;
	_this setPos [10747.156, 12138.269, 0.36648759];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_103"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1234 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10745.13, 12140.3, 0.33719295];
	_vehicle_1234 = _this;
	_this setVehicleVarName "SD_103";
	SD_103 = _this;
	_this setDir 45.642105;
	_this setPos [10745.13, 12140.3, 0.33719295];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_103""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_103"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_103"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1237 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10772.888, 12156.871, 0.00024604797];
	_vehicle_1237 = _this;
	_this setDir 753.07562;
	_this setPos [10772.888, 12156.871, 0.00024604797];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_104
_vehicle_1240 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17692.137, 12620.522, 0.32961807];
	_vehicle_1240 = _this;
	_this setDir -947.88013;
	_this setPos [17692.137, 12620.522, 0.32961807];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_104"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1243 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17695.105, 12615.512, 0.47227672];
	_vehicle_1243 = _this;
	_this setDir 1573.484;
	_this setPos [17695.105, 12615.512, 0.47227672];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_104"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1246 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17699.156, 12621.996, 0.41435218];
	_vehicle_1246 = _this;
	_this setVehicleVarName "SD_104";
	SD_104 = _this;
	_this setDir -48.038807;
	_this setPos [17699.156, 12621.996, 0.41435218];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_104""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_104"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_104"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1249 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [17679.658, 12636.255, -7.2479248e-005];
	_vehicle_1249 = _this;
	_this setDir 575.84485;
	_this setPos [17679.658, 12636.255, -7.2479248e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_105
_vehicle_1252 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3557.7339, 11629.328, 0.3404454];
	_vehicle_1252 = _this;
	_this setDir -1030.0244;
	_this setPos [3557.7339, 11629.328, 0.3404454];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_105"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1255 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [3566.4233, 11629.926, 0.34608564];
	_vehicle_1255 = _this;
	_this setDir 1399.0308;
	_this setPos [3566.4233, 11629.926, 0.34608564];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_105"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1258 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [3561.0723, 11635.364, 0.3123619];
	_vehicle_1258 = _this;
	_this setVehicleVarName "SD_105";
	SD_105 = _this;
	_this setDir -132.84273;
	_this setPos [3561.0723, 11635.364, 0.3123619];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_105""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_105"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_105"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1261 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3544.3669, 11611.046, 1.4305115e-006];
	_vehicle_1261 = _this;
	_this setDir 407.69547;
	_this setPos [3544.3669, 11611.046, 1.4305115e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_106
_vehicle_1263 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16693.262, 16109.07, 0.24769953];
	_vehicle_1263 = _this;
	_this setDir -959.375;
	_this setPos [16693.262, 16109.07, 0.24769953];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_106"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1266 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16696.541, 16100.028, 0.51919132];
	_vehicle_1266 = _this;
	_this setDir 1382.6907;
	_this setPos [16696.541, 16100.028, 0.51919132];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_106"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1269 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16699.893, 16107.92, 0.42010117];
	_vehicle_1269 = _this;
	_this setVehicleVarName "SD_106";
	SD_106 = _this;
	_this setDir -238.56276;
	_this setPos [16699.893, 16107.92, 0.42010117];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_106""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_106"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_106"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1272 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16715.809, 16119.999, -6.4849854e-005];
	_vehicle_1272 = _this;
	_this setDir 570.52045;
	_this setPos [16715.809, 16119.999, -6.4849854e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_107
_vehicle_1274 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9404.8506, 11990.69, 0.42625311];
	_vehicle_1274 = _this;
	_this setDir -1211.4249;
	_this setPos [9404.8506, 11990.69, 0.42625311];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_107"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1277 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9398.0752, 11991.608, 0.27772829];
	_vehicle_1277 = _this;
	_this setDir 1399.991;
	_this setPos [9398.0752, 11991.608, 0.27772829];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_107"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1280 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9399.1484, 11982.885, 0.37353504];
	_vehicle_1280 = _this;
	_this setVehicleVarName "SD_107";
	SD_107 = _this;
	_this setDir -220.20732;
	_this setPos [9399.1484, 11982.885, 0.37353504];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_107""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_107"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_107"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1283 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9410.2188, 12005.452, -2.7656555e-005];
	_vehicle_1283 = _this;
	_this setDir 674.79791;
	_this setPos [9410.2188, 12005.452, -2.7656555e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_108
_vehicle_1286 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19444.439, 13267.653, 0.33104908];
	_vehicle_1286 = _this;
	_this setDir -1304.7379;
	_this setPos [19444.439, 13267.653, 0.33104908];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_108"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1289 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19443.977, 13260.679, 0.3863098];
	_vehicle_1289 = _this;
	_this setDir 1484.7078;
	_this setPos [19443.977, 13260.679, 0.3863098];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_108"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1292 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19452.432, 13262.701, 0.19257234];
	_vehicle_1292 = _this;
	_this setVehicleVarName "SD_108";
	SD_108 = _this;
	_this setDir -184.73347;
	_this setPos [19452.432, 13262.701, 0.19257234];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_108""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_108"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_108"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_109
_vehicle_1294 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11527.268, 9438.0166, 0.39084592];
	_vehicle_1294 = _this;
	_this setDir -1206.3422;
	_this setPos [11527.268, 9438.0166, 0.39084592];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_109"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1297 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11527.285, 9434.8965, 0.52017176];
	_vehicle_1297 = _this;
	_this setDir 1314.2062;
	_this setPos [11527.285, 9434.8965, 0.52017176];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_109"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1300 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11532.782, 9433.6416, 0.47267777];
	_vehicle_1300 = _this;
	_this setVehicleVarName "SD_109";
	SD_109 = _this;
	_this setDir -215.88687;
	_this setPos [11532.782, 9433.6416, 0.47267777];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_109""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_109"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_109"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1303 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11542.11, 9443.5078];
	_vehicle_1303 = _this;
	_this setDir 682.07684;
	_this setPos [11542.11, 9443.5078];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_110
_vehicle_1305 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9287.8506, 12129.294, -1.335144e-005];
	_vehicle_1305 = _this;
	_this setDir -1299.2682;
	_this setPos [9287.8506, 12129.294, -1.335144e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_110"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1311 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9286.8359, 12127.472, 0.066654384];
	_vehicle_1311 = _this;
	_this setVehicleVarName "SD_110";
	SD_110 = _this;
	_this setDir -219.43501;
	_this setPos [9286.8359, 12127.472, 0.066654384];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_110""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_110"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_110"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_111
_vehicle_1314 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19507.848, 13349.568, -9.5367432e-005];
	_vehicle_1314 = _this;
	_this setDir -1203.7491;
	_this setPos [19507.848, 13349.568, -9.5367432e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_111"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1317 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19502.514, 13347.703, 0.47176141];
	_vehicle_1317 = _this;
	_this setVehicleVarName "SD_111";
	SD_111 = _this;
	_this setDir -215.51268;
	_this setPos [19502.514, 13347.703, 0.47176141];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_111""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_111"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_111"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1320 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19497.943, 13345.538, 0.26701182];
	_vehicle_1320 = _this;
	_this setDir 1314.2062;
	_this setPos [19497.943, 13345.538, 0.26701182];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_111"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1326 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19536.811, 13343.916, 8.7738037e-005];
	_vehicle_1326 = _this;
	_this setDir 596.19281;
	_this setPos [19536.811, 13343.916, 8.7738037e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_112
_vehicle_1329 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4232.9487, 13520.636, 0.90104294];
	_vehicle_1329 = _this;
	_this setDir -1124.571;
	_this setPos [4232.9487, 13520.636, 0.90104294];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_112"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1332 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4225.7412, 13519.532, 0.91068977];
	_vehicle_1332 = _this;
	_this setVehicleVarName "SD_112";
	SD_112 = _this;
	_this setDir -224.45964;
	_this setPos [4225.7412, 13519.532, 0.91068977];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_112""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_112"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_112"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1335 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4228.979, 13525.826, 1.3675028];
	_vehicle_1335 = _this;
	_this setDir 1306.1084;
	_this setPos [4228.979, 13525.826, 1.3675028];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_112"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1338 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [4209.6523, 13497.813, 3.8146973e-006];
	_vehicle_1338 = _this;
	_this setDir 587.03168;
	_this setPos [4209.6523, 13497.813, 3.8146973e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_113
_vehicle_1340 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9198.4307, 19271.34, -3.0517578e-005];
	_vehicle_1340 = _this;
	_this setDir -1292.1897;
	_this setPos [9198.4307, 19271.34, -3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_113"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1343 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9204.667, 19269.156, 0.47111887];
	_vehicle_1343 = _this;
	_this setVehicleVarName "SD_113";
	SD_113 = _this;
	_this setDir -211.23698;
	_this setPos [9204.667, 19269.156, 0.47111887];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_113""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_113"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_113"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1346 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9204.9746, 19266.703, 0.52884483];
	_vehicle_1346 = _this;
	_this setDir 1318.8517;
	_this setPos [9204.9746, 19266.703, 0.52884483];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_113"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1349 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9203.1006, 19295.264, 9.1552734e-005];
	_vehicle_1349 = _this;
	_this setDir 587.03168;
	_this setPos [9203.1006, 19295.264, 9.1552734e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_114
_vehicle_1352 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8638.6523, 17873.529, 7.6293945e-005];
	_vehicle_1352 = _this;
	_this setDir -1221.4766;
	_this setPos [8638.6523, 17873.529, 7.6293945e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_114"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1355 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8635.7109, 17870.633, 0.22082865];
	_vehicle_1355 = _this;
	_this setVehicleVarName "SD_114";
	SD_114 = _this;
	_this setDir -233.15511;
	_this setPos [8635.7109, 17870.633, 0.22082865];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_114""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_114"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_114"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1358 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [8635.0371, 17864.736, 0.4165653];
	_vehicle_1358 = _this;
	_this setDir 1386.7551;
	_this setPos [8635.0371, 17864.736, 0.4165653];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_114"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1361 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [8655.6963, 17874.473, 1.5258789e-005];
	_vehicle_1361 = _this;
	_this setDir 530.35077;
	_this setPos [8655.6963, 17874.473, 1.5258789e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_115
_vehicle_1365 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10970.678, 10157.268, -5.0544739e-005];
	_vehicle_1365 = _this;
	_this setDir -1403.7562;
	_this setPos [10970.678, 10157.268, -5.0544739e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_115"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1368 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10969.818, 10165.483, 0.16515958];
	_vehicle_1368 = _this;
	_this setVehicleVarName "SD_115";
	SD_115 = _this;
	_this setDir -233.15511;
	_this setPos [10969.818, 10165.483, 0.16515958];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_115""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_115"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_115"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1371 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10967.705, 10160.664, 0.36580464];
	_vehicle_1371 = _this;
	_this setDir 1386.7551;
	_this setPos [10967.705, 10160.664, 0.36580464];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_115"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1375 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10954.863, 10148.776, -2.3841858e-005];
	_vehicle_1375 = _this;
	_this setDir 396.22226;
	_this setPos [10954.863, 10148.776, -2.3841858e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_1374 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19280.922, 13329.852];
	_vehicle_290 = _this;
	_this setDir -112.16706;
	_this setPos [19280.922, 13329.852];
_this enableSimulation false; _this allowDamage false; };

//Haus SD_116
_vehicle_1377 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16728.58, 16424.732, -1.1444092e-005];
	_vehicle_1377 = _this;
	_this setDir 273.59863;
	_this setPos [16728.58, 16424.732, -1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_116"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1380 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16724.666, 16423.844, 2.8940957];
	_vehicle_1380 = _this;
	_this setVehicleVarName "SD_116";
	SD_116 = _this;
	_this setDir 93.404;
	_this setPos [16724.666, 16423.844, 2.8940957];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_116""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_116"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_116"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1386 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16762.707, 16420.014];
	_vehicle_1386 = _this;
	_this setDir 383.91785;
	_this setPos [16762.707, 16420.014];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_117
_vehicle_1389 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20963.688, 17196.512, -7.2479248e-005];
	_vehicle_1389 = _this;
	_this setDir -1527.2135;
	_this setPos [20963.688, 17196.512, -7.2479248e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_117"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1392 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20960, 17188.02, 0.085654721];
	_vehicle_1392 = _this;
	_this setVehicleVarName "SD_117";
	SD_117 = _this;
	_this setDir -266.39252;
	_this setPos [20960, 17188.02, 0.085654721];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_117""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_117"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_117"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1395 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20961.635, 17191.074, 0.22131877];
	_vehicle_1395 = _this;
	_this setDir 1352.5446;
	_this setPos [20961.635, 17191.074, 0.22131877];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_117"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1398 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20986.23, 17187.15, 0.00025939941];
	_vehicle_1398 = _this;
	_this setDir 181.83682;
	_this setPos [20986.23, 17187.15, 0.00025939941];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_118
_vehicle_1401 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14219.727, 18729.209, 0.25935811];
	_vehicle_1401 = _this;
	_this setDir -1440.0593;
	_this setPos [14219.727, 18729.209, 0.25935811];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_118"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1404 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14214.554, 18734.164, 0.39183217];
	_vehicle_1404 = _this;
	_this setVehicleVarName "SD_118";
	SD_118 = _this;
	_this setDir -270.40448;
	_this setPos [14214.554, 18734.164, 0.39183217];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_118""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_118"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_118"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1407 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [14217.854, 18730.189, 0.46835804];
	_vehicle_1407 = _this;
	_this setDir 1350.634;
	_this setPos [14217.854, 18730.189, 0.46835804];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_118"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1410 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [14204.104, 18707.996, -4.5776367e-005];
	_vehicle_1410 = _this;
	_this setDir 267.50232;
	_this setPos [14204.104, 18707.996, -4.5776367e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_119
_vehicle_1413 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14199.714, 18728.977, 0.28037637];
	_vehicle_1413 = _this;
	_this setDir -1353.8282;
	_this setPos [14199.714, 18728.977, 0.28037637];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_119"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1416 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [14201.486, 18732.051, 0.4297823];
	_vehicle_1416 = _this;
	_this setDir 1350.634;
	_this setPos [14201.486, 18732.051, 0.4297823];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_119"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1419 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14203.687, 18734.969, 0.40461388];
	_vehicle_1419 = _this;
	_this setVehicleVarName "SD_119";
	SD_119 = _this;
	_this setDir -270.40448;
	_this setPos [14203.687, 18734.969, 0.40461388];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_119""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_119"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_119"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_120
_vehicle_1422 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18515.203, 16969.195, 0.517326];
	_vehicle_1422 = _this;
	_this setDir -1220.8083;
	_this setPos [18515.203, 16969.195, 0.517326];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_120"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1425 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18516.854, 16966.844, 0.45522898];
	_vehicle_1425 = _this;
	_this setVehicleVarName "SD_120";
	SD_120 = _this;
	_this setDir -230.05128;
	_this setPos [18516.854, 16966.844, 0.45522898];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_120""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_120"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_120"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1428 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18510.291, 16964.957, 0.6874705];
	_vehicle_1428 = _this;
	_this setDir 1389.7419;
	_this setPos [18510.291, 16964.957, 0.6874705];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_120"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1431 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18535.33, 16976.984, 3.2424927e-005];
	_vehicle_1431 = _this;
	_this setDir 327.52481;
	_this setPos [18535.33, 16976.984, 3.2424927e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_121
_vehicle_1433 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4016.0259, 13544.198, 2.4920249];
	_vehicle_1433 = _this;
	_this setDir -1215.7107;
	_this setPos [4016.0259, 13544.198, 2.4920249];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_121"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1436 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4016.1392, 13537.229, 1.4663857];
	_vehicle_1436 = _this;
	_this setVehicleVarName "SD_121";
	SD_121 = _this;
	_this setDir -224.87086;
	_this setPos [4016.1392, 13537.229, 1.4663857];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_121""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_121"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_121"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1439 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4018.1348, 13540.93, 1.9574445];
	_vehicle_1439 = _this;
	_this setDir 1394.6469;
	_this setPos [4018.1348, 13540.93, 1.9574445];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_121"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1442 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3967.1665, 13572.648, 3.0517578e-005];
	_vehicle_1442 = _this;
	_this setDir 222.78424;
	_this setPos [3967.1665, 13572.648, 3.0517578e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_122
_vehicle_1445 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16761.664, 14872.402, -0.00011920929];
	_vehicle_1445 = _this;
	_this setDir -1249.7987;
	_this setPos [16761.664, 14872.402, -0.00011920929];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_122"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1448 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16759.83, 14867.029, 3.0260594];
	_vehicle_1448 = _this;
	_this setVehicleVarName "SD_122";
	SD_122 = _this;
	_this setDir -260.22687;
	_this setPos [16761.467, 14866.762, 3.0260594];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_122""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_122"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_122"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1451 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16764.805, 14870.039, 2.9872594];
	_vehicle_1451 = _this;
	_this setDir 1450.4125;
	_this setPos [16764.805, 14870.039, 2.9872594];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_122"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1454 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16753.375, 14850.805, 3.4332275e-005];
	_vehicle_1454 = _this;
	_this setDir 284.60117;
	_this setPos [16753.375, 14850.805, 3.4332275e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_123
_vehicle_1457 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22943.43, 18838.154, 1.335144e-005];
	_vehicle_1457 = _this;
	_this setDir -1296.7399;
	_this setPos [22943.43, 18838.154, 1.335144e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_123"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1460 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [22948.477, 18839.555, 0.13013297];
	_vehicle_1460 = _this;
	_this setVehicleVarName "SD_123";
	SD_123 = _this;
	_this setDir -218.46068;
	_this setPos [22948.477, 18839.555, 0.13013297];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_123""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_123"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_123"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1463 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [22949.396, 18836.35, 0.28655329];
	_vehicle_1463 = _this;
	_this setDir 1491.2556;
	_this setPos [22949.396, 18836.35, 0.28655329];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_123"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_124
_vehicle_1466 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18793.691, 16392.002, 0.4832837];
	_vehicle_1466 = _this;
	_this setDir -1169.4922;
	_this setPos [18793.691, 16392.002, 0.4832837];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_124"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1469 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18789.01, 16398.059, 0.31956115];
	_vehicle_1469 = _this;
	_this setVehicleVarName "SD_124";
	SD_124 = _this;
	_this setDir -218.46068;
	_this setPos [18789.01, 16398.059, 0.31956115];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_124""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_124"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_124"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1472 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18787.588, 16390.699, 0.15160865];
	_vehicle_1472 = _this;
	_this setDir 1441.7771;
	_this setPos [18787.588, 16390.699, 0.15160865];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_124"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1475 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18791.723, 16414.795, 8.0108643e-005];
	_vehicle_1475 = _this;
	_this setDir 361.1857;
	_this setPos [18791.723, 16414.795, 8.0108643e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_125
_vehicle_1478 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20793.99, 16607.834, 0.64473099];
	_vehicle_1478 = _this;
	_this setDir -1027.4891;
	_this setPos [20793.99, 16607.834, 0.64473099];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_125"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1482 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20788.252, 16612.148, 0.47530696];
	_vehicle_1482 = _this;
	_this setVehicleVarName "SD_125";
	SD_125 = _this;
	_this setDir -218.46068;
	_this setPos [20788.252, 16612.148, 0.47530696];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_125""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_125"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_125"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1485 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20793.9, 16609.564, 0.74426931];
	_vehicle_1485 = _this;
	_this setDir 1402.7141;
	_this setPos [20793.9, 16609.564, 0.74426931];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_125"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1491 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20802.291, 16590.936, 2.6702881e-005];
	_vehicle_1491 = _this;
	_this setDir 414.33679;
	_this setPos [20802.291, 16590.936, 2.6702881e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_126
_vehicle_1494 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10656.44, 11646.261, -0.00010108948];
	_vehicle_1494 = _this;
	_this setDir -1019.6989;
	_this setPos [10656.44, 11646.261, -0.00010108948];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_126"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1497 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10659.425, 11653.31, 0.40404505];
	_vehicle_1497 = _this;
	_this setVehicleVarName "SD_126";
	SD_126 = _this;
	_this setDir -245.55717;
	_this setPos [10659.425, 11653.31, 0.40404505];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_126""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_126"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_126"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1500 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10656.233, 11648.777, 0.75036585];
	_vehicle_1500 = _this;
	_this setDir 1412.894;
	_this setPos [10656.233, 11648.777, 0.75036585];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_126"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1503 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [10633.679, 11637.533, 3.7193298e-005];
	_vehicle_1503 = _this;
	_this setDir 245.44156;
	_this setPos [10633.679, 11637.533, 3.7193298e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_127
_vehicle_1506 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4008.0635, 15514.173, -2.6702881e-005];
	_vehicle_1506 = _this;
	_this setDir -1044.4408;
	_this setPos [4008.0635, 15514.173, -2.6702881e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_127"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1509 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [4006.8386, 15540.564, -0.022009054];
	_vehicle_1509 = _this;
	_this setVehicleVarName "SD_127";
	SD_127 = _this;
	_this setDir -245.55717;
	_this setPos [4006.8386, 15540.564, -0.022009054];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_127""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_127"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_127"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1512 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [4002.3765, 15537.95, 0.22342853];
	_vehicle_1512 = _this;
	_this setDir 1385.4352;
	_this setPos [4002.3765, 15537.95, 0.22342853];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_127"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1515 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [3999.394, 15496.638, -3.4332275e-005];
	_vehicle_1515 = _this;
	_this setDir 176.14713;
	_this setPos [3999.394, 15496.638, -3.4332275e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_128
_vehicle_1518 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19247.422, 13608.075, -4.5776367e-005];
	_vehicle_1518 = _this;
	_this setDir -911.91205;
	_this setPos [19247.422, 13608.075, -4.5776367e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_128"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1521 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19245.893, 13603.339, 0.44931966];
	_vehicle_1521 = _this;
	_this setVehicleVarName "SD_128";
	SD_128 = _this;
	_this setDir -245.55717;
	_this setPos [19245.893, 13603.339, 0.44931966];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_128""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_128"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_128"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1524 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19248.453, 13601.77, 0.36876184];
	_vehicle_1524 = _this;
	_this setDir 1427.8214;
	_this setPos [19248.453, 13601.77, 0.36876184];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_128"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1527 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19266.348, 13614.802, 0.00015449524];
	_vehicle_1527 = _this;
	_this setDir 163.83643;
	_this setPos [19266.348, 13614.802, 0.00015449524];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_129
_vehicle_1530 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17330.268, 13352.499, -5.3405762e-005];
	_vehicle_1530 = _this;
	_this setVehicleVarName "SD_129";
	SD_129 = _this;
	_this setDir -1033.0585;
	_this setPos [17330.268, 13352.499, -5.3405762e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_129"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1533 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17339.064, 13358.854, 0.42285785];
	_vehicle_1533 = _this;
	_this setDir -223.08;
	_this setPos [17339.064, 13358.854, 0.42285785];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_129""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_129"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_129"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1536 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17339.551, 13354.422, 0.52574217];
	_vehicle_1536 = _this;
	_this setDir 1485.7629;
	_this setPos [17339.551, 13354.422, 0.52574217];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_129"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1539 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [17342.844, 13335.856, -2.1934509e-005];
	_vehicle_1539 = _this;
	_this setDir 224.69072;
	_this setPos [17342.844, 13335.856, -2.1934509e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_130
_vehicle_1542 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16929.279, 15123.773, -0.03728047];
	_vehicle_1542 = _this;
	_this setDir -1171.5867;
	_this setPos [16929.279, 15123.773, -0.03728047];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_130"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1545 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16924.793, 15129.288, 0.098669007];
	_vehicle_1545 = _this;
	_this setVehicleVarName "SD_130";
	SD_130 = _this;
	_this setDir -180.25334;
	_this setPos [16924.793, 15129.288, 0.098669007];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_130""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_130"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_130"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1548 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16923.037, 15121.519, 0.1720973];
	_vehicle_1548 = _this;
	_this setDir 1529.8309;
	_this setPos [16923.037, 15121.519, 0.1720973];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_130"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1551 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16944.129, 15135.14, 0.0001411438];
	_vehicle_1551 = _this;
	_this setDir 359.23618;
	_this setPos [16944.129, 15135.14, 0.0001411438];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_131
_vehicle_1554 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7707.0034, 14351.741, -4.5776367e-005];
	_vehicle_1554 = _this;
	_this setDir -1358.2191;
	_this setPos [7707.0034, 14351.741, -4.5776367e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_131"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1557 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7713.1855, 14353.479, 0.70284623];
	_vehicle_1557 = _this;
	_this setVehicleVarName "SD_131";
	SD_131 = _this;
	_this setDir -188.53185;
	_this setPos [7713.1855, 14353.479, 0.70284623];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_131""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_131"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_131"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1560 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [7712.8833, 14347.128, 1.1075897];
	_vehicle_1560 = _this;
	_this setDir 1520.6;
	_this setPos [7712.8833, 14347.128, 1.1075897];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_131"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1563 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [7727.0854, 14356.563, -4.5776367e-005];
	_vehicle_1563 = _this;
	_this setDir 353.73016;
	_this setPos [7727.0854, 14356.563, -4.5776367e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_132
_vehicle_1566 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7702.6431, 14374.209, 0.078251168];
	_vehicle_1566 = _this;
	_this setVehicleVarName "SD_132";
	SD_132 = _this;
	_this setDir -186.35951;
	_this setPos [7702.6431, 14374.209, 0.078251168];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_132""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_132"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_132"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1569 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7699.666, 14368.861, -0.00022888184];
	_vehicle_1569 = _this;
	_this setDir -1443.7382;
	_this setVehicleAmmo 0.89999998;
	_this setPos [7699.666, 14368.861, -0.00022888184];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_132"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};


//Haus SD_133
_vehicle_1571 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [26208.814, 24192.805, -1.5258789e-005];
	_vehicle_1571 = _this;
	_this setDir -1582.5247;
	_this setPos [26208.814, 24192.805, -1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_133"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1574 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [26208.549, 24181.035, 0.097425081];
	_vehicle_1574 = _this;
	_this setVehicleVarName "SD_133";
	SD_133 = _this;
	_this setDir -170.32964;
	_this setPos [26208.549, 24181.035, 0.097425081];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_133""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_133"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_133"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1577 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [26208.18, 24177.838, 0.3353503];
	_vehicle_1577 = _this;
	_this setDir 1630.0442;
	_this setPos [26208.18, 24177.838, 0.3353503];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_133"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1580 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [26230.014, 24182.904, -0.00020313263];
	_vehicle_1580 = _this;
	_this setDir 353.73016;
	_this setPos [26230.014, 24182.904, -0.00020313263];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_134
_vehicle_1583 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16918.799, 15144.946, 0.25358355];
	_vehicle_1583 = _this;
	_this setDir -1620.4836;
	_this setVehicleAmmo 0.89999998;
	_this setPos [16918.799, 15144.946, 0.25358355];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_134"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1586 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16925.258, 15146.816, 0.39729485];
	_vehicle_1586 = _this;
	_this setVehicleVarName "SD_134";
	SD_134 = _this;
	_this setDir -270.19495;
	_this setPos [16925.258, 15146.816, 0.39729485];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_134""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_134"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_134"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1589 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16920.129, 15143.136, 0.41393518];
	_vehicle_1589 = _this;
	_this setDir 1621.0708;
	_this setPos [16920.129, 15143.136, 0.41393518];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_134"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_135
_vehicle_1591 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11770.741, 22713.637, 2.5749207e-005];
	_vehicle_1591 = _this;
	_this setDir -1511.6686;
	_this setPos [11770.741, 22713.637, 2.5749207e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_135"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1594 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11766.637, 22713.66, 2.9132743];
	_vehicle_1594 = _this;
	_this setVehicleVarName "SD_135";
	SD_135 = _this;
	_this setDir -251.55058;
	_this setPos [11766.637, 22713.66, 2.9132743];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_135""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_135"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_135"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1597 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11770.711, 22716.303, 0.16805691];
	_vehicle_1597 = _this;
	_this setDir 1639.3385;
	_this setPos [11770.711, 22716.303, 0.16805691];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_135"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1600 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11782.302, 22709.461, 9.5367432e-007];
	_vehicle_1600 = _this;
	_this setDir 374.29782;
	_this setPos [11782.302, 22709.461, 9.5367432e-007];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_136
_vehicle_1603 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21275.568, 16299.261, 1.335144e-005];
	_vehicle_1603 = _this;
	_this setDir -1603.9218;
	_this setPos [21275.568, 16299.261, 1.335144e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_136"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1606 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21287.605, 16301.098, 0.43177608];
	_vehicle_1606 = _this;
	_this setVehicleVarName "SD_136";
	SD_136 = _this;
	_this setDir -270.10104;
	_this setPos [21287.605, 16301.098, 0.43177608];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_136""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_136"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_136"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1609 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21288.736, 16307.178, 0.42145544];
	_vehicle_1609 = _this;
	_this setDir 1618.9469;
	_this setPos [21288.736, 16307.178, 0.42145544];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_136"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1612 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21284.998, 16284.135, -0.00018882751];
	_vehicle_1612 = _this;
	_this setDir 450.51428;
	_this setPos [21284.998, 16284.135, -0.00018882751];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_137
_vehicle_1615 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [5697.1606, 15068.828, 0.3830364];
	_vehicle_1615 = _this;
	_this setDir -1668.5341;
	_this setPos [5697.1606, 15068.828, 0.3830364];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_137"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1618 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [5704.0942, 15070.484, 0.43467191];
	_vehicle_1618 = _this;
	_this setVehicleVarName "SD_137";
	SD_137 = _this;
	_this setDir -228.32813;
	_this setPos [5704.0942, 15070.484, 0.43467191];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_137""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_137"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_137"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1621 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [5699.4585, 15070.09, 0.4680061];
	_vehicle_1621 = _this;
	_this setDir 1661.5884;
	_this setPos [5699.4585, 15070.09, 0.4680061];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_137"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1624 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [5688.9683, 15050.344, 1.5258789e-005];
	_vehicle_1624 = _this;
	_this setDir 498.91116;
	_this setPos [5688.9683, 15050.344, 1.5258789e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_138
_vehicle_1627 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19522.873, 15396.627, 0.00010299683];
	_vehicle_1627 = _this;
	_this setDir -1830.2792;
	_this setPos [19522.873, 15396.627, 0.00010299683];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_138"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1630 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19522.262, 15403.545, 0.88820016];
	_vehicle_1630 = _this;
	_this setVehicleVarName "SD_138";
	SD_138 = _this;
	_this setDir -209.00136;
	_this setPos [19522.262, 15403.545, 0.88820016];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_138""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_138"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_138"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1633 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19518.283, 15401.132, 1.0454464];
	_vehicle_1633 = _this;
	_this setDir 1679.0854;
	_this setPos [19518.283, 15401.132, 1.0454464];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_138"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1636 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19534.408, 15382.621, -9.727478e-005];
	_vehicle_1636 = _this;
	_this setDir 405.44244;
	_this setPos [19534.408, 15382.621, -9.727478e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_139
_vehicle_1639 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12753.987, 14429.349, -2.8610229e-005];
	_vehicle_1639 = _this;
	_this setDir -2030.9257;
	_this setPos [12753.987, 14429.349, -2.8610229e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_139"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1642 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12754.016, 14421.784, 0.37912402];
	_vehicle_1642 = _this;
	_this setVehicleVarName "SD_139";
	SD_139 = _this;
	_this setDir -230.96098;
	_this setPos [12754.016, 14421.784, 0.37912402];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_139""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_139"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_139"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1645 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12759.366, 14427.341, 0.38696137];
	_vehicle_1645 = _this;
	_this setDir 1657.3252;
	_this setPos [12759.366, 14427.341, 0.38696137];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_139"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1648 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12744.547, 14450.743, 3.0517578e-005];
	_vehicle_1648 = _this;
	_this setDir 335.98962;
	_this setPos [12744.547, 14450.743, 3.0517578e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_140
_vehicle_1651 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [23090.975, 7320.7983, -3.8146973e-005];
	_vehicle_1651 = _this;
	_this setDir -2111.5645;
	_this setPos [23090.975, 7320.7983, -3.8146973e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_140"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1654 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [23000.844, 7269.1548, 0.59115481];
	_vehicle_1654 = _this;
	_this setVehicleVarName "SD_140";
	SD_140 = _this;
	_this setDir -213.5327;
	_this setPos [23000.844, 7269.1548, 0.59115481];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_140""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_140"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_140"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1657 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [23001.752, 7272.0244, 0.81455135];
	_vehicle_1657 = _this;
	_this setDir 1676.4604;
	_this setPos [23001.752, 7272.0244, 0.81455135];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_140"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_141
_vehicle_1660 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16845.604, 15465.902, -2.3841858e-005];
	_vehicle_1660 = _this;
	_this setDir -2003.4711;
	_this setPos [16845.604, 15465.902, -2.3841858e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_141"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1663 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16852.869, 15463.023, 3.9176586];
	_vehicle_1663 = _this;
	_this setVehicleVarName "SD_141";
	SD_141 = _this;
	_this setDir -205.24677;
	_this setPos [16852.869, 15463.023, 3.9176586];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_141""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_141"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_141"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1666 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16843.982, 15464.043, 4.0316319];
	_vehicle_1666 = _this;
	_this setDir 1685.9139;
	_this setPos [16843.982, 15464.043, 4.0316319];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_141"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1669 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16834.498, 15491.394, -5.7220459e-006];
	_vehicle_1669 = _this;
	_this setDir 244.16251;
	_this setPos [16834.498, 15491.394, -5.7220459e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_142
_vehicle_1672 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16856.955, 14728.986, -0.00020217896];
	_vehicle_1672 = _this;
	_this setDir -2302.7322;
	_this setPos [16856.955, 14728.986, -0.00020217896];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_142"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1675 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16852.568, 14726.299, 0.31653816];
	_vehicle_1675 = _this;
	_this setVehicleVarName "SD_142";
	SD_142 = _this;
	_this setDir -321.63684;
	_this setPos [16852.568, 14726.299, 0.31653816];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_142""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_142"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_142"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1678 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16859.539, 14724.762, 0.24744947];
	_vehicle_1678 = _this;
	_this setDir 1657.0466;
	_this setPos [16859.539, 14724.762, 0.24744947];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_142"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1681 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16866.83, 14743.801, 0.00011062622];
	_vehicle_1681 = _this;
	_this setDir 215.4093;
	_this setPos [16866.83, 14743.801, 0.00011062622];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_143
_vehicle_1684 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16718.967, 12307.392, -4.2438507e-005];
	_vehicle_1684 = _this;
	_this setDir -2109.6711;
	_this setPos [16718.967, 12307.392, -4.2438507e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_143"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1687 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16730.557, 12318.302, 0.31235686];
	_vehicle_1687 = _this;
	_this setDir -215.31352;
	_this setPos [16730.557, 12318.302, 0.31235686];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_143""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_143"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_143"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1690 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16736.379, 12313.628, 0.1954298];
	_vehicle_1690 = _this;
	_this setDir 1765.2638;
	_this setPos [16736.379, 12313.628, 0.1954298];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_143"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1693 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16715.479, 12295.113, -0.0001373291];
	_vehicle_1693 = _this;
	_this setDir 143.24361;
	_this setPos [16715.479, 12295.113, -0.0001373291];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_144
_vehicle_1696 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [23906.229, 20233.951, -4.7683716e-005];
	_vehicle_1696 = _this;
	_this setDir -2202.8633;
	_this setPos [23906.229, 20233.951, -4.7683716e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_144"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1699 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [23900.146, 20235.137, 0.27495557];
	_vehicle_1699 = _this;
	_this setVehicleVarName "SD_144";
	SD_144 = _this;
	_this setDir -220.99078;
	_this setPos [23900.146, 20235.137, 0.27495557];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_144""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_144"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_144"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1702 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [23904.441, 20234.633, 0.47175834];
	_vehicle_1702 = _this;
	_this setDir 1757.7944;
	_this setPos [23904.441, 20234.633, 0.47175834];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_144"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1705 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [23889.914, 20222.348, -0.00022888184];
	_vehicle_1705 = _this;
	_this setDir 143.24361;
	_this setPos [23889.914, 20222.348, -0.00022888184];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_145
_vehicle_1708 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17317.316, 13324.06, 2.4795532e-005];
	_vehicle_1708 = _this;
	_this setDir -2382.2705;
	_this setPos [17317.316, 13324.06, 2.4795532e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_145"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1711 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17323.619, 13323.388, 0.29831335];
	_vehicle_1711 = _this;
	_this setVehicleVarName "SD_145";
	SD_145 = _this;
	_this setDir -221.98816;
	_this setPos [17323.619, 13323.388, 0.29831335];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_145""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_145"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_145"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1714 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17318.473, 13319.705, 0.26725575];
	_vehicle_1714 = _this;
	_this setDir 1757.7944;
	_this setPos [17318.473, 13319.705, 0.26725575];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_145"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_146
_vehicle_1717 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20821.988, 16651.17, -0.00011825562];
	_vehicle_1717 = _this;
	_this setDir -2390.1577;
	_this setPos [20821.988, 16651.17, -0.00011825562];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_146"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1720 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20829.465, 16651.17, 0.22860338];
	_vehicle_1720 = _this;
	_this setVehicleVarName "SD_146";
	SD_146 = _this;
	_this setDir -230.69276;
	_this setPos [20829.465, 16651.17, 0.22860338];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_146""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_146"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_146"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1723 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20824.5, 16651.479, 0.54535204];
	_vehicle_1723 = _this;
	_this setDir 1749.7311;
	_this setPos [20824.5, 16651.479, 0.54535204];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_146"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1726 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20808.367, 16633.354, 0.00012207031];
	_vehicle_1726 = _this;
	_this setDir 129.87476;
	_this setPos [20808.367, 16633.354, 0.00012207031];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_147
_vehicle_1728 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19408.613, 14308.392, -4.0054321e-005];
	_vehicle_1728 = _this;
	_this setDir -2655.3833;
	_this setPos [19408.613, 14308.392, -4.0054321e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_147"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1731 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19405.02, 14305.641, 0.20683208];
	_vehicle_1731 = _this;
	_this setVehicleVarName "SD_147";
	SD_147 = _this;
	_this setDir -227.3615;
	_this setPos [19405.02, 14305.641, 0.20683208];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_147""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_147"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_147"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1735 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19405.639, 14307.475, 0.25599337];
	_vehicle_1735 = _this;
	_this setDir 1843.8453;
	_this setPos [19405.639, 14307.475, 0.25599337];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_147"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1738 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19419.33, 14316.335, -6.8664551e-005];
	_vehicle_1738 = _this;
	_this setDir 129.87476;
	_this setPos [19419.33, 14316.335, -6.8664551e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_148
_vehicle_1741 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12361.908, 14358.656, 6.9141388e-005];
	_vehicle_1741 = _this;
	_this setDir -2721.9895;
	_this setPos [12361.908, 14358.656, 6.9141388e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_148"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false; 
	_this setvectorup [0,0,1];
};

_vehicle_1744 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [12363.064, 14354.284, 0.23275205];
	_vehicle_1744 = _this;
	_this setVehicleVarName "SD_148";
	SD_148 = _this;
	_this setDir -291.73743;
	_this setPos [12363.064, 14354.284, 0.23275205];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_148""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_148"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_148"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1747 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [12361.304, 14357.768, 0.2096878];
	_vehicle_1747 = _this;
	_this setDir 1868.183;
	_this setPos [12361.304, 14357.768, 0.2096878];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_148"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1750 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [12351.743, 14368.226, -7.4386597e-005];
	_vehicle_1750 = _this;
	_this setDir 247.08276;
	_this setPos [12351.743, 14368.226, -7.4386597e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_149
_vehicle_1753 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20871.775, 16771.688, 9.9182129e-005];
	_vehicle_1753 = _this;
	_this setDir -2749.8975;
	_this setPos [20871.775, 16771.688, 9.9182129e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_149"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1756 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20874, 16767.213, 0.28575024];
	_vehicle_1756 = _this;
	_this setDir -320.56921;
	_this setPos [20874, 16767.213, 0.28575024];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_149""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_149"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_149"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1759 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20876.678, 16767.516, 0.41288501];
	_vehicle_1759 = _this;
	_this setDir 1929.333;
	_this setPos [20876.678, 16767.516, 0.41288501];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_149"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1762 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20871.174, 16743.271, -3.0517578e-005];
	_vehicle_1762 = _this;
	_this setDir 205.75694;
	_this setPos [20871.174, 16743.271, -3.0517578e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_150
_vehicle_1765 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20885.625, 16894.807, 0.66958696];
	_vehicle_1765 = _this;
	_this setDir -2790.3188;
	_this setPos [20885.625, 16894.807, 0.66958696];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_150"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1768 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20898.332, 16897.959, 1.6574067];
	_vehicle_1768 = _this;
	_this setVehicleVarName "SD_150";
	SD_150 = _this;
	_this setDir -360.3605;
	_this setPos [20898.332, 16897.959, 1.6574067];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_150""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_150"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_150"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1771 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20901.344, 16894.648, 2.5260754];
	_vehicle_1771 = _this;
	_this setDir 2067.9233;
	_this setPos [20901.344, 16894.648, 2.5260754];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_150"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_151
_vehicle_1773 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11115.391, 14409.027, -8.5830688e-005];
	_vehicle_1773 = _this;
	_this setDir -2928.0632;
	_this setPos [11115.391, 14409.027, -8.5830688e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_151"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1776 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11101.992, 14409.851, 0.24595271];
	_vehicle_1776 = _this;
	_this setVehicleVarName "SD_151";
	SD_151 = _this;
	_this setDir -360.3605;
	_this setPos [11101.992, 14409.851, 0.24595271];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_151""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_151"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_151"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1779 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11106.906, 14409.217, 0.31498531];
	_vehicle_1779 = _this;
	_this setDir 2111.2244;
	_this setPos [11106.906, 14409.217, 0.31498531];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_151"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1782 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11116.095, 14383.074, 1.9073486e-006];
	_vehicle_1782 = _this;
	_this setDir 222.82196;
	_this setPos [11116.095, 14383.074, 1.9073486e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_152
_vehicle_1785 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20630.131, 17000.957, 6.1035156e-005];
	_vehicle_1785 = _this;
	_this setDir -2879.6831;
	_this setPos [20630.131, 17000.957, 6.1035156e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_152"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1788 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20626.99, 17017.359, 3.0517578e-005];
	_vehicle_1788 = _this;
	_this setVehicleVarName "SD_152";
	SD_152 = _this;
	_this setDir -392.3718;
	_this setPos [20626.99, 17017.359, 3.0517578e-005];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_152""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_152"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_152"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1791 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20628.191, 17014.879, 0.12085227];
	_vehicle_1791 = _this;
	_this setDir 2129.45;
	_this setPos [20628.191, 17014.879, 0.12085227];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_152"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1794 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20611.221, 16983.346, 0.00024414063];
	_vehicle_1794 = _this;
	_this setDir 222.82196;
	_this setPos [20611.221, 16983.346, 0.00024414063];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_153
_vehicle_1797 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11184.462, 14482.553];
	_vehicle_1797 = _this;
	_this setDir -2837.5352;
	_this setPos [11184.462, 14482.553];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_153"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1800 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11190.2, 14490.136, 0.53164893];
	_vehicle_1800 = _this;
	_this setVehicleVarName "SD_153";
	SD_153 = _this;
	_this setDir -405.51581;
	_this setPos [11190.2, 14490.136, 0.53164893];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_153""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_153"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_153"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1803 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11191.683, 14485.379, 1.2423449];
	_vehicle_1803 = _this;
	_this setDir 2115.5198;
	_this setPos [11191.683, 14485.379, 1.2423449];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_153"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1806 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11190.288, 14451.924, -0.000207901];
	_vehicle_1806 = _this;
	_this setDir 222.82196;
	_this setPos [11190.288, 14451.924, -0.000207901];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_154
_vehicle_1808 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20413.918, 17818.803, 6.1035156e-005];
	_vehicle_1808 = _this;
	_this setDir -2837.5854;
	_this setPos [20413.918, 17818.803, 6.1035156e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_154"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1811 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20418.537, 17823.264, 0.14911896];
	_vehicle_1811 = _this;
	_this setVehicleVarName "SD_154";
	SD_154 = _this;
	_this setDir -405.51581;
	_this setPos [20418.537, 17823.264, 0.14911896];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_154""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_154"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_154"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1814 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20411.193, 17822.404, 0.39483291];
	_vehicle_1814 = _this;
	_this setDir 2111.9067;
	_this setPos [20411.193, 17822.404, 0.39483291];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_154"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1817 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20389.67, 17810.748, 7.6293945e-005];
	_vehicle_1817 = _this;
	_this setDir 132.71814;
	_this setPos [20389.67, 17810.748, 7.6293945e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_155
_vehicle_1820 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19442.547, 13149.898, 4.196167e-005];
	_vehicle_1820 = _this;
	_this setDir -2817.7231;
	_this setPos [19442.547, 13149.898, 4.196167e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_155"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1823 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19458.561, 13162.98, 0.22227263];
	_vehicle_1823 = _this;
	_this setVehicleVarName "SD_155";
	SD_155 = _this;
	_this setDir -384.89359;
	_this setPos [19458.561, 13162.98, 0.22227263];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_155""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_155"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_155"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1826 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19461.734, 13164.523, 0.33555478];
	_vehicle_1826 = _this;
	_this setDir 2045.2892;
	_this setPos [19461.734, 13164.523, 0.33555478];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_155"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1829 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19416.533, 13132.238, 0.00012969971];
	_vehicle_1829 = _this;
	_this setDir 233.97763;
	_this setPos [19416.533, 13132.238, 0.00012969971];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_156
_vehicle_1832 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21239.877, 16907.563, 4.5776367e-005];
	_vehicle_1832 = _this;
	_this setDir -2833.2979;
	_this setPos [21239.877, 16907.563, 4.5776367e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_156"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1835 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21246.057, 16920.855, 0.23582718];
	_vehicle_1835 = _this;
	_this setVehicleVarName "SD_156";
	SD_156 = _this;
	_this setDir -402.52448;
	_this setPos [21246.057, 16920.855, 0.23582718];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_156""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_156"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_156"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1838 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21244.895, 16915.766, 0.19744305];
	_vehicle_1838 = _this;
	_this setDir 2208.6465;
	_this setPos [21244.895, 16915.766, 0.19744305];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_156"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1841 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21228.832, 16892.01, -0.00010871887];
	_vehicle_1841 = _this;
	_this setDir 139.89415;
	_this setPos [21228.832, 16892.01, -0.00010871887];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_157
_vehicle_1843 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20982.293, 17605.404, -1.5258789e-005];
	_vehicle_1843 = _this;
	_this setDir -2812.5027;
	_this setPos [20982.293, 17605.404, -1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_157"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1846 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20988.035, 17608.287, 0.37842971];
	_vehicle_1846 = _this;
	_this setDir 2225.5742;
	_this setPos [20988.035, 17608.287, 0.37842971];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_157"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1849 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20987.219, 17605.502, 0.29795721];
	_vehicle_1849 = _this;
	_this setVehicleVarName "SD_157";
	SD_157 = _this;
	_this setDir -383.81088;
	_this setPos [20987.219, 17605.502, 0.29795721];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_157""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_157"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_157"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1852 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20978.439, 17588.545, 8.392334e-005];
	_vehicle_1852 = _this;
	_this setDir 160.92639;
	_this setPos [20978.439, 17588.545, 8.392334e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_158
_vehicle_1855 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10705.753, 12196.651, 2.6702881e-005];
	_vehicle_1855 = _this;
	_this setDir -2749.4785;
	_this setPos [10705.753, 12196.651, 2.6702881e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_158"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1858 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10710.301, 12186.702, 0.63416272];
	_vehicle_1858 = _this;
	_this setDir 2199.4741;
	_this setPos [10710.301, 12186.702, 0.63416272];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_158"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1861 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10716.598, 12191.106, 0.63966006];
	_vehicle_1861 = _this;
	_this setVehicleVarName "SD_158";
	SD_158 = _this;
	_this setDir -366.17505;
	_this setPos [10716.598, 12191.106, 0.63966006];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_158""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_158"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_158"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_159
_vehicle_1864 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18800.701, 16286.88, -5.7220459e-006];
	_vehicle_1864 = _this;
	_this setDir -2607.2605;
	_this setPos [18800.701, 16286.88, -5.7220459e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_159"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1867 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18792.027, 16287.331, 0.89378166];
	_vehicle_1867 = _this;
	_this setDir 2073.1567;
	_this setPos [18792.027, 16287.331, 0.89378166];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_159"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1870 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18786.213, 16288.889, 0.25984782];
	_vehicle_1870 = _this;
	_this setVehicleVarName "SD_159";
	SD_159 = _this;
	_this setDir -357.74792;
	_this setPos [18786.213, 16288.889, 0.25984782];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_159""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_159"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_159"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1873 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18816.607, 16289.365, 6.1035156e-005];
	_vehicle_1873 = _this;
	_this setDir 177.57767;
	_this setPos [18816.607, 16289.365, 6.1035156e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_160
_vehicle_1876 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16845.568, 16195.384, -8.5830688e-005];
	_vehicle_1876 = _this;
	_this setDir -2834.9646;
	_this setPos [16845.568, 16195.384, -8.5830688e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_160"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1879 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16880.625, 16193.536, 0.40115792];
	_vehicle_1879 = _this;
	_this setDir 2099.1985;
	_this setPos [16880.625, 16193.536, 0.40115792];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_160"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1882 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16876.463, 16192.07, 0.2314759];
	_vehicle_1882 = _this;
	_this setVehicleVarName "SD_160";
	SD_160 = _this;
	_this setDir -330.80286;
	_this setPos [16876.463, 16192.07, 0.2314759];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_160""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_160"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_160"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1885 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16830.107, 16179.909, -5.7220459e-006];
	_vehicle_1885 = _this;
	_this setDir 126.65682;
	_this setPos [16830.107, 16179.909, -5.7220459e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_161
_vehicle_1888 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10762.356, 12168.874, 9.5367432e-005];
	_vehicle_1888 = _this;
	_this setDir -2932.2024;
	_this setPos [10762.356, 12168.874, 9.5367432e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_161"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1891 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10762.589, 12176.271, 0.55590993];
	_vehicle_1891 = _this;
	_this setDir 2108.8999;
	_this setPos [10762.589, 12176.271, 0.55590993];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_161"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1894 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10756.423, 12170.647, 6.4849854e-005];
	_vehicle_1894 = _this;
	_this setDir -319.74924;
	_this setPos [10756.423, 12170.647, 6.4849854e-005];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_161""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_161"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_161"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_162
_vehicle_1897 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10749.335, 12202.411, 0.55267334];
	_vehicle_1897 = _this;
	_this setDir -2926.8538;
	_this setPos [10749.335, 12202.411, 0.55267334];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_162"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1900 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [10746.491, 12207.56, 0.6891613];
	_vehicle_1900 = _this;
	_this setDir 2112.9595;
	_this setPos [10746.491, 12207.56, 0.6891613];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_162"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1903 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [10742.222, 12202.088, 0.36156622];
	_vehicle_1903 = _this;
	_this setVehicleVarName "SD_162";
	SD_162 = _this;
	_this setDir -317.12802;
	_this setPos [10742.222, 12202.088, 0.36156622];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_162""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_162"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_162"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_163
_vehicle_1906 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20981.422, 17008.137, 3.0517578e-005];
	_vehicle_1906 = _this;
	_this setDir -3020.4551;
	_this setPos [20981.422, 17008.137, 3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_163"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1909 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20975.645, 17011.613, 0.61514616];
	_vehicle_1909 = _this;
	_this setDir 2108.282;
	_this setPos [20975.645, 17011.613, 0.61514616];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_163"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1912 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20979.064, 17006.723, 0.88156652];
	_vehicle_1912 = _this;
	_this setVehicleVarName "SD_163";
	SD_163 = _this;
	_this setDir -321.60275;
	_this setPos [20979.064, 17006.723, 0.88156652];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_163""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_163"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_163"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_164
_vehicle_1915 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17138.818, 14834.47, 3.2424927e-005];
	_vehicle_1915 = _this;
	_this setDir -3207.01;
	_this setPos [17138.818, 14834.47, 3.2424927e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_164"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1918 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17134.621, 14841.953, 0.29227218];
	_vehicle_1918 = _this;
	_this setDir 2105.0562;
	_this setPos [17134.621, 14841.953, 0.29227218];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_164"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1921 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17137.381, 14837.852, -0.0001039505];
	_vehicle_1921 = _this;
	_this setVehicleVarName "SD_164";
	SD_164 = _this;
	_this setDir -324.94571;
	_this setPos [17137.381, 14837.852, -0.0001039505];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_164""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_164"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_164"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1924 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [17136.094, 14817.313, -0.00016021729];
	_vehicle_1924 = _this;
	_this setDir 216.18634;
	_this setPos [17136.094, 14817.313, -0.00016021729];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_165
_vehicle_1927 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16855.119, 15469.718, 0.0001115799];
	_vehicle_1927 = _this;
	_this setDir -3084.5632;
	_this setPos [16855.119, 15469.718, 0.0001115799];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_165"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1930 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16855.248, 15465.872, 4.1806092];
	_vehicle_1930 = _this;
	_this setDir 2135.8125;
	_this setPos [16855.248, 15465.872, 4.1806092];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_165"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1933 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16859.814, 15468.21, 3.9612021];
	_vehicle_1933 = _this;
	_this setVehicleVarName "SD_165";
	SD_165 = _this;
	_this setDir -383.55746;
	_this setPos [16859.814, 15468.21, 3.9612021];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_165""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_165"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_165"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_166
_vehicle_1935 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21038.074, 16984.324, 0.66318971];
	_vehicle_1935 = _this;
	_this setDir -2926.5369;
	_this setPos [21038.074, 16984.324, 0.66318971];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_166"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1938 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21036.799, 16990.83, 0.58082843];
	_vehicle_1938 = _this;
	_this setDir 2114.3057;
	_this setPos [21036.799, 16990.83, 0.58082843];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_166"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1941 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21032.488, 16986.369, 0.37601221];
	_vehicle_1941 = _this;
	_this setVehicleVarName "SD_166";
	SD_166 = _this;
	_this setDir -405.64932;
	_this setPos [21032.488, 16986.369, 0.37601221];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_166""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_166"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_166"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1944 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21057.285, 16978.609, 8.0108643e-005];
	_vehicle_1944 = _this;
	_this setDir 313.00592;
	_this setPos [21057.285, 16978.609, 8.0108643e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_167
_vehicle_1947 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9524.75, 11587.71, 9.5367432e-007];
	_vehicle_1947 = _this;
	_this setDir -2986.718;
	_this setPos [9524.75, 11587.71, 9.5367432e-007];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_167"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1950 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9515.8291, 11588.454, 0.68414259];
	_vehicle_1950 = _this;
	_this setDir 2144.467;
	_this setPos [9515.8291, 11588.454, 0.68414259];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_167"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1953 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9515.748, 11580.691, 0.51533985];
	_vehicle_1953 = _this;
	_this setDir -423.41153;
	_this setPos [9515.748, 11580.691, 0.51533985];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_167""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_167"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_167"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1956 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9535.2822, 11597.977, -7.6293945e-006];
	_vehicle_1956 = _this;
	_this setDir 341.91626;
	_this setPos [9535.2822, 11597.977, -7.6293945e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_168
_vehicle_1959 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7131.5913, 18905.559, -1.5258789e-005];
	_vehicle_1959 = _this;
	_this setDir -2843.0139;
	_this setPos [7131.5913, 18905.559, -1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_168"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1962 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [7137.7778, 18906.375, 1.0252434];
	_vehicle_1962 = _this;
	_this setDir 2106.8206;
	_this setPos [7137.7778, 18906.375, 1.0252434];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_168"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1965 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7136.9351, 18909.574, 0.69233549];
	_vehicle_1965 = _this;
	_this setDir -413.36432;
	_this setPos [7136.9351, 18909.574, 0.69233549];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_168""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_168"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_168"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1968 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [7113.2632, 18901.965, 0.00032043457];
	_vehicle_1968 = _this;
	_this setDir 313.06485;
	_this setPos [7113.2632, 18901.965, 0.00032043457];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_169
_vehicle_1970 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18681.443, 16837.861, 0.85563838];
	_vehicle_1970 = _this;
	_this setDir -2932.7732;
	_this setPos [18681.443, 16837.861, 0.85563838];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_169""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1973 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18678.053, 16842.707, 1.2565259];
	_vehicle_1973 = _this;
	_this setDir 2107.4626;
	_this setPos [18678.053, 16842.707, 1.2565259];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_169""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1976 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18674.506, 16835.824, 0.72150445];
	_vehicle_1976 = _this;
	_this setDir -411.62555;
	_this setPos [18674.506, 16835.824, 0.72150445];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_169""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_169"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_169"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1981 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18694.209, 16853.816, 4.5776367e-005];
	_vehicle_1981 = _this;
	_this setDir 313.06485;
	_this setPos [18694.209, 16853.816, 4.5776367e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_170
_vehicle_1984 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20808.564, 16890.834, 0.89814425];
	_vehicle_1984 = _this;
	_this setDir -2760.2078;
	_this setPos [20808.564, 16890.834, 0.89814425];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_170""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1987 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20812.598, 16886.496, 1.7822982];
	_vehicle_1987 = _this;
	_this setDir 2100.6045;
	_this setPos [20812.598, 16886.496, 1.7822982];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_170""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1990 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20810.305, 16897.717, 0.41208178];
	_vehicle_1990 = _this;
	_this setVehicleVarName "SD_170";
	SD_170 = _this;
	_this setDir -331.20551;
	_this setPos [20810.305, 16897.717, 0.41208178];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_170""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_170"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_170"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_171
_vehicle_1996 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9570.6367, 11763.353, 5.0544739e-005];
	_vehicle_1996 = _this;
	_this setDir -2897.4929;
	_this setPos [9570.6367, 11763.353, 5.0544739e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_171""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_1999 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9571.5088, 11772.811, 0.90511185];
	_vehicle_1999 = _this;
	_this setDir 2142.1792;
	_this setPos [9571.5088, 11772.811, 0.90511185];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_171""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2002 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9565.3486, 11775.028, 0.77588046];
	_vehicle_2002 = _this;
	_this setVehicleVarName "SD_171";
	SD_171 = _this;
	_this setDir -331.20551;
	_this setPos [9565.3486, 11775.028, 0.77588046];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_171""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_171"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_171"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2005 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9584.75, 11755.57, 9.5367432e-007];
	_vehicle_2005 = _this;
	_this setDir 431.75214;
	_this setPos [9584.75, 11755.57, 9.5367432e-007];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_172
_vehicle_2008 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19410.219, 13380.775, -7.6293945e-006];
	_vehicle_2008 = _this;
	_this setDir -2798.1238;
	_this setPos [19410.219, 13380.775, -7.6293945e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_172""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2011 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19413.971, 13387.116, 0.44381684];
	_vehicle_2011 = _this;
	_this setDir 2151.1724;
	_this setPos [19413.971, 13387.116, 0.44381684];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_172""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2014 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19414.768, 13382.042, 0.12461006];
	_vehicle_2014 = _this;
	_this setVehicleVarName "SD_172";
	SD_172 = _this;
	_this setDir -331.20551;
	_this setPos [19414.768, 13382.042, 0.12461006];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_172""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_172"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_172"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_173
_vehicle_2017 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [6112.3467, 17996.123, -5.3405762e-005];
	_vehicle_2017 = _this;
	_this setDir -2691.9556;
	_this setPos [6112.3467, 17996.123, -5.3405762e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_173""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2020 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [6110.2427, 17992.145, 0.33636543];
	_vehicle_2020 = _this;
	_this setDir 2169.7163;
	_this setPos [6110.2427, 17992.145, 0.33636543];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_173""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2023 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [6116.4546, 17990.4, 0.44318491];
	_vehicle_2023 = _this;
	_this setVehicleVarName "SD_173";
	SD_173 = _this;
	_this setDir -349.14911;
	_this setPos [6116.4546, 17990.4, 0.44318491];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_173""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_173"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_173"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2026 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [6132.9292, 17992.945, -0.00065612793];
	_vehicle_2026 = _this;
	_this setDir 454.61636;
	_this setPos [6132.9292, 17992.945, -0.00065612793];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_174
_vehicle_2029 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9449.9717, 23115.813, 0.00010323524];
	_vehicle_2029 = _this;
	_this setDir -2789.9526;
	_this setPos [9449.9717, 23115.813, 0.00010323524];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_174""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2032 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9454.8311, 23116.143, 0.52128196];
	_vehicle_2032 = _this;
	_this setDir 2159.6252;
	_this setPos [9454.8311, 23116.143, 0.52128196];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_174""]; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2035 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9454.9658, 23117.961, 0.62491715];
	_vehicle_2035 = _this;
	_this setVehicleVarName "SD_174";
	SD_174 = _this;
	_this setDir -360.50781;
	_this setPos [9454.9658, 23117.961, 0.62491715];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_174""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_174"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_174"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; this setvectorup [0,0,1];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2038 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9434.291, 23118.014, -0.00012540817];
	_vehicle_2038 = _this;
	_this setDir 539.45056;
	_this setPos [9434.291, 23118.014, -0.00012540817];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_175
_vehicle_2040 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18567.152, 16984.695, 0.00015449524];
	_vehicle_2040 = _this;
	_this setDir -2825.9526;
	_this setPos [18567.152, 16984.695, 0.00015449524];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_175""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2043 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18566.457, 16994.596, 0.37674177];
	_vehicle_2043 = _this;
	_this setDir 2035.1343;
	_this setPos [18566.457, 16994.596, 0.37674177];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_175""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2046 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18568.098, 16994.055, 0.38106146];
	_vehicle_2046 = _this;
	_this setVehicleVarName "SD_175";
	SD_175 = _this;
	_this setDir -395.15076;
	_this setPos [18568.098, 16994.055, 0.38106146];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_175""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_175"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_175"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2049 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18550.273, 17020.227, 0.00010108948];
	_vehicle_2049 = _this;
	_this setDir 686.35693;
	_this setPos [18550.273, 17020.227, 0.00010108948];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_176
_vehicle_2052 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7017.7573, 16486.92, -0.17963184];
	_vehicle_2052 = _this;
	_this setDir -2804.5879;
	_this setPos [7017.7573, 16486.92, -0.17963184];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_176""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2055 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [7028.4912, 16486.52, 0.56998312];
	_vehicle_2055 = _this;
	_this setDir 2057.0361;
	_this setPos [7028.4912, 16486.52, 0.56998312];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_176""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2058 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [7022.8447, 16485.348, 0.78392935];
	_vehicle_2058 = _this;
	_this setVehicleVarName "SD_176";
	SD_176 = _this;
	_this setDir -372.76175;
	_this setPos [7022.8447, 16485.348, 0.78392935];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_176""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_176"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_176"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2061 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [6994.9648, 16473.586, 0];
	_vehicle_2061 = _this;
	_this setDir 686.35693;
	_this setPos [6994.9648, 16473.586, 0];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_177
_vehicle_2064 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20994.736, 17156.586, -0.00010299683];
	_vehicle_2064 = _this;
	_this setDir -2644.7334;
	_this setPos [20994.736, 17156.586, -0.00010299683];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_177""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2067 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20989.16, 17155.844, 0.48243046];
	_vehicle_2067 = _this;
	_this setDir 2035.0265;
	_this setPos [20989.16, 17155.844, 0.48243046];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_177""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2070 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20988.375, 17149.668, 0.045409299];
	_vehicle_2070 = _this;
	_this setVehicleVarName "SD_177";
	SD_177 = _this;
	_this setDir -304.61423;
	_this setPos [20988.375, 17149.668, 0.045409299];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_177""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_177"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_177"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2073 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21006.461, 17159.975, -7.6293945e-005];
	_vehicle_2073 = _this;
	_this setDir 686.35693;
	_this setPos [21006.461, 17159.975, -7.6293945e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_178
_vehicle_2076 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11243.624, 14482.444, -3.0517578e-005];
	_vehicle_2076 = _this;
	_this setDir -2845.6396;
	_this setPos [11243.624, 14482.444, -3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_178""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2079 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [11247.788, 14487.337, 0.64291906];
	_vehicle_2079 = _this;
	_this setDir 2195.8699;
	_this setPos [11247.788, 14487.337, 0.64291906];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_178""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2082 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [11248.342, 14484.724, 0.79161781];
	_vehicle_2082 = _this;
	_this setVehicleVarName "SD_178";
	SD_178 = _this;
	_this setDir -235.30667;
	_this setPos [11248.342, 14484.724, 0.79161781];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_178""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_178"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_178"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2085 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [11256.071, 14470.97, 0.00010299683];
	_vehicle_2085 = _this;
	_this setDir 755.216;
	_this setPos [11256.071, 14470.97, 0.00010299683];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_179
_vehicle_2087 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20531.219, 17098.494, 9.5367432e-005];
	_vehicle_2087 = _this;
	_this setDir -2910.8413;
	_this setPos [20531.219, 17098.494, 9.5367432e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_179""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2090 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [20530.328, 17105.713, 0.43784091];
	_vehicle_2090 = _this;
	_this setDir -211.00101;
	_this setPos [20530.328, 17105.713, 0.43784091];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_179""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_179"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_179"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2093 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [20523.941, 17107.172, 0.28673938];
	_vehicle_2093 = _this;
	_this setDir 2219.792;
	_this setPos [20523.941, 17107.172, 0.28673938];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_179""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2096 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [20506.127, 17083.922, 3.8146973e-006];
	_vehicle_2096 = _this;
	_this setDir 584.96967;
	_this setPos [20506.127, 17083.922, 3.8146973e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_180
_vehicle_2099 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [8579.9619, 18427.049, 0.027198507];
	_vehicle_2099 = _this;
	_this setDir -2994.5225;
	_this setPos [8579.9619, 18427.049, 0.027198507];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_180""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2102 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [8578.6035, 18428.154, 0.045079101];
	_vehicle_2102 = _this;
	_this setVehicleVarName "SD_180";
	SD_180 = _this;
	_this setDir -205.1568;
	_this setPos [8578.6035, 18428.154, 0.045079101];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_180""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_180"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_180"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2105 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [8577.1172, 18425.584, 0.38781354];
	_vehicle_2105 = _this;
	_this setDir 2224.4946;
	_this setPos [8577.1172, 18425.584, 0.38781354];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_180""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_181
_vehicle_2108 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16292.622, 15727.768, 0.35585195];
	_vehicle_2108 = _this;
	_this setDir -3214.2507;
	_this setPos [16292.622, 15727.768, 0.35585195];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_181""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2111 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16303.263, 15727.126, 0.33444792];
	_vehicle_2111 = _this;
	_this setVehicleVarName "SD_181";
	SD_181 = _this;
	_this setDir -201.24072;
	_this setPos [16303.263, 15727.126, 0.33444792];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_181""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_181"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_181"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2115 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [16299.716, 15727.901, 0.44416878];
	_vehicle_2115 = _this;
	_this setDir 2187.23;
	_this setPos [16299.716, 15727.901, 0.44416878];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_181""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2118 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [16281.345, 15742.733, 3.7670135e-005];
	_vehicle_2118 = _this;
	_this setDir 744.09851;
	_this setPos [16281.345, 15742.733, 3.7670135e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_182
_vehicle_2120 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21128.502, 17219.465, -6.4849854e-005];
	_vehicle_2120 = _this;
	_this setDir -3117.8892;
	_this setPos [21128.502, 17219.465, -6.4849854e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_182""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2123 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [21138.375, 17223.354, 0.38906354];
	_vehicle_2123 = _this;
	_this setVehicleVarName "SD_182";
	SD_182 = _this;
	_this setDir -235.49478;
	_this setPos [21138.375, 17223.354, 0.38906354];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_182""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_182"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_182"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2126 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [21133.256, 17221.373, 0.26675072];
	_vehicle_2126 = _this;
	_this setDir 2194.6313;
	_this setPos [21133.256, 17221.373, 0.26675072];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_182""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2129 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [21112.287, 17235.1, 9.9182129e-005];
	_vehicle_2129 = _this;
	_this setDir 848.46167;
	_this setPos [21112.287, 17235.1, 9.9182129e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_183
_vehicle_2132 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9449.1162, 14135.423, 3.8146973e-006];
	_vehicle_2132 = _this;
	_this setDir -3222.0327;
	_this setPos [9449.1162, 14135.423, 3.8146973e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_183""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2135 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9443.0107, 14143.986, 0.17018199];
	_vehicle_2135 = _this;
	_this setVehicleVarName "SD_183";
	SD_183 = _this;
	_this setDir -250.84839;
	_this setPos [9443.0107, 14143.986, 0.17018199];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_183""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_183"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_183"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2138 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9444.2285, 14139.013, 0.21882832];
	_vehicle_2138 = _this;
	_this setDir 2179.6104;
	_this setPos [9444.2285, 14139.013, 0.21882832];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_183""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2141 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9466.8848, 14131.979, -1.5258789e-005];
	_vehicle_2141 = _this;
	_this setDir 757.13367;
	_this setPos [9466.8848, 14131.979, -1.5258789e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_184
_vehicle_2144 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [9076.792, 7725.9268, 9.9182129e-005];
	_vehicle_2144 = _this;
	_this setDir -3219.0845;
	_this setPos [9076.792, 7725.9268, 9.9182129e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_184""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2147 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [9078.1445, 7731.5308, 0.19267787];
	_vehicle_2147 = _this;
	_this setVehicleVarName "SD_184";
	SD_184 = _this;
	_this setDir -249.73189;
	_this setPos [9078.1445, 7731.5308, 0.19267787];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_184""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_184"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_184"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2150 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [9075.8809, 7731.3169, 0.22175747];
	_vehicle_2150 = _this;
	_this setDir 2180.4763;
	_this setPos [9075.8809, 7731.3169, 0.22175747];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_184""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2153 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [9072.1201, 7711.1445, 0.00028991699];
	_vehicle_2153 = _this;
	_this setDir 741.93225;
	_this setPos [9072.1201, 7711.1445, 0.00028991699];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_185
_vehicle_2156 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17440.977, 12978.814, 3.8146973e-005];
	_vehicle_2156 = _this;
	_this setVehicleVarName "SD_185";
	SD_185 = _this;
	_this setDir -3191.1357;
	_this setPos [17440.977, 12978.814, 3.8146973e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_185""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2159 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17446.098, 12982.745, 0.056058172];
	_vehicle_2159 = _this;
	_this setVehicleVarName "SD_185";
	SD_185 = _this;
	_this setDir -221.59146;
	_this setPos [17446.098, 12982.745, 0.056058172];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_185""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_185"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_185"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west ']; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2162 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17447.004, 12980.158, 0.1180369];
	_vehicle_2162 = _this;
	_this setDir 2207.1206;
	_this setPos [17447.004, 12980.158, 0.1180369];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_185""]; "];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2165 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [17420.727, 12969.981, 1.9073486e-006];
	_vehicle_2165 = _this;
	_this setDir 768.44531;
	_this setPos [17420.727, 12969.981, 1.9073486e-006];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_186
_vehicle_2167 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18064.553, 16254.734, 0.00010681152];
	_vehicle_2167 = _this;
	_this setDir -3268.0552;
	_this setPos [18064.553, 16254.734, 0.00010681152];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_186"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2170 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [18064.307, 16259.275, 0.10595545];
	_vehicle_2170 = _this;
	_this setVehicleVarName "SD_186";
	SD_186 = _this;
	_this setDir -207.42569;
	_this setPos [18064.307, 16259.275, 0.10595545];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_186""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_186"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_186"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2173 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [18065.1, 16255.643, 0.20639777];
	_vehicle_2173 = _this;
	_this setDir 2221.9438;
	_this setPos [18065.1, 16255.643, 0.20639777];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_186"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2176 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [18074.332, 16232.812, -9.1552734e-005];
	_vehicle_2176 = _this;
	_this setDir 782.43506;
	_this setPos [18074.332, 16232.812, -9.1552734e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_187
_vehicle_2179 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19535.516, 13256.294, 0.00010681152];
	_vehicle_2179 = _this;
	_this setDir -3178.053;
	_this setPos [19535.516, 13256.294, 0.00010681152];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_187"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2182 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19540.799, 13257.482, 0.25886479];
	_vehicle_2182 = _this;
	_this setVehicleVarName "SD_187";
	SD_187 = _this;
	_this setDir -205.7655;
	_this setPos [19540.799, 13257.482, 0.25886479];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_187""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_187"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_187"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2185 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [19536.6, 13262.273, 0.44567931];
	_vehicle_2185 = _this;
	_this setDir 2221.9438;
	_this setPos [19536.6, 13262.273, 0.44567931];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_187"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus SD_188
_vehicle_2188 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [17224.189, 13170.11, -3.8146973e-005];
	_vehicle_2188 = _this;
	_this setDir -3194.9282;
	_this setPos [17224.189, 13170.11, -3.8146973e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_188"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2191 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [17227.967, 13172.573, 0.10980649];
	_vehicle_2191 = _this;
	_this setVehicleVarName "SD_188";
	SD_188 = _this;
	_this setDir -222.70197;
	_this setPos [17227.967, 13172.573, 0.10980649];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_188""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_188"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_188"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2194 = objNull;
if (true) then
{
	_this = "Land_Sun_chair_green_F" createvehiclelocal [17226.371, 13169.851, 0.19071424];
	_vehicle_2194 = _this;
	_this setDir 2207.4536;
	_this setPos [17226.371, 13169.851, 0.19071424];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""SD_188"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_2197 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [17226.453, 13152.23, 6.4849854e-005];
	_vehicle_2197 = _this;
	_this setDir 854.50061;
	_this setPos [17226.453, 13152.23, 6.4849854e-005];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus SD_189
_vehicle_2199 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19487.264, 15342.077, -3.2424927e-005];
	_vehicle_2199 = _this;
	_this setDir -3181.9314;
	_this setPos [19487.264, 15342.077, -3.2424927e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""SD_189"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_2202 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [19489.346, 15348.637, 0.18641406];
	_vehicle_2202 = _this;
	_this setVehicleVarName "SD_189";
	SD_189 = _this;
	_this setDir -213.83226;
	_this setPos [19489.346, 15348.637, 0.18641406];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""SD_189""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""SD_189"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""SD_189"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_2205 = objNull;
if (true) then
{
	_this = "Land_HelipadSquare_F" createvehiclelocal [19503.752, 15347.17, 0.00011444092];
	_vehicle_2205 = _this;
	_this setDir 684.6756;
	_this setPos [19503.752, 15347.17, 0.00011444092];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;;

EMonkeys_loadmap5 = true;