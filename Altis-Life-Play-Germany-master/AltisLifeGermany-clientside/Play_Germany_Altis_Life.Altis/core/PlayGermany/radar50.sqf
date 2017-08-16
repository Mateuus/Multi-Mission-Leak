#include <macro.h>
private ["_fahrzeug","_blitzer","_name","_list", "_strafe", "_speed"];

while {playerSide == civilian} do
{
	_fahrzeug = vehicle player;
	_speed = speed _fahrzeug;
	_blitzer = [Kavala_1,Blitzer_2,Blitzer_4,Blitzer_5, Blitzer_8, Blitzer_10,Blitzer_12];
	_name = getText (configFile >> "CfgVehicles" >> (typeOf _fahrzeug) >> "displayname");
	{
		if ((player == driver _fahrzeug) && (_fahrzeug distance _x < 15) && (_speed >= 60)) then
		{	
			titleCut [" ","white in",1];
			switch(true) do
			{
				case ((_speed >= 60) && (_speed < 70)): { _strafe = 10000; };
				case ((_speed >= 70) && (_speed < 100)): { _strafe = 25000; };
				case ((_speed >= 100) && (_speed < 125)): { _strafe = 50000; };
				case ((_speed >= 125) && (_speed < 150)): { _strafe = 100000; };
				case ((_speed >= 150) && (_speed < 400)): { _strafe = 150000; };
			};
			if(BANK > _strafe) then {
			hint format ["Du wurdest gerade geblitzt! (Limit: 50, Geschwindigkeit: %1)", round _speed];
			titleText[format["Für dein Vergehen wurde dir ein Bußgeld in Höhe von %1  Euro von deinem Bankkonto abgezogen!",_strafe],"PLAIN"];
			[[0,format["%1 wurde in einer 50er Zone geblitzt! Fahrzeug: %4, Position: %3, Geschwindigkeit: %2 Kmh, Bußgeld: $%5!",name player, round _speed, _x, _name, _strafe]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			SUB(BANK,_strafe);
			};
			sleep 3;
		};
	} foreach _blitzer;
	sleep 0.1;
};