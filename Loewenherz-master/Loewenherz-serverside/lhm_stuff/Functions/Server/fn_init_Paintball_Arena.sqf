#define DEBUG 
/* 
[unit,causedBy,damage] 
"DEBUG: Hit: _this = [B Alpha 2-2:1,C Alpha 1-1:1 ([DEV]Leo),1.16935]" 
 
[unit,selectionName,damage,source,projectile] 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"head",2.48619,<NULL-object>,"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"",1.16985,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"",1.16985,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"head",2.48619,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"body",0.00193587,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"hand_l",0.0380251,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
"DEBUG: HandleDamage: _this = [B Alpha 4-3:1,"leg_l",0.000487207,C Alpha 1-1:1 ([DEV]Leo),"B_762x51_Ball"]" 
 
[target,shooter,bullet,position,velocity,selection,ammo,direction,radius,surface,direct] 
"DEBUG: HitPart: _this = [[B Alpha 3-3:1,C Alpha 1-1:1 ([DEV]Leo),1780415: tracer_white.p3d,[14700.8,16229,19.4934],[-626.08,536.922,77.1043],["head"],[12,0,0,0,"B_762x51_Ball"],[0.674016,-0.593183,-0.440268],0.128259,"A3\data_f\Penetration\meatbones.bisurf",true]]" 
 
****** Configuration ****** 
Map Marker: 
pbexit = Ausgang Paintball Arena 
pbbluespawn = Startpunkt des blauen teams wenn das Spiel beginnt 
pbredspawn = Startpunkt des roten Teams wenn das Spiel beginnt 
 
Beide Helipads mit Namen (Square Helipad) 
MeetPointBlue = Team Sammelpunkt Blau 
MeetPointRed = Team Sammelpunkt Rot 
*/ 
 
//Vars 
LHM_VAR_DAMAGE = 0; 
LHM_VAR_HINTS = ""; 
LHM_VAR_HINTS2 = ""; 
LHM_VAR_TRIGGERRED_LIST = "[]"; 
LHM_VAR_TRIGGERBLUE_LIST = "[]"; 
LHM_VAR_PAINTBALL_ON = true; //move to DB ?! 
LHM_VAR_PB_MATCH_STARTED = false; 
LHM_VAR_PB_MATCH_RUNNING = false; 
publicVariable "LHM_VAR_PB_MATCH_RUNNING"; 
LHM_VAR_PB_TICKET_COSTS = 5000; 
publicVariable "LHM_VAR_PB_TICKET_COSTS"; 
LHM_VAR_MATCH_TIME = 600; 
LHM_VAR_TEST_MODE = false; //Change on release !!! 
LHM_VAR_PB_JACKPOT = 0; 
publicVariable "LHM_VAR_PB_JACKPOT"; 
LHM_VAR_PB_WALLS = []; 
LHM_VAR_TEAM_RED = []; 
LHM_VAR_TEAM_BLUE = []; 
LHM_VAR_PB_WAIT_TIME = 45; 
Grp_TeamRed = []; 
publicVariable "Grp_TeamRed"; 
Grp_TeamBlue = []; 
publicVariable "Grp_TeamBlue"; 
// 
 
lhm_fnc_hint = {hintsilent format["%1",_this];}; 
 
 
lhm_fnc_playSound = {PlaySound format["%1",_this];}; 
 
 
lhm_fnc_PB_ClientHandleDamage = { 
 Private ["_ret","_multiplier","_target","_source","_selection","_damagein","_paintball"]; 
 _target = _this select 0; 
 _source = _this select 3; 
 if ((isNull _source) || (isNull _target)) exitWith {0}; 
 if (_source == _target) exitWith {0}; 
 _paintball = _target getVariable ["LHM_PaintBallStatus",false]; 
 if (!_paintball) exitWith {0}; 
 _selection = _this select 1; 
 if (_selection == "") exitWith {0}; 
 _damagein = (round((_this select 2) * 100)) / 100; 
 if (_damagein > 0) then { 
  _multiplier = switch(_selection) do 
  { 
   case "hands": {1}; 
   case "legs":  {1}; 
   case "body": {2}; 
   case "head":  {5}; 
   default   {0}; 
  }; 
  diag_log format["DEBUG: HandleDamage: _damagein = %2 _multiplier = %3 distance = %4 _this = %1", _this, _damagein,_multiplier,(_target distance _source)]; 
  LHM_VAR_DAMAGE = LHM_VAR_DAMAGE + (_damagein * _multiplier * (_target distance _source)); 
 }; 
 _ret = 0; 
 _ret 
}; 
 
 
lhm_fnc_PB_PlayerHandleDamage = { 
 Private ["_ret","_multiplier","_target","_source","_selection","_damagein","_paintball"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_PlayerHandleDamage: _this = %1",_this]; 
 #endif 
 if(!((_this select 4) in ["B_556x45_Ball_Tracer_Yellow","B_556x45_Ball_Tracer_Green"])) exitWith {0}; 
 _target = _this select 0; 
 _source = _this select 3; 
 if ((isNull _source) || (isNull _target)) exitWith {0}; 
 if (_source == _target) exitWith {0}; 
 if ((_source in Grp_TeamBlue) && (_target in Grp_TeamBlue)) exitWith {0}; 
 if ((_source in Grp_TeamRed) && (_target in Grp_TeamRed)) exitWith {0}; 
 _paintball = _target getVariable ["LHM_PaintBallStatus",false]; 
 if (!_paintball) exitWith {0}; 
 _selection = _this select 1; 
 if (_selection == "") exitWith {0}; 
 _damagein = (round((_this select 2) * 100)) / 100; 
 if (_damagein > 0) then { 
  _multiplier = switch(_selection) do 
  { 
   case "hands": {1}; 
   case "legs":  {1}; 
   case "body": {2}; 
   case "head":  {5}; 
   default   {0}; 
  }; 
  if (LHM_VAR_PB_MATCH_RUNNING) then { 
   LHM_VAR_PB_HP = round (LHM_VAR_PB_HP - (_damagein * 7.5)); 
   if (LHM_VAR_PB_HP < 1) then { 
    LHM_VAR_PB_KILLER = _source; 
    LHM_VAR_PB_HP = 0; 
   }; 
  }; 
 }; 
 _ret = 0; 
 _ret 
}; 
 
 
lhm_fnc_ClientPaintBallInit = { 
 
 LHM_VAR_DAMAGE = 0; 
 LHM_VAR_PB_HP = 100; 
 LHM_VAR_PB_KILLER = objNull; 
 [] spawn { 
  while {true} do { 
   waitUntil{sleep 5;!((player getVariable ["LHM_PB_ATM_CASH",0]) == (lhm_atmcash))}; 
   player setVariable ["LHM_PB_ATM_CASH",lhm_atmcash,true]; 
  }; 
 }; 
 diag_log "::lhm Client:: Paintball initialization complete"; 
}; 
 
 
lhm_fnc_PB_ClientMoveToArena = { 
 Private ["_group","_pos","_errorcount","_errorbit","_startpos"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_ClientMoveToArena: %1 ",_this]; 
 #endif 
 _player = _this select 0; 
 if (!(_player == player)) exitWith {"ERROR" hintC format["Error: PBA: %1",__LINE__]}; 
 _group =  _this select 1; 
 _startpos = []; 
 _pos = [0,0,0]; 
 _errorcount = 0; 
 _errorbit = false; 
 
 if(dialog) then { 
  closeDialog 0; 
 }; 
 lhm_canOpenPMenu = false; 
 
 disableUserInput true; 
 3 cutRsc ["SplashNoise","BLACK"]; 
 [format["<t size='1.3' color='#FF0000'>WELCOME TO PAINTBALL ARENA</t><br/>Prepare to Fight"],0,0.2,10,1,0,8] spawn BIS_fnc_dynamicText; 
 playSound "pbprepare"; 
 
 // force Save current Gear 
 _handle = [] spawn lhm_fnc_saveGear; 
 waitUntil{ScriptDone _handle}; 
 
 // remove everything 
 _handle = [] spawn lhm_fnc_stripDownPlayer; 
 waitUntil {scriptDone _handle}; 
 
 {missionNamespace setVariable[_x,0];} foreach lhm_inv_items; 
 
 
 
 switch (_group) do 
 { 
  case "RED" : { 
   _startpos = getMarkerPos "pbredspawn"; // Startpos in Arena Red 
   player forceaddUniform "U_O_Protagonist_VR"; 
   player addVest "V_BandollierB_blk"; 
   player addweapon "arifle_SDAR_F"; 
   player addMagazines ["30Rnd_556x45_Stanag_Tracer_Yellow",10]; 
   player selectWeapon "arifle_SDAR_F"; 
   reload player; 
  }; 
  case "BLUE" : { 
   _startpos =  getMarkerPos "pbbluespawn";; // StartPos in Arena Blue 
   player forceaddUniform "U_B_Protagonist_VR"; 
   player addVest "V_BandollierB_blk"; 
   player addweapon "arifle_SDAR_F"; 
   player addMagazines ["30Rnd_556x45_Stanag_Tracer_Green",10]; 
   player selectWeapon "arifle_SDAR_F"; 
   reload player; 
  }; 
 }; 
 if ((count _startpos) < 3) exitWith {"ERROR" hintC format["Error: PBA: %1",__LINE__]}; 
 while {(_startpos distance _pos) > 20} do { 
  _pos = (nearestObject [_startpos,"Land_Metal_Shed_F"]) buildingPos (round(random 6)); 
  _errorcount = _errorcount + 1; 
  if (_errorcount > 19) exitWith { 
   _errorbit = true; 
  }; 
  //hintsilent format["%1",(_startpos distance _pos)]; 
  sleep 0.01; 
 }; 
 if (_errorbit) exitWith {"ERROR" hintC format["Kein gueltiger Spawnpunkt gefunden!"];}; 
 player setPos _pos; // Port player into area 
 sleep 0.1; 
 Hint ""; 
 if (LHM_VAR_PB_MATCH_RUNNING) then { 
  [] spawn lhm_fnc_PB_ClientMatchRunning; 
 }; 
}; 
 
 
lhm_fnc_PB_JoinTeam = { 
 Private ["_player","_team"]; 
 _player = _this select 0; 
 _team = _this select 1; 
 switch (_team) do 
 { 
  case "RED" : { 
   Grp_TeamRed pushBack _player; 
   publicVariable "Grp_TeamRed"; 
  }; 
  case "BLUE" : { 
   Grp_TeamBlue pushBack _player; 
   publicVariable "Grp_TeamBlue"; 
  }; 
 }; 
}; 
 
 
lhm_fnc_PB_LeaveTeam = { 
 if (_this in Grp_TeamRed) then { 
  Grp_TeamRed = Grp_TeamRed - [_this]; 
  publicVariable "Grp_TeamRed"; 
 }; 
 if (_this in Grp_TeamBlue) then { 
  Grp_TeamBlue = Grp_TeamBlue - [_this]; 
  publicVariable "Grp_TeamBlue"; 
 }; 
}; 
 
 
lhm_fnc_PB_ClientMoveOutArena = { 
 Private ["_group","_pos","_errorcount","_errorbit","_exitPos"]; 
 _player = _this select 0; 
 if (!(_player == player)) exitWith {"ERROR" hintC format["Error: PBA: %1",__LINE__]}; 
 _group =  _this select 1; 
 _pos = [0,0,0]; 
 _exitPos = getMarkerPos "pbexit"; 
 _errorcount = 0; 
 _errorbit = false; 
 
 
 //move Buffs back 
 koffer_1 setPos (getMarkerPos "HealthBuff_1"); 
 koffer_2 setPos (getMarkerPos "smokeBuff"); 
 koffer_3 setPos (getMarkerPos "HealthBuff_2"); 
 koffer_4 setPos (getMarkerPos "HealthBuff_3"); 
 koffer_5 setPos (getMarkerPos "HealthBuff_4"); 
 koffer_6 setPos (getMarkerPos "Magazin_Buff"); 
 
 
 disableUserInput true; 
 3 cutRsc ["SplashNoise","BLACK"]; 
 [format["<t size='1.3' color='#FF0000'>PAINTBALL ARENA</t><br/>Thanks for playing"],0,0.2,3,0,0,8] spawn BIS_fnc_dynamicText; 
 
 // force remove stuff 
 _handle = [] spawn lhm_fnc_stripDownPlayer; 
 waitUntil {scriptDone _handle}; 
 
 // add old stuff 
 _handle = [] spawn lhm_fnc_loadGear; 
 waitUntil{ScriptDone _handle}; 
 
 if ((count _exitPos) < 3) exitWith { 
  "ERROR" hintC format["Error: PBA: %1",__LINE__]; 
  _pos = [_exitPos,0,10,0.01,0,100,0] call BIS_fnc_findSafePos; //  Market 
  player setPos _pos; 
 }; 
 while {(_exitPos distance _pos) > 20} do { 
  _pos = [_exitPos,0,5,0.01,0,100,0] call BIS_fnc_findSafePos; // Market 
  _pos set [2,0]; 
  _errorcount = _errorcount + 1; 
  if (_errorcount > 19) exitWith { 
   _errorbit = true; 
  }; 
  sleep 0.01; 
 }; 
 if (_errorbit) then { 
  _pos = [_exitPos,0,10,0.01,0,100,0] call BIS_fnc_findSafePos; //  Market 
 }; 
 sleep 0.1; 
 player setPos _pos; 
 sleep 0.5; 
 player playActionNow "Stop"; 
 [player,"lhm_fnc_PB_LeaveTeam",FALSE,FALSE] call lhm_fnc_mp; 
 player setVariable ["LHM_PB_OldGroup",nil,true]; 
 player setVariable ["LHM_PaintBallStatus",false,true]; 
 LHM_VAR_PB_HP = 100; 
 sleep 5; 
 player removeAllEventHandlers "HandleDamage"; 
 player addEventHandler["handleDamage",{_this call lhm_fnc_handleDamage;}]; 
 
 lhm_canOpenPMenu = true; 
 
 3 cutFadeOut 3; 
 disableUserInput false; 
}; 
 
 
lhm_fnc_PB_ClientMatchRunning = { 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_ClientMatchRunning: %1 ",_this]; 
 #endif 
 
 // if(isServer) then { 
  // [] spawn { 
   // for "_i" from 1 to 10 do { 
    // _color = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"] call BIS_fnc_selectRandom; 
    // _pos = getMarkerPos "pbarena"; 
    // _pos = [(_pos select 0) - 50 + random 100, (_pos select 1) - 50 + random 100, 0]; 
    // _smoke = createVehicle [_color, _pos,[], 0, "NONE"]; 
    // sleep 10; 
   // }; 
  // }; 
 // }; 
 
 sleep 2; 
 for "_i" from 1 to 3 do { 
  [format["<t size='1.3' color='#FF0000'>PAINTBALL ARENA</t><br/>Get Ready - %1",(4 - _i)],0,0.2,4,0,0,8] spawn BIS_fnc_dynamicText; 
  switch (_i) do 
  { 
   case 1 : {playSound "pbthree";}; 
   case 2 : {playSound "pbtwo";}; 
   case 3 : {playSound "pbone";}; 
  }; 
  sleep 1.5; 
 }; 
 [format["<t size='1.3' color='#FF0000'>PAINTBALL ARENA</t><br/>FIGHT"],0,0.2,1.5,0,0,8] spawn BIS_fnc_dynamicText; 
 3 cutFadeOut 2; 
 playSound "pbfight"; 
 disableUserInput false; 
 
 while {LHM_VAR_PB_MATCH_RUNNING} do { 
  //hintsilent format["PB HP: %1",LHM_VAR_PB_HP]; 
  [format["PB <t size='1' color='#FF0000'>Health %1%2</t>",LHM_VAR_PB_HP,"%"],-1, 1.2, 1, 0, 0, 11123] spawn BIS_fnc_dynamicText; // new design 
 
  if (LHM_VAR_PB_HP < 1) then { 
   if (player in Grp_TeamRed) then { 
    player setVariable ["LHM_PB_isOut",true,true]; 
    [player,"RED"] spawn lhm_fnc_PB_ClientMoveOutArena; 
    ["pbkill","lhm_fnc_playSound",LHM_VAR_PB_KILLER,FALSE] call lhm_fnc_mp; 
    sleep 3; 
    "You are OUT" hintC format["%1 has killed you.",name LHM_VAR_PB_KILLER]; 
   }; 
   if (player in Grp_TeamBlue) then { 
    [player,"BLUE"] spawn lhm_fnc_PB_ClientMoveOutArena; 
    ["pbkill","lhm_fnc_playSound",LHM_VAR_PB_KILLER,FALSE] call lhm_fnc_mp; 
    sleep 3; 
    "You are OUT" hintC format["%1 has killed you.",name LHM_VAR_PB_KILLER]; 
   }; 
   LHM_VAR_PB_MATCH_RUNNING = false; 
   LHM_VAR_PB_KILLER setVariable ["LHM_PB_Kills",((LHM_VAR_PB_KILLER getVariable ["LHM_PB_Kills",0]) + 1),true]; 
  }; 
  sleep 0.1; 
 }; 
}; 
 
lhm_fnc_PB_prepareClient = { 
 Private ["_olduniform"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_prepareClient: %1 ",_this]; 
 #endif 
 if (!(lhm_atmcash > LHM_VAR_PB_TICKET_COSTS)) exitWith { 
  Private ["_olduniform"]; 
  cutText [format["Du hast nicht genug Geld für ein Paintball-Ticket. Ein Ticket kostet %1$.",LHM_VAR_PB_TICKET_COSTS],"PLAIN DOWN"]; 
  [player,"lhm_fnc_PB_LeaveTeam",FALSE,FALSE] call lhm_fnc_mp; 
  _olduniform = uniform player; 
  removeUniform player; 
  player forceaddUniform _olduniform; 
 }; 
 if (lhm_atmcash > LHM_VAR_PB_TICKET_COSTS) then { 
  lhm_atmcash = [lhm_atmcash,false,LHM_VAR_PB_TICKET_COSTS,"PB_TICKET_COSTS"] call lhm_fnc_changeLHM_ATMCash; 
  [{LHM_VAR_PB_JACKPOT = LHM_VAR_PB_JACKPOT + LHM_VAR_PB_TICKET_COSTS;publicVariable "LHM_VAR_PB_JACKPOT"}, "BIS_fnc_spawn", false, false] call lhm_fnc_mp; 
  cutText [format["Du hast ein Paintball-Ticket fuer %1$ gekauft. [Bank]",LHM_VAR_PB_TICKET_COSTS],"PLAIN DOWN"]; 
 }; 
 player removeAllEventHandlers "HandleDamage"; 
 LHM_VAR_PB_HP = 100; 
 player addEventHandler["HandleDamage",{_this call lhm_fnc_PB_PlayerHandleDamage;}]; 
 player setVariable ["LHM_PaintBallStatus",true,true]; 
 player setVariable ["LHM_PB_Kills",0,true]; 
 player setVariable ["LHM_PB_isOut",false,true]; 
 LHM_VAR_TEAM_RED = (Grp_TeamRed); 
 LHM_VAR_TEAM_BLUE = (Grp_TeamBlue); 
 if (player in Grp_TeamRed) then { 
  [player,"RED"] spawn lhm_fnc_PB_ClientMoveToArena; 
 }; 
 if (player in Grp_TeamBlue) then { 
  [player,"BLUE"] spawn lhm_fnc_PB_ClientMoveToArena; 
 }; 
}; 
 
 
lhm_fnc_PB_ClientWon = { 
 Private ["_place","_pListSorted"]; 
 _pListSorted = [LHM_VAR_TEAM_RED + LHM_VAR_TEAM_BLUE] call lhm_fnc_PB_calcHighScore; 
 _place = (_pListSorted find player) + 1; 
 if (player in Grp_TeamRed) then { 
  [player,"RED"] spawn lhm_fnc_PB_ClientMoveOutArena; 
  sleep 2; 
  if (_place == 1) then { 
   [] spawn lhm_fnc_PB_First; 
  } else { 
   [] spawn lhm_fnc_PB_HintScore; 
  }; 
 }; 
 if (player in Grp_TeamBlue) then { 
  [player,"BLUE"] spawn lhm_fnc_PB_ClientMoveOutArena; 
  sleep 2; 
  if (_place == 1) then { 
   [] spawn lhm_fnc_PB_First; 
  } else { 
   [] spawn lhm_fnc_PB_HintScore; 
  }; 
 }; 
}; 
 
 
lhm_fnc_PB_setClientBack = { 
 Private ["_playerlist","_grpblue","_grpred"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_setClientBack: %1 ",_this]; 
 #endif 
 _grpblue = ""; 
 _grpred = ""; 
 _playerlist = ""; 
 if (player in Grp_TeamRed) then { 
  [player,"RED"] spawn lhm_fnc_PB_ClientMoveOutArena; 
  sleep 5; 
  [] spawn lhm_fnc_PB_HintScore; 
 }; 
 if (player in Grp_TeamBlue) then { 
  [player,"BLUE"] spawn lhm_fnc_PB_ClientMoveOutArena; 
  sleep 5; 
  [] spawn lhm_fnc_PB_HintScore; 
 }; 
}; 
 
 
lhm_fnc_PB_StartMatch = { 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_StartMatch: %1 ",_this]; 
 #endif 
 LHM_VAR_PB_JACKPOT = 0; 
 publicVariable "LHM_VAR_PB_JACKPOT"; 
 LHM_VAR_TEAM_RED = (Grp_TeamRed); 
 LHM_VAR_TEAM_BLUE = (Grp_TeamBlue); 
 LHM_VAR_TEAM_RED spawn { 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    [_x,"lhm_fnc_PB_prepareClient",(owner _x),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     [] call lhm_fnc_PB_prepareClient; 
    }; 
   }; 
   sleep 0.01; 
  } foreach _this; 
 }; 
 LHM_VAR_TEAM_BLUE spawn { 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    [_x,"lhm_fnc_PB_prepareClient",(owner _x),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     [] call lhm_fnc_PB_prepareClient; 
    }; 
   }; 
   sleep 0.01; 
  } foreach _this; 
 }; 
 if (!LHM_VAR_PB_MATCH_RUNNING) then { 
  [] spawn lhm_fnc_PB_MatchRunning; 
 }; 
}; 
 
lhm_fnc_PB_WonMatch = { 
 Private ["_teamRed","_teamBlue","_pListSorted","_index"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_WonMatch: %1 ",_this]; 
 #endif 
 _index = 0; 
 _teamRed = Grp_TeamRed; 
 _teamBlue = Grp_TeamBlue; 
 _teamRed spawn { 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    [[_x],"lhm_fnc_PB_ClientWon",(owner _x),FALSE] call lhm_fnc_mp; 
   }; 
   sleep 0.001; 
  } foreach _this; 
 }; 
 _teamBlue spawn { 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    [[_x],"lhm_fnc_PB_ClientWon",(owner _x),FALSE] call lhm_fnc_mp; 
   }; 
   sleep 0.001; 
  } foreach _this; 
 }; 
 [] spawn {sleep 5;LHM_VAR_PB_MATCH_STARTED = false;Grp_TeamRed = [];Grp_TeamBlue = [];}; 
}; 
 
lhm_fnc_PB_EndMatch = { 
 Private ["_teamRed","_teamBlue","_playerobj","_playerkills","_highest","_index","_playerobjSorted"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_EndMatch: %1 ",_this]; 
 #endif 
 _teamRed = Grp_TeamRed; 
 _teamBlue = Grp_TeamBlue; 
 _playerobjSorted = [_teamRed + _teamBlue] call lhm_fnc_PB_calcHighScore; 
 _playerobj = []; 
 _playerkills = []; 
 _teamRed spawn { // call 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    _playerobj pushBack _x; 
    _player pushBack (_x getVariable ["LHM_PB_Kills",0]); 
    [_x,"lhm_fnc_PB_setClientBack",(owner _x),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     [] call lhm_fnc_PB_setClientBack; 
    }; 
   }; 
  sleep 0.01; 
  } foreach _this; 
 }; 
 _teamBlue spawn { // call 
  { 
   if ((isPlayer _x) || LHM_VAR_TEST_MODE) then { 
    _playerobj pushBack _x; 
    _playerkills pushBack (_x getVariable ["LHM_PB_Kills",0]); 
    [_x,"lhm_fnc_PB_setClientBack",(owner _x),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     [] call lhm_fnc_PB_setClientBack; 
    }; 
   }; 
  sleep 0.01; 
  } foreach _this; 
 }; 
 _firstplayer = _playerobjSorted select 0; 
 _secondplayer = _playerobjSorted select 1; 
 _thirdplayer = _playerobjSorted select 2; 
 if (!isnil "_firstplayer") then { 
  if (!isNull _firstplayer) then { 
   [_firstplayer,"lhm_fnc_PB_First",(owner _firstplayer),FALSE] call lhm_fnc_mp; 
  }; 
 }; 
 if (!isnil "_secondplayer") then { 
  if (!isNull _secondplayer) then { 
   //[_secondplayer,"lhm_fnc_PB_Second",(owner _secondplayer),FALSE] call lhm_fnc_mp; 
  }; 
 }; 
 if (!isnil "_thirdplayer") then { 
  if (!isNull _thirdplayer) then { 
   //[_thirdplayer,"lhm_fnc_PB_Third",(owner _thirdplayer),FALSE] call lhm_fnc_mp; 
  }; 
 }; 
 { 
 }; 
 [] spawn {sleep 5;LHM_VAR_PB_MATCH_STARTED = false;Grp_TeamRed = [];Grp_TeamBlue = [];}; 
}; 
 
//[LHM_VAR_TEAM_RED + LHM_VAR_TEAM_BLUE] call lhm_fnc_PB_calcHighScore; 
lhm_fnc_PB_calcHighScore = { 
 Private ["_players","_highest","_playersSorted"]; 
 _players = _this select 0; 
 _playersSorted = [_players,[],{_x getVariable ["LHM_PB_Kills",0];},"DESCEND"] call BIS_fnc_sortBy; 
 _playersSorted 
}; 
 
 
lhm_fnc_PB_HintScore = { 
 Private ["_playerlist"]; 
 _playerlist = call lhm_fnc_PB_PlayerStatistic; 
 hintsilent composeText [parseText ("Match BEENDET<br />"),parseText ("Statistik<br />"),_playerlist]; 
}; 
 
 
lhm_fnc_PB_First = { 
 Private ["_win","_playersSorted","_playerlist"]; 
 _win = 0; 
 if (LHM_VAR_PB_JACKPOT > 0) then { 
  _win = LHM_VAR_PB_JACKPOT * 50 / 100; 
 }; 
 _playerlist = call lhm_fnc_PB_PlayerStatistic; 
 sleep 1; 
 "Place 1. !!!" hintC [format["Dein Gewinn ist %1$",_win],composeText [parseText ("Statistik<br />"),_playerlist]]; 
 lhm_atmcash = [lhm_atmcash,true,_win,"PB_TICKET_COSTS"] call lhm_fnc_changeLHM_ATMCash; 
 [(format["- Glueckwunsch -
%1 du hast das Paintball-Match gewonnen!",name player]),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp; 
 playSound "pbwon"; 
}; 
 
 
lhm_fnc_PB_PlayerStatistic = { 
 Private ["_playersSorted","_playerlist"]; 
 _playersSorted = [LHM_VAR_TEAM_RED + LHM_VAR_TEAM_BLUE] call lhm_fnc_PB_calcHighScore; 
 _playerlist = ""; 
 { 
  _isOut = _x getVariable ["LHM_PB_isOut",true]; 
  _kills = _x getVariable ["LHM_PB_Kills",0]; 
  if (_x in LHM_VAR_TEAM_RED) then { 
   _playerlist = _playerlist + format["<t color='#ff0000'><t align='left'>%1</t>  <t align='right'>%2 %3</t></t><br />",name _x,_kills,switch (_isOut) do{case true: {"OUT"};case false: {"   "};}]; 
  }; 
  if (_x in LHM_VAR_TEAM_BLUE) then { 
   _playerlist = _playerlist + format["<t color='#0000FF'><t align='left'>%1</t>  <t align='right'>%2 %3</t></t><br />",name _x,_kills,switch (_isOut) do{case true: {"OUT"};case false: {"   "};}]; 
  }; 
 } foreach _playersSorted; 
 parseText _playerlist 
}; 
 
 
lhm_fnc_PB_Second = { 
 //_win = 0; 
 //if (LHM_VAR_PB_JACKPOT > 0) then { 
  //_win = LHM_VAR_PB_JACKPOT * 40 / 100; 
 //}; 
 sleep 1; 
 "2. !!" hintC [format["Du bist auf Platz 2."],format["Dein Gewinn ist %1$",_win]]; 
 lhm_atmcash = [lhm_atmcash,true,_win,"PB_TICKET_COSTS"] call lhm_fnc_changeLHM_ATMCash; 
}; 
 
lhm_fnc_PB_Third = { 
 //_win = 0; 
 //if (LHM_VAR_PB_JACKPOT > 0) then { 
 // _win = LHM_VAR_PB_JACKPOT * 20 / 100; 
 //}; 
 sleep 0.1; 
 "3. !" hintC [format["Du bist auf Platz 3."],format["Dein Gewinn ist %1$",_win]]; 
 lhm_atmcash = [lhm_atmcash,true,_win,"PB_TICKET_COSTS"] call lhm_fnc_changeLHM_ATMCash; 
}; 
 
 
lhm_fnc_PB_MatchRunning = { 
 Private ["_matchTimeNow"]; 
 #ifdef DEBUG 
 diag_log format["DEBUG: lhm_fnc_PB_MatchRunning: %1 ",_this]; 
 #endif 
 _matchTimeNow = 0; 
 LHM_VAR_PB_MATCH_RUNNING = true; 
 publicVariable "LHM_VAR_PB_MATCH_RUNNING"; 
 while {LHM_VAR_PB_MATCH_RUNNING} do { 
  sleep 1; 
  _matchTimeNow = _matchTimeNow + 1; 
  if (((count (Grp_TeamBlue)) < 1) || ((count (Grp_TeamRed)) < 1)) then { 
   LHM_VAR_PB_MATCH_RUNNING = false; 
   publicVariable "LHM_VAR_PB_MATCH_RUNNING"; 
   call lhm_fnc_PB_WonMatch; 
  }; 
  if ((_matchTimeNow > LHM_VAR_MATCH_TIME)) then { 
   LHM_VAR_PB_MATCH_RUNNING = false; 
   publicVariable "LHM_VAR_PB_MATCH_RUNNING"; 
   call lhm_fnc_PB_EndMatch; 
  }; 
 }; 
}; 
 
lhm_fnc_PB_Timer = { 
 _runtime = _this select 0; 
 _actTime = 0; 
 while {!(isNil "LHM_VAR_PB_Timer_Run")} do { 
  _actTime = _actTime + 1; 
  if (_actTime > (_runtime - 1)) exitWith { 
   [(format["Paintball Match gestartet!"]),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp; 
   if (!LHM_VAR_PB_MATCH_STARTED) then { 
    LHM_VAR_PB_MATCH_STARTED = true; 
    LHM_VAR_PB_Timer_Run = nil; 
    call lhm_fnc_PB_StartMatch; 
   }; 
  }; 
  { 
   [(format["Paintball Match
Startet in %1s
Azahl Spieler pro Team muss gleich sein.
- Bitte nicht bewegen! -",_runtime - _actTime]),"lhm_fnc_hint",(owner _x),FALSE] call lhm_fnc_mp; 
  }foreach ((Grp_TeamRed) + (Grp_TeamBlue)); 
  sleep 1; 
 }; 
}; 
 
lhm_fnc_PB_cutText = { 
 cutText [format["%1",_this],"PLAIN DOWN"]; 
}; 
//[_x,"lhm_fnc_PB_ResetUniform",(owner _x),FALSE] call lhm_fnc_mp; 
lhm_fnc_PB_ResetUniform = { 
 Private ["_olduniform"]; 
 _olduniform = uniform _this; 
 removeUniform _this; 
 _this forceaddUniform _olduniform; 
}; 
 
 
lhm_fnc_TriggerChange = { 
 Private ["_tempBlue","_tempRed","_listRed","_listBlue","_runtime","_unitsRed","_unitsBlue","_addRed","_removeRed","_addBlue","_removeBlue"]; 
 _listRed = list Trigger_Team_Red; 
 _listBlue = list Trigger_Team_Blue; 
 _unitsRed = Grp_TeamRed; 
 _unitsBlue = Grp_TeamBlue; 
 
 if ((count _unitsRed) < 10) then { 
  _addRed = (_listRed - _unitsRed); 
 } else { 
  _addRed = []; 
 }; 
 _removeRed = (_unitsRed - _listRed); 
 if ((count _unitsBlue) < 10) then { 
  _addBlue = (_listBlue - _unitsBlue); 
 } else { 
  _addBlue = []; 
 }; 
 _removeBlue = (_unitsBlue - _listBlue); 
 if (count (_addRed) > 0) then { 
  Private["_unittoadd","_oldgroup","_i"]; 
  for "_i" from 0 to ((count _addRed) - 1) do 
  { 
   _unittoadd = _addRed select _i; 
   _oldgroup = group _unittoadd; 
   if ((_unittoadd getVariable ["LHM_PB_ATM_CASH",0]) > LHM_VAR_PB_TICKET_COSTS) then { 
    [_unittoadd,"RED"] call lhm_fnc_PB_JoinTeam; 
    _unittoadd setObjectTextureGlobal [0,'#(argb,8,8,3)color(0.5,0,0,0.5)']; 
   } else { 
    [format["Du hast nicht genug $ um dem PaintBall Match beizutreten.Ein Ticket kostet %1$.",LHM_VAR_PB_TICKET_COSTS],"lhm_fnc_PB_cutText",(owner _unittoadd),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     (format["Du hast nicht genug $ um dem PaintBall Match beizutreten.Ein Ticket kostet %1$.",LHM_VAR_PB_TICKET_COSTS]) call lhm_fnc_PB_cutText; 
    }; 
   }; 
  }; 
 }; 
 if (count (_removeRed) > 0) then { 
  Private["_unittoremove","_oldgroup","_i"]; 
  for "_i" from 0 to ((count _removeRed) - 1) do 
  { 
   _unittoremove = _removeRed select _i; 
   _unittoremove call lhm_fnc_PB_LeaveTeam; 
   [_unittoremove,"lhm_fnc_PB_ResetUniform",(owner _unittoremove),FALSE] call lhm_fnc_mp; 
  }; 
 }; 
 if (count (_addBlue) > 0) then { 
  Private["_unittoadd","_oldgroup","_i"]; 
  for "_i" from 0 to ((count _addBlue) - 1) do 
  { 
   _unittoadd = _addBlue select _i; 
   if ((_unittoadd getVariable ["LHM_PB_ATM_CASH",0]) > LHM_VAR_PB_TICKET_COSTS) then { 
    [_unittoadd,"BLUE"] call lhm_fnc_PB_JoinTeam; 
    _unittoadd setObjectTextureGlobal [0,'#(argb,8,8,3)color(0,0,0.5,0.5)']; 
   } else { 
    [format["Du hast nicht genug $ um dem PaintBall Match beizutreten.Ein Ticket kostet %1$.",LHM_VAR_PB_TICKET_COSTS],"lhm_fnc_PB_cutText",(owner _unittoadd),FALSE] call lhm_fnc_mp; 
    if (isServer && !isDedicated) then { 
     (format["Du hast nicht genug $ um dem PaintBall Match beizutreten.Ein Ticket kostet %1$.",LHM_VAR_PB_TICKET_COSTS]) call lhm_fnc_PB_cutText; 
    }; 
   }; 
  }; 
 }; 
 if (count (_removeBlue) > 0) then { 
  Private["_unittoremove","_oldgroup","_i"]; 
  for "_i" from 0 to ((count _removeBlue) - 1) do 
  { 
   _unittoremove = _removeBlue select _i; 
   _unittoremove call lhm_fnc_PB_LeaveTeam; 
   [_unittoremove,"lhm_fnc_PB_ResetUniform",(owner _unittoremove),FALSE] call lhm_fnc_mp; 
  }; 
 }; 
 [_removeRed,_removeBlue,_addRed,_addBlue] spawn { 
  Private ["_tempRed","_tempBlue"]; 
  sleep 0.25; 
  if (isNil "_tempRed") then { 
   _tempRed = ""; 
  }; 
  if (isNil "_tempBlue") then { 
   _tempBlue = ""; 
  }; 
  if (!(_tempRed == str(Grp_TeamRed)) || !(_tempBlue == str(Grp_TeamBlue))) then { 
   if ((count(Grp_TeamRed) == count(Grp_TeamBlue)) && ((count(Grp_TeamBlue) > 0)) && (count(Grp_TeamRed) > 0)) then { 
    if (isNil "LHM_VAR_PB_Timer_Run") then { 
     LHM_VAR_PB_Timer_Run = true; 
      _timmerscript = [LHM_VAR_PB_WAIT_TIME] spawn lhm_fnc_PB_Timer; 
    }; 
   } else { 
    LHM_VAR_PB_Timer_Run = nil; 
    if (!isNil "_timmerscript") then { 
     terminate _timmerscript; 
     [(format["Paintball Match
Countdown aborted!"]),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp; 
    }; 
   }; 
   _tempRed = str(Grp_TeamRed); 
   _tempBlue = str(Grp_TeamBlue); 
  }; 
 }; 
}; 
 
 
lhm_fnc_InitPB_Groups = { 
 Private ["_listRed","_listBlue"]; 
 #ifdef DEBUG 
 diag_log format["Paintball Arena: lhm_fnc_InitPB_Groups: %1 ",_this]; 
 #endif 
 while {LHM_VAR_PAINTBALL_ON} do { 
  waitUntil{sleep 1;((!(LHM_VAR_TRIGGERBLUE_LIST == str(list Trigger_Team_Blue)) || !(LHM_VAR_TRIGGERRED_LIST == str(list Trigger_Team_Red))) && !LHM_VAR_PB_MATCH_STARTED)}; 
  call lhm_fnc_TriggerChange; 
  LHM_VAR_TRIGGERBLUE_LIST = str(list Trigger_Team_Blue); 
  LHM_VAR_TRIGGERRED_LIST = str(list Trigger_Team_Red); 
 }; 
}; 
 
lhm_fnc_PB_Spawn = { 
 Private ["_objects","_objects2","_enterTriggerCode","_script"]; 
 REDCOUNTER = 0; 
 diag_log format["Paintball Arena: creating Triggers..."]; 
 if (!isNil "MeetPointRed") then { 
  if (!isNull MeetPointRed) then { 
   Trigger_Team_Red = createTrigger ["EmptyDetector", (position MeetPointRed)]; 
   Trigger_Team_Red setTriggerArea [5.5, 5.5, 0, true]; 
   Trigger_Team_Red setTriggerActivation ["ANY", "PRESENT", true]; // "CIV" 
   Trigger_Team_Red setTriggerText "Trigger_Team_Red"; 
   Trigger_Team_Red setTriggerStatements ["this", "", ""]; 
   publicVariable "Trigger_Team_Red"; 
  }; 
 }; 
 if (!isNil "MeetPointBlue") then { 
  if (!isNull MeetPointBlue) then { 
   Trigger_Team_Blue = createTrigger ["EmptyDetector", (position MeetPointBlue)]; 
   Trigger_Team_Blue setTriggerArea [5.5, 5.5, 0, true]; 
   Trigger_Team_Blue setTriggerActivation ["ANY", "PRESENT", true]; // "CIV" 
   Trigger_Team_Blue setTriggerText "Team_Blue"; 
   Trigger_Team_Blue setTriggerStatements ["this", "", ""]; 
   publicVariable "Trigger_Team_Blue"; 
  }; 
 }; 
 
  LHM_PB_ArenaMarker = createmarker ["PB_Arena", getMarkerPos "paintballarena"]; 
  LHM_PB_ArenaMarker setMarkerShape "ELLIPSE"; 
  LHM_PB_ArenaMarker setMarkerSize  [110,110]; 
  LHM_PB_ArenaMarker setMarkerColor "ColorYellow"; 
  waitUntil {!isNil"LHM_PB_ArenaMarker"}; 
 
 diag_log format["Paintball Arena: Initializing Groups..."]; 
 [] spawn lhm_fnc_InitPB_Groups; 
 diag_log format["Paintball Arena: Init Groups Done"]; 
 diag_log format["Paintball Arena: All Done"]; 
}; 
 
 
[ 
"lhm_fnc_hint", 
"lhm_fnc_playSound", 
"lhm_fnc_PB_ClientHandleDamage", 
"lhm_fnc_PB_PlayerHandleDamage", 
"lhm_fnc_ClientPaintBallInit", 
"lhm_fnc_PB_ClientMoveToArena", 
"lhm_fnc_PB_JoinTeam", 
"lhm_fnc_PB_LeaveTeam", 
"lhm_fnc_PB_ClientMoveOutArena", 
"lhm_fnc_PB_ClientMatchRunning", 
"lhm_fnc_PB_prepareClient", 
"lhm_fnc_PB_ClientWon", 
"lhm_fnc_PB_setClientBack", 
"lhm_fnc_PB_calcHighScore", 
"lhm_fnc_PB_HintScore", 
"lhm_fnc_PB_First", 
"lhm_fnc_PB_Second", 
"lhm_fnc_PB_Third", 
"lhm_fnc_PB_PlayerStatistic", 
"lhm_fnc_PB_ResetUniform" 
] spawn lhm_fnc_streamFunction; 
 
[] spawn lhm_fnc_PB_Spawn;