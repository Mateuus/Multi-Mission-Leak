/*
	File: fn_towVehicle.sqf
	Author: Barney
	
	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	
	Description:
	Tow a Vehicle to the Truck
	
	
*/

private ["_vehicletowed","_vehicletowing","_action"];
_vehicletowing =  cursortarget;
if(!(_vehicletowing iskindof "B_Truck_01_mover_F")) exitwith {};
_vehicletowed = attachedObjects _vehicletowing;
if (count(_vehicletowed) == 0) exitwith {};
_vehicletowed = _vehicletowed - [Objnull];
_vehicletowed = _vehicletowed select 0;


switch(true) do{
case (_vehicletowed iskindof("I_MRAP_03_F")):           {_vehicletowed attachto [_vehicletowing,[0,-6.4,0.55]];sleep 0.01;_vehicletowed setVectorUp [0,-0.23,0.6];    sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-7.4,0.55]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];              sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.4,0.55]];               sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-7.4,0]]; detach _vehicletowed;     _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("O_MRAP_02_F")):  	        {_vehicletowed attachto [_vehicletowing,[0,-4.8,1.55]];sleep 0.01;_vehicletowed setVectorUp [0,-0.23,0.73];   sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-5.8,1.55]];sleep 0.01;_vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-6.8,1.55]];               sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-6.8,0.6]]; detach _vehicletowed;     _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("O_MRAP_02_hmg_F")):       {_vehicletowed attachto [_vehicletowing,[0,-4.8,1.85]];sleep 0.01;_vehicletowed setVectorUp [0,-0.23,0.73];   sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-5.8,1.85]];sleep 0.01;_vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-6.8,1.85]];               sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-6.8,0.99]];detach _vehicletowed;_vehicletowing setvariable["tow_status",""];};

case (_vehicletowed iskindof("B_MRAP_01_F")):           {_vehicletowed attachto [_vehicletowing,[0,-4.7,1.3]];sleep 0.01; _vehicletowed setVectorUp [0,-0.3,1];       sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-5.7,1.3]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-6.7,1.3]];                sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-6.7,0.3]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("B_MRAP_01_hmg_F")):  	    {_vehicletowed attachto [_vehicletowing,[0,-4.7,1.9]];sleep 0.01; _vehicletowed setVectorUp [0,-0.3,1];       sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-5.7,1.9]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-6.7,1.9]];                sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-6.7,0.9]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};

case (_vehicletowed iskindof("C_Offroad_01_F")):        {_vehicletowed attachto [_vehicletowing,[0,-5.7,0.4]];sleep 0.01; _vehicletowed setVectorUp [0,-0.35,1];      sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-6.7,0.4]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.7,0.4]];                sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-7.7,-0.2]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("I_G_Offroad_01_F")):      {_vehicletowed attachto [_vehicletowing,[0,-5.7,0.5]];sleep 0.01; _vehicletowed setVectorUp [0,-0.4,1];       sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-6.7,0.5]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.7,0.5]];                sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-7.7,-0.2]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("B_G_Offroad_01_armed_F")):{_vehicletowed attachto [_vehicletowing,[0,-5.9,0.95]];sleep 0.01; _vehicletowed setVectorUp [0,-0.32,1];     sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-6.9,0.95]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];              sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.9,0.95]];               sleep 0.2;            _vehicletowed attachto [_vehicletowing,[0,-7.9,0.3]];detach _vehicletowed;    _vehicletowing setvariable["tow_status",""];}; 

case (_vehicletowed iskindof("C_SUV_01_F")):            {_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];detach _vehicletowed;};
case (_vehicletowed iskindof("C_Hatchback_01_sport_F")):{_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];detach _vehicletowed;};
case (_vehicletowed iskindof("C_Hatchback_01_F")):      {_vehicletowed attachto [_vehicletowing,[0,-6.5,-0.25]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];detach _vehicletowed;};

case (_vehicletowed iskindof("B_Quadbike_01_F")):       {_vehicletowed attachto [_vehicletowing,[00,-3.5,0.90]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];       sleep 0.2;              _vehicletowed attachto [_vehicletowing,[00,-4.5,0.90]];                                                           sleep 0.2;       _vehicletowed attachto [_vehicletowing,[00,-5.5,0.90]];              sleep 0.2;             _vehicletowed attachto [_vehicletowing,[00,-6.5,0.90]];                    sleep 0.2;       _vehicletowed attachto [_vehicletowing,[00,-6.5,-0.3]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};

case (_vehicletowed iskindof("C_Van_01_transport_F")):  {_vehicletowed attachto [_vehicletowing,[0,-5.3,0.720]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.3];  sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-6.3,0.72]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];              sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.3,0.72]];               sleep 0.2;             _vehicletowed attachto [_vehicletowing,[0,-7.3,0]];detach _vehicletowed;    _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("C_Van_01_box_F")):        {_vehicletowed attachto [_vehicletowing,[0,-5.3,0.720]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.3];  sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-6.3,0.720]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];             sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.3,0.72]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};

case (_vehicletowed iskindof("O_Truck_03_transport_F")):{_vehicletowed attachto [_vehicletowing,[0,-5.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.4];  sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-6.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];             sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.9,1.320]];             sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-8.9,1.320]];                     sleep 0.2;     _vehicletowed attachto [_vehicletowing,[0,-8.9,0.520]];detach _vehicletowed;  _vehicletowing setvariable["tow_status",""];}; 
case (_vehicletowed iskindof("O_Truck_03_covered_F")):  {_vehicletowed attachto [_vehicletowing,[0,-5.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.4];  sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-6.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];             sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.9,1.320]];             sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-8.9,1.320]];                     sleep 0.2;     _vehicletowed attachto [_vehicletowing,[0,-8.9,0.520]];detach _vehicletowed; _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("O_Truck_03_device_F")):   {_vehicletowed attachto [_vehicletowing,[0,-5.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.4];  sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-6.9,1.320]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];             sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-7.9,1.320]];             sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-8.9,1.320]];                     sleep 0.2;     _vehicletowed attachto [_vehicletowing,[0,-8.9,0.520]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};

case (_vehicletowed iskindof("I_Truck_02_transport_F")):{_vehicletowed attachto [_vehicletowing,[0,-6.5,1.0]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.4];    sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-7.5,1.0]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-8.5,1.0]];               sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-8.5,0.5]];detach _vehicletowed;  _vehicletowing setvariable["tow_status",""];};
case (_vehicletowed iskindof("I_Truck_02_covered_F")):  {_vehicletowed attachto [_vehicletowing,[0,-6.5,1.0]];sleep 0.01; _vehicletowed setVectorUp [0,-0.1,0.4];    sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-7.5,1.0]];sleep 0.01; _vehicletowed setVectorUp [0,0,1];               sleep 0.2;       _vehicletowed attachto [_vehicletowing,[0,-8.5,1.0]];               sleep 0.2;              _vehicletowed attachto [_vehicletowing,[0,-8.5,0.5]];detach _vehicletowed;   _vehicletowing setvariable["tow_status",""];};
default {_vehicletowed attachto [_vehicletowing,[0,-8.7,1]];_vehicletowed setVectorUp [0,0,1]; detach _vehicletowed;_vehicletowing setvariable["tow_status",""];};
};









