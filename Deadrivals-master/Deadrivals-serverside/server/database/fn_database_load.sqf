private["_loadperso","_player","_side","_name","_uid","_generaldata","_geardata","_whitelistdata","_gangRequest","_gangdata","_specificdata","_kranheitsdata"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_uid = [_this,2,"",[""]] call BIS_fnc_param; 
_gangdata = []; 
_specificdata = []; 
_housedata = []; 
_jaildata = []; 
_player = owner _player; 
 
_whitelistdata = format["SELECT independentlevel,westlevel,eastlevel,supportlevel,dienst,baned,combatlog FROM whitelist WHERE playerid = '%1'",_uid]; 
 
_whitelistdata = [_whitelistdata,2] call SERVERDATABASE_fnc_asyncCall; 
 
switch (_side) do { 
case west: { 
_generaldata = format["SELECT cash,bank,licenses,stats,time,exp,talente,talentpunkte,erfolge,title FROM West WHERE playerid = '%1'",_uid]; 
_geardata = format["SELECT assigned_items,backpack,backpack_items,backpack_magazines,backpack_weapons,current_weapon,goggles,handgun_items,handgun_weapon,headgear,binocular,loaded_magazines,primary_weapon,primary_weapon_items,secondary_weapon,secondary_weapon_items,uniform,uniform_items,uniform_magazines,uniform_weapons,vest,vest_items,vest_magazines,vest_weapons,zinventar FROM WestGear WHERE playerid = '%1'",_uid]; 
_kranheitsdata = format["SELECT hitpoints FROM krankheitenwest WHERE playerid = '%1'",_uid]; 
 
_generaldata = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_geardata = [_geardata,2] call SERVERDATABASE_fnc_asyncCall; 
_kranheitsdata = [_kranheitsdata,2] call SERVERDATABASE_fnc_asyncCall; 
}; 
case civilian: { 
_generaldata = format["SELECT cash,bank,licenses,stats,time,exp,talente,talentpunkte,erfolge,title FROM Zivilist WHERE playerid = '%1'",_uid]; 
_geardata = format["SELECT assigned_items,backpack,backpack_items,backpack_magazines,backpack_weapons,current_weapon,goggles,handgun_items,handgun_weapon,headgear,binocular,loaded_magazines,primary_weapon,primary_weapon_items,secondary_weapon,secondary_weapon_items,uniform,uniform_items,uniform_magazines,uniform_weapons,vest,vest_items,vest_magazines,vest_weapons,zinventar FROM ZivilistGear WHERE playerid = '%1'",_uid]; 
_specificdata = format["SELECT hausanzahl,rufpunkte FROM Zivilist WHERE playerid = '%1'",_uid]; 
_kranheitsdata = format["SELECT hitpoints FROM krankheitenciv WHERE playerid = '%1'",_uid]; 
_jaildata = format["SELECT jailtime,grund FROM jail WHERE playerid = '%1'",_uid]; 
 
_generaldata = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_geardata = [_geardata,2] call SERVERDATABASE_fnc_asyncCall; 
_kranheitsdata = [_kranheitsdata,2] call SERVERDATABASE_fnc_asyncCall; 
_specificdata = [_specificdata,2] call SERVERDATABASE_fnc_asyncCall; 
_jaildata = [_jaildata,2] call SERVERDATABASE_fnc_asyncCall; 
 
_requestgangdata = _uid spawn SERVER_fnc_queryPlayerGang; 
waitUntil{scriptDone _requestgangdata}; 
_gangdata pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]); 
 
_requesthousedata = _uid spawn SERVER_fnc_fetchPlayerHouses; 
waitUntil {scriptDone _requesthousedata}; 
_houseData pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]); 
}; 
case independent: { 
_generaldata = format["SELECT cash,bank,licenses,stats,time,exp,talente,talentpunkte,erfolge,title FROM Independent WHERE playerid = '%1'",_uid]; 
_geardata = format["SELECT assigned_items,backpack,backpack_items,backpack_magazines,backpack_weapons,current_weapon,goggles,handgun_items,handgun_weapon,headgear,binocular,loaded_magazines,primary_weapon,primary_weapon_items,secondary_weapon,secondary_weapon_items,uniform,uniform_items,uniform_magazines,uniform_weapons,vest,vest_items,vest_magazines,vest_weapons,zinventar FROM IndependentGear WHERE playerid = '%1'",_uid]; 
_kranheitsdata = format["SELECT hitpoints FROM krankheitenindependent WHERE playerid = '%1'",_uid]; 
 
_generaldata = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_geardata = [_geardata,2] call SERVERDATABASE_fnc_asyncCall; 
_kranheitsdata = [_kranheitsdata,2] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case east: { 
_generaldata = format["SELECT cash,bank,licenses,stats,time,exp,talente,talentpunkte,erfolge,title FROM east WHERE playerid = '%1'",_uid]; 
_geardata = format["SELECT assigned_items,backpack,backpack_items,backpack_magazines,backpack_weapons,current_weapon,goggles,handgun_items,handgun_weapon,headgear,binocular,loaded_magazines,primary_weapon,primary_weapon_items,secondary_weapon,secondary_weapon_items,uniform,uniform_items,uniform_magazines,uniform_weapons,vest,vest_items,vest_magazines,vest_weapons,zinventar FROM eastgear WHERE playerid = '%1'",_uid]; 
_kranheitsdata = format["SELECT hitpoints FROM krankheiteneast WHERE playerid = '%1'",_uid]; 
 
_generaldata = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_geardata = [_geardata,2] call SERVERDATABASE_fnc_asyncCall; 
_kranheitsdata = [_kranheitsdata,2] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
[_generaldata,_geardata,_whitelistdata,_gangdata,_specificdata,_kranheitsdata,_housedata,_jaildata] remoteExec ["CLIENTSERVER_fnc_loadplayer",_player]; 
 
switch (_side) do { 
case civilian: { 
_loadperso = format["SELECT name,bild,adress,birthday,serial FROM perso WHERE playerid = '%1'",_uid]; 
 
_loadperso = [_loadperso,2] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _loadperso == 0) then {[] remoteExec ["CLIENTSERVER_fnc_joinedfirsttime",_player];} else { 
[_loadperso] remoteExec ["CLIENTSERVER_fnc_loadperso",_player]; 
}; 
}; 
};