private["_ui","_progress","_pfand","_pgText","_cp","_this"];
_pfand = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = _this select 0;
_action = _this select 2;

	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (player distance _pfand > 5) exitWith { hint "Bleib gefälligst da!!"; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (isNull player OR isNull _pfand) exitWith {};
	if (!alive player) exitWith {};
	

_item = 1 + round(random 7);
_nagelband = 1 + round(random 12);
_fuel = 1 + round(random 4);
_pickaxe = 1 + round(random 5);
_marijuana = 1 + round(random 15);
_toolkit = 1 + round(random 5);
_fuelEmpty = 1 + round(random 3);
_lockpick = 1 + round(random 6);
_donuts = 1 + round(random 5);
_gold = 1 + round(random 100);

_unit removeAction _action;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du durchsuchst den Mülleimer (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Du durchsuchst den Mülleimer (%1%2)...",round(_cP * 100),"%"];
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	if (!alive player) exitWith {};
	if (player distance _pfand > 5) exitWith {hint "Du hast dich zu weit entfernt!"; 5 cutText ["","PLAIN"];};		
	if(_cP >= 1) exitWith {};
}; 

if (player distance _pfand > 5) exitWith { hint "Du hast dich zu weit entfernt!";};

5 cutText ["","PLAIN"];

[true,"pfandflasche",_item] call life_fnc_handleInv;

titleText[format["Du hast %1 Pfandflaschen gefunden",[_item] call life_fnc_numberText],"PLAIN"];

if (_nagelband == 2) then {[true,"spikeStrip",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Nagelband"]; };

if (_fuel == 2) then {[true,"fuelFull",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Benzinkanister"]; };

if (_pickaxe == 2) then {[true,"pickaxe",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Spitzhacke"]; };

if (_marijuana == 2) then {[true,"marijuana",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Marijuana"]; };

if (_toolkit == 2) then {[true,"toolkit",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Werkzeugkasten"]; };

if (_fuelempty == 2) then {[true,"fuelempty",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Leerer Benzinkanister"]; };

if (_lockpick == 2) then {[true,"lockpick",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Dietrich"]; };

if (_donuts == 2) then {[true,"donuts",2] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>2x Donuts"]; };

if (_gold == 2) then {[true,"goldbar",1] call life_fnc_handleInv; hint parseText format ["<t color='#FF0000'><t size='2'>Außerdem Gefunden</t></t><br/><t color='#FFD700'><t size='1.5'>" + "</t></t><br/>Goldbarren"]; };


sleep 300;

_unit addAction["<t color='#ADFF2F'>Pfandflaschen sammeln</t>",life_fnc_pfand]; 
