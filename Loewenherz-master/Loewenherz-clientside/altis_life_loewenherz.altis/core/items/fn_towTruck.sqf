/*
	File: fn_towVehicle.sqf
	Author: Barney
	
	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	
	Description:
	Tow a Vehicle to the Truck
	BABAM
	
*/

private ["_vehicletowed","_vehicletowing","_action"];
if(vehicle player != player) exitWith {hint "?"};
_vehicletowed = cursortarget;
_vehicletowing = nearestObjects [getposatl(player), ["B_Truck_01_mover_F"], 15];
if(count(_vehicletowing) == 0) exitWith {hint "Kein geeignetes Fahreug in der Naehe"};
_vehicletowing = _vehicletowing select 0;
if ((speed(_vehicletowed)>1) or (speed(_vehicletowing)>1)) exitWith {hint "Die Fahrzeuge müssen still stehen fürs Abschleppen"};
if (count(crew (_vehicletowed))>0) exitWith {hint "Das Fahrzeug muss leer sein"};
if(_vehicletowing getvariable "tow_status" == "towing") exitWith {hint "Dieses Fahrzeug wird bereits benutzt"};
if (!local _vehicletowed) then {
    [[_vehicletowed,player],"lhm_fnc_changeOwner",false,false] call lhm_fnc_mp;
};

switch (true) do {

case (_vehicletowed iskindof("I_MRAP_03_F")):           {_vehicletowed attachto [_vehicletowing,[0,-4.4,0.55]];_vehicletowed setVectorUp [0,-0.23,0.6]; sleep 0.5;_vehicletowed setVectorUp [0,-0.23,0.6];  _vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("O_MRAP_02_F")):  	        {_vehicletowed attachto [_vehicletowing,[0,-3.8,1.55]];_vehicletowed setVectorUp [0,-0.23,0.73];sleep 0.5;_vehicletowed setVectorUp [0,-0.23,0.73];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("O_MRAP_02_hmg_F")):       {_vehicletowed attachto [_vehicletowing,[0,-3.8,1.85]];_vehicletowed setVectorUp [0,-0.23,0.73];sleep 0.5;_vehicletowed setVectorUp [0,-0.23,0.73];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("B_MRAP_01_F")):            {_vehicletowed attachto [_vehicletowing,[0,-3.7,1.3]]; _vehicletowed setVectorUp [0,-0.3,1];sleep 0.5;_vehicletowed setVectorUp [0,-0.3,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("B_MRAP_01_hmg_F")):  	    {_vehicletowed attachto [_vehicletowing,[0,-3.7,1.9]]; _vehicletowed setVectorUp [0,-0.3,1];sleep 0.5;_vehicletowed setVectorUp [0,-0.3,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("C_Offroad_01_F")):        {_vehicletowed attachto [_vehicletowing,[0,-4.7,0.4]]; _vehicletowed setVectorUp [0,-0.35,1];sleep 0.5;_vehicletowed setVectorUp [0,-0.35,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("I_G_Offroad_01_F")):      {_vehicletowed attachto [_vehicletowing,[0,-4.6,0.41]]; _vehicletowed setVectorUp [0,-0.3,1];sleep 0.5;_vehicletowed setVectorUp [0,-0.3,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("B_G_Offroad_01_armed_F")):{_vehicletowed attachto [_vehicletowing,[0,-4.9,0.95]]; _vehicletowed setVectorUp [0,-0.32,1];sleep 0.5;_vehicletowed setVectorUp [0,-0.32,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("C_SUV_01_F")):            {_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]]; _vehicletowed setVectorUp [0,0,1];sleep 0.5;_vehicletowed setVectorUp [0,0,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("C_Hatchback_01_sport_F")):{_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]]; _vehicletowed setVectorUp [0,0,1];sleep 0.5;_vehicletowed setVectorUp [0,0,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("C_Hatchback_01_F")):      {_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]]; _vehicletowed setVectorUp [0,0,1];sleep 0.5;_vehicletowed setVectorUp [0,0,1];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("B_Quadbike_01_F")):       {_vehicletowed attachto [_vehicletowing,[00,-2.5,0.90]]; _vehicletowed setVectorUp [0,-0.1,0.99];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.99];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("C_Van_01_transport_F")):  {_vehicletowed attachto [_vehicletowing,[0,-4.3,0.720]]; _vehicletowed setVectorUp [0,-0.1,0.3];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.3];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("C_Van_01_box_F")):        {_vehicletowed attachto [_vehicletowing,[0,-4.3,0.720]]; _vehicletowed setVectorUp [0,-0.1,0.3];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.3];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("O_Truck_03_transport_F")):{_vehicletowed attachto [_vehicletowing,[0,-4.9,1.320]]; _vehicletowed setVectorUp [0,-0.1,0.4];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.4];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("O_Truck_03_covered_F")):  {_vehicletowed attachto [_vehicletowing,[0,-4.9,1.320]]; _vehicletowed setVectorUp [0,-0.1,0.4];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.4];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("O_Truck_03_device_F")):   {_vehicletowed attachto [_vehicletowing,[0,-4.9,1.320]]; _vehicletowed setVectorUp [0,-0.1,0.4];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.4];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};

case (_vehicletowed iskindof("I_Truck_02_transport_F")):{_vehicletowed attachto [_vehicletowing,[0,-5.5,1.0]]; _vehicletowed setVectorUp [0,-0.1,0.4];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.4];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
case (_vehicletowed iskindof("I_Truck_02_covered_F")):  {_vehicletowed attachto [_vehicletowing,[0,-5.5,1.0]]; _vehicletowed setVectorUp [0,-0.1,0.4];sleep 0.5;_vehicletowed setVectorUp [0,-0.1,0.4];_vehicletowing setVariable["tow_status","towing",true];sleep 1; if(_vehicletowing getVariable["tow_status",""] != "towing") then {_vehicletowing setVariable["tow_status","towing",true];};};
default {hint "Du kannst dieses Fahrzeug nicht abschleppen";};
};
sleep 1;
while{damage _vehicletowed < 1 && (attachedTo _vehicletowed) == _vehicletowing && damage _vehicletowing < 1} do {  
sleep 30;

};

_vehicletowing setvariable["tow_status","",true];





