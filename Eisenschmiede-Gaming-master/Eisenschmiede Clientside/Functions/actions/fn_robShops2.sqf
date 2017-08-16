/*         
            file: fn_robShops2.sqf
            Author: MrKraken
            Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
            Description:
            Executes the rob shob action!
            Idea developed by PEpwnzya v2.0
            
*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if !(alive _robber) exitWith {};

_rip = true;
_kassa = 15000 + round(random 15000); //Maximal & Minimal Beute
[[_shop,_robber,_action,-1],"ES_fnc_shopState",false,false] spawn ES_fnc_MP;

_chance = random(100);
if(_chance >= 85) then { hint "Der Kassierer hat heimlich die Polizei informiert!"; _Pos = position player; // <-----------NEU NEU NEU
_marker = createMarker ["Marker200", _Pos]; 
"Marker200" setMarkerColor "ColorRed";
"Marker200" setMarkerText "!ACHTUNG......Überfall....ACHTUNG!";
"Marker200" setMarkerType "mil_warning"; [[0,format["ALARM! - Gasstation: %1 wird überfallen!", _shop]],"ES_fnc_broadcast",west,false] spawn ES_fnc_MP; };
//Setup our progress bar.
disableSerialization;
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNameSpace getVariable "ES_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Es wird ausgeraubt , bleib in der nähe (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
    while{true} do
    {
        sleep  0.85;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Es wird ausgeraubt , bleib in der nahe (5m) (%1%2)...",round(_cP * 100),"%"];
        if(_cP >= 1) exitWith {};
        if(_robber distance _shop > 5) exitWith { };
        if!(alive _robber) exitWith {};
        
    }; // the loop continues til the progressbar is full, distance is exceeded or robber dies. 
    if!(alive _robber) exitWith { _rip = false; };
    if(_robber distance _shop > 5) exitWith { hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben."; 5 cutText ["","PLAIN"]; _rip = false; };
    5 cutText ["","PLAIN"];
	deleteMarker "Marker200"; // <-----------NEU NEU NEU
    titleText[format["Du hast %1 geklaut, nichts wie weg hier , die Cops sind auf dem Weg!",[_kassa] call ES_fnc_numberText],"PLAIN"];
    ES_cash = ES_cash + _kassa; 
	deleteMarker "Marker200"; // <-----------NEU NEU NEU
    _rip = false;
    ES_use_atm = false;
    sleep (15 + random(90)); //Clerk in the store takes between 30-210 seconds before he manage to warn the police about the robbery. 
    ES_use_atm = true; // Robber can not use the ATM at this point.
    if!(alive _robber) exitWith {};
    [[0,format["112 - Gasstation: %2 wurde gerade von %1 ausgeraubt für ein Preis von $%3",name _robber, _shop, [_kassa] call ES_fnc_numberText]],"ES_fnc_broadcast",west,false] spawn ES_fnc_MP;
    [[0,format["NEWS: Gasstation: %2 wurde gerade von %1 ausgeraubt für ein Preis von $%3",name _robber, _shop, [_kassa] call ES_fnc_numberText]],"ES_fnc_broadcast",civilian,false] spawn ES_fnc_MP;
    [[getPlayerUID _robber,name _robber,"211A"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
	deleteMarker "Marker200"; // <-----------NEU NEU NEU	
};
[[_shop,_robber,_action,0],"ES_fnc_shopState",false,false] spawn ES_fnc_MP;