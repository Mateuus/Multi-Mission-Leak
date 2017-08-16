/*
	File: housing-pyr.sqf
	Author: KOMA
	Edited: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com
	
	Information: Objekte:34 | Housing Pyrgos
*/

_initCodes =[];

//Haus 130
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16750, 12460.5, 0.20070866];
	_vehicle_001 = _this;
	_this setVehicleVarName "house_130";
	house_130 = _this;
	_this setDir 235.768;
	_this setPos [16750, 12460.5, 0.20070866];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_130""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_130"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_130"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16743.971, 12465.712];
	_vehicle_002 = _this;
	_this setDir 144.246;
	_this setPos [16743.971, 12465.712];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_130"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 131
_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16776.082, 12475.413, 0.37456128];
	_vehicle_003 = _this;
	_this setVehicleVarName "house_131";
	house_131 = _this;
	_this setDir 162.55522;
	_this setPos [16776.082, 12475.413, 0.37456128];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_131""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_131"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_131"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16781.443, 12474.651, -0.11873837];
	_vehicle_004 = _this;
	_this setDir 256.171;
	_this setPos [16781.443, 12474.651, -0.11873837];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_131"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 132
_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16794.588, 12516.771, 1.3279325];
	_vehicle_005 = _this;
	_this setDir 93.1692;
	_this setPos [16794.588, 12516.771, 1.3279325];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_132"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16796.059, 12514.989, 1.5467693];
	_vehicle_006 = _this;
	_this setVehicleVarName "house_132";
	house_132 = _this;
	_this setDir 178.888;
	_this setPos [16796.059, 12514.989, 1.5467693];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_132""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_132"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_132"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 133
_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16766.6,12567.8,0];
	_vehicle_007 = _this;
	_this setDir 305.116;
	_this setPos [16766.6,12567.8,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_133"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16760.4,12565.4,0];
	_vehicle_008 = _this;
	_this setVehicleVarName "house_133";
	house_133 = _this;
	_this setDir 305.096;
	_this setPos [16760.4,12565.4,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_133""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_133"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_133"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 134
_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16767.699, 12596.2, 0.81648731];
	_vehicle_009 = _this;
	_this setVehicleVarName "house_134";
	house_134 = _this;
	_this setDir 7.58104;
	_this setPos [16767.699, 12596.2, 0.81648731];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_134""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_134"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_134"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16772.1, 12601.3];
	_vehicle_010 = _this;
	_this setDir 274.786;
	_this setPos [16772.1, 12601.3];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_134"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 135
_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16882.135, 12675.134, -0.34686702];
	_vehicle_011 = _this;
	_this setVehicleVarName "house_135";
	house_135 = _this;
	_this setDir 132.491;
	_this setPos [16883.7,12676.3,0.325];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_135""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_135"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_135"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16884.695, 12670.092, -0.83349735];
	_vehicle_012 = _this;
	_this setDir 42.0624;
	_this setPos [16884.7,12670.1,0.325];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_135"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 136
_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16891.801, 12706.5, -0.36891571];
	_vehicle_013 = _this;
	_this setDir 226.158;
	_this setPos [16891.8,12706.5,0.1];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_136"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [16892.902, 12699.891, 0.35781774];
	_vehicle_014 = _this;
	_this setVehicleVarName "house_136";
	house_136 = _this;
	_this setDir 229.921;
	_this setPos [16892.902, 12699.891, 0.35781774];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_136""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_136"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_136"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 137
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16907.885, 12723.035, -0.089580633];
	_vehicle_015 = _this;
	_this setDir 313.524;
	_this setPos [16908,12723,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_137"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [16899.092, 12729.413, -0.99866259];
	_vehicle_016 = _this;
	_this setVehicleVarName "house_137";
	house_137 = _this;
	_this setDir 315.654;
	_this setPos [16899.7,12729.3,1.175];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_137""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_137"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_137"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 138
_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16824.658, 12758.08, -0.40799469];
	_vehicle_017 = _this;
	_this setDir 94.6219;
	_this setPos [16824.6,12757.2,0.175];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_138"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16829.699, 12752.4, -0.17171538];
	_vehicle_018 = _this;
	_this setVehicleVarName "house_138";
	house_138 = _this;
	_this setDir 183.018;
	_this setPos [16829.7,12752.4,0.175];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_138""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_138"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_138"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 139
_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16848.982, 12762.644, -0.15535676];
	_vehicle_019 = _this;
	_this setVehicleVarName "house_139";
	house_139 = _this;
	_this setDir 132.778;
	_this setPos [16848.5,12761.9,1];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_139""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_139"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_139"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16846.047, 12761.903, -0.15280597];
	_vehicle_019 = _this;
	_this setDir 134.822;
	_this setPos [16845.9,12761.7,0.3];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_139"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 140
_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16871.4, 12781.7, -0.25627854];
	_vehicle_020 = _this;
	_this setDir 310.974;
	_this setPos [16871.4,12781.7,0.625];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_140"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16865, 12780.1, -0.072332002];
	_vehicle_021 = _this;
	_this setVehicleVarName "house_140";
	house_140 = _this;
	_this setDir 38.9336;
	_this setPos [16865,12780.1,0.625];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_140""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_140"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_140"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 141
_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [16851.6, 12789.6, -0.40100405];
	_vehicle_022 = _this;
	_this setVehicleVarName "house_141";
	house_141 = _this;
	_this setDir 36.2793;
	_this setPos [16851.6,12789.6,0.625];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_141""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_141"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_141"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16860.605, 12795.186, -0.1235854];
	_vehicle_023 = _this;
	_this setDir 305.742;
	_this setPos [16860.6,12795.2,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_141"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 142
_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16802.418, 12778.147, -0.32392645];
	_vehicle_024 = _this;
	_this setDir 311.093;
	_this setPos [16802.5,12777.8,0.175];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_142"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16799.199, 12788.2];
	_vehicle_025 = _this;
	_this setVehicleVarName "house_142";
	house_142 = _this;
	_this setDir 311.183;
	_this setPos [16799.2,12788.2,0.45];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_142""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_142"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_142"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 143
_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16821.975, 12818.901, 0.019374575];
	_vehicle_026 = _this;
	_this setDir 218.422;
	_this setPos [16822.2,12818.5,0.15];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_143"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16812.199, 12815.2, -0.085499316];
	_vehicle_027 = _this;
	_this setVehicleVarName "house_143";
	house_143 = _this;
	_this setDir 218.169;
	_this setPos [16812.2,12815.2,0.175];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_143""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_143"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_143"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 144
_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16794.4, 12826.9, 0.23771708];
	_vehicle_028 = _this;
	_this setVehicleVarName "house_144";
	house_144 = _this;
	_this setDir 41.6627;
	_this setPos [16794.4, 12826.9, 0.23771708];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_144""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_144"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_144"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16805.529, 12830.652, -0.097590804];
	_vehicle_029 = _this;
	_this setDir 311.56256;
	_this setPos [16805.529, 12830.652, -0.097590804];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_144"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 145
_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16808.6, 12853.7, -0.52658647];
	_vehicle_030 = _this;
	_this setDir 42.7144;
	_this setPos [16808.6, 12853.7, -0.52658647];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_145"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16809.801, 12859.354, 0.58459103];
	_vehicle_031 = _this;
	_this setVehicleVarName "house_145";
	house_145 = _this;
	_this setDir 42.615;
	_this setPos [16809.801, 12859.354, 0.58459103];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_145""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_145"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_145"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

//Haus 146
_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16865.156, 12828.029, -0.20327799];
	_vehicle_032 = _this;
	_this setDir 121.358;
	_this setPos [16865.3,12828,0.175];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_146"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
};

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [16873.1, 12829.1, 0.070913225];
	_vehicle_033 = _this;
	_this setVehicleVarName "house_146";
	house_146 = _this;
	_this setDir 215.191;
	_this setPos [16873.1,12829.1,0.175];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_146""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_146"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_146"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];  "];
	_this enableSimulation false;
	_this allowDamage false;
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;