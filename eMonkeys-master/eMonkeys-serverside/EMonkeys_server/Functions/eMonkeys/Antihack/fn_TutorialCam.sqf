/* 
    Author: Niklas "Rappelkiste" Quenter 
 File: fn_TutorialCam.sqf 
 Server: e-Monkeys.com 
     
    Description: Tutorial for new Player. 
*/ 
private["_camera","_setTitel","_setInfobox","_newfocus","_music","_hoehe","_kavala","_markt","_parkplatz","_obst","_trash","_lotsen","_laptop","_craftingzone","_playerSpawn","_zkavala","_zobst","_zmarkt","_ztrash","_zlotsen","_zplayer","_zlaptop","_zcraftingzone","_task_tutorial","_task_laptop","_task_Offroad","_display"]; 
 
//Funktionen 
_setTitel = { 
 private["_textfield","_text","_time"]; 
 disableSerialization; 
 _textfield = (findDisplay 11000) displayCtrl 1003; 
 _text = _this select 0; 
 _time = (_this select 1) - 10; 
  
 _textfield ctrlShow false; 
 _textfield ctrlSetStructuredText parseText format["<t font='PuristaSemiBold' color='#81c800' size='2' align='center' shadow='2' shadowColor='#000000'> %1 </t>", _text]; 
 _textfield ctrlSetFade 1; 
 _textfield ctrlCommit 0.5; 
 waitUntil {ctrlCommitted _textfield}; 
 _textfield ctrlShow true; 
 _textfield ctrlSetFade 0; 
 _textfield ctrlCommit 6; 
 waitUntil {ctrlCommitted _textfield}; 
 uisleep _time; 
 _textfield ctrlSetFade 1; 
 _textfield ctrlCommit 6; 
}; 
_setInfobox = { 
 private["_infofield","_text","_time","_Infos"]; 
 disableSerialization; 
 _infofield = (findDisplay 11000) displayCtrl 1004; 
 _texte = _this select 0; 
 _time = (_this select 1) - 10; 
  
 _infofield ctrlShow false; 
 _Infos = format["<t font='PuristaMedium' color='#81c800' size='1.5' align='left' shadow='2' shadowColor='#000000'>"]; 
 {_Infos = _Infos + format ["- %1<br/>",_x];}foreach _texte; 
 _Infos = _Infos + "</t>"; 
 _infofield ctrlSetStructuredText parseText _Infos; 
 
 _infofield ctrlSetFade 1; 
 _infofield ctrlCommit 0.5; 
 waitUntil {ctrlCommitted _infofield}; 
 _infofield ctrlShow true; 
 _infofield ctrlSetFade 0; 
 _infofield ctrlCommit 6; 
 waitUntil {ctrlCommitted _infofield}; 
 uisleep _time; 
 _infofield ctrlSetFade 1; 
 _infofield ctrlCommit 6; 
}; 
_newfocus = { 
 private["_map","_pos","_time"]; 
 disableSerialization; 
 _map = (findDisplay 11000) displayCtrl 1002; 
 _pos = _this select 0; 
 _time = _this select 1; 
  
 _map ctrlMapAnimAdd [_time, 0.01, _pos]; 
 ctrlMapAnimCommit _map; 
}; 
_music = { 
 EMonkeys_TutorialMusic = true; 
 while {EMonkeys_TutorialMusic} do 
 { 
  playSound "Tutorial_back"; 
  uisleep 85; 
 }; 
}; 
 
//Positionen 
_hoehe = 100; 
_kavala = getmarkerpos "dd_Kavala"; 
_markt = [3648.923, 13112.25, 0]; 
_parkplatz = [3652.34, 13184.4, 0]; 
_obst = getmarkerpos "fruit_1"; 
_trash = getmarkerpos "marker_trash"; 
_lotsen = [3646.81,13078.1,5]; 
_laptop = [3117.682, 12474.491, 1.383]; 
_craftingzone = getmarkerpos "crafting_tut_spawn_1"; 
_playerSpawn = []; 
 
//Zeiten 
_zkavala = 5; 
_zobst = 10; 
_zmarkt = 10; 
_ztrash = 20.6; 
_zlotsen = 19; 
_zplayer = 5; 
_zlaptop = 5; 
_zcraftingzone = 8.4; 
 
//Variabeln 
EMonkeys_firstSpawn = false; 
EMonkeys_PlayerInTutorial = true; 
eM_TutorialVehicle = false; 
_Spawnpoints = [[[3099.9,12483.7,0.21831],112.869],[[3103.23,12486.4,0.491102],140.275],[[3106.72,12489,0.586087],145.933],[[3110.17,12485.3,0.606498],192.792],[[3102.76,12479.6,0.199479],105.744],[[3113.1,12481.6,0.613724],171.605],[[3105.85,12475.8,0.264072],93.0603],[[3109.08,12471.5,0.257121],66.321],[[3112.32,12467.5,0.254228],25.0528]]; 
 
///////////////////////////Tutorial starten//////////////////////////////////////// 
uisleep 10; 
closeDialog 0; 
disableSerialization; 
disableUserInput true; 
0 fadeSound 0.6; 
0 cutText ["","BLACK OUT",2]; 
uisleep 3; 
showCinemaBorder false; 
camUseNVG false; 
 
_camera = "camera" camCreate [(_kavala select 0) - 500, (_kavala select 1), _hoehe]; 
_camera cameraEffect ["internal","back"]; 
_camera camSetTarget _kavala; 
_camera camCommit _zkavala; 
WaitUntil {camCommitted _camera}; 
 
0 cutText ["","BLACK In",2]; 
[] spawn _music; 
playSound "Tutorial1"; 
uisleep 28.8; 
disableUserInput false; 
[] spawn EMonkeys_fnc_ausweiserstellendialog; //Ausweis Menu erstellen 
WaitUntil {eM_TutorialAusweis}; 
///////////////////////////Camera Tutorial Gestartet//////////////////////////////// 
disableUserInput true; 
createDialog "EMonkeys_tutorialDialog"; 
_map = (findDisplay 11000) displayCtrl 1002; 
_map ctrlMapAnimAdd [0.1, 0.1, _kavala]; 
ctrlMapAnimCommit _map; 
 
//Marktplatz 
_camera camSetPos [(_markt select 0) - 100,(_markt select 1), _hoehe]; 
_camera camSetTarget _markt; 
_camera camCommit _zmarkt; 
[_markt, _zmarkt] spawn _newfocus; 
WaitUntil {camCommitted _camera}; 
playSound "Tutorial2"; 
[_camera, _markt, _hoehe, (-100), 0.5, false] execFSM "core\fsm\cam_round.fsm"; 
["Marktplatz von Kavala",66] spawn _setTitel; 
uisleep 20; 
[["Safezone","Bankautomat","Händler für ...<br/>  - Alltagsgegenstände<br/>  - Werkzeuge<br/>  - Kleidungen","Lizenzen Schule","Warenübersicht","Großer Parkplatz"],44] spawn _setInfobox; 
uisleep 35.5; 
EMonkeys_EscRoundCam = true; 
_camera camSetTarget _parkplatz; 
_camera camCommit 3; 
WaitUntil {camCommitted _camera}; 
uisleep 7.5; 
 
//Obstplantage 
_camera camSetPos [(_obst select 0) - 100,(_obst select 1), _hoehe]; 
_camera camSetTarget _obst; 
_camera camCommit _zobst; 
[_obst, _zobst] spawn _newfocus; 
WaitUntil {camCommitted _camera}; 
playSound "Tutorial3"; 
["Obstplantage",40] spawn _setTitel; 
[_camera, _obst, _hoehe, (-100), 0.5, false] execFSM "core\fsm\cam_round.fsm"; 
uisleep 4; 
[["Abbauen mit der<br/>  ""Windows Taste""","zufälliges Abbauen","Obst verkaufen ...<br/>  - direkt am Marktplatz<br/>  - oder als Obstsalat"],35] spawn _setInfobox; 
uisleep 36; 
EMonkeys_EscRoundCam = true; 
 
//Müllhalde 
_camera camSetPos [(_trash select 0) - 41.108,(_trash select 1) - 92.207, _hoehe]; 
_camera camSetTarget _trash; 
_camera camCommit _ztrash; 
[_trash, _ztrash] spawn _newfocus; 
uisleep 2; 
playSound "Tutorial4"; 
WaitUntil {camCommitted _camera}; 
["Müllhalde",38.4] spawn _setTitel; 
[["zufälliges Abbauen","nutzbare Gegenstände<br/>  wie z.B. ...<br/>  - Baupläne<br/>  - Munition<br/>  - Geld","nutzlose Gegenstände<br/>  wie z.B. ...<br/>  - Dreckhaufen<br/>  - Kleinkram","Sozialer Brennpunkt"],38.3] spawn _setInfobox; 
[_camera, _trash, _hoehe, (-100), 0.5, true, 66] execFSM "core\fsm\cam_round.fsm"; 
uisleep 38.4; 
EMonkeys_EscRoundCam = true; 
 
//Lotsen 
_camera camSetPos [(_lotsen select 0) + 6.8,(_lotsen select 1) + 50, _hoehe]; 
_camera camSetTarget _lotsen; 
_camera camCommit _zlotsen; 
[_lotsen, _zlotsen] spawn _newfocus; 
uisleep 12; 
playSound "Tutorial5"; 
WaitUntil {camCommitted _camera}; 
_camera camSetPos [(_lotsen select 0) + 6.8,(_lotsen select 1) + 12.8, 3]; 
_camera camCommit 3; 
WaitUntil {camCommitted _camera}; 
["LOTSEN",33] spawn _setTitel; 
[["ehrenamtliche Spieler","erweiterte Spieleinführung","für Erklärungen","Tragen eine hellblaue<br/>  Uniform","Erreichbar über...<br/>   - dein Handy<br/>   - unseren Ts3 Server"],32] spawn _setInfobox; 
[_camera, _lotsen, 3, 14.5, 3, true, 62] execFSM "core\fsm\cam_round.fsm"; 
uisleep 35; 
EMonkeys_EscRoundCam = true; 
2 fadeSound 0; 
0 cutText ["","BLACK OUT",2]; 
0 cutFadeOut 9999999; 
closeDialog 0; 
uisleep ((round random 3) + 4); 
 
//Player Position 
{ 
 if(count(nearestObjects[(_x select 0),["Man"],4]) == 0) exitWith {_playerSpawn = _x}; 
}forEach _Spawnpoints; 
player setpos (_playerSpawn select 0); 
player setDir (_playerSpawn select 1); 
_posPlayer = getPosATL player; 
 
//Camera In Gebäude 
_camera camSetTarget _posPlayer; 
_camera camSetRelPos [-80,0,100]; 
_camera camCommit _zplayer; 
WaitUntil {camCommitted _camera}; 
3 fadeSound 0.8; 
0 cutText ["","BLACK IN"]; 
0 cutFadeOut 3; 
_camera camSetRelPos [-0.2,0,2]; 
_camera camCommit 8; 
WaitUntil {camCommitted _camera}; 
_camera cameraEffect ["terminate","back"]; 
camDestroy _camera; 
///////////////////////////Camera Tutorial Beendet//////////////////////////////// 
 
///////////////////////////Interactives Tutorial////////////////////////////////// 
//Crafting Menu zeigen 
playSound "Tutorial6"; 
uisleep 16; 
[] spawn EMonkeys_fnc_p_openMenu; 
uisleep 3.3; 
 //Icon blinken lassen 
 _display = (findDisplay 2001) displayCtrl 2055; 
 for "_i" from 1 to 2 do 
 { 
  _display ctrlSetFade 1; 
  _display ctrlCommit 0.5; 
  waitUntil {ctrlCommitted _display}; 
  _display ctrlSetFade 0; 
  _display ctrlCommit 0.5; 
  waitUntil {ctrlCommitted _display}; 
 }; 
uisleep 0.9; 
closeDialog 0; 
createDialog "EMonkeys_craft"; 
uisleep 31.9; 
closeDialog 0; 
 
//Aufgabe erstellen "Baue eine Offroader" 
_task_tutorial = player createSimpleTask ["Tutorial: Baue einen Offroader"]; 
_task_tutorial setSimpleTaskDescription ["Befolge die Anweisungen und erhalte zum Schluss des Tutorials einen Geländewagen","Tutorial: Bau einen Offroader",""]; 
_task_tutorial setTaskState "Assigned"; 
player setCurrentTask _task_tutorial; 
["Tutorial",["Baue einen Offroader"]] call bis_fnc_showNotification; 
 
uisleep 3; 
 
//Camera effect Laptop 
playSound "Tutorial7"; 
_camera = "camera" camCreate [(_posPlayer select 0), (_posPlayer select 1),(_posPlayer select 2)+ 2]; 
_camera cameraEffect ["internal","back"]; 
_camera camSetPos [(_laptop select 0) - 1.496, (_laptop select 1) + 0.276,(_laptop select 2) + 0.2]; 
_camera camSetTarget _laptop; 
_camera camCommit _zlaptop; 
WaitUntil {camCommitted _camera}; 
uisleep 4.5; 
 
//Cam löschen 
_camera cameraEffect ["terminate","back"]; 
camDestroy _camera; 
disableUserInput false; //Spieler Kontrolle einschalten 
6 fadeSound 1; 
 
if(EMonkeys_c164 < 20000) then 
{ 
 EMonkeys_c164 = EMonkeys_c164 + 20000; 
}; 
 
//Aufgabe erstellen "Laptop" 
_task_laptop = player createSimpleTask ["Tutorial Aufgabe: Laptop"]; 
_task_laptop setSimpleTaskDescription ["Gehe zum Laptop und kaufen dir einen Bauplan für den Offroad um mit dem Tutorial fortzufahren!","Tutorial Aufgabe: Laptop",""]; 
_task_laptop setTaskState "Assigned"; 
player setCurrentTask _task_laptop; 
["Tutorial",["Gehe zum Laptop und kaufe einen Bauplan"]] call bis_fnc_showNotification; 
WaitUntil {EMonkeys_inv_bs_offroad > 0}; 
closeDialog 0; 
 
_posPlayer = [(getPosATL player select 0), (getPosATL player select 1),(getPosATL player select 2)+ 1.8]; //Update Player Position 
 
//Tutorial Craftingzone 
2 fadeSound 0.8; 
_camera = "camera" camCreate _posPlayer; 
_camera cameraEffect ["External","back"]; 
_camera camSetPos [3106.14,12488.3,2.5]; 
_camera camSetTarget _posPlayer; 
_camera camCommit (_zcraftingzone / 2); 
uisleep 2; 
playSound "Tutorial8"; 
WaitUntil {camCommitted _camera}; 
_task_laptop setTaskState "Succeeded"; 
["Tutorial",["Du hast dir erfolgreich einen Bausatz ""Offroad"" gekauft"]] call bis_fnc_showNotification; 
_camera cameraEffect ["Internal","back"]; 
_camera camSetTarget _craftingzone; 
_camera camSetRelPos [-10,0,2.5]; 
_camera camCommit (_zcraftingzone / 2); 
WaitUntil {camCommitted _camera}; 
uisleep 2.4; 
createDialog "EMonkeys_craft"; 
(findDisplay 666) displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"]; 
_display = (findDisplay 666) displayCtrl 674; 
_display ctrlEnable false; 
uisleep 8.2; 
closeDialog 0; 
0 cutText ["","BLACK OUT",2]; 
0 cutFadeOut 9999999; 
uisleep 2; 
_camera cameraEffect ["terminate","back"]; 
camDestroy _camera; 
0 cutText ["","BLACK IN"]; 
0 cutFadeOut 3; 
4 fadeSound 1; 
EMonkeys_TutorialLeave = true; 
 
//Aufgabe erstellen "Geländewagen" 
_task_Offroad = player createSimpleTask ["Tutorial Aufgabe: Geländewagen"]; 
_task_Offroad setSimpleTaskDescription ["Gehe zur Crafting Zone außerhalb des Gebäudes und Bau dir mit hilfe des Crafting Menus einen Geländewagen","Tutorial Aufgabe: Geländewagen",""]; 
_task_Offroad setTaskState "Assigned"; 
player setCurrentTask _task_Offroad; 
["Tutorial",["Gehe zur Crafting Zone und bau dir einen Geländewagen"]] call bis_fnc_showNotification; 
 
WaitUntil {eM_TutorialVehicle}; //Auf Fahrzeug warten 
uisleep 3; 
playSound "Tutorial10"; 
0 cutText ["","BLACK IN"]; 
0 cutFadeOut 3; 
_task_Offroad setTaskState "Succeeded"; 
_task_tutorial setTaskState "Succeeded"; 
["Tutorial",["Du hast dir erfolgreich einen Geländewagen hergestellt"]] call bis_fnc_showNotification; 
 
uisleep 2; 
["Herzlichen Willkommen<br/> bei den Electronic Monkeys",["Das Tutorial wurde erfolgreich beendet.","Wir wünschen dir viel Spaß"],"#81c800"] call EMonkeys_fnc_specialText; 
EMonkeys_PlayerInTutorial = false; 
EMonkeys_TutorialLeave = false; 
eM_TutorialVehicle = false; 
eM_TutorialAusweis = false; 
EMonkeys_TutorialMusic = false; 
 
uisleep 20; 
["Tipp",["Du kannst dein Fahrzeug","öffnen indem du ""U"" drückst"],"#81c800"] call EMonkeys_fnc_specialText;