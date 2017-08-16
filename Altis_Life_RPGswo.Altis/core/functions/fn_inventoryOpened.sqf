/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
if(side _unit == WEST) exitWith 
{
	if ((!isNil "DWEV_paintball") && DWEV_paintball) then 
	{
		hint "Inventar darf in der Arena nicht benutzt werden";
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
		};	
	};
	
	if(_container isKindOf "Man" && !alive _container) exitWith 
	{
		hint "Du darfst keine Toten looten!";
		[] spawn 
		{
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
		};
	};

}; // Polizisten dürfen in Rucksäcke, Kisten und Fahrzeuge schauen aber nicht in leichen.

if ((player getVariable["DWEV_paintball_dome",false]) || (player getVariable["DWEV_paintball_arena",false])) exitWith 
{
	hint "Inventar darf in der Arena nicht benutzt werden";
	[] spawn 
	{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
	};
}; 

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then 
{
	hint "Du darfst nicht in Rucksäcke anderer Leute schauen.";
	[] spawn 
	{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith 
{
	_house = nearestBuilding (getPosATL player);
	if(!(_house in DWEV_vehicles) && {(_house getVariable ["locked",false])} && {(_container getVariable ["BoxRobbed",false])}) then 
	{
		hint "Du hast keine Berechtigung in die Lagerkiste zuschauen, lass sie vom Hausbesitzer oeffnen.";
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
		};
	};
};


/// Sperre der Lagerkisten in den Häusern wegen extDB bug und Serverchash
/*
if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	
		hint "Das Haus Inventar ist aufgrund der Serverabstürze vorrübergehend deaktiviert \n\n\n Das T Inventar kann ganz normal benutzt werden";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
};
*/
///////////////////////////////////////////////////////////

if( (_container isKindOf "Car") || (_container isKindOf "Air") || (_container isKindOf "Ship") ) exitWith  // Abschießen des Kofferraums von Fahrzeugen (I - Inventar) wenn spieler keinen Schlüssel zum Fahrzeug hat
{       
	if(!(_container in DWEV_vehicles || _container in DWEV_robbed_vehicles) /*&& (locked _container == 2)*/) then 
	{
		hint "Du hast keinen Schlüssel für dieses Fahrzeug";
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;

		};
	}
	else
	{
		if (_container getVariable["DWEV_INVENTORY_OPEN",false]) exitWith 
		{
			hint "Jemand anderes benutzt das Inventar bereits";
			[] spawn 
			{
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
				uisleep 0.2;
				closeDialog 0;
			};

		};

		_container setVariable["DWEV_INVENTORY_OPEN",true,true];
		_container setVariable["DWEV_INVENTORY_OPENER",getPlayerUID player,true];
		
		_container spawn 
		{
			while {_this getVariable["DWEV_INVENTORY_OPEN",false]} do
			{
				sleep 0.2;
						if (_this getVariable["DWEV_INVENTORY_OPENER",getPlayerUID player] != getPlayerUID player) exitWith 
						{
							hint "Jemand anderes benutzt das Inventar bereits";
							[] spawn 
							{
								waitUntil {!isNull (findDisplay 602)};
								closeDialog 0;
								uisleep 0.2;
								closeDialog 0;
								uisleep 0.2;
								closeDialog 0;
								uisleep 0.2;
								closeDialog 0;
								uisleep 0.2;
								closeDialog 0;
								uisleep 0.2;
								closeDialog 0;
							};

						};
			};
		};
	};
};
	//Allow alive players who've been knocked out to be looted, just not the dead ones
	if(_container isKindOf "Man" && !alive _container) exitWith 
	{
	hint "Du darfst keine Toten looten!";
	[] spawn 
	{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
			uisleep 0.2;
			closeDialog 0;
	};
};