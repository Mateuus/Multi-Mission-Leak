/*
	File: fn_npcInit.sqf
	Author: MarkusSR1984
	
	Description:
	Erstellt Objecte auf der Karte lokal beim Spieler
	["ClassName",[0,0,0],13.759,"_this allowdamage false;"] call DWEV_fnc_objectInit;
*/

_varCount = count _this;
_classname = _this select 0; 			// STRING Klassenname
_position = _this select 1;		// ARRAY Koordinaten
_direction = _this select 2;		// INT Richtung

// Defaultwerte falls was schiefläuft beim laden
_pitch = 0;					// INT Ausrichtung 1
_bank = 0;					// INT Ausrichtung 2
_initCode = "";				// CODE als STRING Initialisierungscode (Wird nur in der laufenden mission geladen aber nicht im editor)
	
switch (_varCount) do
{
	case 4:		// Division Wolf System ohne Pitch / Bank
	{
		_pitch = 0;					// INT Ausrichtung 1
		_bank = 0;					// INT Ausrichtung 2
		//_initCode = str (_this select 3);	// CODE 
		_initCode = (_this select 3);	// CODE 
					
	};
	case 6:
	{
		_pitch = _this select 3;			// INT Ausrichtung 1
		_bank = _this select 4;			// INT Ausrichtung 2
		_followterrain = _this select 5;	// BOOL Folge dem Untergrund
		_initCode = ""
	};
	case 7:
	{
		_pitch = _this select 3;			// INT Ausrichtung 1
		_bank = _this select 4;			// INT Ausrichtung 2
		_followterrain = _this select 5;	// BOOL Folge dem Untergrund
		//_initCode = str (_this select 6);	// CODE 
		_initCode = (_this select 6);	// CODE 
	};
};



_object = _classname createVehicleLocal [0,0,9999];	
//_object call compile _initCode;


_object call compile format["%1",_initCode];
_object setDamage 0;
_object setPosASL _position;
_object setDir _direction;
_object setVariable ["mapplaced",true];

_aroundX = _pitch;
_aroundY = _bank;
_aroundZ = (360 - (_direction) - 360); 
_dirX = 0; 
_dirY = 1; 
_dirZ = 0; 
_upX = 0; 
_upY = 0; 
_upZ = 1; 

if (_aroundX != 0) then 
{ 
    _dirY = cos _aroundX; 
    _dirZ = sin _aroundX; 
    _upY = -sin _aroundX; 
    _upZ = cos _aroundX; 
}; 

if (_aroundY != 0) then 
{ 
    _dirX = _dirZ * sin _aroundY; 
    _dirZ = _dirZ * cos _aroundY; 
    _upX = _upZ * sin _aroundY; 
    _upZ = _upZ * cos _aroundY; 
}; 

if (_aroundZ != 0) then 
{ 
    _dirXTemp = _dirX; 
    _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
    _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
    _upXTemp = _upX; 
    _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
    _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
};

_dir = [_dirX,_dirY,_dirZ]; 
_up = [_upX,_upY,_upZ]; 
_object setVectorDirAndUp [_dir,_up];

_object