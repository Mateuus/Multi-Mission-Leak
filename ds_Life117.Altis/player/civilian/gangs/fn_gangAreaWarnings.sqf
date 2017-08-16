/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Warns gang area owners of people in their hideout
*/
private ["_myGroup","_hideOut","_group"];

if((vehicle player) isKindOf "Air")exitwith{sleep 30;[] spawn DS_civ_gangAreaWarnings;};

if(player distance gangFlag1 < 300)then
	{
	titleText  ["Warning, You are in a Gang Area, these are KOS Zones (Including unarmed persons)","PLAIN"];
	_hideout = (nearestObjects[gangFlag1,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],40]) select 0;         
	_group = _hideout getVariable ["gangOwner",grpNull];          
	if(_group != (group player))then           
		{              
			{
				if((group _x) == (_group))then
					{
					if(playerside == west)then{[[1,true],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP; };
					if(playerside == civilian)then{[[1,false],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP;};
					};
			}forEach playableUnits;
		};
	};
if(player distance gangFlag2 < 300)then
	{
	titleText  ["Warning, You are in a Gang Area, these are KOS Zones (Including unarmed persons)","PLAIN"];
	_hideout = (nearestObjects[gangFlag2,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],40]) select 0;         
	_group = _hideout getVariable ["gangOwner",grpNull];    
	if(_group != (group player))then           
		{              
			{
				if((group _x) == (_group))then
					{
					if(playerside == west)then{[[2,true],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP; };
					if(playerside == civilian)then{[[2,false],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP;};
					};
			}forEach playableUnits;
		};
	};
if(player distance gangFlag3 < 300)then
	{
	titleText  ["Warning, You are in a Gang Area, these are KOS Zones (Including unarmed persons)","PLAIN"];
	_hideout = (nearestObjects[gangFlag3,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],40]) select 0;         
	_group = _hideout getVariable ["gangOwner",grpNull];          
	if(_group != (group player))then           
		{              
			{
				if((group _x) == (_group))then
					{
					if(playerside == west)then{[[3,true],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP; };
					if(playerside == civilian)then{[[3,false],"DS_civ_gangAreaWarningsGlobal",_x,false] spawn BIS_fnc_MP;};
					};
			}forEach playableUnits;
		};
	};	