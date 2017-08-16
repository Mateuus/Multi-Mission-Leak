/*
file: fn_robShops.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint "Tu ne peux pas dérober cette station" };
if(_robber distance _shop > 5) exitWith { hint "Tu dois etre a moins de 5 mètres" };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "Avancement du braquage !" };
if (vehicle player != _robber) exitWith { hint "Sors de ton véhicule !" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Haha, rigolo de kermesse ! Casses-toi !" };
if (_kassa == 0) exitWith { hint "La caisse est vide !" };// si il n'y a rien dans la caisse alors elle est vide (suite a un braquage)

_rip = true;
_kassa = 20000 + round(random 10000);//20000= le nombre minimal de la recette + suivant d'un "tirage au hasard"
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance < 50) then { hint "Le caissier avait une alarme secrete, la police arrive!"; [[1,format["ALERTE une Station Service est dérobé!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; }; //une chance sur 2 que la police sois contacter pendant le braquage

_cops = (west countSide playableUnits);
if(_cops < 2) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "Il n'y a pas assez de policiers!";}; //2 est le nombre de policiers necessaire 
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Progression du braquage (tu dois être à moins de 10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
while{true} do
{
sleep 0.8;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Progression du braquage (tu dois être à 10m) (%1%2)...",round(_cP * 100),"%"];
_Pos = getPosWorld player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "Attention, braquage en cours !";
				                "Marker200" setMarkerType "mil_warning";
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint "Tu dois rester à < 10m pour que le braquage continue !"; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Vous avez volé $%1, maintenant partez, les flics arrivent !",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;

_rip = false;
life_use_atm = false;
sleep (60 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
//[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
_action = _shop addAction["Braquer la station service",life_fnc_robShops];
_shop switchMove "";