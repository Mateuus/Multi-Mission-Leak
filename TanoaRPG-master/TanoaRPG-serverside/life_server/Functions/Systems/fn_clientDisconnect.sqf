/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 When a client disconnects this will remove their corpse and 
 clean up their storage boxes in their house. 
*/ 
private["_unit","_id","_uid","_name","_side","_stemp","_ztemp","_ivtemp","_iptemp","_ittemp","_containers","_schilds"]; 
_unit = _this select 0; 
_id = _this select 1; 
_uid = _this select 2; 
_name = _this select 3; 
if(isNull _unit) exitWith {}; 
 
if(_unit in [hc_1, hc_2]) then 
{ 
 life_hc_inUse = ObjNull; 
 [[_uid, _name], [-1, "SERVER"], 4, "[HC]", "Headless Client hat sich ausgeloggt"] spawn TEX_fnc_logIt; 
 [0, _uid, _name] call TEX_fnc_initHC; 
}; 
 
//Delete Disconnected Einsatzschilder 
_schilds = (mvh getVariable ["Schild", []]); 
if(_unit in _schilds) then 
{ 
 _schilds = _schilds - [player]; 
 mvh setVariable ["Schild", _schilds, true]; 
  
 { 
  deletevehicle _x; 
 } foreach ((getPos _unit) nearObjects ["Steel_Plate_L_F", 2]); 
  
 { 
  deletevehicle _x; 
 } foreach ((getPos _unit) nearObjects ["UserTexture1m_F", 2]); 
}; 
 
//Delete Disconected Bodies/weapons 
_side = (side _unit); 
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; 
{deleteVehicle _x;} foreach _containers; 
deleteVehicle _unit; 
 
//Clean Houses 
_uid spawn TEX_fnc_houseCleanup; 
 
 
//check if player is dead / when dead delete gear and save all to serverlog 
_stemp =(mvh getVariable ["Death", ["0","0"]]); 
_ztemp = []; 
{ 
 if(_x != _uid) then 
 { 
  _ztemp pushBack _x; 
 } else { 
  [[_uid, _name], [-1, "SERVER"], 4, "[ANTI-COMBAT-LOG]", "Hat sich ausgeloggt während er tot war und das Gear wurde gelöscht."] spawn TEX_fnc_logIt; 
  [[0,1],format["%1 hat getrennt während er tot war !!! Gearsave ist Verboten !!! Sein Gear wurde gelöscht und %1 verwarnt !!!!", _name]] remoteExec ["tanoarpg_fnc_broadcast", -2,false]; 
  [_uid, _side, "[]", 3] call DB_fnc_updatePartial; 
 }; 
} foreach _stemp; 
mvh setVariable ["Death", _ztemp, true]; 
 
//Check if Player Was in Inventory 
_ivtemp = (mvh getVariable [format["InInvTemp%1", _uid], ""]); 
_iptemp = (mvh getVariable [format["InInvPut%1", _uid], ""]); 
_ittemp = (mvh getVariable [format["InInvTake%1", _uid], ""]); 
if(format["%1", _ivtemp] != "") then 
{ 
 [[_uid, _name], [-1, "SERVER"], 4, "[ANTI-DOPPEL-SYSTEM]", format["Put:%1| Take:%2|", _iptemp, _ittemp], "[DOPPELN-DA-UNSAVED-GEAR]"] spawn TEX_fnc_logIt; 
  
 mvh setVariable [format["InInvTemp%1", _uid], nil, true]; 
 mvh setVariable [format["InInvPut%1", _uid], nil, true]; 
 mvh setVariable [format["InInvTake%1", _uid], nil, true]; 
}; 
 
 
//Allgemeiner Log 
[[_uid, _name], [-1, "SERVER"], 4, "[DISCONNECT]", format["Pos:%1", getPos player]] spawn TEX_fnc_logIt; 
 
