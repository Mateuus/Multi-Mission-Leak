/*
	File: housing-poliakko.sqf
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:54 | Housing Poliakko
*/

_initCodes = [];

//Haus  245
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10800.957, 13318.451, 0.22441088];
	_vehicle_001 = _this;
	_this setPos [10800.957, 13318.451, 0.22441088];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_245""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_245"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_245"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10801.798, 13321.196, 0.090306766];
	_vehicle_002 = _this;
	_this setDir -89.396004;
	_this setPos [10801.798, 13321.196, 0.090306766];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_245"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 246
_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10843.883, 13322.62, 0.30555242];
	_vehicle_003 = _this;
	_this setDir -58.068153;
	_this setPos [10843.883, 13322.62, 0.30555242];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_246""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_246"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_246"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10846.654, 13324.711, 3.8146973e-005];
	_vehicle_004 = _this;
	_this setDir -58.14782;
	_this setPos [10846.654, 13324.711, 3.8146973e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_246"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 247
_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10901.836, 13426.177, 1.1406714];
	_vehicle_005 = _this;
	_this setDir -66.14373;
	_this setPos [10901.836, 13426.177, 1.1406714];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_247""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_247"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_247"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10899.584, 13420.094, -7.6293945e-006];
	_vehicle_006 = _this;
	_this setDir 25.463394;
	_this setPos [10899.584, 13420.094, -7.6293945e-006];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_247"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 248
_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10918.173, 13456.459, 0.31593114];
	_vehicle_007 = _this;
	_this setDir -146.08672;
	_this setPos [10918.173, 13456.459, 0.31593114];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_248""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_248"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_248"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10922.031, 13453.867, 0.0002040863];
	_vehicle_008 = _this;
	_this setDir -57.471149;
	_this setPos [10922.031, 13453.867, 0.0002040863];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_248"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 249
_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10896.826, 13464.03, 0.00011825562];
	_vehicle_009 = _this;
	_this setDir -144.14659;
	_this setPos [10896.826, 13464.03, 0.00011825562];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_249""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_249"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_249"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10901.817, 13468.152, 0.35958689];
	_vehicle_010 = _this;
	_this setDir -147.90889;
	_this setPos [10901.817, 13468.152, 0.35958689];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_249"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 250
_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10870.423, 13515.063, 0.20259275];
	_vehicle_011 = _this;
	_this setDir -90.772713;
	_this setPos [10870.423, 13515.063, 0.20259275];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_250""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_250"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_250"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10876.095, 13509.403, 1.5258789e-005];
	_vehicle_012 = _this;
	_this setDir -0.95514494;
	_this setPos [10876.095, 13509.403, 1.5258789e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_250"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 251
_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10861.766, 13519.522, 0.50621182];
	_vehicle_013 = _this;
	_this setDir -91.008553;
	_this setPos [10861.766, 13519.522, 0.50621182];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_251""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_251"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_251"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10857.5, 13515.832, -0.11263625];
	_vehicle_014 = _this;
	_this setDir 89.802765;
	_this setPos [10857.5, 13515.832, -0.11263625];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_251"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 252
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10798.532, 13533.474, 0.06769412];
	_vehicle_015 = _this;
	_this setDir -40.77589;
	_this setPos [10798.532, 13533.474, 0.06769412];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_252""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_252"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_252"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10805.966, 13533.408, 0.00089748949];
	_vehicle_016 = _this;
	_this setDir 228.8783;
	_this setPos [10805.966, 13533.408, 0.00089748949];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_252"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 253
_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10789.163, 13482.447, 2.1097534];
	_vehicle_017 = _this;
	_this setDir -15.117911;
	_this setPos [10789.163, 13482.447, 2.1097534];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_253""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_253"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_253"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10788.381, 13488.195, 2.2759774];
	_vehicle_018 = _this;
	_this setDir 254.93275;
	_this setPos [10788.381, 13488.195, 2.2759774];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_253"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 254
_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10790.793, 13471.138, 0.51414096];
	_vehicle_019 = _this;
	_this setDir -13.95393;
	_this setPos [10790.793, 13471.138, 0.51414096];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_254""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_254"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_254"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10789.231, 13466.409, 3.8146973e-005];
	_vehicle_020 = _this;
	_this setDir 344.99359;
	_this setPos [10789.231, 13466.409, 3.8146973e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_254"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 255
_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10810.035, 13460.078, 0.15692875];
	_vehicle_021 = _this;
	_this setDir 15.789555;
	_this setPos [10810.035, 13460.078, 0.15692875];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_255""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_255"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_255"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10811.279, 13454.212, 6.8664551e-005];
	_vehicle_022 = _this;
	_this setDir 374.29431;
	_this setPos [10811.279, 13454.212, 6.8664551e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_255"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 256
_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10829.471, 13439.678, 0.20917803];
	_vehicle_023 = _this;
	_this setDir 25.080837;
	_this setPos [10829.471, 13439.678, 0.20917803];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_256""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_256"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_256"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10829.798, 13434.384, 0.039022576];
	_vehicle_024 = _this;
	_this setDir 384.27271;
	_this setPos [10829.798, 13434.384, 0.039022576];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_256"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 257
_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10959.095, 13429.341, 0.81376433];
	_vehicle_025 = _this;
	_this setDir 25.080837;
	_this setPos [10959.095, 13429.341, 0.81376433];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_257""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_257"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_257"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10953.549, 13430.878, 0.01962682];
	_vehicle_026 = _this;
	_this setDir 474.05984;
	_this setPos [10953.549, 13430.878, 0.01962682];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_257"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 258
_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11098.229, 13357.408, 0.7684406];
	_vehicle_027 = _this;
	_this setDir 22.616098;
	_this setPos [11098.229, 13357.408, 0.7684406];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_258""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_258"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_258"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11092.087, 13357.413, 0.453493];
	_vehicle_028 = _this;
	_this setDir 471.83698;
	_this setPos [11092.087, 13357.413, 0.453493];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_258"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 259
_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11061.775, 13411.817, 0.45069385];
	_vehicle_029 = _this;
	_this setDir 41.856026;
	_this setPos [11061.775, 13411.817, 0.45069385];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_259""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_259"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_259"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11065.608, 13406.232, 0.58502138];
	_vehicle_030 = _this;
	_this setDir 310.85052;
	_this setPos [11065.608, 13406.232, 0.58502138];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_259"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 260
_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11040.509, 13429.157, 0.18133837];
	_vehicle_031 = _this;
	_this setDir -42.371723;
	_this setPos [11040.509, 13429.157, 0.18133837];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_260""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_260"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_260"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11045.244, 13430.752, -3.6239624e-005];
	_vehicle_032 = _this;
	_this setDir 226.90428;
	_this setPos [11045.244, 13430.752, -3.6239624e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_260"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 261
_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11013.393, 13475.296, 0.58994663];
	_vehicle_033 = _this;
	_this setDir -16.741205;
	_this setPos [11013.393, 13475.296, 0.58994663];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_261""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_261"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_261"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11013.562, 13468.716, 0.46755084];
	_vehicle_034 = _this;
	_this setDir 341.32394;
	_this setPos [11013.562, 13468.716, 0.46755084];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_261"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 262
_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11037.784, 13474.849, 0.57867742];
	_vehicle_035 = _this;
	_this setDir -18.850554;
	_this setPos [11037.784, 13474.849, 0.57867742];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_262""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_262"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_262"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11033.341, 13473.259, 0.094227292];
	_vehicle_036 = _this;
	_this setDir 431.14206;
	_this setPos [11033.341, 13473.259, 0.094227292];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_262"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 263
_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11054.279, 13478.721, 0.33179328];
	_vehicle_037 = _this;
	_this setDir -18.469156;
	_this setPos [11054.279, 13478.721, 0.33179328];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_263""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_263"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_263"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11049.285, 13485.8, 0.18259262];
	_vehicle_038 = _this;
	_this setDir 520.85156;
	_this setPos [11049.285, 13485.8, 0.18259262];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_263"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 264
_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11156.248, 13500.958, 0.94116706];
	_vehicle_039 = _this;
	_this setDir -48.176983;
	_this setPos [11156.248, 13500.958, 0.94116706];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_264""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_264"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_264"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11152.752, 13495.447, 1.9073486e-006];
	_vehicle_040 = _this;
	_this setDir 401.6008;
	_this setPos [11152.752, 13495.447, 1.9073486e-006];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_264"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 265
_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11121.237, 13543.14, 0.57732236];
	_vehicle_041 = _this;
	_this setDir -38.455177;
	_this setPos [11121.237, 13543.14, 0.57732236];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_265""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_265"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_265"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11127.181, 13543.255, 0.00013160706];
	_vehicle_042 = _this;
	_this setDir 319.75668;
	_this setPos [11127.181, 13543.255, 0.00013160706];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_265"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 266
_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11028.905, 13557.19, 0.14295118];
	_vehicle_043 = _this;
	_this setDir -46.195969;
	_this setPos [11028.905, 13557.19, 0.14295118];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_266""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_266"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_266"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11035.53, 13554.516, 0.40315029];
	_vehicle_044 = _this;
	_this setDir 313.00839;
	_this setPos [11035.53, 13554.516, 0.40315029];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_266"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 267
_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10987.828, 13372.215, 0.73542851];
	_vehicle_045 = _this;
	_this setDir -58.872955;
	_this setPos [10987.828, 13372.215, 0.73542851];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_267""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_267"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_267"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10983.546, 13377.322, 0.38332656];
	_vehicle_046 = _this;
	_this setDir 479.47104;
	_this setPos [10983.546, 13377.322, 0.38332656];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_267"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 268
_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10940.544, 13311.651, 0.79278499];
	_vehicle_047 = _this;
	_this setDir -51.499016;
	_this setPos [10940.544, 13311.651, 0.79278499];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_268""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_268"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_268"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10944.269, 13314.607, -3.8146973e-006];
	_vehicle_048 = _this;
	_this setDir 578.69525;
	_this setPos [10944.269, 13314.607, -3.8146973e-006];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_268"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 269
_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10999.507, 13328.663, 0.2022845];
	_vehicle_049 = _this;
	_this setDir -33.888893;
	_this setPos [10999.507, 13328.663, 0.2022845];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_269""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_269"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_269"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10998.91, 13318.495, -7.4386597e-005];
	_vehicle_050 = _this;
	_this setDir 414.90158;
	_this setPos [10998.91, 13318.495, -7.4386597e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_269"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 270
_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [10965.383, 13255.168, 0.91910577];
	_vehicle_051 = _this;
	_this setDir -59.572014;
	_this setPos [10965.383, 13255.168, 0.91910577];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_270""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_270"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_270"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [10969.082, 13255.826, -0.24683964];
	_vehicle_052 = _this;
	_this setDir 298.37061;
	_this setPos [10969.082, 13255.826, -0.24683964];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_270"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 271
_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11060.933, 13304.771, 0.70937616];
	_vehicle_053 = _this;
	_this setDir -147.58321;
	_this setPos [11060.933, 13304.771, 0.70937616];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_271""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_271"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_271"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11061.654, 13304.519, 7.6293945e-005];
	_vehicle_054 = _this;
	_this setDir 300.56717;
	_this setPos [11061.654, 13304.519, 7.6293945e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_271"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;