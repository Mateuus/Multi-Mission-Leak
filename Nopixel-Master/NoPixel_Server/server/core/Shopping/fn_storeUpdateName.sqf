 
 
_player = _this select 0; 
_newname = _this select 1; 
 
diag_log ["store update name %1", _player]; 
 
 
if(count _newname > 25) exitWith { ["Shop name can not be longer than 25 characters.", false] remoteExec ["domsg",_player]; }; 
 
_shop = _player getVariable "shop"; 
deletemarker format["%1",getPlayerUID _player]; 
_marker = createMarker [getPlayerUID _player, _shop]; 
_marker setMarkerShape "ICON"; 
_marker setMarkerType "hd_dot"; 
_marker setMarkerText format["%1", _newname]; 
 
_updatestr = format ["updateShopName:%1:%2", _newname, getPlayerUID _player]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
