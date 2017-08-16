/*         
            file: fn_robShops.sqf
            Author: MrKraken
            Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
            Description:
            Executes the rob shob action!
            Idea developed by PEpwnzya v2.0
            
*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_geld"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if !(alive _robber) exitWith {};

_rip = true;
_kassa = 50000 + round(random 75000); //setting the money in the registry, anywhere from 50000 to 80000. 
_geld = _kassa;
if(life_erfahrung >=3425) then {_geld = _kassa *1.10;};
[[_shop,_robber,_action,-1],"TON_fnc_shopState",false,false] spawn life_fnc_MP; //sending information to the server so the animations and removeaction can be performed for all players if the checks clear. 

_chance = random(100); //calling a random number between 0-100. 
_chance2 = 25;
if(life_erfahrung >= 850) then {_chance2 = 50;};
if(life_erfahrung >= 7300) then {_chance2 =75;};
if(_chance >= _chance2) then { hint "Der Mitarbeiter hat heimlich die Polizei informiert!"; [[0,format["ALARM! - Bankfiliale: %1 wird ausgeraubt!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; }; //We set a 50% chance that the silent alarm is being triggered, wich sends a 911-message to the police. 

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Es wird ausgeraubt , bleib in der nähe (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{

_markerName = format ["Bankfiliale: %1", _shop];
_Pos = position player; // by ehno: get player pos
				_marker = createMarker [_markerName,_Pos]; //by ehno: Place a Maker on the map
				_marker setMarkerColor "ColorRed";
				_marker setMarkerText "!ACHTUNG ---Bankueberfall--- ACHTUNG!";
				_marker setMarkerType "mil_warning";
// Marker by ehno end	
    while{true} do
    {
        sleep  3;
        _cP = _cP + 0.015;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Es wird ausgeraubt, bleib in der naehe (5m) (%1%2)...",round(_cP * 100),"%"];
        if(_cP >= 1) exitWith {};
        if(_robber distance _shop > 5) exitWith { };
        if!(alive _robber) exitWith {};
		
	
        
    }; // the loop continues til the progressbar is full, distance is exceeded or robber dies. 
	deleteMarker _markerName;
    if!(alive _robber) exitWith { _rip = false; };
    if(_robber distance _shop > 5) exitWith { hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben."; 5 cutText ["","PLAIN"]; _rip = false; };
    5 cutText ["","PLAIN"];
    titleText[format["Du hast %1 geklaut, nichts wie weg hier, die Cops sind auf dem Weg!",[_kassa] call life_fnc_numberText],"PLAIN"];
    life_cash = life_cash + _geld; 
	life_erfahrung = life_erfahrung + 20;
	systemChat "+20 EXP";
	[] call life_fnc_hudUpdate;
    _rip = false;
    life_use_atm = false;
    sleep (30 + random(60)); //Clerk in the store takes between 30-210 seconds before he manage to warn the police about the robbery. 
    life_use_atm = true; // Robber can not use the ATM at this point.

	
    if!(alive _robber) exitWith {};
	if(headgear _robber in life_masked) then
	{
	[[0,format["911 - Bankfiliale %2 wurde gerade Überfallen und $%3 wurden erbeutet.",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call life_fnc_MP;
	}
	else
	{
	[[0,format["911 - Bankfiliale %2 wurde von %1 Überfallen und $%3 wurden erbeutet.",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call life_fnc_MP;
	};
	[[0,format["NEWS: Bankfiliale %1 wurde gerade Überfallen und es wurden $%2 erbeutet", _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] call life_fnc_MP;
    //[[getPlayerUID _robber,name _robber,"42"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 
};
[[_shop,_robber,_action,0],"TON_fnc_shopState",false,false] spawn life_fnc_MP;
