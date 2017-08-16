/* 
EMP VEHICLE SCRIPT
File: empLight.sqf
Author: DemoCore
Date: 2014.05.05
Version: 1.00
*/

_pos = _this select 0;

_duration = 1.5;

//_pos = [markerPos "empMarker" select 0, markerPos "empMarker" select 1, (markerPos "empMarker" select 2) + 50];
//_pos = getPos player;

//licht erstellen
_light = "#lightpoint" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 50]; 

//Helligkeit setzen
_light setLightBrightness 1.0; 

//Reflektionsfarbe setzen (blau)
_light setLightAmbient[0.0, 0.0, 1.0]; 

//Lichtfarbe setzen (blau)
_light setLightColor[0.0, 0.0, 1.0]; 

//Ausgangspunkt leuchten lassen
_light setLightFlareSize 3.0;

//_light lightAttachObject [_object, [0,0,0]];

isEmpActive = 1;

//das licht die gegebene Zeit in Sekunden anlassen
_counter = 0;
_curBrightness = 1.0;
while{ _counter < _duration } do
{
	uisleep 0.04;
	_counter = _counter + 0.1;
	
	if(_curBrightness < maxLightSize) then
	{
		_curBrightness = _curBrightness + 1;
		_light setLightBrightness _curBrightness; 
	};
};


while{_curBrightness > 0} do
{
	_curBrightness = _curBrightness - 2;
	_light setLightBrightness _curBrightness; 
	uisleep 0.03;
};

deleteVehicle _light;