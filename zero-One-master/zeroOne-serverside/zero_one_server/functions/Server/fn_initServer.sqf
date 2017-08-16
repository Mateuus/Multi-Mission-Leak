/* 
 Author: Zero-One Development 
 Desc: Server initialization 
*/ 
private["_rsb","_motd","_hs","_var"]; 
Tjof = false; 
publicVariable "Tjof"; 
 
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; 
 
[8,true,12] execFSM "\zero_one_server\timeModule.fsm"; 
//setTimeMultiplier 10; //Tag-Nacht Wechsel fest - raus weil wegen deync oder so 
 
[] spawn { 
 
 while {true} do { 
  diag_log diag_activeSQFScripts; 
  sleep 1; 
 }; 
 
}; 
 
[ 
 (10*60), // seconds to delete dead bodies (0 means don't delete) 
 0, // seconds to delete dead vehicles (0 means don't delete) 
 (2*60), // seconds to delete dropped weapons (0 means don't delete) 
 0, // seconds to deleted planted explosives (0 means don't delete) 
 0, // seconds to delete dropped smokes/chemlights (0 means don't delete) 
 (20*60) // seconds to delete empty Vehicle of Server 
] execVM "\zero_one_server\Functions\Cleanup\repetitive_cleanup.sqf"; 
[] execFSM "\zero_one_server\Functions\Cleanup\FSM\cleanup.fsm"; 
 
//"zero_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call zero_fnc_handleMPexec;}; 
"BIS_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call zero_fnc_handleMPexecBIS;}; 
"zo_log" addPublicVariableEventHandler {(_this select 1) call {("debug_console" callExtension (_this + "~0001"))};}; 
"headless" addPublicVariableEventHandler {(_this select 1) call zero_fnc_initHC;}; 
"zero_one_admin_call" addPublicVariableEventHandler {[_this select 0,_this select 1] spawn admin_fnc_server;}; //ggf löschen 
"wVfbTMtk" addPublicVariableEventHandler {(_this select 1) spawn zero_fnc_namecheck;}; 
"zero_update_market" addPublicVariableEventHandler {(_this select 1) spawn zero_fnc_updateMarket;}; 
 
adminfnc = { 
 private["_sendbackTarget","_code","_return"]; 
 _sendbackTarget = owner(_this select 0); 
 _code = _this select 1; 
 _return = []; 
 { 
  _return pushBack (call compile(_code select _forEachIndex)); 
 } forEach _code; 
 sendback = [_this select 2,_return]; 
 _sendbackTarget publicVariableClient "sendback"; 
 sendback = nil; 
}; 
"SyOQAdOF" addPublicVariableEventHandler {(_this select 1) spawn adminfnc;};//admin stuff 
 
disableRemoteSensors true; //dekativierung der Entfernungserkennung, Ortung Befehle wie knowsAbout, nearTargets und targetKnowledge funktioneren dadurch auf den Server nicht mehr. 
 
CcYcUurP = 0; 
crvpV = 0; 
EiUa = 0; 
 
kjcotSjcS = []; 
dIOg = []; 
 
// OPFOR && BLUFOR && INDEPENDENT FRIENDS 
Resistance setFriend [East, 1]; 
East setFriend [Resistance, 1]; 
 
West setFriend [Resistance, 1]; 
Resistance setFriend [West, 1]; 
 
West setFriend [East, 1]; 
East setFriend [West, 1]; 
 
//Null out harmful things for the server. 
JxMxE_PublishVehicle = compileFinal ("No"); 
 
fed_bank setVariable["safe",100,true]; //Fester Bank Wert 
Player_Combat = []; 
 
onPlayerConnected { 
 
 if(_name isEqualTo "__SERVER__" || _name isEqualTo "headlessclient") exitWith {}; 
 
 /* 
 private _uidplayers = []; 
 
 { 
  _uidplayers pushback (getPlayerUID _x); 
 } foreach allplayers; 
 
 if (_uid in _uidplayers) then { 
  diag_log format ["Hack Player ID:%1 Name:%2 UID:%3 Owner:%4 JIP:%5",_id,_name,_uid,_owner,_jip]; 
  "ArmaLeakTeam" serverCommand format["#kick %1",_owner]; 
 }; 
 */ 
 
    //[("https://api.zero-one.cc/check_player.php?id=" + _uid),url_fetch_function,_owner,_uid] spawn url_fetch_callback; 
 
 if (_name in Player_Combat) then { 
  [0,format["%1 hat erneut verbunden.",_name]] remoteExecCall ["zero_fnc_cpbpJzzAd",(allPlayers - entities "HeadlessClient_F")]; 
  zo_log = format["WARNING: %1 hat innerhalb von 30s erneut verbunden.",_name]; 
  publicVariableServer "zo_log"; 
  zo_log = nil; 
 }; 
 
}; 
 
addMissionEventHandler ["HandleDisconnect",{_this call zero_fnc_clientDisconnect; false;}]; 
 
tFHiSiX = []; 
client_session_list = []; 
 
//Strip NPC's of weapons 
{ 
 if(!isPlayer _x) then { 
  _npc = _x; 
  { 
   if(_x != "") then { 
    _npc removeWeapon _x; 
   }; 
  } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc]; 
 }; 
} forEach allUnits; 
 
//Krankenhäuser 
{ 
 _hs = "Land_Hospital_main_F" createVehicle [0,0,0]; 
 _hs enableSimulation false; 
 _hs setDamage 0; 
 _hs allowDamage false; 
 _hs setDir (_x select 2); 
 _hs setPosATL (_x select 1); 
 
 _hs2 = "Land_Hospital_side1_F" createVehicle [0,0,0]; 
 _hs2 enableSimulation false; 
 _hs2 setDamage 0; 
 _hs2 allowDamage false; 
 _hs2 attachTo [_hs, [4.69775,32.6045,-0.1125]]; 
 detach _hs2; 
 
 _hs3 = "Land_Hospital_side2_F" createVehicle [0,0,0]; 
 _hs3 enableSimulation false; 
 _hs3 setDamage 0; 
 _hs3 allowDamage false; 
 _hs3 attachTo [_hs, [-28.0336,-10.0317,0.0889387]]; 
 detach _hs3; 
 
 
} forEach [ 
 ["hospital_2",[15600.4,17211.8,0],-52.634], 
 ["hospital_3",[26059.2,21423.3,0],-45.9166] 
]; 
 
//Lockup the dome 
_rsb = nearestObject [[20889,19224,0],"Land_Research_HQ_F"]; 
_rsb setVariable["bis_disabled_Door_1",1,true]; 
_rsb setVariable["bis_disabled_Door_2",1,true]; 
_rsb allowDamage false; 
 
for "_i" from 1 to 3 do { 
   jail_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; 
   jail_dome animate [format["Door_%1_rot",_i],0]; 
 }; 
 
//Gang Eroberung 
_pos = [21976.1,21030.8,7.3]; 
_gangmarker = createMarker ["Gang_Eroberung_2", _pos]; 
_gangmarker setMarkerColor "ColorRed"; 
_gangmarker setMarkerShape "ELLIPSE"; 
_gangmarker setMarkerBrush "Grid"; 
_gangmarker setMarkerAlpha 0.25; 
_gangmarker setMarkerSize [300,300]; 
 
_gangmarker = createMarker ["Gang_Eroberung_1", _pos]; 
_gangmarker setMarkerColor "ColorRed"; 
_gangmarker setMarkerType "mil_circle"; 
_gangmarker setMarkerText "Gang Eroberung"; 
_gangmarker setMarkerSize [0.7, 0.7]; 
 
 
//TODO auf clienten auslagern wenn möglich 
zero_gang_flag = "FlagPole_F" createVehicle [0,0,0]; //createVehicleLocal 
zero_gang_flag enableSimulation false; 
zero_gang_flag setDamage 0; 
zero_gang_flag allowDamage false; 
zero_gang_flag setPosATL _pos; 
publicVariable "zero_gang_flag"; 
 
jailedUnits = []; 
 
//ID für Zero One Admin 
zero_one_admin = [ 
 "76561197960667748",//Nokman 
 "76561198035321973",//Dirk 
 "76561198066071224",//Arkensor 
 "76561197968909110",//Sturm 
 "76561198140712195",//Yawalla 
 "76561198054377433",//Bobo 
 "76561197968680172",//Tim 
 "76561197973840719",//IZwaynee 
 "76561198105042921",//Yamato 
 "76561197987791478",//Adrian 
 "76561198199036439",//Hulk 
 "76561198075726896",//Florian 
 "76561198166819375", //Ray-Webdev 
 "76561198085661090" //Mal so 
]; 
 
waitUntil {HC1_on}; 
//waituntil {HC2_on}; 
//HC2_owner publicVariableClient "HC1_on"; 
 
[] spawn zero_fnc_loadHouses; 
 
_motd = ["selectConfig:motd",2,true] call zero_fnc_asyncCall; 
server_cfg = _motd select 0; 
publicVariable "server_cfg"; 
 
//Run procedures for SQL cleanup on mission start. 
["resetLifeVehicles",1] spawn zero_fnc_asyncCall; 
["delLifeVehicles",1] spawn zero_fnc_asyncCall; 
["delLifeHouses",1] spawn zero_fnc_asyncCall; 
["delLifeGang",1] spawn zero_fnc_asyncCall; 
 
[] spawn zero_fnc_loadVehicleShop; 
 
Tjof = true; 
publicVariable "Tjof"; 
zero_server_start = nil; 
