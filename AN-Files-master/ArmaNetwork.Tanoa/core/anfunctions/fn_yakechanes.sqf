/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index"];
disableSerialization;
createDialog "Life_key_management";
_display = findDisplay 2705;
_vehicles = _display displayCtrl 1500;
lbClear _vehicles;
{
  _vehicle = _x;
  if(!isNull _vehicle && {alive _vehicle}) then {
    _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
    _pic = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "picture");
    if(("vehgps" in AN_Skills) OR {playerSide isEqualTo west}) then {
      _vehicles lbAdd format["%1 - [Distance: %2m]",_name,round(player distance _vehicle)];
    } else {
      _vehicles lbAdd format["%1",_name];
    };
    if(_pic != "pictureStaticObject") then {
      _vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
    };
    _vehicles lbSetData [(lbSize _vehicles)-1,str(_forEachIndex)];
  };
} forEach life_vehicles;
