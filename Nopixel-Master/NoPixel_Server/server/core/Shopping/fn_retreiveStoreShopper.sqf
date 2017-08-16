 
 
 
 
private ["_shop","_unit","_shopplayer","_shopcontent"];  
 
_shop = _this select 0; 
_unit = _this select 1; 
 
diag_log ["open someones store %1", _unit]; 
 
 
_shop = nearestObjects [_unit, [_shop], 30]; 
_shop = _shop select 0; 
 
_shopplayer = _shop getVariable "shop"; 
 
if(isNil "_ShopPlayer") exitWith { ["This shop is currently not owned.", false] remoteExec ["domsg",_unit]; }; 
 
_uid = getPlayerUID _shopplayer; 
 
if(_uid in activeshopcrates) exitwith { ["This shop is currently being stocked, please wait a few moments.", false] remoteExec ["domsg",_unit]; }; 
 
_shopcontent = _shopplayer getVariable "shopcontent"; 
 
[_shopcontent,_shopplayer] remoteExec ["client_fnc_openShop",_unit]; 
 
 
