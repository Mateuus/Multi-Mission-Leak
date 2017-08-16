/*
	File: housing-alikampos.sqf
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:20 | Housing Alikampos
*/

_initCodes =[];

//Haus 272
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11112.28, 14627.106, 0.34316635];
	_vehicle_001 = _this;
	_this setDir -178.36864;
	_this setPos [11112.28, 14627.106, 0.34316635];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_272""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_272"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_272"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11103.764, 14631.773, 0.00023269653];
	_vehicle_002 = _this;
	_this setDir 178.89505;
	_this setPos [11103.764, 14631.773, 0.00023269653];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_272"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 273
_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11213.726, 14609.912, 0.49694544];
	_vehicle_003 = _this;
	_this setDir -120.11915;
	_this setPos [11213.726, 14609.912, 0.49694544];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_273""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_273"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_273"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11211.348, 14602.597, -0.20102294];
	_vehicle_004 = _this;
	_this setDir 57.445942;
	_this setPos [11211.348, 14602.597, -0.20102294];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_273"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 274
_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11184.766, 14559.841, 1.0267128];
	_vehicle_005 = _this;
	_this setDir -38.27066;
	_this setPos [11184.766, 14559.841, 1.0267128];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_274""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_274"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_274"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11177.726, 14559.214, 0.31531632];
	_vehicle_006 = _this;
	_this setDir 140.50136;
	_this setPos [11177.726, 14559.214, 0.31531632];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_274"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 275
_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11164.568, 14543.467, 0.54114527];
	_vehicle_007 = _this;
	_this setDir -126.43407;
	_this setPos [11164.568, 14543.467, 0.54114527];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_275""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_275"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_275"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11160.611, 14547.66, -0.00017929077];
	_vehicle_008 = _this;
	_this setDir 140.50136;
	_this setPos [11160.611, 14547.66, -0.00017929077];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_275"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 276
_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11154.412, 14532.276, 1.0436745];
	_vehicle_009 = _this;
	_this setDir -127.94628;
	_this setPos [11154.412, 14532.276, 1.0436745];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_276""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_276"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_276"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11149.323, 14532.284, -0.13524604];
	_vehicle_010 = _this;
	_this setDir 51.768871;
	_this setPos [11149.323, 14532.284, -0.13524604];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_276"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 277
_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11145.439, 14576.05, 0.88076967];
	_vehicle_011 = _this;
	_this setDir -88.591232;
	_this setPos [11145.439, 14576.05, 0.88076967];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_277""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_277"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_277"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11142.745, 14571.526, 1.3209946];
	_vehicle_012 = _this;
	_this setDir -1.4070115;
	_this setPos [11142.745, 14571.526, 1.3209946];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_277"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 278
_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11113.6, 14581.224, 0.31066671];
	_vehicle_013 = _this;
	_this setDir -180.66702;
	_this setPos [11113.6, 14581.224, 0.31066671];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_278""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_278"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_278"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11116.203, 14574.474, 1.2645538];
	_vehicle_014 = _this;
	_this setDir -1.0692452;
	_this setPos [11116.203, 14574.474, 1.2645538];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_278"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 279
_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11104.432, 14580.603, 0.64118338];
	_vehicle_015 = _this;
	_this setDir -180.66702;
	_this setPos [11104.432, 14580.603, 0.64118338];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_279""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_279"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_279"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11110.306, 14577.132, 0.93308026];
	_vehicle_016 = _this;
	_this setDir -0.70472741;
	_this setPos [11110.306, 14577.132, 0.93308026];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_279"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 280
_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11089.463, 14496.803, 1.0328135];
	_vehicle_017 = _this;
	_this setDir -129.36041;
	_this setPos [11089.463, 14496.803, 1.0328135];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_280""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_280"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_280"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11088.27, 14507.282, 4.9591064e-005];
	_vehicle_018 = _this;
	_this setDir -131.56062;
	_this setPos [11088.27, 14507.282, 4.9591064e-005];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_280"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

//Haus 281
_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [11042.373, 14602.06, 1.3607252];
	_vehicle_019 = _this;
	_this setDir -183.96642;
	_this setPos [11042.373, 14602.06, 1.3607252];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_281""] spawn open_house_inventory},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_281"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_281"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [11048.47, 14607.84, -0.19821997];
	_vehicle_020 = _this;
	_this setDir -93.454201;
	_this setPos [11048.47, 14607.84, -0.19821997];
	_initCodes pushBack [_this,"this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_281"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\house.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this SetVectorUp [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;