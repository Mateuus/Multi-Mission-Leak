private ["_marker"];
if(playerside != west)exitWith{};
if(ESG_sos_cooldown)exitWith{hint "Chill mal! Nicht so schnell!"};
ESG_sos_cooldown = true;
parsetext format["<t align='center' font='PuristaBold' size='2' color='#ff0000'>SOS-Alarm</t><br/><br/><t align='center' size='1.5'>%3<br/><br/>%1 hat den Notrufknopf betätigt! Alle Einheiten werden benötigt!<br/><br/>Position: %2<br/><br/>%3</t>",player getVariable["realname",name player], mapGridPosition player,'============']remoteExec ["hint",west];
"alarm" remoteExec["playsound", west];
[player]remoteExec["ESG_fnc_sosMarker",west];
[]spawn {
  sleep 90;
  hint "Deine SOS-Markierung wurde gelöscht!";
  sleep 60;
  ESG_sos_cooldown = false;
};
