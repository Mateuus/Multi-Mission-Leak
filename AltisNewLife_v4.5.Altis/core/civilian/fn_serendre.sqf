titleText["Vous preférez vous rendre, votre vie est si precieuse","PLAIN"];
titleFadeOut 4;
[[1,format["%1 a preferé se rendre plutôt que de risquer sa vie !",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
_box = boundingBox player;  
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...
_sp = visiblePosition player;
_sp = _sp vectorAdd [0,0,_offset]; 
_vh = createVehicle ["Sign_Arrow_Large_Green_F", _sp ,[],0,"NONE"];
_vh setPos _sp; 
uiSleep 2;
deleteVehicle _vh;
if (currentWeapon player != "") then {
[1] call life_fnc_holsterWeapon;
};
player action ["Eject", vehicle player];
player setVariable ["surrender", true, true];
while { player getVariable ["surrender", false] }  do { 
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};
player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";