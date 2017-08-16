/*
	File: housing-athira.sqf
	Author: KOMA
	Edited: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:48 | Housing Athira
*/

_initCodes =[];

//Haus 54
_vehicle_000 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13950.983, 18710.588];
	_vehicle_000 = _this;
	_this setDir 393.56;
	_this setPos [13950.983, 18710.588];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_54"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false; _this enableSimulation false;  };

_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [13954.2, 18712.5, 0.37192601];
	_vehicle_001 = _this;
	_this setVehicleVarName "house_54";
	house_54 = _this;
	_this setDir 389.024;
	_this setPos [13954.2, 18712.5, 0.37192601];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_54""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_54"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_54"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 55
_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13938,18809.4,0];
	_vehicle_002 = _this;
	_this setDir -506.012;
	_this setPos [13938,18809.4,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_55""]; "];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_khaki_F" createvehiclelocal [13933.6,18804.9,0];
	_vehicle_003 = _this;
	_this setVehicleVarName "house_55";
	house_55 = _this;
	_this setDir -229.904;
	_this setPos [13933.6,18804.9,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_55""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_55"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_55"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 56
_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13941.1, 18738.301, 0.4024958];
	_vehicle_004 = _this;
	_this setDir -382.625;
	_this setPos [13941.1, 18738.301, 0.4024958];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_56""]; "];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13944.789, 18745.828, 0.11464691];
	_vehicle_005 = _this;
	_this setVehicleVarName "house_56";
	house_56 = _this;
	_this setDir -18.6346;
	_this setPos [13944.789, 18745.828, 0.11464691];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_56""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_56"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_56"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 57
_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13995.188, 18772.311, 0.20164296];
	_vehicle_006 = _this;
	_this setDir -239.50739;
	_this setPos [13995.188, 18772.311, 0.20164296];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_57"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [13999.952, 18767.846, 0.45124608];
	_vehicle_007 = _this;
	_this setVehicleVarName "house_57";
	house_57 = _this;
	_this setDir 300.698;
	_this setPos [13999.952, 18767.846, 0.45124608];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_57""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_57"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_57"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 58
_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14042.3,18810.6,0];
	_vehicle_008 = _this;
	_this setDir -330.359;
	_this setPos [14042.3,18810.6,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_58"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [14045.46, 18819.637, 0.17990589];
	_vehicle_009 = _this;
	_this setVehicleVarName "house_58";
	house_58 = _this;
	_this setDir 210.61336;
	_this setPos [14045.46, 18819.637, 0.17990589];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_58""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_58"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_58"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 59
_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14108.258, 18850.023,0];
	_vehicle_010 = _this;
	_this setDir 303.95251;
	_this setPos [14108.258, 18850.023,0];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_59"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [14099.5,18848.2,0];
	_vehicle_011 = _this;
	_this setVehicleVarName "house_59";
	house_59 = _this;
	_this setDir 119.262;
	_this setPos [14099.5,18848.2,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_59""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_59"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_59"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 60
_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13969.508, 18783.939, 0.022651795];
	_vehicle_012 = _this;
	_this setDir -143.13243;
	_this setPos [13969.508, 18783.939, 0.022651795];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_60"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [13968.9, 18778.699, 0.089736708];
	_vehicle_013 = _this;
	_this setVehicleVarName "house_60";
	house_60 = _this;
	_this setDir 35.7147;
	_this setPos [13968.9, 18778.699, 0.089736708];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_60""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_60"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_60"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 61
_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13918.492, 18737.658];
	_vehicle_014 = _this;
	_this setDir -116.56;
	_this setPos [13918.492, 18737.658];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_61"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [13920.4, 18728.699, 0.24708098];
	_vehicle_015 = _this;
	_this setVehicleVarName "house_61";
	house_61 = _this;
	_this setDir 61.904;
	_this setPos [13920.4, 18728.699, 0.24708098];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_61""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_61"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_61"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;  
};

//Haus 62
_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14087.746, 18687.291];
	_vehicle_016 = _this;
	_this setDir 135.77;
	_this setPos [14087.746, 18687.291];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_62"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;  
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [14086.688, 18679.314, 0.1175501];
	_vehicle_017 = _this;
	_this setVehicleVarName "house_62";
	house_62 = _this;
	_this setDir -221.502;
	_this setPos [14086.688, 18679.314, 0.1175501];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_62""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_62"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_62"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false; 
};

//Haus 63
_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14107.758, 18705.227];
	_vehicle_018 = _this;
	_this setDir 135.04584;
	_this setPos [14107.758, 18705.227];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_63"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [14101.774, 18698.025, 0.89];
	_vehicle_019 = _this;
	_this setVehicleVarName "house_63";
	house_63 = _this;
	_this setDir 228.20058;
	_this setPos [14101.774, 18698.025, 0.89];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_63""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_63"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_63"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;  
};

//Haus 64
_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14086.371, 18774.764, 0.068456911];
	_vehicle_020 = _this;
	_this setDir -320.44391;
	_this setPos [14086.371, 18774.764, 0.068456911];
	_initCodes pushBack [_this,"this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_64"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_F" createvehiclelocal [14094.11, 18774.949, -0.0084945653];
	_vehicle_021 = _this;
	_this setVehicleVarName "house_64";
	house_64 = _this;
	_this setDir -142.03238;
	_this setPos [14094.11, 18774.949, -0.0084945653];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_64""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Haus-Inventar"", EMonkeys_fnc_houseInventory, ""house_64"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_64"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 65
_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14011.7,18489,0];
	_vehicle_022 = _this;
	_this setDir -677.76;
	_this setPos [14011.7,18489,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_65"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false; _this enableSimulation false;  };

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14021,18487.7,0];
	_vehicle_023 = _this;
	_this setVehicleVarName "house_65";
	house_65 = _this;
	_this setDir 44.244;
	_this setPos [14021,18487.7,0];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_65""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_65"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_65"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 66
_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14020.5,18561,0];
	_vehicle_024 = _this;
	_this setDir -511.885;
	_this setPos [14020.5,18561,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_66"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false; _this enableSimulation false;  };

_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14023.818, 18553.904];
	_vehicle_025 = _this;
	_this setVehicleVarName "house_66";
	house_66 = _this;
	_this setDir 117.34908;
	_this setPos [14023.818, 18553.904];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_66""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_66"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_66"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 67
_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13981.2, 18580.9, 0.035488326];
	_vehicle_026 = _this;
	_this setDir 208;
	_this setPos [13981.2, 18580.9, 0.035488326];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_67"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13985.248, 18577.793, -9.1523398e-005];
	_vehicle_027 = _this;
	_this setVehicleVarName "house_67";
	house_67 = _this;
	_this setDir 118.692;
	_this setPos [13985.248, 18577.793, -9.1523398e-005];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_67""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar"", EMonkeys_fnc_houseInventory, ""house_67"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_67"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 68
_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14063.5, 18561.9, 0.47269061];
	_vehicle_028 = _this;
	_this setDir -688.336;
	_this setPos [14063.5, 18561.9, 0.47269061];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_68"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false; _this enableSimulation false;  };

_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14066.097, 18570.533, -0.044198219];
	_vehicle_029 = _this;
	_this setVehicleVarName "house_68";
	house_68 = _this;
	_this setDir 38.8664;
	_this setPos [14066.097, 18570.533, -0.044198219];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_68""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_68"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_68"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 69
_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14078.1,18551.4,0];
	_vehicle_030 = _this;
	_this setDir -679.803;
	_this setPos [14078.1,18551.4,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_69"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14085.1, 18551.301, 0.60930431];
	_vehicle_031 = _this;
	_this setVehicleVarName "house_69";
	house_69 = _this;
	_this setDir 31.2247;
	_this setPos [14085.1, 18551.301, 0.60930431];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_69""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_69"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_69"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 70
_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14091.821, 18536.455];
	_vehicle_032 = _this;
	_this setDir -679.803;
	_this setPos [14091.821, 18536.455];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_70"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
_this allowDamage false; _this enableSimulation false;  };

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14091.892, 18544.184, 0.11342413];
	_vehicle_033 = _this;
	_this setVehicleVarName "house_70";
	house_70 = _this;
	_this setDir 38.4878;
	_this setPos [14091.892, 18544.184, 0.11342413];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_70""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_70"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_70"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};
//Haus 71
_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14016.9,18634.6,0];
	_vehicle_034 = _this;
	_this setDir 200;
	_this setPos [14016.9,18634.6,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_71"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14011.1, 18624.5, 0.91177028];
	_vehicle_035 = _this;
	_this setVehicleVarName "house_71";
	house_71 = _this;
	_this setDir 20.4163;
	_this setPos [14011.1, 18624.5, 0.91177028];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_71""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_71"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_71"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 72
_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14007.5,18637.9,0];
	_vehicle_036 = _this;
	_this setDir 200;
	_this setPos [14007.5,18637.9,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_72"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14001.9, 18627.6, 1.2008265];
	_vehicle_037 = _this;
	_this setVehicleVarName "house_72";
	house_72 = _this;
	_this setDir 21.8343;
	_this setPos [14001.9, 18627.6, 1.2008265];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_72""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_72"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_72"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
_this allowDamage false; _this enableSimulation false;  };

//Haus 73
_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13950.2,18613.1,0];
	_vehicle_038 = _this;
	_this setDir -686.806;
	_this setPos [13950.2,18613.1,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_73"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13955.693, 18616.945, 0.2711179];
	_vehicle_039 = _this;
	_this setVehicleVarName "house_73";
	house_73 = _this;
	_this setDir 30.088;
	_this setPos [13955.693, 18616.945, 0.2711179];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_73""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_73"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_73"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 74
_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13934,18617.7,0];
	_vehicle_040 = _this;
	_this setDir -691.273;
	_this setPos [13934,18617.7,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_74"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13952.596, 18632.631, 0.62729251];
	_vehicle_041 = _this;
	_this setVehicleVarName "house_74";
	house_74 = _this;
	_this setDir 29.847;
	_this setPos [13952.596, 18632.631, 0.62729251];
	_initCodes pushBack [_this,"this allowDamage false;this addAction [""Lager"",{[""house_74""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_74"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_74"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 75
_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14010.5,18652.5,0];
	_vehicle_042 = _this;
	_this setDir -701.611;
	_this setPos [14010.5,18652.5,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_75"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};	

_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14006.8, 18655.199, 1.0944147];
	_vehicle_043 = _this;
	_this setVehicleVarName "house_75";
	house_75 = _this;
	_this setDir 19.2493;
	_this setPos [14006.8, 18655.199, 1.0944147];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_75""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_75"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_75"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 76
_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [13996.421, 18664.191, 0.24354942];
	_vehicle_044 = _this;
	_this setDir -693.24146;
	_this setPos [13996.421, 18664.191, 0.24354942];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_76"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [13993.3, 18669.9, 0.30199248];
	_vehicle_045 = _this;
	_this setVehicleVarName "house_76";
	house_76 = _this;
	_this setDir 26.2357;
	_this setPos [13993.3, 18669.9, 0.30199248];
	_initCodes pushBack [_this,"this addAction [""Lager"",{[""house_76""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_76"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_76"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Haus 77
_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createvehiclelocal [14012.4,18677.9,0];
	_vehicle_046 = _this;
	_this setDir -689.923;
	_this setPos [14012.4,18677.9,0];
	_initCodes pushBack [_this," this setObjectTexture [0,""core\textures\map\house.paa""]; this addAction [""Haus ..."", EMonkeys_fnc_houseMenu, ""house_77"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_ShelvesWooden_blue_F" createvehiclelocal [14010.6, 18685.801, 0.47468278];
	_vehicle_047 = _this;
	_this setVehicleVarName "house_77";
	house_77 = _this;
	_this setDir 28.7995;
	_this setPos [14010.6, 18685.801, 0.47468278];
	_initCodes pushBack [_this,"this allowDamage false;this addAction [""Lager"",{[""house_77""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar "", EMonkeys_fnc_houseInventory, ""house_77"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""house_77"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;