private["_gewinnsumme","_steuer","_msg","_query","_queryResult","_playername","_gewinner","_online"]; 
if (lotto isequalto []) exitwith { 
 _msg = format [" 
  <t align='center' size='1.5' color='#EDF5F5'>Der Gewinner der heutigen Ziehung ist die Bank.</t> 
  <br/> 
  <br/> 
  <img size ='3' image='Resources\textures\icons\money.paa' /> 
  <br/> 
  <t align='center' size='2' color='#DC143C'>Es hat niemand mitgespielt</t> 
  <br/> 
 "]; 
 [4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",civilian]; 
 [4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",east]; 
}; 
private _count = count lotto; 
_gewinner = selectrandom lotto; 
_gewinnsumme = round (((count lotto) * GJZHuPDR)* ((100 - wCrWgCLX) / 100)); 
 
if(_gewinnsumme > 8000000) then {_gewinnsumme = 8000000;}; 
 
lotto = []; 
profilenamespace setVariable ["lotto",nil]; 
 
_query = format ["playerInfo:%1",_gewinner]; 
_queryResult = [_query,2,false] call DB2_fnc_extdbcallHC; 
 
_playername = (_queryResult select 3); 
 
_listegewinner = profilenamespace getVariable ["Lottogewinner",[]]; 
_listegewinner pushback [_playername,_gewinnsumme]; 
profilenamespace setVariable ["Lottogewinner",_listegewinner]; 
 
//online Check 
_online = {if (getplayeruid _x isequalto _gewinner) exitwith {_x};}foreach (allPlayers - entities "HeadlessClient_F"); 
zo_log = format ["LOTTO GEWINN: Gewinn Spieler:%1 Gewinnsumme:%2 Lose:%3",_playername,[_gewinnsumme] call zero_fnc_nAnP,_count]; 
publicvariableserver "zo_log"; 
 
_msg = format [" 
 <t align='center' size='1.5' color='#EDF5F5'>Der Gewinner der heutigen Ziehung ist.</t> 
 <br/> 
 <br/> 
 <img size ='3' image='Resources\textures\icons\money.paa' /> 
 <br/> 
 <t align='center' size='2' color='#DC143C'>%1</t> 
 <br/> 
 <br/> 
 <t align='center' size='1' color='#EDF5F5'>Herzlichen Glückwunsch von der Zero-One Lotterie</t> 
 <br/> 
",_playername]; 
[4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",civilian]; 
[4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",east]; 
 
if (isnil "_online") then { 
 //offline 
 _query = format ["updatePlayerCashlotto:%1:%2",_gewinnsumme,_gewinner]; 
 _queryResult = [_query,1,true] call DB2_fnc_extdbcallHC; 
} else { 
 //online 
 [3,format ["Du hast %1 gewonnen. Herzlichen Glückwunsch!",[_gewinnsumme] call zero_fnc_nAnP], "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",_online]; 
 while {_gewinnsumme > 0} do { 
  if (_gewinnsumme > 900000) then { 
   [900000,"Zero-One Lotterie",_gewinner] remoteExecCall ["zero_fnc_sOGUHNZbt",_online]; 
   _gewinnsumme = _gewinnsumme - 900000; 
  } else { 
   [_gewinnsumme,"Zero-One Lotterie",_gewinner] remoteExecCall ["zero_fnc_sOGUHNZbt",_online]; 
   _gewinnsumme = 0; 
  }; 
  uisleep 0.5; 
 }; 
}; 
