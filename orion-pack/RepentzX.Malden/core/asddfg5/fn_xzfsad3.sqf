/*
	File: fn_safezones.sqf
*/
private ["_eh1","_inArea","_zone1","_zone2","_zone3","_zone4","_zone5","_zone6","_zone7","_zone8","_zone1dis","_zone2dis","_zone3dis","_zone4dis","_zone5dis","_zone6dis","_zone7dis","_zone8dis","_dis"];

_obj = _this select 0;

_zone1 = getMarkerPos "safezone_port"; // MARKERS FOR SAFEZONE
_zone2 = getMarkerPos "safezone_Trinite";
_zone3 = getMarkerPos "safezone_Pessagne";
_zone4 = getMarkerPos "safezone_ter1";
_zone5 = getMarkerPos "safezone_reb1";
_zone6 = getMarkerPos "safezone_air1";
_zone7 = getMarkerPos "safezone_gun1";
_zone8 = getMarkerPos "safezone_Don";

_zone1dis = 200;
_zone2dis = 125;
_zone3dis = 125;
_zone4dis = 250;
_zone5dis = 250;
_zone6dis = 150;
_zone7dis = 75;
_zone8dis = 100;

_dis = 350;

_ret = false;

if (((_zone1 distance _obj < _zone1dis) || (_zone2 distance _obj < _zone2dis) || (_zone3 distance _obj < _zone3dis) || (_zone4 distance _obj < _zone4dis) || (_zone5 distance _obj < _zone5dis) || (_zone6 distance _obj < _zone6dis) || (_zone7 distance _obj < _zone7dis) || (_zone8 distance _obj < _zone8dis))) then
{
	// Unit is within distance of one of the specified safezones, return true
	_ret = true;
};
if (((_zone1 distance _obj > _zone1dis) && (_zone2 distance _obj > _zone2dis) && (_zone3 distance _obj > _zone3dis) && (_zone4 distance _obj > _zone4dis) &&(_zone5 distance _obj > _zone5dis) || (_zone6 distance _obj > _zone6dis) || (_zone7 distance _obj > _zone7dis) || (_zone8 distance _obj > _zone8dis))) then
{
	// Unit is not within the specified distance to any safezone, return false
	_ret = false;
};


_ret;
