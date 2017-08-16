/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Does all side specific vehicle setup features
*/

private ["_vehicle"];

_vehicle = _this select 0;
_special = _this select 1;
if(isNil "_special")then{_special = 0};

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
			case "C_Offroad_02_unarmed_F":
				{
				if(DS_copLevel < 5)then
					{
					_vehicle animate ["hideBullbar", 1];
					_vehicle animate ["hideFenders", 1];
					_vehicle animate ["hideHeadSupportRear", 1];
					_vehicle animate ["hideHeadSupportFront", 1];
					_vehicle animate ["hideSpareWheel", 1];
					}
					else
					{
					_vehicle animate ["hideBullbar", 0];
					_vehicle animate ["hideFenders", 0];
					_vehicle animate ["hideHeadSupportRear", 0];
					_vehicle animate ["hideHeadSupportFront", 0];
					_vehicle animate ["hideSpareWheel", 0];
					};
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
		if(player getVariable ["security",true])then
			{
			_vehicle setVariable ["setUp",1,true];
			switch(typeOf _vehicle)do
				{
				case "B_Heli_Light_01_F":
					{
					_vehicle animate ["AddHoldingFrame",1];
					_vehicle animate ["AddCargoHook_COver",1];
					_vehicle animate ["AddTread",1];
					_vehicle animate ["AddBackseats",1];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_vehicle animate ["AddBenches",1];
					_vehicle animate ["AddHoldingFrame",1];
					_vehicle animate ["AddCargoHook_COver",1];
					_vehicle animate ["AddTread",1];
					_vehicle animate ["AddBackseats",1];
					};
				};
			};
		};
	case civilian:
		{
		switch(typeOf _vehicle)do
			{
			case "C_Offroad_02_unarmed_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["hideBullbar",1];
						_vehicle animate ["hideRollcage",1];
						};
					case 4://Gang
						{
						_vehicle animate ["hideBullbar",1];
						_vehicle animate ["hideRollcage",1];
						_vehicle animate ["hideFenders",1];
						_vehicle animate ["hideHeadSupportRear",1];
						_vehicle animate ["hideHeadSupportFront",1];
						_vehicle animate ["hideSpareWheel",1];
						};
					case 5://rebel
						{
						_vehicle animate ["hideLeftDoor",1];
						_vehicle animate ["hideRightDoor",1];
						_vehicle animate ["hideHeadSupportRear",1];
						_vehicle animate ["hideSpareWheel",1];
						};
					case 1://Civ Upgraded
						{
						_vehicle animate ["hideBullbar",0];
						_vehicle animate ["hideRollcage",0];
						_vehicle animate ["hideFenders",0];
						_vehicle animate ["hideHeadSupportRear",0];
						_vehicle animate ["hideHeadSupportFront",0];
						_vehicle animate ["hideSpareWheel",0];
						_vehicle animate ["hideLeftDoor",0];
						_vehicle animate ["hideRightDoor",0];
						};
					};
				};
			case "B_Heli_Light_01_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["AddBenches",0];
						_vehicle animate ["AddTread",0];
						_vehicle animate ["AddBackseats",0];
						_vehicle animate ["AddCargoHook_COver",0];
						};
					case 4://Gang
						{
						_vehicle animate ["AddBenches",1];
						_vehicle animate ["AddHoldingFrame",1];
						_vehicle animate ["AddCargoHook_COver",0];
						};
					case 5://rebel
						{
						_vehicle animate ["AddTread",0];
						_vehicle animate ["AddHoldingFrame",1];
						_vehicle animate ["AddCargoHook_COver",0];
						};
					case 1://Civ Upgraded
						{
						_vehicle animate ["AddBenches",1];
						_vehicle animate ["AddHoldingFrame",1];
						_vehicle animate ["AddCargoHook_COver",1];
						_vehicle animate ["AddTread",1];
						_vehicle animate ["AddBackseats",1];
						};
					};
				};
			case "C_Heli_Light_01_civil_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["AddDoors",0];
						_vehicle animate ["AddBackseats",0];
						_vehicle animate ["AddTread",0];
						_vehicle animate ["AddCargoHook_COver",0];
						};
					case 1://Civ Upgraded
						{
						_vehicle animate ["AddCargoHook_COver",1];
						_vehicle animate ["AddDoors",1];
						_vehicle animate ["AddBackseats",1];
						_vehicle animate ["AddTread",1];
						};
					};
				};
			case "C_Offroad_01_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["HideGlass2",1];
						_vehicle animate ["Proxy",0];
						_vehicle animate ["Destruct",0];
						};
					case 1://Civ Upgraded
						{
						_vehicle animate ["HideGlass2",1];
						_vehicle animate ["HideBumper2",0];
						_vehicle animate ["HideConstruction",0];
						_vehicle animate ["Destruct",0];
						_vehicle animate ["Proxy",0];
						};
					};
				};
			case "B_T_LSV_01_unarmed_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["HideDoor1",1];
						_vehicle animate ["HideDoor2",1];
						_vehicle animate ["HideDoor3",1];
						_vehicle animate ["HideDoor4",1];
						};
					case 1://Special
						{
						_vehicle animate ["HideDoor1",0];
						_vehicle animate ["HideDoor2",0];
						_vehicle animate ["HideDoor3",0];
						_vehicle animate ["HideDoor4",0];
						};
					};
				};
			case "B_T_LSV_01_armed_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["HideDoor1",1];
						_vehicle animate ["HideDoor2",1];
						_vehicle animate ["HideDoor3",1];
						_vehicle animate ["HideDoor4",1];
						};
					case 1://Special
						{
						_vehicle animate ["HideDoor1",0];
						_vehicle animate ["HideDoor2",0];
						_vehicle animate ["HideDoor3",0];
						_vehicle animate ["HideDoor4",0];
						};
					};
				};
			case "O_T_LSV_02_unarmed_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["Unarmed_Doors_Hide",1];
						};
					case 1://Special
						{
						_vehicle animate ["Unarmed_Doors_Hide",0];
						};
					};
				};
			case "O_T_LSV_02_armed_F":
				{
				switch(_special)do
					{
					case 0://Civilian
						{
						_vehicle animate ["Unarmed_Doors_Hide",1];
						};
					case 1://Special
						{
						_vehicle animate ["Unarmed_Doors_Hide",0];
						};
					};
				};
			};
		};
	};