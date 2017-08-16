 
private ["_weapons","_magazines","_items","_backpacks"];  
_player = _this select 0; 
 
_uid = getPlayerUID _player; 
 
diag_log ["store %1", _uid]; 
 
if(_uid in activeshopcrates) exitwith {}; 
activeshopcrates pushback _uid; 
 
_holder = createVehicle ["plp_ct_woodboxlightbig", _player modeltoworld[0,2,1], [], 0, "can_Collide"];   
 
["Your crate is ready, people can not use your shop while this is happening.", false] remoteExec ["domsg",_player]; 
 
["You can change prices once the items are stored in a few minutes.", false] remoteExec ["domsg",_player]; 
 
_shopcontent = _player getVariable "shopcontent"; 
 
_myweapons = (_shopcontent select 0);  
_mymagazines = (_shopcontent select 1);  
_myitems = (_shopcontent select 2);  
_mybackpacks = (_shopcontent select 3); 
 
_myweaponsPrices = ((_shopcontent select 0) select 2); 
_mymagazinesPrices = ((_shopcontent select 1) select 2); 
_myitemsPrices = ((_shopcontent select 2) select 2); 
_mybackpacksPrices = ((_shopcontent select 3) select 2); 
 
_process = _myWeapons select 0; 
 
if(!isnil "_process") then { 
_count = 0; 
{  
_ItemCount = _myweapons select 1; 
_itemNumber = _ItemCount select _count; 
_holder addWeaponCargoGlobal [_x,_itemnumber]; 
_count = _count + 1; 
} foreach _process;  
}; 
 
_process = _myMagazines select 0;  
 
if(!isnil "_process") then { 
_count = 0; 
{  
_ItemCount = _mymagazines select 1; 
_itemNumber = _ItemCount select _count; 
_holder addMagazineCargoGlobal [_x,_itemnumber]; 
_count = _count + 1; 
} foreach _process;  
}; 
 
_process = _myItems select 0;  
 
if(!isnil "_process") then { 
_count = 0; 
{  
_ItemCount = _myitems select 1; 
_itemNumber = _ItemCount select _count; 
_holder addItemCargoGlobal [_x,_itemnumber]; 
_count = _count + 1; 
} foreach _process;   
}; 
 
_process = _mybackpacks select 0;  
 
if(!isnil "_process") then { 
_count = 0; 
{  
_ItemCount = _mybackpacks select 1; 
_itemNumber = _ItemCount select _count; 
_holder addBackpackCargoGlobal [_x,_itemnumber]; 
_count = _count + 1; 
} foreach _process;  
}; 
 
_time = time + 30;  
 
waitUntil {  
time > _time  
};  
 
 
 
_weapons = getWeaponCargo _holder; 
_weapons pushback []; 
 
_process = _weapons select 0; 
if(!isnil "_process") then { 
_n = 0; 
{ 
_curPrice = _myweaponsPrices select _n; 
if(isnil "_curPrice") then { _weapons select 2 pushback 0;  } else { _weapons select 2 pushback _curPrice; }; 
_n = _n + 1; 
}foreach (_weapons select 0); 
}; 
 
 
_magazines = getMagazineCargo _holder; 
_magazines pushback []; 
_process = _magazines select 0; 
if(!isnil "_process") then { 
_n = 0; 
{ 
_curPrice = _myMagazinesPrices select _n; 
if(isnil "_curPrice") then { _magazines select 2 pushback 0;  } else { _magazines select 2 pushback _curPrice; }; 
_n = _n + 1; 
}foreach (_magazines select 0); 
}; 
 
_count = 0; 
_items = getItemCargo _holder; 
_items pushback []; 
_process = _items select 0; 
if(!isnil "_process") then { 
_n = 0; 
{ 
_curPrice = _myItemsPrices select _n; 
if(isnil "_curPrice") then { _items select 2 pushback 0;  } else { _items select 2 pushback _curPrice; }; 
_n = _n + 1; 
}foreach (_items select 0); 
}; 
 
_count = 0; 
_backpacks = getBackpackCargo _holder; 
_backpacks pushback []; 
_process = _backpacks select 0; 
if(!isnil "_process") then { 
_n = 0; 
{ 
_curPrice = _myBackpacksPrices select _n; 
if(isnil "_curPrice") then { _backpacks select 2 pushback 0;  } else { _backpacks select 2 pushback _curPrice; }; 
_n = _n + 1; 
}foreach (_backpacks select 0); 
}; 
 
_shopcontent = [_weapons,_magazines,_items,_backpacks]; 
_player setVariable ["shopcontent",_shopcontent,false]; 
_updatestr = format ["updateShop:%1:%2", _shopcontent, getPlayerUID _player]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
deleteVehicle _holder;  
 
[_shopcontent,"start"] remoteExec ["client_fnc_updatePrices",_player]; 
 
 
if(getmarkerpos format["%1",getPlayerUID _player] isEqualTo [0,0,0]) then { deletemarker format["%1",getPlayerUID _player]; }; 
 
if(_shopcontent isequalto [[[],[],[]],[[],[],[]],[[],[],[]],[[],[],[]]]) then { 
_marker = createMarkerLocal [getPlayerUID player, getpos _player]; 
_marker setMarkerShapeLocal "ICON"; 
_marker setMarkerTypeLocal "hd_dot"; 
_marker setMarkerTextLocal format["%1 - CLOSED", _shopname]; 
} else { 
_marker = createMarker [getPlayerUID player, getpos _player]; 
_marker setMarkerShape "ICON"; 
_marker setMarkerType "hd_dot"; 
_marker setMarkerText format["%1", _shopname]; 
}; 
