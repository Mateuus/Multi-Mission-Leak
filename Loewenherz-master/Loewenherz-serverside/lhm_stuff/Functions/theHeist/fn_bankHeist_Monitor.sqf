 
/* 
Filename: fn_bankHeist_Monitor.sqf 
 
Author: Blackd0g, Barney 
 
Description: monitoring of the bank Heist event progress 
*/ 
private []; 
// private ["_tempBankTeam","_tempBankWay","_tempnames","_getTask","_task","_taskPos","_taskState","_description","_descriptionShort","_descriptionHUD","_notification","_text","_elements","_items","_itemNames","_curItem","_curItemAmount","_a1","_a2","_box","_tItems","_tWeight","_weightcurItems","_fail","_keyPadCounter","_ChargeTime","_smoke","_bomb","_goldAmount","_query","_reset","_code"]; 
 
scopeName "BankHeistMain"; 
BankHeist_Way = param [0,"",[""]]; // Way1/Way2 String 
BankHeist_Team =  param [1,[],[[]]];  // Array with Team Objects 
 
// Some Checks 
if (BankHeist_isRunning) exitWith {diag_log "Bank Heist: BankHeist_isRunning!"}; 
if (BankHeist_Team isEqualTo []) exitWith {diag_log "Bank Heist: Team is empty!"}; 
if (BankHeist_Way isEqualTo "") exitWith {diag_log "Bank Heist: No Way defined!"}; 
 
BankHeist_isRunning = true; 
publicVariable "BankHeist_isRunning"; 
waitUntil {BankHeist_isRunning}; 
diag_log "*** Starting Bank Heist ***"; 
 
// creates a random 5 digit code for the keypad 
fed_code = round([10000,99999] call BIS_fnc_randomNum); 
publicVariable "fed_code"; 
 
// save team members from start 
_tempBankTeam = BankHeist_Team; 
_tempBankWay = BankHeist_Way; 
BankHeist_Team = _tempBankTeam; 
BankHeist_Way = _tempBankWay; 
LHM_BANK_Way = BankHeist_Way; 
Bankheist_TimeOut = false; 
bankHeistAlarmTriggered = false; 
publicVariable "BankHeist_Team"; 
publicVariable "LHM_BANK_Way"; 
publicVariable "BankHeist_Way"; 
 
bankHeistGuy setVariable["Heist_isRunning",true,true]; 
 
diag_log format ["Bank Heist: %1 selected",BankHeist_Way]; 
 
_tempnames = []; 
{ 
 _tempnames pushBack name _x; 
} forEach _tempBankTeam; 
 
diag_log format ["Bank Heist Members are: %1",_tempnames]; 
 
_getTask = nil; 
// State of progress 
BankHeistState = 0; 
bankHeistTime = 0; 
 
Louisbox setVariable ["Trunk",[[],0],true]; 
 
[5400] call lhm_fnc_HeistTimeOut_Control; 
 
/* 
[ 
    -1, // type: 0 - file1, 1 - file2, 2 - photo, -1 - random 
    random 360, // direction: 0-360 of Intel object 
    getPosASL playerServer, // position ASL of Intel object 
    "Secret Intel", // title of Intel 
    "GO FUCK YOURSELF!", // description of Intel 
    "\a3\data_f\Flags\flag_armex_co.paa", // optional large image 
    [west], // recipient sides 
    true // sync found Intel for JIP players 
] call lhm_fnc_createIntelObjectServer; 
 
 //set a mission to clients 
 [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
// set mission task state 
 [[_task,_taskState,_notification,_descriptionShort,_template],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
// Remove all tasks 
 [[],"lhm_fnc_removeAllMissionTasks",BankHeist_Team,false] call LHM_fnc_MP; 
 
 
 // remove fails a mission to clients 
 [[_task,_notification,_descriptionShort]],"lhm_fnc_removeMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
*/ 
 
// Switch through Ways 
switch (BankHeist_Way) do 
{ 
 case "Way1": 
 { 
  diag_log "Bank Heist: starting monitoring Thread..."; 
  //////////////// Start Monitoring  //////////////// 
  [_tempBankTeam] spawn { 
   private ["_task","_checkGold","_checkSafe","_alarmSound","_startingTime","_team","_exMember"]; 
   _startingTime = diag_tickTime; 
 
   while {BankHeist_isRunning} do 
   { 
    scopeName "BankHeist_Monitor"; 
 
    _tempBankTeam = _this select 0; // Original Team 
 
    // Amount of Money 
    _checkGold = fed_bank getVariable ["safe",0]; 
 
    { 
     if(!alive _x || !(isPlayer _x)) then { 
      if(!(count BankHeist_Team isEqualTo 0)) then { 
       _team = BankHeist_Team; 
       _exMember = [_x]; 
       BankHeist_Team = _team - _exMember; 
       publicVariable "BankHeist_Team"; 
       diag_log format ["Bank Heist: Member dead or disconnected. New Count is %1",count BankHeist_Team]; 
 
       _text = parseText format [" 
       <t size='1.10' font='puristaLight' align='center' color='#ff0000'>%1 ist tot!</t><br/><br/> 
       <t size='0.95' font='puristaLight' align='center' color='#ff0000'>Verbleibende Mitglieder: %2</t> 
       ",name _x,count BankHeist_Team]; 
       [_text,"lhm_fnc_hintMessage",BankHeist_Team,false] call LHM_fnc_MP; 
 
       uiSleep 1; 
        [[],"lhm_fnc_removeAllMissionTasks",_x,false] call LHM_fnc_MP; 
      }; 
     }; 
    } forEach BankHeist_Team; 
 
    if(BankHeist_Team isEqualTo [] && !(fed_bank getvariable["safe_open",false]) && !(fed_bank getVariable["chargeplaced",false])) exitWith { 
     // reset bank heist... 
     [] spawn lhm_fnc_bankHeist_reset; 
 
     _task = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
     waitUntil {!IsNil "_task"}; 
     [[(_task select 0),"Banküberfall fehlgeschlagen","Banküberfall"],"lhm_fnc_removeMissionTask",_tempBankTeam,false] call LHM_fnc_MP; 
 
     diag_log "Bank Heist failed!"; 
     uiSleep 10; 
      [[],"lhm_fnc_removeAllMissionTasks",_tempBankTeam,false] call LHM_fnc_MP; 
    }; 
 
    if(Bankheist_TimeOut) exitWith { 
     [] spawn lhm_fnc_bankHeist_reset; 
 
     _task = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
     waitUntil {!IsNil "_task"}; 
     [[(_task select 0),"Banküberfall fehlgeschlagen","Banküberfall"],"lhm_fnc_removeMissionTask",_tempBankTeam,false] call LHM_fnc_MP; 
 
     _text = parseText format [" 
      <t size='1.10' font='puristaLight' align='center' color='#ff0000'>Timeout!</t><br/><br/> 
      <t size='0.95' font='puristaLight' align='center' color='#ff0000'>Der Überfall wurde beendet!</t> 
      "]; 
     [_text,"lhm_fnc_hintMessage",BankHeist_Team,false] call LHM_fnc_MP; 
 
     diag_log "Bank Heist failed!"; 
     uiSleep 10; 
      [[],"lhm_fnc_removeAllMissionTasks",_tempBankTeam,false] call LHM_fnc_MP; 
 
 
    }; 
 
    //if (condition1) then {breakTo "main"}; // Breaks all scopes and return to "main" 
    //if (condition2) then {breakOut "loop2"}; // Breaks scope named "loop2" 
 
   uiSleep 1; 
 
   // refresh timer 
   bankHeistTime = diag_tickTime - _startingTime; 
 
   }; 
  }; 
  ////////////////  Monitoring End //////////////// 
 
 /* 
 ************* HEIST PROGRESS ************* 
 */ 
 
 diag_log "Bank Heist: Way 1 selected"; 
 
  ///////////// Welcome Screen - inform player & rules ///////////// 
  [ 
   [ 
    [ 
     ["BANKÜBERFALL","<t align = 'center' shadow = '1' size = '0.7' color='#00FF00' font='PuristaBold'>%1</t>"], 
     ["Die Sicherheitslücke","<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"], 
     ["Anweisungen werden abgerufen...","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"] 
    ] 
   ],"BIS_fnc_typeText",BankHeist_Team,false] call LHM_fnc_MP; 
 
  _text = parseText format 
  [ 
  " 
  <t size='1.10' font='puristaLight' align='center' color='#ffcb85'>HINWEISE ZUM ÜBERFALL</t><br/><br/> 
  <t size='0.95' font='puristaLight' align='left' color='#00cc00'>1. Bei tot, disconnect, oder gefangennahme scheidet der Spieler automatisch aus dem Überfallszenario aus!</t><br/><br/> 
  <t size='0.95' font='puristaLight' align='left' color='#00cc00'>2. Sollte das LETZTE MITGLIED durch eine der oben genannten Punkte betroffen sein endet der Banküberfall und sämtlicher Fortschritt wird zurückgesetzt.</t><br/><br/> 
  <t size='0.95' font='puristaLight' align='left' color='#00cc00'>3. Der Überfall findet in unterschiedlichen Abschnitten statt. Auftragshinweise stehen auf der Map unter > TASKS</t><br/> 
  " 
  ]; 
  [_text,"hint",BankHeist_Team,false] call LHM_fnc_MP; 
  ///////////// Welcome Screen - inform player & rules ///////////// 
 
  uiSleep 12; 
 
  ///////////// State 1 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
  [[0],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true}; BankHeistState == 1;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 2 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  [[1],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
  // Show louis box 
  Louisbox setPos [getPos Louisbox select 0, getPos Louisbox select 1, 0]; 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
 
 
  // set requirements for louis box 
  Louisbox_itemsReq = []; 
  _elements = []; 
  _items = []; 
  _itemNames = []; 
  for "_i" from 1 to 10 step 1 do 
  { 
   _elements = 
   [ 
    "woodu", 
    "diamond", 
    "tracker", 
    "sensor", 
    "bottledwhiskey", 
    "redgull", 
    "marijuana", 
    "heroinp", 
    "zigarette", 
    "cocainep", 
    "bottledbeer", 
    "bottledshine" 
   ] call BIS_fnc_selectRandom; 
 
   _items pushBack _elements; 
  }; 
 
  Louisbox_itemsReq = _items call BIS_fnc_consolidateArray; // create Requirements Array 
  publicVariable "Louisbox_itemsReq"; 
 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification,Louisbox_itemsReq],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  // monitoring the box 
  while {true} do 
  { 
   if(!BankHeist_isRunning) exitWith {}; 
   waitUntil {!(Louisbox getVariable ["trunk_in_use",false])}; // if box is in use stop the check 
 
   if(count Louisbox_itemsReq isEqualTo 0) exitWith { // if requirement list is empty exit to next state 
    Louisbox setVariable ["Trunk",[[],0],true]; 
   }; 
 
   { 
    _curItem = (_x select 0); 
    _curItemAmount = (_x select 1); 
 
     for "_i" from 0 to (count(Louisbox getVariable["Trunk",[[],0]] select 0) -1) do { 
 
      if((Louisbox getVariable["Trunk",[[],0]] select 0) select _i select 0 == _curItem) then { 
       if((Louisbox getVariable["Trunk",[[],0]] select 0) select _i select 1 >= _curItemAmount) then { 
        _a1 = Louisbox_itemsReq; 
        _a2 = [[_curItem,_curItemAmount]]; 
        Louisbox_itemsReq = _a1 - _a2; 
        _box = Louisbox getVariable["Trunk",[[],0]]; 
        _tItems = (_box select 0); 
        _tWeight = (_box select 1); 
 
        _weightcurItems = ([_curItem] call lhm_fnc_itemWeight) * ((Louisbox getVariable["Trunk",[[],0]] select 0) select _i select 1); 
        _tWeight = _tWeight - _weightcurItems; 
 
        _a1 = _tItems; 
        _a2 = [[(Louisbox getVariable["Trunk",[[],0]] select 0) select _i select 0,((Louisbox getVariable["Trunk",[[],0]] select 0) select _i select 1)]]; 
        _tItems = _a1 - _a2; 
 
        Louisbox setVariable ["Trunk",[_tItems,_tWeight],true]; 
       }; 
      }; 
     }; 
   } forEach Louisbox_itemsReq; 
   uiSleep 1; 
  }; 
  if(!BankHeist_isRunning) exitWith {}; 
  // hide louis box and clear stuff 
  Louisbox_itemsReq = nil; 
  publicVariable "Louisbox_itemsReq"; 
  Louisbox setPos [getPos Louisbox select 0, getPos Louisbox select 1, -100]; 
 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 2;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 3 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // Terminals spawnen 
  [] call lhm_fnc_bankheist_spawnTerminals; 
 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
  [[2],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 3;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 4 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
 
  // Lokale Marker auf dem Client entfernen --- gesetzt in der fn_bankheist_spawn_terminals //  s. Z. 175 
  [["Bank_Way_1_1",nil,nil,nil,nil,true],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
  [["Bank_Way_1_2",nil,nil,nil,nil,true],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
  [["Bank_Way_1_3",nil,nil,nil,nil,true],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
 
  [[nil,nil,nil,nil,nil,nil,true],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
 
  [[3],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true}; BankHeistState == 4;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  [[nil,nil,nil,nil,nil,true,true],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
 
  [[4],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 5;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 5 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  [[5],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 6;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 6 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  [[6],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  // open small dome doors 
  { 
   for "_i" from 1 to 2 do { 
    _x setVariable[format["bis_disabled_Door_%1",_i],1,true]; 
    _x animateSource ["door_1A_move",1]; 
    _x animateSource ["door_1B_move",1]; 
    _x animateSource ["door_2A_move",1]; 
    _x animateSource ["door_2B_move",1]; 
   }; 
  } forEach [dome1,dome2]; 
 
 
  // check if keycode is entered simultanous 
  _fail = false; 
  diag_log "Bank Heist: Waiting for Keypad input"; 
  _keyPadCounter = 0; 
  while{true} do { 
    if((bankKeypad2 getvariable["done",false]) && (bankKeypad1 getvariable["done",false])) exitWith {diag_log "Bank Heist: Both Keypads acitvated";}; 
    if((bankKeypad2 getvariable["tries",0] > 3) || (bankKeypad1 getvariable["tries",0] > 3)) exitWith {_fail = true;}; 
 
    //if(_keyPadCounter >= 3 && isNil "_alarmSound") then { 
     // hit the alarm!!! 
    // _keyPadCounter = 0; 
    // _alarmSound = [] spawn lhm_fnc_bankHeist_Alarm; 
    //}; 
    if((bankKeypad2 getvariable["done",false]) && (bankKeypad1 getvariable["done",false])) exitWith {diag_log "Bank Heist: Both Keypads acitvated";}; 
 
    if(!BankHeist_isRunning) exitWith {}; 
  }; 
  if(!BankHeist_isRunning) exitWith {}; 
 
  if(_fail) then { 
 
    [] spawn lhm_fnc_bankHeist_Alarm; 
 
    while{true} do { 
     if((bankKeypad2 getvariable["done",false]) && (bankKeypad1 getvariable["done",false])) exitWith {diag_log "Bank Heist: Both Keypads acitvated";}; 
     if(!BankHeist_isRunning) exitWith {}; 
    }; 
  }; 
 
  if(!BankHeist_isRunning) exitWith {}; 
 
  // key pad info msg 
  [ 
   [ 
    [ 
     ["FEDERAL RESERVE","<t align = 'center' shadow = '1' size = '0.7' color='#00FF00' font='PuristaBold'>%1</t>"], 
     ["Keypad Input","<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"], 
     ["Code korrekt, Einlass bestätigt, Türen werden geöffnet...","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"] 
    ] 
   ],"BIS_fnc_typeText",BankHeist_Team,false] call LHM_fnc_MP; 
 
  // open big dome small door (middle) 
  dome3 animateSource ["door_1A_move",1]; 
  dome3 animateSource ["door_1B_move",1]; 
 
  BankHeistState = 7; 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  //waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 7;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  ///////////// State 7 ///////////// 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  [[7],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
  diag_log format ["Bank Heist: current State - %1",BankHeistState]; 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 8;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  _getTask = [BankHeist_Way,BankHeistState] call lhm_fnc_bankHeist_taskDescription; 
 
  // Task Information Array 
  _task = _getTask select 0; 
  _taskPos = _getTask select 1; 
  _taskState = _getTask select 2; 
  _description = _getTask select 3; 
  _descriptionShort = _getTask select 4; 
  _descriptionHUD = _getTask select 5; 
  _notification = _getTask select 6; 
 
  // set a mission to members 
  [[_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification],"lhm_fnc_getMissionTask",BankHeist_Team,false] call LHM_fnc_MP; 
 
  [[8],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_MP; 
 
 
  // inform players that democharge is placed 
  waitUntil {fed_bank getVariable["chargeplaced",false]}; 
 
  // add players to the wanted list 
  { 
   [getPlayerUID _x,name _x,"777"] call lhm_fnc_wantedAdd; 
  } foreach bankHeistTeam; 
 
  [[],"lhm_fnc_demoChargeTimer",BankHeist_Team,false] call lhm_fnc_mp; 
  [[],"lhm_fnc_demoChargeTimer",west,false] call lhm_fnc_mp; 
 
  _alarmSound = [] spawn lhm_fnc_bankHeist_Alarm; 
 
  // start bomb timer 
  _ChargeTime = time + (8 * 60); 
  while {true} do { 
   if(round(_ChargeTime - time) < 1) exitWith {}; 
   if(!(fed_bank getVariable["chargeplaced",false])) exitWith {}; 
   if((fed_bank getVariable["chargecodewrong",false])) exitWith {}; // exit to bomb detonate > when entered wrong code 
   uiSleep 0.08; 
  }; 
  if(!(fed_bank getVariable["chargeplaced",false])) exitWith { 
   [true] spawn lhm_fnc_bankHeist_reset; 
 
  }; 
 
  // create bomb and smoke 
  _smoke = "SmokeShell" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5]; 
  _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.6]; 
 
  // create an alarm sound 
  [] spawn { 
   safeAlarmSound = createSoundSource ["Sound_Alarm2", getPos fed_bank, [], 0]; 
   sleep 120; 
   deleteVehicle safeAlarmSound; 
  }; 
 
  fed_bank setVariable["chargeplaced",false,true]; 
  fed_bank setVariable["safe_open",true,true]; 
 
 
  waitUntil {if(!BankHeist_isRunning) exitWith {true};BankHeistState == 8;}; 
  if(!BankHeist_isRunning) exitWith {}; 
  [[_task,"Succeeded",_notification,_descriptionShort,"BankJobSucceeded"],"lhm_fnc_setMissionTask",BankHeist_Team,false] call LHM_fnc_MP; // task accomplished 
 
  uiSleep 10; 
 
  // broacast a msg ? 
  [[true,2,true],"lhm_fnc_removeMoney",true,false] call LHM_fnc_MP; // remove some money from all active players 
 
  [] spawn { 
   scopeName "BankHeist_End"; 
   private ["_goldAmount"]; 
   waitUntil {!(fed_bank getvariable["safe_open",false])}; 
   // Update Gold on DB 
   uiSleep 5; 
   if(!isNil "safeAlarmSound") then { 
    deleteVehicle safeAlarmSound; 
   }; 
   _goldAmount = fed_bank getvariable["safe",0]; 
   [true] spawn lhm_fnc_bankHeist_reset; 
   _query = format["UPDATE lhm_bank SET amount='%1' WHERE banktype='FED'",_goldAmount]; 
   [_query,1] call DB_fnc_asyncCall; 
   diag_log format ["Federal Reserve Gold amount value is now: %1",_goldAmount]; 
 
   sleep 120; 
   // remove all tasks from the players 
   [[],"lhm_fnc_removeAllMissionTasks",BankHeist_Team,false] call LHM_fnc_MP; 
   diag_log "Bank Heist: removing all Mission Tasks..."; 
  }; 
 
  diag_log format ["Bank Heist: completed in [%2] Time with a count of %1 Members",count BankHeist_Team,bankHeistTime]; 
  uiSleep 5; 
 
  while {true} do 
  { 
   _units = {(_x distance fed_bank < 500)} count playableUnits; 
   if(_units isEqualTo 0) exitWith {}; 
   uiSleep 60; 
  }; 
  if(!BankHeist_isRunning) exitWith {}; // safety check 
  diag_log "Bank Heist: Resetting Bank Heist..."; 
  _reset = [] spawn lhm_fnc_bankHeist_reset; 
  waitUntil {ScriptDone _reset}; 
  diag_log "Bank Heist: Reset complete!"; 
 
  // Way 1 END 
 }; 
 
/* 
*********************************************************************************************************************************************** 
*********************************************************************************************************************************************** 
*********************************************************************************************************************************************** 
*/ 
 
 // Way 2 
 case "Way2": 
 { 
 
 // State 1 
  [ 
   [ 
    [ 
     ["BANKÜBERFALL","<t align = 'center' shadow = '1' size = '0.7' color='#00FF00' font='PuristaBold'>%1</t>"], 
     ["Stromausfall","<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"], 
     ["Anweisungen werden abgerufen...","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"] 
    ] 
   ],"BIS_fnc_typeText",BankHeist_Team,false] call BIS_fnc_MP; 
 
  uiSleep 10; 
 
  /* 
    while {true} do 
    { 
     for "_i" from 1 to 200 step 1 do 
     { 
      _code = (round([10000,99999] call BIS_fnc_randomNum)); 
      sleep 0.01; 
     }; 
     sleep 15; 
    }; 
  */ 
 
 
  // Way 2 END 
 }; 
}; 
 
 
 
 
 
