/*
	File: fn_vehDoors.sqf
	Author: Huntah "Shawn" Macgillivray  (Go on SgtNeverlast change the Author to yourself as always... you're such a shit cunt)
	
	Description:
	Simple script to open close doors on vehicles at given times.
*/
private["_vehicle","_driver"];

_vehicle = _this select 0;
_driver = _this select 1;

if(typeOf _vehicle == "I_MRAP_03_F")then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 1, false];
		}
		else
		{
		_vehicle animateDoor ["Door_RF", 1, false];
		};
	};
if(typeOf _vehicle == "O_MRAP_02_F")then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 1, false];
		_vehicle animateDoor ["Door_RF", 1, false];
		}
		else
		{
		_vehicle animateDoor ["Door_LB", 1, false];
		_vehicle animateDoor ["Door_RB", 1, false];
		_vehicle animateDoor ["Door_rear", 1, false];
		};
	};	
if(typeOf _vehicle in ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_L", 1, false];
		}
		else
		{
		_vehicle animateDoor ["Door_R", 1, false];
		};
	};	
	
if(typeOf _vehicle in ["B_MRAP_01_F","B_MRAP_01_hmg_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 1, false];
		}
		else
		{
		_vehicle animateDoor ["Door_RF", 1, false];
		_vehicle animateDoor ["Door_LB", 1, false];
		_vehicle animateDoor ["Door_RB", 1, false];
		};
	};
	
if(typeOf _vehicle in ["B_Heli_Transport_03_black_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_L_source", 1, false];
		}
		else
		{
		_vehicle animateDoor ["Door_R_source", 1, false];
		_vehicle animateDoor ["Door_rear_source", 1, false];
		};
	};

if(typeOf _vehicle in ["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["DoorL_Front_Open", 1, false];
		}
		else
		{
		_vehicle animateDoor ["DoorR_Front_Open", 1, false];
		_vehicle animateDoor ["DoorL_Back_Open", 1, false];
		_vehicle animateDoor ["DoorR_Back_Open", 1, false];
		};
	};
	
if(typeOf _vehicle in ["O_Heli_Attack_02_black_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["door_L", 1, false];
		}
		else
		{
		_vehicle animateDoor ["door_R", 1, false];
		_vehicle animateDoor ["door_L_pop", 1, false];
		_vehicle animateDoor ["door_R_pop", 1, false];
		};
	};
	
sleep 4;

if(typeOf _vehicle == "I_MRAP_03_F")then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 0, false];
		}
		else
		{
		_vehicle animateDoor ["Door_RF", 0, false];
		};
	};
if(typeOf _vehicle == "O_MRAP_02_F")then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 0, false];
		_vehicle animateDoor ["Door_RF", 0, false];
		}
		else
		{
		_vehicle animateDoor ["Door_LB", 0, false];
		_vehicle animateDoor ["Door_RB", 0, false];
		_vehicle animateDoor ["Door_rear", 0, false];
		};
	};	
if(typeOf _vehicle in ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_L", 0, false];
		}
		else
		{
		_vehicle animateDoor ["Door_R", 0, false];
		};
	};	
	
if(typeOf _vehicle in ["B_MRAP_01_F","B_MRAP_01_hmg_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_LF", 0, false];
		}
		else
		{
		_vehicle animateDoor ["Door_RF", 0, false];
		_vehicle animateDoor ["Door_LB", 0, false];
		_vehicle animateDoor ["Door_RB", 0, false];
		};
	};
	
if(typeOf _vehicle in ["B_Heli_Transport_03_black_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["Door_L_source", 0, false];
		}
		else
		{
		_vehicle animateDoor ["Door_R_source", 0, false];
		_vehicle animateDoor ["Door_rear_source", 0, false];
		};
	};

if(typeOf _vehicle in ["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["DoorL_Front_Open", 0, false];
		}
		else
		{
		_vehicle animateDoor ["DoorR_Front_Open", 0, false];
		_vehicle animateDoor ["DoorL_Back_Open", 0, false];
		_vehicle animateDoor ["DoorR_Back_Open", 0, false];
		};
	};
	
if(typeOf _vehicle in ["O_Heli_Attack_02_black_F"])then
	{
	if(_driver)then
		{
		_vehicle animateDoor ["door_L", 0, false];
		}
		else
		{
		_vehicle animateDoor ["door_R", 0, false];
		_vehicle animateDoor ["door_L_pop", 0, false];
		_vehicle animateDoor ["door_R_pop", 0, false];
		};
	};

