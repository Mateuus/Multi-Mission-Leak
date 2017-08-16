#define GETC(var) (call var)
private["_vehic","_money"];
_vehic = cursorTarget;
_money = _vehic getVariable ["money",0];
if(GETC(life_tafflevel) == 8) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous êtes un employé de la Brinks, vous ne pouvez pas braquer vos propres véhicules !","PLAIN"];};
if(!(_vehic getVariable["brinksvehic",false])) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nCe n'est pas un véhicule de la Brinks !","PLAIN"];};
if(_money == 0) then {titleText["\n\n\n\n\n\n\n\n\n\n\n\nCe camion est vide !","PLAIN"];};
if((player distance _vehic) > 4) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nLe véhicule est trop loin !","PLAIN"];};
titleText["\n\n\n\n\n\n\n\n\n\n\n\nPatientez...","PLAIN"];
_timeToAdd = (random 120) + 90;
_time = time + _timeToAdd;

titleText["Tu as déclenché l'alarme !!","PLAIN"];
[[steamid,name player,"515"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;		
[[_curTarget, "CarAlarm",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[0,format["Le camion de la Brinks est en train de se faire braquer !",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
_Pos = position player; 
_marker = createMarker ["Markerbrinks", _Pos]; 
"Markerbrinks" setMarkerColor "ColorRed";
"Markerbrinks" setMarkerText "!ATTENTION! Braquage de Brinks en cours !ATTENTION!";
"Markerbrinks" setMarkerType "mil_warning";	
							
while{_time > time} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.5;
	if((player distance _vehic) > 4) then {life_interrupted = true};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
deleteMarker "Markerbrinks";	
argent_liquide = argent_liquide + _money;
_vehic setVariable ["money",0,true];
_vehic setVariable ["holdup",true,true];
titleText[format["\n\n\n\n\n\n\n\n\n\n\n\nVous avez volé %1 € !",_money],"PLAIN"];