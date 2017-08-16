/* 
 @file Version: 1.0.0.0 
 @file Author: RYN_Ryan 
 @file edit: 20.01.2015 
 Copyright 2015 Ryan Torzynski, All rights reserved 
 All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"! 
*/ 
 
diag_log "AirdropAdmin wurde gestartet !!"; 
_posPlayer = [_this,0,[],[[]]] call BIS_fnc_param; 
 
if (!airdrop_enable) exitWith {}; 
if (airdrop_goingon) exitWith {}; 
//if({side _x == civilian} count playableUnits < 50) exitWith {}; 
airdrop_goingon = true; 
 
_dest = _posPlayer; 
 
uisleep 1; 
 
// AIRDROP STARTEN 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting - Mission</t></t><br/><br/><t size='1'>Die e-Monkeys-Helikopter-Crew wird in 30 Minuten eine Nachschubkiste mit hochwertigem Inhalt abwerfen! Die Abwurfzone wird in Kürze übermittelt! (Achtung: PvP-Zone, Regeln im Forum beachten!)</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 600; 
 
_marker = createMarker ["Airdropmarker", _dest]; 
"Airdropmarker" setMarkerColor "ColorRed"; 
"Airdropmarker" setMarkerType "Empty"; 
"Airdropmarker" setMarkerShape "ELLIPSE"; 
"Airdropmarker" setMarkerSize [500,500]; 
_markerText = createMarker ["Airdropmarkertext", _dest]; 
"Airdropmarkertext" setMarkerColor "ColorBlack"; 
"Airdropmarkertext" setMarkerText "Crafting-Mission"; 
"Airdropmarkertext" setMarkerType "mil_warning"; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting - Mission</t></t><br/><br/><t size='1'>20 Minuten bis zum Abwurf der Nachschubkiste! Die Abwurfzone wurde übermittelt!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 600; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting-Mission</t></t><br/><br/><t size='1'>10 Minuten bis zum Abwurf der Nachschubkiste!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 300; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting-Mission</t></t><br/><br/><t size='1'>5 Minuten bis zum Abwurf der Nachschubkiste!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 120; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting-Mission</t></t><br/><br/><t size='1'>3 Minuten bis zum Abwurf der Nachschubkiste!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 60; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting-Mission</t></t><br/><br/><t size='1'>2 Minuten bis zum Abwurf der Nachschubkiste!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
uisleep 60; 
 
[[5,"<t size='1.8'><t color='#00FF33'>Crafting-Mission</t></t><br/><br/><t size='1'>1 Minute bis zum Abwurf der Nachschubkiste! </t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"]; 
 
 
 
heli1 allowDamage false; 
 
 
_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup; 
 
 
{_x moveInDriver heli1} forEach units _mygroup1; 
 
 
_mygroup1 addWaypoint [_dest, 0]; 
_mygroup1 addWaypoint [[2380.47,22267.8,0], 0]; 
 
 
_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]]; 
"airbox_marker" setMarkerColor "ColorGreen"; 
"airbox_marker" setMarkerText " Nachschub"; 
"airbox_marker" setMarkerType "mil_destroy"; 
 
_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"]; 
_containerdummy attachTo [heli1,[0,0,-3.5]]; 
_containerdummy setDir 90; 
 
 
while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; uisleep 0.1 }; 
[[5,"<t size='1.8'><t color='#FF0000'>Crafting - Mission</t></t><br/><br/><t size='1'>Der Nachschub wurde abgeworfen!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 
// Drop the container 
 
deleteVehicle _containerdummy; 
uisleep 0.1; 
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"]; 
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""]; 
_para setPosATL (heli1 modelToWorld[0,0,100]); 
_para attachTo [heli1,[0,0,-10]]; 
detach _para; 
_container attachTo [_para,[0,0,-2]]; 
_container setDir 90; 
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container]; 
_smoke="SmokeShellRed" createVehicle [getpos _container select 0, getpos _container select 1,0]; 
_smoke attachTo [_container,[0,0,0]]; 
_light = "Chemlight_red" createVehicle getPos _container; 
_light attachTo [_container,[0,0,0]]; 
_flare = "F_40mm_Red" createVehicle getPos _container; 
_flare attachTo [_container,[0,0,0]]; 
uisleep 0.1; 
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos heli1;uisleep 1; }; 
detach _container; 
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5]; 
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container]; 
uisleep 6; 
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0]; 
_pos_container = getPos _container; 
deleteVehicle _container; 
uisleep 0.5; 
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"]; 
_box allowDamage false; 
 
_box setVariable["trunk_in_use",false,true]; 
airdrop_kiste = _box; 
publicVariable "airdrop_kiste"; 
_box allowDamage false; 
_box setVariable["kiste_open",false,false]; 
 
_markerText = createMarker ["airbox_kiste", getPos _box]; 
 "airbox_kiste" setMarkerColor "ColorBlue"; 
 "airbox_kiste" setMarkerText "Nachschub"; 
 "airbox_kiste" setMarkerType "mil_destroy";  
 
_smoke="SmokeShellRed" createVehicle [getpos _box select 0,getpos _box select 1,0]; 
_flare = "F_40mm_Red" createVehicle getPos _container; 
_light attachTo [_box,[0,0,0]]; 
_flare attachTo [_box,[0,0,0]]; 
 
deleteMarker "airbox_marker"; 
 
// Fill box 
 
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box; 
clearItemCargoGlobal _box; 
_red = round(random 100); 
  switch(true) do 
  { 
   case (_red < 10) : { 
                _box setVariable["Trunk",[[["bp_mxm",2],["bp_mk200mg",1],["bp_mk18",2],["aktex1",1],["bp_ghillie",1],["bp_aktex",1],["diamondc",109]],0],true]; 
            }; 
    
   case (_red < 20) : { 
                _box setVariable["Trunk",[[["bp_mxm",1],["bp_zafir",1],["bp_mk200mg",1],["aktex2",1],["bp_ghillie",1],["aktex6",1],["heroinp",104],["furniture_05",1]],0],true]; 
            }; 
    
   case (_red < 30) : { 
                _box setVariable["Trunk",[[["bp_mxm",2],["bp_mk200mg",1],["bp_mk1",2],["aktex3",1],["bp_ghillie",4],["aktex8",1],["flush",17],["edelmetall",2]],0],true]; 
            }; 
    
            case (_red < 40) : { 
                _box setVariable["Trunk",[[["bp_mxm",2],["bp_sniperoptic",5],["bp_sln338",1],["bp_mk1",2],["aktex4",1],["bp_ghillie",4],["aktex1",1],["diamondc",122],["edelmetall",2]],0],true]; 
             }; 
     
            case (_red < 50) : { 
                _box setVariable["Trunk",[[["bp_mk200mg",2],["bp_mk18",2],["bp_almanach",1],["bp_ghillie",1],["aktex5",1],["aktex7",1],["heroinp",88],["edelmetall",2],["bottledwhiskey",144]],0],true]; 
             }; 
     
    case (_red < 60) : { 
                _box setVariable["Trunk",[[["bp_katiba",1],["bp_mx",1],["bp_mk1",3],["bp_almanach",2],["aktex6",1],["flush",17],["bp_ghillie",1],["furniture_05",1],["bottledwhiskey",127],["bp_sln762",2]],0],true]; 
            }; 
    
            case (_red < 70) : { 
                _box setVariable["Trunk",[[["bp_katiba",1],["bp_mx",1],["bp_mk14",3],["bp_almanach",2],["aktex7",1],["flush",16],["bp_ghillie",3],["edelmetall",2],["bottledwhiskey",151],["bp_sln762",2]],0],true]; 
            }; 
    
            case (_red < 80) : { 
                _box setVariable["Trunk",[[["bp_sln65",3],["carbonfaser",2],["bp_mk14",3],["edelmetall",1],["alup",5],["aktex8",1],["bp_ghillie",2],["diamondc",112],["bp_sln762",2]],0],true]; 
            }; 
    
            case (_red < 90) : { 
                _box setVariable["Trunk",[[["goldbar",2],["bp_mk14",3],["carbonfaser",3],["aktex9",1],["heroinp",46],["edelmetall",3],["bp_ghillie",4],["bp_almanach",1],["bp_sln762",2]],0],true]; 
            }; 
    
            case (_red < 100) : { 
   _box setVariable["Trunk",[[["goldbar",3],["bp_mxm",3],["carbonfaser",4],["bp_mk18",1],["bottledshine",23],["edelmetall",4],["bp_ghillie",1],["bottledwhiskey",104],["bp_sln762",4]],0],true]; 
            }; 
  }; 
 
 
// Fill box end 
 
uisleep 100; 
deleteVehicle heli1; 
 
uisleep 800; 
[[5,"<t size='1.8'><t color='#FF0000'>Crafting - Mission</t></t><br/><br/><t size='1'>5 Minuten bis zur Selbstzerstörung!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uisleep 240; 
[[5,"<t size='1.8'><t color='#FF0000'>Crafting - Mission</t></t><br/><br/><t size='1'>1 Minute bis zur Selbstzerstörung!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uisleep 50; 
[[5,"<t size='1.8'><t color='#FF0000'>Crafting - Mission</t></t><br/><br/><t size='1'>10 Sekunden bis zur Selbstzerstörung!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uisleep 10; 
[[5,"<t size='1.8'><t color='#FF0000'>Crafting - Mission beendet!</t></t><br/><br/><t size='1'>Die Crafting - Mission ist abgeschlossen!</t>"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
deleteVehicle _box;  
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-1,(getPos _box select 1)+56,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+23,(getPos _box select 1)-75,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-50,(getPos _box select 1)+1,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+87,(getPos _box select 1)-22,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+20,(getPos _box select 1)-20,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-100,(getPos _box select 1)+56,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-55,(getPos _box select 1)+123,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+577,(getPos _box select 1)-83,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+35,(getPos _box select 1)-99,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0]; 
uisleep 1; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-431,(getPos _box select 1)-431,0]; 
 
"Airdropmarker" setMarkerAlpha 0; 
"Airdropmarkertext" setMarkerAlpha 0; 
 
deleteMarker "airbox_kiste"; 
deleteMarker "Airdropmarker"; 
deleteMarker "Airdropmarkertext"; 
 
airdrop_goingon = false;