// Von Yakaroo & Shriver ### Keine Verwendung ohne Erlaubnis !

while {true} do {
 waitUntil {
 sleep 0.1;
 (damage player >= 0.7 && damage Player > 0.01 && alive player )
 };
 if (vehicle player != player) then {
 player allowDamage false;
 moveOut player;
 };
 hint "Eine Person wurde schwerverwundet";
 createDialog "life_deathcam";
 (findDisplay 410) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"];
 player switchCamera "INTERNAL";
 [[player,"DeadState",false],"life_fnc_animSync",true,false] call BIS_fnc_MP;

 sleep 3;
 player allowDamage true;
 while {(damage player >= 0.7 && damage Player > 0.01 && alive player )} do {
 waitUntil {
 
 	if ( damage Player < 0.7 && damage Player > 0.01 && alive player ) then {
	
	 closeDialog 1;
	 hintSilent "Du wurdest aus dem Koma wiederbelebt, benutze nun die Enter-Taste auf dem NumPad um aufzustehen !";
	 
	};
 
 sleep 0.1;
 cameraOn == player && cameraView != "Internal"
 };
 player switchCamera "Internal";
 };
 closeDialog 0;
 [[player,"AmovPpneMstpSnonWnonDnon",false],"life_fnc_animSync",true,false] call BIS_fnc_MP;
 
};
