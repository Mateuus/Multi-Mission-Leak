 
private ["_turntable","_holder","_time","_dir"];  
 
 
 
_player = _this select 0; 
 
diag_log ["retreive house: %1", _player]; 
 
 
_uid = getPlayerUID _player; 
 
if(_uid in activecrates) exitwith {}; 
activecrates pushback _uid; 
 
 
 
 
_houseLevel = _player getvariable "houselevel"; 
if(_houselevel == 1) then { _holder = "plp_ct_SuitcaseBigBlack" createVehicleLocal (_player modeltoworld[0,2,1]); }; 
if(_houselevel == 2) then { _holder = "plp_ct_woodboxlightmedium" createVehicleLocal (_player modeltoworld[0,2,1]); }; 
if(_houselevel == 3) then { _holder = "plp_ct_woodboxlightbig" createVehicleLocal (_player modeltoworld[0,2,1]); }; 
 
 
_playercontent = _player getVariable "housecontent"; 
 
_myweapons = (_playercontent select 0);  
_mymagazines = (_playercontent select 1);  
_myitems = (_playercontent select 2);  
_mybackpacks = (_playercontent select 3); 
 
 
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
 
_process =_myMagazines select 0;  
 
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
 
_time = time + 300;  
 
waitUntil {  
time > _time  
};  
 
if(!isnull _holder) then { 
_weapons = getWeaponCargo _holder; 
_magazines = getMagazineCargo _holder; 
_items = getItemCargo _holder; 
_backpacks = getBackpackCargo _holder; 
 
_playercontent = [_weapons,_magazines,_items,_backpacks]; 
 
_player setVariable ["housecontent",_playercontent,false]; 
 
_updatestr = format ["updateHouse:%1:%2", _playercontent, getPlayerUID _player]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
deleteVehicle _holder;  
_pia = activecrates find _uid; 
activecrates deleteAt _pia; 
}; 
