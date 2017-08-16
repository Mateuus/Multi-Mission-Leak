/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Does all side specific vehicle setup features
*/

private ["_vehicle"];

_vehicle = _this select 0;

switch(playerside)do
	{
	case west:
		{
		switch(typeOf _vehicle)do
			{
			case "C_Offroad_01_F":
				{
				_vehicle animate ["HidePolice", 0];
				_vehicle animate ["HideBumper1", 0];
				_vehicle animate ["HideBackpacks", 1];
				_vehicle animate ["HideDoor1", 0];  
				_vehicle animate ["HideDoor2", 0]; 
				_vehicle animate ["HideDoor3", 0];
				};
			};
		};
	case independent:
		{
		if(player getVariable ["mechanic",true])then
			{
			switch(typeOf _vehicle)do
				{
				case "C_Offroad_01_F":
					{
					_vehicle animate ["HideServices", 0];
					_vehicle animate ["HideBumper1", 0];
					_vehicle animate ["HideBackpacks", 1];
					_vehicle animate ["HideDoor1", 0];  
					_vehicle animate ["HideDoor2", 0]; 
					_vehicle animate ["HideDoor3", 0];
					};
				};
			};
		if(player getVariable ["medic",true])then
			{
			switch(typeOf _vehicle)do
				{
				case "C_Offroad_01_F":
					{
					_vehicle animate ["addDoors",1];
					_vehicle animate ["addBenches",1];
					_vehicle animate ["addTread",1];
					_vehicle lockCargo [2,true];
					_vehicle lockCargo [3,true];
					_vehicle lockCargo [4,true];
					_vehicle lockCargo [5,true];
					};
				};
			};
		};
	};

















