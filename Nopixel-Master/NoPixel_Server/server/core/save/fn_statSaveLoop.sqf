 
 
{ 
_phoneBackground = _x getVariable "phoneBackground"; 
_messages = _x getVariable "messages"; 
_statuses = _x getVariable "statuses"; 
_house = _x getVariable "house"; 
_shop = _x getVariable "shop"; 
 
_houselevel = _x getVariable "houselevel"; 
 
_housecontent = _x getVariable "housecontent"; 
_shopcontent = _x getVariable "shopcontent"; 
 
_cash = _x getVariable "cash"; 
_bank = _x getVariable "bank"; 
 
_position = position _x; 
 
_items = _x getVariable "getunitloadout"; 
_uid = getplayerUID _x; 
 
_syncInfo = _x getVariable "sync"; 
 
if(_syncInfo == 1) then { 
_updatestr = format ["updatePlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11", _items, _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _uid]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
} else { 
_updatestr = format ["updatePlayerInfoNoGear:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10", _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _uid]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
}; 
 
if(_houseLevel == 1) then { 
tier1housing pushback _house; 
}; 
if(_houseLevel == 2) then { 
tier2housing pushback _house; 
}; 
if(_houseLevel == 3) then { 
tier3housing pushback _house; 
}; 
 
}forEach allPlayers; 
