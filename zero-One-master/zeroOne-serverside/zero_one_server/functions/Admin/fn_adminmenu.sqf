/* 
 Author: Arkensor 
 Desc: Does admin stuff 
*/ 
private["_mode","_config","_plist","_list","_filter","_adminactions","_helper","_playableUnits","_btn"]; 
_exit = false; 
if(loadFile "\zero_one_server\FRJq8IYz9N.sqf" != "") then { 
 if(([] call compile PreprocessFileLineNumbers "\zero_one_server\FRJq8IYz9N.sqf") != "OVdWWT6Fs1") then {_exit = true; player setVariable ["kick","Such non permission. Much WOW",true];}; 
} else { 
 _exit = true; 
 player setVariable ["kick","Such non permission. Much WOW",true]; 
}; 
if(_exit) exitWith {closeDialog 0; closeDialog 0;}; 
_mode = (_this select 0); 
 
if(_mode == 5) exitWith { 
 private["_case","_data","_text"]; 
 _case = (_this select 1) select 0; 
 _data = (_this select 1) select 1; 
 _text = ""; 
 switch(_case) do{ 
  case 0: { 
   { 
    if(_x select 0 != "<spawn>") then { 
     _text = _text + (str _x) + "<br/>"; 
    }; 
   } foreach (_data select 0) select 0; 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  case 1: { 
   _text = str (_data select 0); 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  case 2: { 
   _text = str((_data select 0) / 1000); 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  case 3: { 
   _text = _text + format ["Spieler Lebend: %1",(_data select 0)] + "<br/>"; 
   _text = _text + format ["Civ %1 - Reb %2 - Feuerwehr %3 - Cop %4",(_data select 1),(_data select 2),(_data select 3),(_data select 4)] + "<br/>"; 
   _text = _text + format ["Laufende Scripte: %1",(_data select 5)] + "<br/>"; 
   _text = _text + format ["Lokale KI: %1",(_data select 6)] + "<br/>"; 
   _text = _text + format ["Nicht Lokale KI: %1",(_data select 7)] + "<br/>"; 
   _text = _text + format ["Anzahl Gruppen: %1",(_data select 8)] + "<br/>"; 
   _text = _text + format ["Anzahl Objekte Map gesetzt: %1",(_data select 9)] + "<br/>"; 
   _text = _text + format ["Anzahl Fahrzeuge: %1",(_data select 10)] + "<br/>"; 
   _text = _text + format ["Local Gesteuert: %1",(_data select 11)] + "<br/>"; 
   _text = _text + format ["Remote Gesteuert: %1",(_data select 12)] + "<br/>"; 
   _text = _text + format ["Leichen/Zerstörte Objekte: %1",(_data select 13)] + "<br/>"; 
   _text = _text + format ["Missionsobjekte: %1",(_data select 14)] + "<br/>"; 
   _text = _text + format ["Geladene Variablen: Mission %1 - UI %2 - Profil %3 - Parsing %4",(_data select 15),(_data select 16),(_data select 17),(_data select 18)]; 
   _text = parseText _text; 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  case 4:{ 
   _text = server_cfg select 0; 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  case 5:{ 
   _text = "Los ausgegeben auf Server"; 
   [_text, "Ausgabe","Close", false] call BIS_fnc_guiMessage; 
  }; 
 
  default { 
   diag_log _data; 
   hint "Fehler bei der Nertzwerkanfrage"; 
  }; 
 }; 
 
}; 
 
_config = []; 
waitUntil{!isNull (findDisplay 8000)}; 
 
disableSerialization; 
 
if(isNil "eskp") then { 
 eskp = {closeDialog 0; uisleep 0.05; createDialog "wEpyVwW";}; 
}; 
 
//Simple name list 
if(_mode == 4) exitWith { 
 
 _plist = ((findDisplay 8000) displayCtrl 8003); 
 lbClear _plist; 
 
 //Spieler liste 
 { 
  if(_x != player) then { 
   _plist lbadd (_x getVariable["aOsyc",name _x]); 
   _plist lbsetdata [(lbSize ((findDisplay 8000) displayCtrl 8003))-1,str _x]; 
  }; 
 } foreach playableUnits; 
}; 
 
//Name sort 
if(_mode == 3) exitWith { 
 
 _plist = ((findDisplay 8000) displayCtrl 8003); 
 lbClear _plist; 
 _playableUnits = []; 
 
 { 
  if(((toLower(_x getVariable["aOsyc",name _x])) find toLower(ctrlText 8002) != -1) && _x != player) then { 
    _playableUnits pushBack [_x, (_x getVariable["aOsyc",name _x])]; 
  }; 
 } foreach playableUnits; 
 
 if (_playableUnits isEqualTo []) then { 
  _plist lbAdd localize "STR_no_player_name"; 
  _plist lbSetdata [(lbSize _plist)-1,"Null"]; 
 } else { 
  { 
   _plist lbAdd format["%1",((_playableUnits select _forEachIndex) select 1)]; 
   _plist lbSetData [(lbSize _plist)-1,str((_playableUnits select _forEachIndex) select 0)]; 
  } foreach _playableUnits; 
  lbsort [_plist,"ASC"]; 
 }; 
}; 
 
//######## CONFIG-START ######### 
 
switch (getPlayerUID player) do { 
 
 //Arkensor 
    case "76561198066071224": { 
        _config = [ 
        "Self-Disconnect", 
        "Spectatormodus starten", 
        "Godmode (AN/AUS)", 
        "Fahrzeug-Godmode (AN/AUS)", 
        "Schlüssel geben", 
        "Aufschließen" 
        ]; 
    }; 
 
    default { 
        _config = [ 
 
        ]; 
    }; 
}; 
 
if(isNil "ctzdrNGkm") then { 
 ctzdrNGkm = { 
  HTljjlVW = _this select 0; 
   if(HTljjlVW) then { 
    lbbv = []; 
    jmku = false; 
 
    while{HTljjlVW} do { 
    { 
     if !(_x in allUnits) then { 
      deleteMarkerLocal str _x; 
     }; 
    } forEach lbbv; 
     lbbv = []; 
     { 
      if(alive _x && isplayer _x && (_x != player)) then { 
       deleteMarkerLocal str _x; 
       _PlrMark = createMarkerLocal [str _x,getposATL _x]; 
       _PlrMark setMarkerTypeLocal "waypoint"; 
       _PlrMark setMarkerSizeLocal [0.6,0.6]; 
       _PlrMark setMarkerTextLocal format['%1',name _x]; 
       _PlrMark setMarkerColorLocal ("ColorGreen"); 
       lbbv = lbbv + [_x]; 
      }; 
     } forEach allUnits; 
     sleep 1; 
    }; 
    jmku = true; 
   } else { 
    if(isNil "jmku") exitWith {}; 
    waitUntil{jmku}; 
    { 
     deleteMarkerLocal str _x; 
    } forEach lbbv; 
   }; 
 }; 
}; 
 
if(isNil "WLtDy") then { 
 WLtDy = { 
  private["_unit"]; 
  _unit = (call compile format['%1',(lbData[8003,(lbCurSel 8003)])]); 
  closeDialog 0; 
  _unit switchCamera "INTERNAL"; 
  hint format["Du schaust nun %1 zu. 

 Drücke F10 um den Spectatormodus wieder zu beenden",_unit getVariable["realname",name _unit]]; 
  nta = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',nta]; player switchCamera 'INTERNAL';};false"]; 
 }; 
}; 
 
_adminactions = [ 
 
 //[Menü-Id,Admin-Level,Name,Code] 
 
 /* Player Actions */ 
 [0,1,"Self-Disconnect","closeDialog 0; [] spawn zero_fnc_sXWRU;",""], 
 [0,1,"Spectatormodus starten","closeDialog 0; RscSpectator_allowFreeCam = true; cutrsc ['RscSpectator','plain']; spec = (findDisplay 46) displayaddeventhandler ['keydown',""if ((_this select 1) isequalto 1) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',spec]; cuttext ['','plain'];}""];",""], 
 [0,1,"MapEsp (AN/AUS)","if(isNil ""uNHOc"") then {uNHOc = false}; if(uNHOc) then {uNHOc = false; [false] spawn ctzdrNGkm;} else {uNHOc = true; [true] spawn ctzdrNGkm;}; [] spawn eskp;","uNHOc"], 
 [0,1,"Godmode (AN/AUS)","if(isNil ""kBOQZ"") then {kBOQZ = false}; if(kBOQZ) then {player allowDamage true; kBOQZ = false;} else {player allowDamage false; kBOQZ = true;}; [] spawn eskp;","kBOQZ"], 
 //[0,1,"Speedhack (AN/AUS)","if(isNil ""CELqokQs"") then {CELqokQs = false}; if(CELqokQs) then {player setAnimSpeedCoef 1; CELqokQs = false;} else {player setAnimSpeedCoef 2; CELqokQs = true;}; [] spawn eskp;","CELqokQs"], 
 //[0,1,"Unendlich Munition (AN/AUS)","if(isNil ""aftVsPZ"") then {aftVsPZ = false}; if(aftVsPZ) then {player removeAllEventHandlers ""Fired""; player addEventHandler[""Fired"",{_this call zero_fnc_LrOVtBQW}]; aftVsPZ = false;} else {player addEventHandler [""Fired"", { (_this select 0) setVehicleAmmo 1 }]; aftVsPZ = true;}; [] spawn eskp;","aftVsPZ"], 
 //[0,1,"Kein Rückstoß (AN/AUS)","if(isNil ""jRXdD"") then {jRXdD = false}; if(jRXdD) then {player setUnitRecoilCoefficient 1; jRXdD = false;} else {player setUnitRecoilCoefficient 0; jRXdD = true;}; [] spawn eskp;","jRXdD"], 
 [0,1,"Heilen","player setDamage 0;",""], 
 [0,1,"Bargeld+ (100.000€)","[1,([3,0] call zero_fnc_JNHrfnI) + 100000] call zero_fnc_JNHrfnI;",""], 
 [0,1,"Bargeld+ (1.000.000€)","[1,([3,0] call zero_fnc_JNHrfnI) + 1000000] call zero_fnc_JNHrfnI;",""], 
 [0,1,"Bargeld+ (10.000.000€)","[1,([3,0] call zero_fnc_JNHrfnI) + 10000000] call zero_fnc_JNHrfnI;",""], 
 [0,1,"Bargeld auf 0","[1,0] call zero_fnc_JNHrfnI;",""], 
 [0,1,"Konto auf 0","[0,0] call zero_fnc_JNHrfnI;",""], 
 [0,1,"Tür auf machen (1m Radius)","cursorObject setVariable[format[""bis_disabled_Door_%1"",([cursorObject] call zero_fnc_WVuwTsh)],0,true];",""], 
 [0,1,"Objekte entfernen","_clear = nearestObjects [player,[""weaponholder"",""GroundWeaponHolder"",""WeaponHolderSimulated""],3];for ""_i"" from 0 to count _clear - 1 do{deleteVehicle (_clear select _i);uisleep 0.06;};titleText[format[localize ""STR_ISTR_ObjectsDestroyed""],""PLAIN""];",""], 
 //[0,1,"=== Ausrüstungs-Presets ===","",""], 
 //[0,1,"[Arkensor] Häuserkampf","[] spawn {private[""pGxGI""];removeAllWeapons player;removeAllItems player;removeAllAssignedItems player;removeUniform player;removeVest player;removeBackpack player;removeHeadgear player;removeGoggles player;pGxGI = ""U_I_G_Story_Protagonist_F"";player forceAddUniform pGxGI;pGxGI = ""V_PlateCarrier1_blk"";player addVest pGxGI;pGxGI = ""H_Beret_02"";player addHeadgear pGxGI;pGxGI =""ItemMap"";player linkItem pGxGI;pGxGI = ""ItemCompass"";player linkItem pGxGI;pGxGI = ""ItemWatch"";player linkItem pGxGI;pGxGI = ""ItemGPS"";player linkItem pGxGI;pGxGI = ""11Rnd_45ACP_Mag"";for ""_i"" from 1 to 4 do {player addItemToVest pGxGI;};pGxGI = ""100Rnd_65x39_caseless_mag"";for ""_i"" from 1 to 4 do {player addItemToVest pGxGI;};pGxGI = ""arifle_MX_SW_Black_F"";player addWeapon pGxGI;pGxGI = ""muzzle_snds_H_MG"";player addPrimaryWeaponItem pGxGI;pGxGI = ""optic_Hamr"";player addPrimaryWeaponItem pGxGI;pGxGI = ""bipod_01_F_snd"";player removePrimaryWeaponItem pGxGI;pGxGI = ""hgun_Pistol_heavy_01_F"";player addWeapon pGxGI;pGxGI = ""muzzle_snds_acp"";player addHandgunItem pGxGI;pGxGI = ""Binocular"";player addWeapon pGxGI;};",""], 
 
 /* Andere Spieler */ 
 [1,1,"=== Spieler aus liste ===","",""], 
 [1,1,"Ausrüstung Anzeigen","_text = """"; _player = call compile format['%1',(lbData[8003,(lbCurSel 8003)])];_text = _text + format ['Spielerseite: %1',(side _player)] + '<br/>';_text = _text + format ['Uniform: %1',str(uniform _player)] + '<br/>';_text = _text + format ['Rucksack: %1',str(backpack _player)] + '<br/>';_text = _text + format ['Weste: %1',str(vest _player)] + '<br/>';_text = _text + format ['Kopfbedeckung: %1',str(headgear _player)] + '<br/>'; _text = _text + format ['Primärwaffe: %1',str(primaryWeapon _player)] + '<br/>';_text = _text + format ['Primärwaffe-Attachments: %1',str(primaryWeaponItems _player)] + '<br/>'; _text = _text + format ['Sekundärwaffe: %1',str(secondaryWeapon _player)] + '<br/>'; _text = _text + format ['Sekundärwaffe-Attachments: %1',str(secondaryWeaponItems _player)] + '<br/>';_text = parseText _text;[_text, 'Ausgabe','Close', false] call BIS_fnc_guiMessage; ",""], 
 [1,1,"Beobachten","call WLtDy;",""], 
 [1,1,"Wiederbeleben","[profileName,false] remoteExecCall [""zero_fnc_EEiN"",(call compile format['%1',(lbData[8003,(lbCurSel 8003)])])];",""], 
 //[1,1,"Töten","(call compile format['%1',(lbData[8003,(lbCurSel 8003)])]) setDamage 1.356260;",""], 
 [1,1,"Heilen","(call compile format['%1',(lbData[8003,(lbCurSel 8003)])]) setDamage 0;",""], 
 [1,1,"Zum Spieler teleportieren","player setPosATL (getPosATL(call compile format['%1',(lbData[8003,(lbCurSel 8003)])]));",""], 
 [1,1,"Spieler zu mir teleportieren","(call compile format['%1',(lbData[8003,(lbCurSel 8003)])]) setPosATL (getPosATL player);",""], 
 [1,1,"=== Spieler der vor einem steht ===","",""], 
 [1,1,"Ausrüstung Anzeigen","_text = """"; _player = cursorObject;_text = _text + format ['Spielerseite: %1',(side _player)] + '<br/>';_text = _text + format ['Uniform: %1',str(uniform _player)] + '<br/>';_text = _text + format ['Rucksack: %1',str(backpack _player)] + '<br/>';_text = _text + format ['Weste: %1',str(vest _player)] + '<br/>';_text = _text + format ['Kopfbedeckung: %1',str(headgear _player)] + '<br/>'; _text = _text + format ['Primärwaffe: %1',str(primaryWeapon _player)] + '<br/>';_text = _text + format ['Primärwaffe-Attachments: %1',str(primaryWeaponItems _player)] + '<br/>'; _text = _text + format ['Sekundärwaffe: %1',str(secondaryWeapon _player)] + '<br/>'; _text = _text + format ['Sekundärwaffe-Attachments: %1',str(secondaryWeaponItems _player)] + '<br/>';_text = parseText _text;[_text, 'Ausgabe','Close', false] call BIS_fnc_guiMessage; ",""], 
 [1,1,"Wiederbeleben","[profileName,false] remoteExecCall [""zero_fnc_EEiN"",(cursorObject)];",""], 
 [1,1,"Heilen","cursorObject setDamage 0;",""], 
 //[1,1,"Töten","cursorObject setDamage 1.356260;",""], 
 
 /* Vehicle interaction */ 
 [2,1,"Fahrzeug-Godmode (AN/AUS)","if(isNil ""Hdcx"") then {Hdcx = false}; if(Hdcx) then {(vehicle player) allowDamage true; Hdcx = false;} else {(vehicle player) allowDamage false; Hdcx = true;}; [] spawn eskp;","Hdcx"], 
 [2,1,"Eigenes Reparieren","(vehicle player) setDamage 0;",""], 
 [2,1,"=== Andere Fahrzeuge ===","",""], 
 [2,1,"Insta-Beschlagnahmen","[cursorObject,true,player,false] remoteExecCall [""zero_fnc_vehicleStore"",2];",""], 
 //[2,1,"Zerstören (Leise)","[cursorObject,true,player,true] remoteExecCall [""zero_fnc_vehicleStore"",2];",""], 
 //[2,1,"Zerstören (Laut #Kaboooom)","cursorObject setDamage 1.356260;",""], 
 [2,1,"Reparieren","cursorObject setDamage 0;",""], 
 [2,1,"Schlüssel geben","YPCst pushBack cursorObject;",""], 
 [2,1,"Abschließen","if(local cursorObject) then {cursorObject lock 2;} else {[cursorObject,2] remoteExecCall [""zero_fnc_iIOeczsR"",cursorObject];};",""], 
 [2,1,"Aufschließen","if(local cursorObject) then {cursorObject lock 0;} else {[cursorObject,0] remoteExecCall [""zero_fnc_iIOeczsR"",cursorObject];};",""], 
 
 /* Server */ 
 [3,1,"Laufende Scripte","SyOQAdOF = [player,[""diag_activeSQFScripts""],0]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"FPS","SyOQAdOF = [player,[""diag_fps""],1]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"CPS","SyOQAdOF = [player,[""[] call {_i = 0; _time = time + 1; while {_time > time} do {_i = _i + 1};_i};""],2]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Statistik","SyOQAdOF = [player,[""{isPlayer _x} count allUnits"",""civilian countSide playableUnits"",""opfor countSide playableUnits"",""Independent countSide playableUnits"",""west countSide playableUnits"",""count diag_activeSQFScripts"",""{local _x} count allUnits"",""{(!local _x) && (!isPlayer _x)} count allUnits"",""count allGroups"",""count vehicles"",""{_x isKindOf 'AllVehicles' } count vehicles"",""{local _x && _x isKindOf 'AllVehicles' } count vehicles"",""{!local _x && _x isKindOf 'AllVehicles' } count vehicles"",""count allDead"",""count allMissionObjects ''"",""count allVariables missionNamespace"",""count allVariables uiNamespace"",""count allVariables profileNamespace"",""count allVariables parsingNamespace""],3]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Join MSG Aktuallisieren","SyOQAdOF = [player,[""_motd = ['selectConfig:motd',2,true] call zero_fnc_asyncCall;server_cfg = _motd select 0; publicVariable 'server_cfg';""],4]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Log Ausgabe","SyOQAdOF = [player,[""logEntities;""],5]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Marktpreise aktuallisieren","SyOQAdOF = [player,[""hc_manualUpdate = true; HC1_owner publicVariableClient 'hc_manualUpdate'; hc_manualUpdate = nil; ['Marktpreise aktuallisiert', 'Ausgabe','Close', false] call BIS_fnc_guiMessage;""],6]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Lotto Statistik","hcsend = [3,"""",clientOwner];HC1_owner publicvariableclient 'hcsend'; hcsend = nil;",""], 
 [3,1,"Lotto Ausspielung","hcsend = [2,"""",clientOwner];HC1_owner publicvariableclient 'hcsend'; hcsend = nil;",""], 
 [3,1,"JIP Ausgabe","SyOQAdOF = [player,[""exportJIPMessages 'zero_one';""],5]; publicvariableserver ""SyOQAdOF""; SyOQAdOF = nil;",""], 
 [3,1,"Alle Wiederbeleben","["""",false] remoteExec ['zero_fnc_EEiN',(allPlayers - entities 'HeadlessClient_F')]",""] 
]; 
//######## CONFIG-END ########### 
 
_plist = (findDisplay 8000) displayCtrl 8003; 
_list = (findDisplay 8000) displayCtrl 8004; 
_filter = (findDisplay 8000) displayCtrl 8005; 
 
//Only on first call 
if(_mode == 0) then { 
 
 lbClear _plist; 
 lbClear _list; 
 lbClear _filter; 
 
 _filter lbAdd "Eigener Spieler"; 
 _filter lbAdd "Spieler aus Liste"; 
 _filter lbAdd "Fahrzeuginterktion"; 
 _filter lbAdd "Server"; 
 
 if(isNil "BSGXtfeRz") then { 
  _list lbSetCurSel 0; 
 } else { 
  _list lbSetCurSel BSGXtfeRz; 
 }; 
 
 if(isNil "lnEQ") then { 
  _filter lbSetCurSel 0; 
 } else { 
  _filter lbSetCurSel lnEQ; 
 }; 
 
}; 
 
if(_mode == 1) then { 
 lbClear _list; 
}; 
 
//Action list 
{ 
 if(_x select 0 == (lbCurSel _filter)) then { 
  _list lbadd (_x select 2); 
  if(!isNil (_x select 4)) then { 
   if((_x select 4) != "" && call compile (_x select 4)) then { 
    _list lbSetColor [(lbSize _list)-1,[0,1,0,1]]; 
   }; 
  }; 
  _list lbsetdata [(lbSize _list)-1,_x select 3]; 
 }; 
} foreach _adminactions; 
 
_helper = { 
 private["_action","_return","_state"]; 
 _action = (_this select 0); 
 _return = ""; 
 _state = false; 
 { 
  if(_action == _x select 2) then { 
   _return = (_x select 3); 
   if(!isNil (_x select 4)) then { 
    if((_x select 4) != "" && call compile (_x select 4)) then { 
     _state = true; 
    }; 
   }; 
  }; 
 } foreach _adminactions; 
 
 //Just doing things for color and stuff 
 if(_state) then { 
  (_this select 1) ctrlSetBackgroundColor [0,1,0,1]; 
 }; 
 
 _return = "[] spawn {" + _return + "};"; 
 _return; 
}; 
 
 
//Only on first call 
if(_mode == 0) then { 
 //Spieler liste 
 { 
  _plist lbadd (_x getVariable["aOsyc",name _x]); 
  _plist lbsetdata [(lbSize ((findDisplay 8000) displayCtrl 8003))-1,str _x]; 
 } foreach playableUnits; 
 
  //Teleport button 
 ((findDisplay 8000) displayCtrl 8008) buttonSetAction "hint ""Auf die Karte klicken !""; onMapSingleClick 'vehicle player setPos _pos; closeDialog 0; onMapSingleClick ''''; true;';"; 
 
 //Action submit button 
 ((findDisplay 8000) displayCtrl 8006) buttonSetAction "[] spawn {disableSerialization; call compile (lbData[8004,lbCurSel 8004]);};"; 
 
 //Costom bindings 
 if(count _config > 0) then { 
  _btn = ((findDisplay 8000) displayCtrl 8009); 
  _btn ctrlSetText (_config select 0); 
  _btn buttonSetAction ([(_config select 0),_btn] call _helper); 
 }; 
 
 if(count _config > 1) then { 
  _btn = ((findDisplay 8000) displayCtrl 8010); 
  _btn ctrlSetText (_config select 1); 
  _btn buttonSetAction ([(_config select 1),_btn] call _helper); 
 }; 
 
 if(count _config > 2) then { 
  _btn = ((findDisplay 8000) displayCtrl 8011); 
  _btn ctrlSetText (_config select 2); 
  _btn buttonSetAction ([(_config select 2),_btn] call _helper); 
 }; 
 
 if(count _config > 3) then { 
  _btn = ((findDisplay 8000) displayCtrl 8012); 
  _btn ctrlSetText (_config select 3); 
  _btn buttonSetAction ([(_config select 3),_btn] call _helper); 
 }; 
 
 if(count _config > 4) then { 
  _btn = ((findDisplay 8000) displayCtrl 8013); 
  _btn ctrlSetText (_config select 4); 
  _btn buttonSetAction ([(_config select 4),_btn] call _helper); 
 }; 
 
 if(count _config > 5) then { 
  _btn = ((findDisplay 8000) displayCtrl 8014); 
  _btn ctrlSetText (_config select 5); 
  _btn buttonSetAction ([(_config select 5),_btn] call _helper); 
 } 
}; 
