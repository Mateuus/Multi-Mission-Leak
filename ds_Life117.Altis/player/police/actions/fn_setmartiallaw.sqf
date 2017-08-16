#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	sets martial law for the server
*/
private["_action","_type","_amountstring","_reasonString"];

_type = _this select 0;
_amountstring = ctrltext 3951;
_reasonString = ctrltext 240755;

_action = [
	"Make sure you have the permission from the highest ranking online officer before declaring martial law or grounding all Air Vehicles. Martial law does not auto expire, it must be ended manually",
	"Martial Law",
	"Continue",
	"Abort"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(((_reasonString == "")||(_reasonString == "Enter Message to civilians or players name"))&&(_type != 10)&&(_type != 7))exitwith
	{
	hint "You must provide a reason of some type";
	};

switch (_type) do
	{
	case 0:
		{
		if(miscInfoArray select 8)exitwith{hint "This is already activated";};
		if(DS_policeBank < 50000)exitwith{hint "There needs to be at least $50k in the police bank to declare martial law on the entire island"};
		[[50000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 1:
		{
		if(miscInfoArray select 8)exitwith{hint "This is already activated";};
		if(DS_policeBank < 50000)exitwith{hint "There needs to be at least $50k in the police bank to declare martial law on the entire island"};
		[[50000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 2:
		{
		if(miscInfoArray select 8)exitwith{hint "This is already activated";};
		if(DS_policeBank < 50000)exitwith{hint "There needs to be at least $50k in the police bank to declare martial law on the entire island"};
		[[50000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 3:
		{
		if(miscInfoArray select 8)exitwith{hint "A server wide martial law is already active";};
		if(miscInfoArray select 9)exitwith{hint "This is already activated";};
		if(DS_policeBank < 20000)exitwith{hint "There needs to be at least $20k in the police bank to declare martial law"};
		[[20000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 4:
		{
		if(miscInfoArray select 8)exitwith{hint "A server wide martial law is already active";};
		if(miscInfoArray select 10)exitwith{hint "This is already activated";};
		if(DS_policeBank < 20000)exitwith{hint "There needs to be at least $20k in the police bank to declare martial law"};
		[[20000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 5:
		{
		if(miscInfoArray select 8)exitwith{hint "A server wide martial law is already active";};
		if(miscInfoArray select 11)exitwith{hint "This is already activated";};
		if(DS_policeBank < 20000)exitwith{hint "There needs to be at least $20k in the police bank to declare martial law"};
		[[20000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 6:
		{
		if(miscInfoArray select 8)exitwith{hint "A server wide martial law is already active";};
		if(miscInfoArray select 12)exitwith{hint "This is already activated";};
		if(DS_policeBank < 20000)exitwith{hint "There needs to be at least $20k in the police bank to declare martial law"};
		[[20000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
		publicVariable "DS_policeBank";
		[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
		};
	case 10:
		{
		if((!(miscInfoArry select 8))&&(!(miscInfoArry select 9))&&(!(miscInfoArry select 10))&&(!(miscInfoArry select 11))&&(!(miscInfoArry select 12)))exitwith{hint "There is no martial law currently declared";};
		[[_type],"HUNT_fnc_martiallaw"] spawn BIS_fnc_MP;
		};
	};

if(_type != 7)exitwith{};//Doesn't need to go here
if(DS_copLevel < 6)exitwith{hint "Your police level is not high enough to do this"};	
	
_action = [
	"Are you sure you want to ground all Air Vehicles? This will give civilians 5 minutes to get out of a sky, after that point any Air Vehicles is allowed to be shot down with any force (This disables the air ban if an air ban is already in progress",
	"Ground Air Vehicles",
	"Continue",
	"Abort"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_AirBan)exitwith
	{
	[[_type],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;
	};
if(DS_policeBank < 100000)exitwith{hint "There is not enough funds in the police bank to declare this"};
[[100000,false],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
[[_type,_reasonString],"HUNT_fnc_martiallaw",false,false] spawn BIS_fnc_MP;


