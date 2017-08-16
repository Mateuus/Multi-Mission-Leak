/*
	File: housing-insel.sqf
	Author: Niklas "Rappelkiste" Quenter 
	Server: e-Monkeys.com
	
	Information: Objekte:102
*/

_initCodes = [];

//Haus 173
_vehicle_000 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4410.9429, 16603.57, 0.33686927];
	_vehicle_000 = _this;
	_this setVehicleVarName "house_173";
	house_173 = _this;
	_this setDir 45.09037;
	_this setPos [4410.9429, 16603.57, 0.33686927];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_173""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_173"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_173"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4410.4395, 16595.77, 3.0517578e-005];
	_vehicle_001 = _this;
	_this setDir 45.470764;
	_this setPos [4410.4395, 16595.77, 3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_173"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 174
_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4379.2261, 16616.939, 0.19508895];
	_vehicle_002 = _this;
	_this setVehicleVarName "house_174";
	house_174 = _this;
	_this setDir 7.9934845;
	_this setPos [4379.2261, 16616.939, 0.19508895];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_174""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_174"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_174"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4383.5537, 16614.908, -0.00022125244];
	_vehicle_003 = _this;
	_this setDir -81.619286;
	_this setPos [4383.5537, 16614.908, -0.00022125244];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_174"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 175
_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4283.3887, 16746.418, 0.50937468];
	_vehicle_004 = _this;
	_this setVehicleVarName "house_175";
	house_175 = _this;
	_this setDir -107.57217;
	_this setPos [4283.3887, 16746.418, 0.50937468];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_175""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_175"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_175"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4252.4316, 16755.795, 0.089071907];
	_vehicle_005 = _this;
	_this setDir 70.123093;
	_this setPos [4252.4316, 16755.795, 0.089071907];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_175"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false;  _this enableSimulation false; };

//Haus 176
_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4258.2725, 16815.936, 0.37744021];
	_vehicle_006 = _this;
	_this setVehicleVarName "house_176";
	house_176 = _this;
	_this setDir -114.91512;
	_this setPos [4258.2725, 16815.936, 0.37744021];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_176""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_176"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_176"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4232.9883, 16803.701, 0.083007872];
	_vehicle_007 = _this;
	_this setDir 66.971458;
	_this setPos [4232.9883, 16803.701, 0.083007872];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_176"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 177
_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4243.2466, 16845.43, 0.55525434];
	_vehicle_008 = _this;
	_this setVehicleVarName "house_177";
	house_177 = _this;
	_this setDir -114.01898;
	_this setPos [4243.2466, 16845.43, 0.55525434];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_177""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_177"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_177"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4221.0254, 16845.91, -7.0095062e-005];
	_vehicle_009 = _this;
	_this setDir 66.971458;
	_this setPos [4221.0254, 16845.91, -7.0095062e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_177"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 178
_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4112.0454, 16982.68, 0.95756501];
	_vehicle_010 = _this;
	_this setVehicleVarName "house_178";
	house_178 = _this;
	_this setDir -138.36755;
	_this setPos [4112.0454, 16982.68, 0.95756501];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_178""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_178"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_178"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4117.2036, 16985.611, 6.1035156e-005];
	_vehicle_012 = _this;
	_this setDir 219.29633;
	_this setPos [4117.2036, 16985.611, 6.1035156e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_178"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 179
_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4126.3452, 16976.461, 0.85541177];
	_vehicle_013 = _this;
	_this setVehicleVarName "house_179";
	house_179 = _this;
	_this setDir -139.43544;
	_this setPos [4126.3452, 16976.461, 0.85541177];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_179""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_179"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_179"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4127.3516, 16976.982, 0.090323173];
	_vehicle_014 = _this;
	_this setDir 219.56693;
	_this setPos [4127.3516, 16976.982, 0.090323173];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_179"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 180
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4147.3765, 17004.176, 0.59259737];
	_vehicle_015 = _this;
	_this setVehicleVarName "house_180";
	house_180 = _this;
	_this setDir -146.50179;
	_this setPos [4147.3765, 17004.176, 0.59259737];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_180""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_180"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_180"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4141.1304, 17002.268, -2.3365021e-005];
	_vehicle_016 = _this;
	_this setDir 391.73984;
	_this setPos [4141.1304, 17002.268, -2.3365021e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_180"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 181
_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3897.8054, 17346.531, 0.42594084];
	_vehicle_017 = _this;
	_this setVehicleVarName "house_181";
	house_181 = _this;
	_this setDir -199.55563;
	_this setPos [3897.8054, 17346.531, 0.42594084];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_181""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_181"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_181"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3900.0674, 17347.354, -0.00016975403];
	_vehicle_018 = _this;
	_this setDir 251.19548;
	_this setPos [3900.0674, 17347.354, -0.00016975403];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_181"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false; 
};

//Haus 182
_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3922.064, 17359.23, 0.21531782];
	_vehicle_019 = _this;
	_this setVehicleVarName "house_182";
	house_182 = _this;
	_this setDir -197.86414;
	_this setPos [3922.064, 17359.23, 0.21531782];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_182""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_182"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_182"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3928.2239, 17344.049, -0.00010681152];
	_vehicle_020 = _this;
	_this setDir 358.33627;
	_this setPos [3928.2239, 17344.049, -0.00010681152];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_182"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 183
_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3929.2341, 17394.363, 0.15689321];
	_vehicle_021 = _this;
	_this setVehicleVarName "house_183";
	house_183 = _this;
	_this setDir -232.98428;
	_this setPos [3929.2341, 17394.363, 0.15689321];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_183""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_183"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_183"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3919.9573, 17408.111, -3.0517578e-005];
	_vehicle_022 = _this;
	_this setDir 488.17294;
	_this setPos [3919.9573, 17408.111, -3.0517578e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_183"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 184
_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3919.0979, 17465.771, 0.30355996];
	_vehicle_023 = _this;
	_this setVehicleVarName "house_184";
	house_184 = _this;
	_this setDir -218.11024;
	_this setPos [3919.0979, 17465.771, 0.30355996];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_184""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_184"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_184"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3893.3025, 17442.01, 3.8146973e-006];
	_vehicle_024 = _this;
	_this setDir 431.50943;
	_this setPos [3893.3025, 17442.01, 3.8146973e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_184"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 185
_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3795.7622, 17576.885, 0.12976784];
	_vehicle_025 = _this;
	_this setVehicleVarName "house_185";
	house_185 = _this;
	_this setDir -211.07173;
	_this setPos [3795.7622, 17576.885, 0.12976784];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_185""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_185"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_185"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3772.8037, 17581.342, -4.5776367e-005];
	_vehicle_026 = _this;
	_this setDir 423.49033;
	_this setPos [3772.8037, 17581.342, -4.5776367e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_185"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 186
_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3747.2532, 17657.568, 0.49215877];
	_vehicle_027 = _this;
	_this setVehicleVarName "house_186";
	house_186 = _this;
	_this setDir -298.77863;
	_this setPos [3747.2532, 17657.568, 0.49215877];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_186""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_186"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_186"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3744.8352, 17646.967, -0.044327952];
	_vehicle_028 = _this;
	_this setDir 424.52704;
	_this setPos [3744.8352, 17646.967, -0.044327952];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_186"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 187
_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [3762.0769, 17647.918, 0.55809093];
	_vehicle_029 = _this;
	_this setVehicleVarName "house_187";
	house_187 = _this;
	_this setDir -295.86972;
	_this setPos [3762.0769, 17647.918, 0.55809093];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_187""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_187"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_187"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [3761.2722, 17641.531, -6.6757202e-005];
	_vehicle_030 = _this;
	_this setDir 423.76917;
	_this setPos [3761.2722, 17641.531, -6.6757202e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_187"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 188
_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4125.3188, 17242.318, 0.45026007];
	_vehicle_031 = _this;
	_this setVehicleVarName "house_188";
	house_188 = _this;
	_this setDir -316.76654;
	_this setPos [4125.3188, 17242.318, 0.45026007];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_188""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_188"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_188"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4124.1538, 17233.961, 7.2479248e-005];
	_vehicle_032 = _this;
	_this setDir 402.72412;
	_this setPos [4124.1538, 17233.961, 7.2479248e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_188"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 189
_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4965.3955, 16112.396, 0.33698845];
	_vehicle_033 = _this;
	_this setVehicleVarName "house_189";
	house_189 = _this;
	_this setDir -360.10974;
	_this setPos [4965.3955, 16112.396, 0.33698845];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_189""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_189"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_189"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4961.8584, 16114.837];
	_vehicle_034 = _this;
	_this setDir 544.38269;
	_this setPos [4961.8584, 16114.837];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_189"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 190
_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4945.5957, 16144.821];
	_vehicle_035 = _this;
	_this setVehicleVarName "house_190";
	house_190 = _this;
	_this setDir -437.98178;
	_this setPos [4945.5957, 16144.821];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_190""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_190"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_190"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4952.8223, 16145.296, 7.6293945e-006];
	_vehicle_036 = _this;
	_this setDir 731.37799;
	_this setPos [4952.8223, 16145.296, 7.6293945e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_190"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 191
_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4927.1802, 16132.742, 0.37441036];
	_vehicle_037 = _this;
	_this setVehicleVarName "house_191";
	house_191 = _this;
	_this setDir -440.39038;
	_this setPos [4927.1802, 16132.742, 0.37441036];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_191""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_191"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_191"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4920.0615, 16132.063, 0.40606275];
	_vehicle_038 = _this;
	_this setDir 549.54913;
	_this setPos [4920.0615, 16132.063, 0.40606275];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_191"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 192
_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4926.1572, 16161.094, 0.47413427];
	_vehicle_039 = _this;
	_this setVehicleVarName "house_192";
	house_192 = _this;
	_this setDir -504.61108;
	_this setPos [4926.1572, 16161.094, 0.47413427];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_192""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_192"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_192"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4928.4751, 16154.327, 0.21960212];
	_vehicle_040 = _this;
	_this setDir 393.72595;
	_this setPos [4928.4751, 16154.327, 0.21960212];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_192"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 193
_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4896.7964, 16164.651, 0.40560135];
	_vehicle_041 = _this;
	_this setVehicleVarName "house_193";
	house_193 = _this;
	_this setDir -591.59058;
	_this setPos [4896.7964, 16164.651, 0.40560135];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_193""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_193"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_193"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4890.0557, 16162.494, 0.23448646];
	_vehicle_042 = _this;
	_this setDir 485.21268;
	_this setPos [4890.0557, 16162.494, 0.23448646];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_193"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 194
_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [4800.7446, 16163.293, 0.26922402];
	_vehicle_043 = _this;
	_this setVehicleVarName "house_194";
	house_194 = _this;
	_this setDir -532.49683;
	_this setPos [4800.7446, 16163.293, 0.26922402];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_194""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_194"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_194"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [4805.9316, 16154.851, -3.8146973e-005];
	_vehicle_044 = _this;
	_this setDir 373.14746;
	_this setPos [4805.9316, 16154.851, -3.8146973e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_194"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 195
_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12387.154, 15752.933, 0.13230455];
	_vehicle_045 = _this;
	_this setVehicleVarName "house_195";
	house_195 = _this;
	_this setDir -506.06491;
	_this setPos [12387.154, 15752.933, 0.13230455];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_195""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_195"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_195"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12385.966, 15760.974, -2.2888184e-005];
	_vehicle_046 = _this;
	_this setDir 574.38702;
	_this setPos [12385.966, 15760.974, -2.2888184e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_195"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 196
_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12413.835, 15774.839, 0.40068701];
	_vehicle_047 = _this;
	_this setVehicleVarName "house_196";
	house_196 = _this;
	_this setDir -717.25623;
	_this setPos [12413.835, 15774.839, 0.40068701];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_196""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_196"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_196"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12419.052, 15770.375, -0.11294383];
	_vehicle_048 = _this;
	_this setDir 363.28479;
	_this setPos [12419.052, 15770.375, -0.11294383];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_196"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 197
_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12385.014, 15809.238, 0.26344645];
	_vehicle_049 = _this;
	_this setVehicleVarName "house_197";
	house_197 = _this;
	_this setDir -355.51224;
	_this setPos [12385.014, 15809.238, 0.26344645];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_197""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_197"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_197"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12390.338, 15804.656, -0.072885536];
	_vehicle_050 = _this;
	_this setDir 724.28113;
	_this setPos [12390.338, 15804.656, -0.072885536];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_197"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 198
_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12400.069, 15572.015, 0.3834205];
	_vehicle_051 = _this;
	_this setVehicleVarName "house_198";
	house_198 = _this;
	_this setDir -636.38312;
	_this setPos [12400.069, 15572.015, 0.3834205];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_198""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_198"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_198"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12401.043, 15576.896, 2.2888184e-005];
	_vehicle_052 = _this;
	_this setDir 172.65117;
	_this setPos [12401.043, 15576.896, 2.2888184e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_198"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 199
_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12372.574, 15843.471, 0.11343467];
	_vehicle_053 = _this;
	_this setVehicleVarName "house_199";
	house_199 = _this;
	_this setDir -516.14423;
	_this setPos [12372.574, 15843.471, 0.11343467];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_199""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_199"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_199"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12381.415, 15848.433, 7.6293945e-006];
	_vehicle_054 = _this;
	_this setDir 295.35904;
	_this setPos [12381.415, 15848.433, 7.6293945e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_199"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 200
_vehicle_055 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [12401.917, 15853.937, 0.33564746];
	_vehicle_055 = _this;
	_this setVehicleVarName "house_200";
	house_200 = _this;
	_this setDir -614.40826;
	_this setPos [12401.917, 15853.937, 0.33564746];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_200""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_200"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_200"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [12397.158, 15846.093, -7.6293945e-006];
	_vehicle_056 = _this;
	_this setDir 103.20045;
	_this setPos [12397.158, 15846.093, -7.6293945e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_200"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 201
_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20993.127, 17028.615, 0.81145716];
	_vehicle_057 = _this;
	_this setVehicleVarName "house_201";
	house_201 = _this;
	_this setDir -502.55527;
	_this setPos [20993.127, 17028.615, 0.81145716];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_201""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_201"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_201"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20995.309, 17021.918, 0.51192564];
	_vehicle_058 = _this;
	_this setDir 397.48926;
	_this setPos [20995.309, 17021.918, 0.51192564];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_201"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 202
_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [21017.512, 16996.588, 1.7181646];
	_vehicle_059 = _this;
	_this setVehicleVarName "house_202";
	house_202 = _this;
	_this setDir -496.64255;
	_this setPos [21017.512, 16996.588, 1.7181646];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_202""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_202"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_202"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_060 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [21006.602, 17002.613, 0.00022888184];
	_vehicle_060 = _this;
	_this setDir 491.85898;
	_this setPos [21006.602, 17002.613, 0.00022888184];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_202"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 203
_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20994.5, 16983.842, 0.59887928];
	_vehicle_061 = _this;
	_this setVehicleVarName "house_203";
	house_203 = _this;
	_this setDir -497.56229;
	_this setPos [20994.5, 16983.842, 0.59887928];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_203""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_203"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_203"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_062 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20991.307, 16977.527, 0.22386681];
	_vehicle_062 = _this;
	_this setDir 494.17853;
	_this setPos [20991.307, 16977.527, 0.22386681];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_203"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 204
_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20936.553, 16901.99, 0.39443976];
	_vehicle_064 = _this;
	_this setVehicleVarName "house_204";
	house_204 = _this;
	_this setDir -494.3284;
	_this setPos [20936.553, 16901.99, 0.39443976];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_204""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_204"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_204"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20932.994, 16895.959, 0.58399636];
	_vehicle_064 = _this;
	_this setDir 497.07205;
	_this setPos [20932.994, 16895.959, 0.58399636];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_204"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false;  _this enableSimulation false; };

//Haus 205
_vehicle_065 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20919.057, 16820.775, 0.30615261];
	_vehicle_065 = _this;
	_this setVehicleVarName "house_205";
	house_205 = _this;
	_this setDir -498.29562;
	_this setPos [20919.057, 16820.775, 0.30615261];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_205""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_205"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_205"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20916.592, 16819.203, 0.15223463];
	_vehicle_066 = _this;
	_this setDir 491.7598;
	_this setPos [20916.592, 16819.203, 0.15223463];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_205"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 206
_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20936.482, 16844.592, 0.2092936];
	_vehicle_067 = _this;
	_this setVehicleVarName "house_206";
	house_206 = _this;
	_this setDir -498.69278;
	_this setPos [20936.482, 16844.592, 0.2092936];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_206""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_206"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_206"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_068 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20933.258, 16838.203, 0.21339943];
	_vehicle_068 = _this;
	_this setDir 490.40976;
	_this setPos [20933.258, 16838.203, 0.21339943];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_206"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 207
_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20840.887, 16890.586, 1.3578634];
	_vehicle_069 = _this;
	_this setVehicleVarName "house_207";
	house_207 = _this;
	_this setDir -510.91705;
	_this setPos [20840.887, 16890.586, 1.3578634];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_207""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_207"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_207"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20844.451, 16894.668, 2.2888184e-005];
	_vehicle_070 = _this;
	_this setDir 660.68121;
	_this setPos [20844.451, 16894.668, 2.2888184e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_207"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 208
_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20847.811, 16866.031, 0.1003413];
	_vehicle_071 = _this;
	_this setVehicleVarName "house_208";
	house_208 = _this;
	_this setDir -510.91705;
	_this setPos [20847.811, 16866.031, 0.1003413];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_208""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_208"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_208"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_072 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20845.938, 16859.258, 0.54084855];
	_vehicle_072 = _this;
	_this setDir 480.30734;
	_this setPos [20845.938, 16859.258, 0.54084855];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_208"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 209
_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20914.723, 17078.404, 1.1145691];
	_vehicle_073 = _this;
	_this setVehicleVarName "house_209";
	house_209 = _this;
	_this setDir -510.91705;
	_this setPos [20914.723, 17078.404, 1.1145691];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_209""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_209"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_209"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20918.807, 17078.217, -0.0001373291];
	_vehicle_074 = _this;
	_this setDir 300.48785;
	_this setPos [20918.807, 17078.217, -0.0001373291];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_209"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 210
_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20988.764, 16910.111, 2.0227094];
	_vehicle_075 = _this;
	_this setVehicleVarName "house_210";
	house_210 = _this;
	_this setDir -510.91705;
	_this setPos [20988.764, 16910.111, 2.0227094];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_210""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_210"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_210"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_076 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20989.721, 16900.91, -3.4332275e-005];
	_vehicle_076 = _this;
	_this setDir 317.26276;
	_this setPos [20989.721, 16900.91, -3.4332275e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_210"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 211
_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [23998.883, 20124.234, 0.22901061];
	_vehicle_077 = _this;
	_this setVehicleVarName "house_211";
	house_211 = _this;
	_this setDir -491.68875;
	_this setPos [23998.883, 20124.234, 0.22901061];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_211""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_211"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_211"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [24000.4, 20113.881, 0.00027370453];
	_vehicle_078 = _this;
	_this setDir 406.23636;
	_this setPos [24000.4, 20113.881, 0.00027370453];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_211"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 212
_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [22484.451, 19990.088, 0.22851527];
	_vehicle_079 = _this;
	_this setVehicleVarName "house_212";
	house_212 = _this;
	_this setDir -482.48636;
	_this setPos [22484.451, 19990.088, 0.22851527];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_212""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_212"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_212"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_080 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22466.123, 20003.27, -1.1444092e-005];
	_vehicle_080 = _this;
	_this setDir 510.67847;
	_this setPos [22466.123, 20003.27, -1.1444092e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_212"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 213
_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [20821.016, 16401.658, 0.33052826];
	_vehicle_081 = _this;
	_this setVehicleVarName "house_213";
	house_213 = _this;
	_this setDir -431.3898;
	_this setPos [20821.016, 16401.658, 0.33052826];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_213""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_213"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_213"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [20834.252, 16416.342, 8.392334e-005];
	_vehicle_082 = _this;
	_this setDir 549.77441;
	_this setPos [20834.252, 16416.342, 8.392334e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_213"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 214
_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [19348.141, 13278.473, 0.38233817];
	_vehicle_083 = _this;
	_this setVehicleVarName "house_214";
	house_214 = _this;
	_this setDir -483.30829;
	_this setPos [19348.141, 13278.473, 0.38233817];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_214""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_214"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_214"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_084 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19348.154, 13271.659, 0.24032588];
	_vehicle_084 = _this;
	_this setDir 418.36023;
	_this setPos [19348.154, 13271.659, 0.24032588];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_214"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 215
_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [19315.385, 13211.372, 0.38095692];
	_vehicle_085 = _this;
	_this setVehicleVarName "house_215";
	house_215 = _this;
	_this setDir -567.93402;
	_this setPos [19315.385, 13211.372, 0.38095692];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_215""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_215"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_215"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19308.889, 13209.484, 0.34234411];
	_vehicle_086 = _this;
	_this setDir 420.10129;
	_this setPos [19308.889, 13209.484, 0.34234411];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_215"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 216
_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [19299.186, 13326.941, 0.4253737];
	_vehicle_087 = _this;
	_this setVehicleVarName "house_216";
	house_216 = _this;
	_this setDir -566.91022;
	_this setPos [19299.186, 13326.941, 0.4253737];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_216""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_216"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_216"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_088 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [19309.57, 13325.657, -1.5258789e-005];
	_vehicle_088 = _this;
	_this setDir 331.17499;
	_this setPos [19309.57, 13325.657, -1.5258789e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_216"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 217
_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [10313.906, 19063.234, 0.38157195];
	_vehicle_089 = _this;
	_this setVehicleVarName "house_217";
	house_217 = _this;
	_this setDir -603.87799;
	_this setPos [10313.906, 19063.234, 0.38157195];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_217""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_217"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_217"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_090 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10318.979, 19059.01, 0.22347264];
	_vehicle_090 = _this;
	_this setDir 294.53592;
	_this setPos [10318.979, 19059.01, 0.22347264];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_217"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 218
_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [10354.526, 18989.398, 0.86796618];
	_vehicle_091 = _this;
	_this setVehicleVarName "house_218";
	house_218 = _this;
	_this setDir -625.59247;
	_this setPos [10354.526, 18989.398, 0.86796618];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_218""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_218"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_218"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_092 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10356.819, 18995.873, 0.47247767];
	_vehicle_092 = _this;
	_this setDir 186.21924;
	_this setPos [10356.819, 18995.873, 0.47247767];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_218"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 219
_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [10324.314, 18986.908, 0.33720911];
	_vehicle_093 = _this;
	_this setVehicleVarName "house_219";
	house_219 = _this;
	_this setDir -632.86334;
	_this setPos [10324.314, 18986.908, 0.33720911];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_219""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_219"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_219"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10320.76, 18980.572, 0.56363124];
	_vehicle_094 = _this;
	_this setDir 83.504349;
	_this setPos [10320.76, 18980.572, 0.56363124];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_219"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 220
_vehicle_095 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [7808.6147, 11020.778, 0.2937282];
	_vehicle_095 = _this;
	_this setVehicleVarName "house_220";
	house_220 = _this;
	_this setDir -709.61206;
	_this setPos [7808.6147, 11020.778, 0.2937282];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_220""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_220"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_220"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7803.2944, 10983.952, 5.7220459e-006];
	_vehicle_096 = _this;
	_this setDir 6.6152596;
	_this setPos [7803.2944, 10983.952, 5.7220459e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_220"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false;  _this enableSimulation false; };

//Haus 221
_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [7628.7432, 10993.145, 0.30082816];
	_vehicle_097 = _this;
	_this setVehicleVarName "house_221";
	house_221 = _this;
	_this setDir -717.23413;
	_this setPos [7628.7432, 10993.145, 0.30082816];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_221""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_221"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_221"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [7628.8628, 10980.403, -5.7220459e-006];
	_vehicle_098 = _this;
	_this setDir -5.529386;
	_this setPos [7628.8628, 10980.403, -5.7220459e-006];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_221"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 222
_vehicle_099 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [18749.986, 16629.484, 0.24569675];
	_vehicle_099 = _this;
	_this setVehicleVarName "house_222";
	house_222 = _this;
	_this setDir -662.93524;
	_this setPos [18749.986, 16629.484, 0.24569675];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_222""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_222"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_222"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18748.416, 16629.41, 0.24878274];
	_vehicle_100 = _this;
	_this setDir 146.89146;
	_this setPos [18748.416, 16629.41, 0.24878274];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_222"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 223
_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [18817.877, 16665.66, 0.43816495];
	_vehicle_101 = _this;
	_this setVehicleVarName "house_223";
	house_223 = _this;
	_this setDir -746.03473;
	_this setPos [18817.877, 16665.66, 0.43816495];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_223""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_223"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_223"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_102 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18810.895, 16666.865, -3.8146973e-005];
	_vehicle_102 = _this;
	_this setDir 153.50493;
	_this setPos [18810.895, 16666.865, -3.8146973e-005];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_223"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 224 NEU
_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18793.102, 16837.463, -3.4332275e-005];
	_vehicle_103 = _this;
	_this setDir 60.138977;
	_this setPos [18793.102, 16837.463, -3.4332275e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_224"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18793.635, 16841.695, 0.31588191];
	_vehicle_104 = _this;
	_this setVehicleVarName "house_224";
	house_224 = _this;
	_this setDir 61.3778;
	_this setPos [18793.635, 16841.695, 0.31588191];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_224""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_224"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_224"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 225
_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18800.16, 16825.17, 6.1035156e-005];
	_vehicle_105 = _this;
	_this setDir 59.802715;
	_this setPos [18800.16, 16825.17, 6.1035156e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_225"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18802.871, 16832.801, 0.21970423];
	_vehicle_106 = _this;
	_this setVehicleVarName "house_225";
	house_225 = _this;
	_this setDir -29.680067;
	_this setPos [18802.871, 16832.801, 0.21970423];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_225""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_225"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_225"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 226
_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18824.369, 16710.145, 3.8146973e-005];
	_vehicle_107 = _this;
	_this setDir 60.671093;
	_this setPos [18824.369, 16710.145, 3.8146973e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_226"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18822.344, 16715.445, 0.24412727];
	_vehicle_108 = _this;
	_this setVehicleVarName "house_226";
	house_226 = _this;
	_this setDir 150.85036;
	_this setPos [18822.344, 16715.445, 0.24412727];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_226""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_226"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_226"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 227
_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18847.775, 16663.633, 9.5367432e-006];
	_vehicle_109 = _this;
	_this setDir 69.298981;
	_this setPos [18847.775, 16663.633, 9.5367432e-006];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_227"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18852.258, 16664.785, 0.35916007];
	_vehicle_110 = _this;
	_this setVehicleVarName "house_227";
	house_277 = _this;
	_this setDir 158.19153;
	_this setPos [18852.258, 16664.785, 0.35916007];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_227""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_227"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_227"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 228
_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18856.682, 16623.631, 0.38268679];
	_vehicle_111 = _this;
	_this setDir -41.550835;
	_this setPos [18856.682, 16623.631, 0.38268679];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_228"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18854.018, 16629.617, 0.26613882];
	_vehicle_112 = _this;
	_this setVehicleVarName "house_228";
	house_228 = _this;
	_this setDir 139.04396;
	_this setPos [18854.018, 16629.617, 0.26613882];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_228""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_228"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_228"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 229
_vehicle_113 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18074.326, 15207.022, -0.00012779236];
	_vehicle_113 = _this;
	_this setDir -71.494377;
	_this setPos [18074.326, 15207.022, -0.00012779236];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_229"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18066.193, 15200.608, 0.26908815];
	_vehicle_114 = _this;
	_this setVehicleVarName "house_229";
	house_229 = _this;
	_this setDir 108.64911;
	_this setPos [18066.193, 15200.608, 0.26908815];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_229""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_229"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_229"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 230
_vehicle_115 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18075.428, 15210.473, 0.38116857];
	_vehicle_115 = _this;
	_this setDir -71.034058;
	_this setPos [18075.428, 15210.473, 0.38116857];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_230"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18072.162, 15214.782, 0.36018312];
	_vehicle_116 = _this;
	_this setVehicleVarName "house_230";
	house_230 = _this;
	_this setDir 199.9828;
	_this setPos [18072.162, 15214.782, 0.36018312];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_230""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_230"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_230"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 231
_vehicle_117 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18099.049, 15216.529, 0.20742814];
	_vehicle_117 = _this;
	_this setDir -136.14867;
	_this setPos [18099.049, 15216.529, 0.20742814];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_231"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18093.289, 15213.37, 0.46585846];
	_vehicle_118 = _this;
	_this setVehicleVarName "house_231";
	house_231 = _this;
	_this setDir 226.94797;
	_this setPos [18093.289, 15213.37, 0.46585846];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_231""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_231"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_231"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];	
};

//Haus 232
_vehicle_119 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18092.041, 15246.544, 0.29266703];
	_vehicle_119 = _this;
	_this setDir -134.90775;
	_this setPos [18092.041, 15246.544, 0.29266703];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_232"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18088.846, 15239.958, 0.26036942];
	_vehicle_120 = _this;
	_this setVehicleVarName "house_232";
	house_232 = _this;
	_this setDir 226.16646;
	_this setPos [18088.846, 15239.958, 0.26036942];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_232""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_232"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_232"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 233
_vehicle_121 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18080.551, 15258.23, -0.00022315979];
	_vehicle_121 = _this;
	_this setDir -137.40936;
	_this setPos [18080.551, 15258.23, -0.00022315979];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_233"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18083.766, 15249.119, 0.48111689];
	_vehicle_122 = _this;
	_this setVehicleVarName "house_233";
	house_233 = _this;
	_this setDir 225.62431;
	_this setPos [18083.766, 15249.119, 0.48111689];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_233""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_233"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_233"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 234
_vehicle_123 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [18106.822, 15271.07, 0.54831266];
	_vehicle_123 = _this;
	_this setDir -41.637424;
	_this setPos [18106.822, 15271.07, 0.54831266];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_234"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [18102.379, 15275.979, 0.26422498];
	_vehicle_124 = _this;
	_this setVehicleVarName "house_234";
	house_234 = _this;
	_this setDir 227.24031;
	_this setPos [18102.379, 15275.979, 0.26422498];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_234""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_234"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_234"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 235
_vehicle_125 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [27021.434, 23291.746, 0.29062265];
	_vehicle_125 = _this;
	_this setDir 45.787674;
	_this setPos [27021.434, 23291.746, 0.29062265];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_235"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [27029.93, 23291.211, 0.066582687];
	_vehicle_126 = _this;
	_this setVehicleVarName "house_235";
	house_235 = _this;
	_this setDir 226.65317;
	_this setPos [27029.93, 23291.211, 0.066582687];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_235""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_235"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_235"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 236
_vehicle_127 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [27036.871, 23279.479, 0.55202401];
	_vehicle_127 = _this;
	_this setDir 46.672264;
	_this setPos [27036.871, 23279.479, 0.55202401];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_236"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [27042.605, 23282.662, 0.61363387];
	_vehicle_128 = _this;
	_this setVehicleVarName "house_236";
	house_236 = _this;
	_this setDir 182.83542;
	_this setPos [27042.605, 23282.662, 0.61363387];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_236""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_236"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_236"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 237
_vehicle_129 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [27038.838, 23273.482, 0.10996126];
	_vehicle_129 = _this;
	_this setDir 46.672264;
	_this setPos [27038.838, 23273.482, 0.10996126];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_237"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [27040.734, 23278.354, 0.20317316];
	_vehicle_130 = _this;
	_this setVehicleVarName "house_237";
	house_237 = _this;
	_this setDir 182.52187;
	_this setPos [27040.734, 23278.354, 0.20317316];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_237""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_237"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_237"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 238
_vehicle_131 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22513.826, 18599.369, -0.13716321];
	_vehicle_131 = _this;
	_this setDir -48.982624;
	_this setPos [22513.826, 18599.369, -0.13716321];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_238"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [22511.955, 18604.162, 0.47037649];
	_vehicle_132 = _this;
	_this setVehicleVarName "house_238";
	house_238 = _this;
	_this setDir 221.06755;
	_this setPos [22511.955, 18604.162, 0.47037649];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_238""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_238"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_238"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 239
_vehicle_133 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [22586.781, 18076.621, -0.089598216];
	_vehicle_133 = _this;
	_this setVehicleVarName "house_239";
	house_239 = _this;
	_this setDir -210.20055;
	_this setPos [22586.781, 18076.621, -0.089598216];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_239"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [22587.758, 18071.84, 0.59617186];
	_vehicle_134 = _this;
	_this setDir 240.52779;
	_this setPos [22587.758, 18071.84, 0.59617186];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_239""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_239"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_239"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 240
_vehicle_135 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16652.395, 16101.449, 0.20568272];
	_vehicle_135 = _this;
	_this setDir -142.19749;
	_this setPos [16652.395, 16101.449, 0.20568272];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_240"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16654.824, 16094.769, 0.41507328];
	_vehicle_136 = _this;
	_this setVehicleVarName "house_240";
	house_240 = _this;
	_this setDir 215.64049;
	_this setPos [16654.824, 16094.769, 0.41507328];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_240""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_240"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_240"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 241
_vehicle_137 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16655.008, 16144.151, 0.23065947];
	_vehicle_137 = _this;
	_this setDir -313.46786;
	_this setPos [16655.008, 16144.151, 0.23065947];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_241"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16653.865, 16146.569, 0.37735245];
	_vehicle_138 = _this;
	_this setVehicleVarName "house_241";
	house_241 = _this;
	_this setDir 137.57292;
	_this setPos [16653.865, 16146.569, 0.37735245];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_241""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_241"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_241"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 242
_vehicle_139 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16665.361, 16064.274, -5.7220459e-005];
	_vehicle_139 = _this;
	_this setDir -211.58971;
	_this setPos [16665.361, 16064.274, -5.7220459e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_242"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16665.469, 16059.012, 3.8920581];
	_vehicle_140 = _this;
	_this setVehicleVarName "house_242";
	house_242 = _this;
	_this setDir 58.358887;
	_this setPos [16665.469, 16059.012, 3.8920581];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_242""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_242"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_242"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 243
_vehicle_141 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16589.262, 16080.931, 0.19717];
	_vehicle_141 = _this;
	_this setDir -397.96005;
	_this setPos [16589.262, 16080.931, 0.19717];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_243"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16585.004, 16086.012, 0.35382101];
	_vehicle_142 = _this;
	_this setVehicleVarName "house_243";
	house_243 = _this;
	_this setDir 51.975796;
	_this setPos [16585.004, 16086.012, 0.35382101];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_243""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_243"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_243"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Haus 244
_vehicle_143 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [16607.977, 16077.273, 3.0517578e-005];
	_vehicle_143 = _this;
	_this setDir -489.77859;
	_this setPos [16607.977, 16077.273, 3.0517578e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_244"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this setObjectTexture [0,""core\textures\map\house.paa""];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [16607.254, 16072.606, 0.23774923];
	_vehicle_144 = _this;
	_this setVehicleVarName "house_244";
	house_244 = _this;
	_this setDir 52.489491;
	_this setPos [16607.254, 16072.606, 0.23774923];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_244""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_244"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_244"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;