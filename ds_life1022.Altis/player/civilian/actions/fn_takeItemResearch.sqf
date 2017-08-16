/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes money from Fort Knox money safe
*/

private ["_str","_rand","_deduction"];

if(safe_research getVariable ["closed",false])exitwith{hint "You need to crack this safe before you can take the items"};

if((DS_researchItems > 10)&&(!(miscInfoArray select 8)))exitwith
	{
	safe_research setVariable ["closed",true,true];
	safe_research setVariable ["cracking",false,true];
	police_payOut = true;
	publicVariable "police_payOut";
	DS_researchItems = 0;
	publicVariable "DS_researchItems";
	hint "You have taken all of the items this safe contained and it has been auto locked, crack it again to take more";
	[0,"A safe at the Altis Research Facility has been auto-locked however criminals are still there",true,1] remoteExecCall ["DS_fnc_globalMessage",west];
	};

if((DS_maxWeight-DS_currentWeight) < 20)exitwith{hint "You need at least 20kg of free space to do this"};
if(player distance safe_research > 3)exitwith{hint "You are too far from the safe";};
if(!(playerSide isEqualTo civilian))exitwith{};

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

if((DS_policeBank < 20000)&&(!(miscInfoArray select 8)))exitwith
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/><br/></t>";
	hint _str;
	systemChat "The safe is empty";
	DS_doingStuff = false;
	};

if([player,8,civilian] call DS_fnc_nearbyPlayers)exitwith{titleText["You can not take this when another player is so nearby","PLAIN"];DS_doingStuff = false;};

hint "Remain close to take an item";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;

_rand = round random 10;

if(DS_tokenMission == 21)then
	{
	DS_tokenMission = -1;
	[250,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
if(DS_tokenMission == 23)then
	{
	DS_tokenMission = -1;
	[250,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

switch(_rand)do
	{
	case 0:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Y inventory Blackfoot chopper from the safe";
			["blackfoot",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken 10 Classified Documents from the safe";
				["spyDocs",true,10] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a 200 pack of Steel from the safe";
				["packSteel",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 1:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Y inventory DAR Pawnee from the safe";
			["pawnee",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a 15 pack of CPU's from the safe";
				["packCPU",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken an Advanced Vehicle Security Kit from the safe";
				["vehSecurityAdv",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 2:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken 20 Classified Documents from the safe";
			["spyDocs",true,20] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a House Storage Upgrade from the safe";
				["houseItemUpgrade",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken 5 Steroids from the safe";
				["steroids",true,5] call DS_fnc_handleInventory;
				};
			};
		};
	case 3:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Air Vehicle Ammo Upgrade from the safe";
			["weaponsAir",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a Land Vehicle Ammo Upgrade from the safe";
				["weaponsLand",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken 5 Steady Aim's from the safe";
				["noRecoil",true,5] call DS_fnc_handleInventory;
				};
			};
		};
	case 4:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Hydrochloric Acid Pack from the safe";
			["hydroPack",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a Sodium Hydroxide Pack from the safe";
				["sodiumPack",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a Hydrochloric Acid Pack from the safe";
				["hydroPack",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 5:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Sodium Hydroxide Pack from the safe";
			["sodiumPack",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a Sodium Hydroxide Pack from the safe";
				["sodiumPack",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a Hydrochloric Acid Pack from the safe";
				["hydroPack",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 6:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Hydrochloric Acid Pack from the safe";
			["hydroPack",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a Hydrochloric Acid Pack from the safe";
				["hydroPack",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a Sodium Hydroxide Pack from the safe";
				["sodiumPack",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 7:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Super Safe Cracker from the safe";
			["safeCrackerAdv",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a 200 pack of Bronze from the safe";
				["packBronze",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a 200 pack of Crystal Glass from the safe";
				["packGlass",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 8:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Y inventory DAR Pawnee from the safe";
			["pawnee",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a 200 pack of Crystal Glass from the safe";
				["packGlass",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a 200 pack of Bronze from the safe";
				["packBronze",true,1] call DS_fnc_handleInventory;
				};
			};
		};
	case 9:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken 5 RPG Launchers from the safe";
			["gunRpg",true,5] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken 4 Lynxes from the safe";
				["gunLynxAdv",true,4] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken 2 Navids from the safe";
				["gunNavid",true,2] call DS_fnc_handleInventory;
				};
			};
		};
	case 10:
		{
		if((DS_policeBank > 999999)||((miscInfoArray select 8)&&((random 8) == 1)))then
			{
			hint "You have taken a Hydrochloric Acid Pack from the safe";
			["hydroPack",true,1] call DS_fnc_handleInventory;
			}
			else
			{
			if((DS_policeBank > 499999)||((miscInfoArray select 8)&&((random 3) == 1)))then
				{
				hint "You have taken a pack of 30 Circuit Boards from the safe";
				["packCircuitBoard",true,1] call DS_fnc_handleInventory;
				}
				else
				{
				hint "You have taken a pack of 30 Small Batteries from the safe";
				["packBattery",true,2] call DS_fnc_handleInventory;
				};
			};
		};
	};

if(DS_policeBank > 999999)then
	{
	_rand = (round random 100000);
	_deduction = 100000 + _rand;
	[_deduction,false] remoteExec ["HUNT_fnc_policeBank",2];
	}
	else
	{
	if(DS_policeBank > 499999)then
		{
		_rand = (round random 50000);
		_deduction = 50000 + _rand;
		[_deduction,false] remoteExec ["HUNT_fnc_policeBank",2];
		}
		else
		{
		_rand = (round random 20000);
		_deduction = 20000 + _rand;
		[_deduction,false] remoteExec ["HUNT_fnc_policeBank",2];
		};
	};

if(DS_policeBank < 0)then
	{
	DS_policeBank = 0;
	};

publicVariable "DS_policeBank";

DS_doingStuff = false;
DS_researchItems = DS_researchItems + 1;
publicVariable "DS_researchItems";