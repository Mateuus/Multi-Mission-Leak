/*
	File: fn_safezones.sqf
	Editor: Cris
	
	Description: kein Kravalla in Kavalla :)
*/
private ["_eh1","_inArea","_zone1","_zone2","_zone3","_zone4","_zone5","_zone6","_zone1dis","_zone2dis","_zone3dis","_zone4dis","_zone5dis","_zone6dis","_dis"];

_zone1 = getMarkerPos "safezone_kav"; // MARKERS FOR SAFEZONE
_zone2 = getMarkerPos "safezone_pyr";
_zone3 = getMarkerPos "safezone_ath";
_zone4 = getMarkerPos "safezone_sof";
_zone5 = getMarkerPos "safezone_air";
_zone6 = getMarkerPos "safezone_air_1";

_zone1dis = 400;
_zone2dis = 250;
_zone3dis = 200;
_zone4dis = 200;
_zone5dis = 100;
_zone6dis = 200;

_dis = 350; // DISTANCE SAFE ZONE (euren Marker Radius angeben)                        
_inArea = false;

_enterText = "Du bist in eine Safezone betreten. Achte auf das Regelwerk!";
_leaveText = "Du hast die Safezone verlassen. Es gelten wieder die normalen Regeln";

switch (playerSide) do
{
	case west:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _zone1dis) || (_zone2 distance player < _zone2dis) || (_zone3 distance player < _zone3dis) || (_zone4 distance player < _zone4dis) || (_zone5 distance player < _zone5dis) || (_zone6 distance player < _zone6dis)) && (!_inArea)) then 
				{     
					//_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_enterText];
					player allowDamage false;
					safezone = true;
				};
				if (((_zone1 distance player > _zone1dis) && (_zone2 distance player > _zone2dis) && (_zone3 distance player > _zone3dis) && (_zone4 distance player > _zone4dis) &&(_zone5 distance player > _zone5dis) && (_zone6 distance player > _zone6dis)) && (_inArea)) then 
				{    
					//player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_leaveText];
					player allowDamage true;
					safezone = false;
				};
     
			};
		};
	};
	
	case civilian:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _zone1dis) || (_zone2 distance player < _zone2dis) || (_zone3 distance player < _zone3dis) || (_zone4 distance player < _zone4dis) || (_zone5 distance player < _zone5dis) || (_zone6 distance player < _zone6dis)) && (!_inArea)) then 
				{     
					_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_enterText];
					player allowDamage false;
					safezone = true;
				};
				if (((_zone1 distance player > _zone1dis) && (_zone2 distance player > _zone2dis) && (_zone3 distance player > _zone3dis) && (_zone4 distance player > _zone4dis) &&(_zone5 distance player > _zone5dis) && (_zone6 distance player > _zone6dis)) && (_inArea)) then 
				{    
					player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_leaveText];
					player allowDamage true;
					safezone = false;
				};
     
			};
		};
	};
	
	case independent:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _zone1dis) || (_zone2 distance player < _zone2dis) || (_zone3 distance player < _zone3dis) || (_zone4 distance player < _zone4dis) || (_zone5 distance player < _zone5dis) || (_zone6 distance player < _zone6dis)) && (!_inArea)) then 
				{     
					//_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_enterText];
					player allowDamage false;
					safezone = true;
				};
				if (((_zone1 distance player > _zone1dis) && (_zone2 distance player > _zone2dis) && (_zone3 distance player > _zone3dis) && (_zone4 distance player > _zone4dis) &&(_zone5 distance player > _zone5dis) && (_zone6 distance player > _zone6dis)) && (_inArea)) then 
				{    
					//player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Warnung Safezone<br/><br/><t align='center'><t size='1'><t color='#ffffff'>%1",_leaveText];
					player allowDamage true;
					safezone = false;
				};
     
			};
		};
	};
	sleep 3;
};