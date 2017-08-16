/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_LicensePlate.sqf

Description:
Custom License plate for each vehicle
*/
RPP_Licenseplate_Create = {
	private ["_plate","_PlateNumbers","_PlateLetters","_plateSelectRandomNumber","_plateSelectRandomLetters","_PlateSetNumber","_PlateLetters"];
	_Plate = _this select 0;
	_player = _this select 1;
	_Maxweight = _this select 2;
	_LicenseArray = [];
	_weight = 0;
	_veh = _Plate;
	_veh lock true;
	_Owners = [];
	_Trunk = [];
	_LPlate = [];
	_trunkopen = false;
	_RandomN = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
	_randomnumbers1 = _RandomN call BIS_FNC_Selectrandom;
	_randomnumbers2 = _RandomN call BIS_FNC_Selectrandom;
	_randomnumbers3 = _RandomN call BIS_FNC_Selectrandom;
	_ID = call compile format ["%1%2%3",_randomnumbers1,_randomnumbers2,_randomnumbers3];
	_class = typeOf _veh;


	_owners = _owners + [getPlayerUID _player]; 

	_veh setVariable ["RPP_Vehicle_Class",_class,true];
	_veh setVariable ["RPP_Vehicle_ID",_ID,true];
	_veh setVariable ["RPP_Vehicles_Buyer",getPlayerUID player,true];
	_veh setVariable ["RPP_Vehicle_isVeh",true,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_Trunk,true];
	_veh setVariable ["RPP_Vehicle_Owners",_owners,true];
	_veh setVariable ["RPP_Vehicle_TrunkOpen",_trunkopen,true];
	_veh setVariable ["RPP_Vehicle_MaxWeight",_Maxweight,true];
	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Licenseplate",_LPlate,true];
	_veh setVariable ["RPP_Siren_On",false,true];






	_PlateNumbers = ["2","3","4","5","6","7","8","9"];
	_PlateLetters = ["a","b","c","d","e","f","g","h","j","k","m","n","o","p","q","r","s","t","u","w","x","u","z"];

	_plateSelectRandomNumber = _PlateNumbers call bis_fnc_selectrandom;
	_plateSelectRandomLetters = _PlateLetters call bis_fnc_selectrandom;

	_PlateSetLetter = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomLetters];

	_plate setObjectTexture [19,_PlateSetLetter];

	_LicenseArray = _LicenseArray + [_plateSelectRandomLetters];

	_plateSelectRandomLetters = _PlateLetters call bis_fnc_selectrandom;

	_PlateSetNumber = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomNumber];
	_PlateSetLetter = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomLetters];

	_plate setObjectTexture [20,_PlateSetLetter];

	_LicenseArray = _LicenseArray + [_plateSelectRandomLetters];

	_plateSelectRandomLetters = _PlateLetters call bis_fnc_selectrandom;

	_PlateSetLetter = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomLetters];

	_plate setObjectTexture [21,_PlateSetNumber];

	_LicenseArray = _LicenseArray + [_plateSelectRandomNumber];
	_plate setObjectTexture [22,_PlateSetLetter];

	_LicenseArray = _LicenseArray + [_plateSelectRandomLetters];

	_plateSelectRandomLetters = _PlateLetters call bis_fnc_selectrandom;
	_PlateSetLetter = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomLetters];

	_plateSelectRandomNumber = _PlateNumbers call bis_fnc_selectrandom;
	_PlateSetNumber = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomNumber];

	_plate setObjectTexture [23,_PlateSetLetter];

	_LicenseArray = _LicenseArray + [_plateSelectRandomLetters];

	_plateSelectRandomLetters = _PlateLetters call bis_fnc_selectrandom;
	_PlateSetLetter = format ["\RPP_Licenseplate\Plate\%1",_plateSelectRandomLetters];

	_plate setObjectTexture [24,_PlateSetLetter];

	_LicenseArray = _LicenseArray + [_plateSelectRandomLetters];

	_plate setObjectTexture [25,_PlateSetNumber];

	_LicenseArray = _LicenseArray + [_plateSelectRandomNumber];

	_Plate setVariable ["RPP_Vehicle_Licenseplate",_LicenseArray,true];




	_Format_to_String = format ["%1%2%3%4%5%6%7",_LicenseArray select 0, _LicenseArray select 1, _LicenseArray select 2, _LicenseArray select 3, _LicenseArray select 4,_LicenseArray select 5, _LicenseArray select 6];
	_Plate setVariable ["RPP_LicensePlate_String",_Format_to_String,true];



	[[_LicenseArray,_Plate,player], "RPP_Licenseplate_Create_Global", true,true] call BIS_FNC_MP;

	[getPlayerUID _player,_plate,_player] remoteExec ["RPP_DB_insertVehicle",2];
};
publicVariable "RPP_Licenseplate_Create";

RPP_Licenseplate_ReturnValue = {
	RPP_LicensePlateCreated = true;
	_Plate = _This select 0;
};
publicVariable "RPP_Licenseplate_ReturnValue";

RPP_Licenseplate_Create_Global = {
	private ["_Plate","_LicPlateArray","_1","_2","_3","_4","_5","_6","_PlateSet"];
	_LicPlateArray = _this select 0;
	_Plate = _this select 1;
	_player = _this select 2;

	_1 = _LicPlateArray select 0;
	_2 = _LicPlateArray select 1;
	_3 = _LicPlateArray select 2;
	_4 = _LicPlateArray select 3;
	_5 = _LicPlateArray select 4;
	_6 = _LicPlateArray select 5;
	_7 = _LicPlateArray select 6;

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_1];
	_Plate setObjectTexture [19,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_2];
	_Plate setObjectTexture [20,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_3];
	_Plate setObjectTexture [21,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_4];
	_Plate setObjectTexture [22,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_5];
	_Plate setObjectTexture [23,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_6];
	_Plate setObjectTexture [24,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_7];
	_Plate setObjectTexture [25,_PlateSet];

	[[_Plate], "RPP_Licenseplate_ReturnValue", _player] call BIS_FNC_MP;
};
publicVariable "RPP_Licenseplate_Create_Global";

RPP_Licenseplate_RePlace = {
	private ["_Plate","_PlateArray","_1","_2","_3","_4","_5","_6","_PlateSet"];
	_Plate = _This select 0;
	_PlateArray = _this select 1;
	
	_1 = _PlateArray select 0;
	_2 = _PlateArray select 1;
	_3 = _PlateArray select 2;
	_4 = _PlateArray select 3;
	_5 = _PlateArray select 4;
	_6 = _PlateArray select 5;
	_7 = _PlateArray select 6;

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_1];
	_Plate setObjectTexture [19,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_2];
	_Plate setObjectTexture [20,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_3];
	_Plate setObjectTexture [21,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_4];
	_Plate setObjectTexture [22,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_5];
	_Plate setObjectTexture [23,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_6];
	_Plate setObjectTexture [24,_PlateSet];

	_PlateSet = format ["\RPP_Licenseplate\Plate\%1",_7];
	_Plate setObjectTexture [25,_PlateSet];
};
publicVariable "RPP_Licenseplate_RePlace";