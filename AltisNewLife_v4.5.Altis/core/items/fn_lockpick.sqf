#include <macro.h>
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
#define SAFETY_ZONES    [["civ_spawn_1", 850], ["civ_spawn_3", 250]]
if ({player distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) exitWith {
	titleText["Pas de vols en safezone","PLAIN"];
};
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Truck")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint "Les clefs du véhicules sont deja dans ton porte-clefs."};
// Impossible vehicules to lockpick:
if((typeOf _curTarget) == "I_MRAP_03_hmg_F" || (typeOf _curTarget) == "O_MRAP_02_hmg_F" || (typeOf _curTarget) == "B_G_Offroad_01_armed_F" || (typeOf _curTarget) == "B_MRAP_01_hmg_F" || (typeOf _curTarget) == "B_Truck_01_mover_F") exitWith {hint "Aucune chance de crocheter ce véhicule."};
//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};
_title = format["Crochetage %1",if(!_isVehicle) then {"des menottes"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions
//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	//if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
	//	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	//	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	//};
	//uiSleep 0.26;
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];   //EDIT
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};

		uiSleep 0.195; // 3 fois 6.5 secondes = 19,5secondes

	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player getVariable["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!isNil "_badDistance") exitWith {titleText["Tu es trop loin !","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulée","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget SVAR["restrained",false,true];
	_curTarget SVAR["Escorting",false,true];
	_curTarget SVAR["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice > 30) then 
	{
		titleText["Tu as déclenché l'alarme !!","PLAIN"];
		[[steamid,name player,"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;		
		[[_curTarget, "CarAlarm",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	};	
	if(_dice < 20) then {
		titleText["Tu as maintenant les clefs du vehicule.","PLAIN"];
		life_vehicles pushBack _curTarget;
		[[steamid,name player,"487"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	} else {
		[[steamid,name player,"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[[0,format["%1 a été vu en train d'essayé de voler un vehicule.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		titleText["Le crochetage s'est rompu.","PLAIN"];
	};
};