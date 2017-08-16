/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_uniform"];
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_curTarget = cursorTarget;
if(eM_action_inUse) exitWith {};

 //Action is in use, exit to prevent spamming.
if((animationState player=="Incapacitated" or  animationState player=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") or (player getVariable "gagged") or (player getVariable "Escortingciv") or (player getVariable "Escorting") or (player getVariable "restrained") or (player getVariable "restrainedciv")) exitWith {};

if(eM_interrupted) exitWith {eM_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith 
{
	if(_isWater) then 
	{
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then 
		{
			[_fish] call EMonkeys_fnc_catchFish;
		};
	}
		else
	{
		if((side player in [east,civilian]) && !eM_action_gather) then 
		{
			closeDialog 0;
			_handle = [] spawn EMonkeys_fnc_gather;	
		};	
	};
};

if(_curTarget isKindOf "Land_CarService_F" && {player distance _curTarget < 5}) exitWith {
	[_curTarget] call EMonkeys_fnc_menu_fInteraction;
};

if(_curTarget isKindOf "GroundWeaponHolder" && !(player isUniformAllowed (getItemCargo _curTarget select 0 select 0)) && {player distance _curTarget < 5} && uniform player == "") exitWith {
	_uniform = getItemCargo _curTarget select 0 select 0;
	clearItemCargoGlobal _curTarget;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	player forceAddUniform _uniform;
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 10} OR ((nearestObject [[16736,13667,0.00140572],"Land_Dome_Small_F"]) == _curTarget  OR (nearestObject [[16731.646,13665.511,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith
{
	[_curTarget] call EMonkeys_fnc_menu_hInteraction;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
eM_action_inUse = true;

//Temp fail safe.
[] spawn 
{
	uisleep 60;
	eM_action_inUse = false;
};

if(isPlayer _curTarget && _curTarget isKindOf "Man" && (player distance _curTarget < 2)) then
{
	if(_curTarget getVariable["onkill",FALSE]) then
	{
		if(side player in [civilian,east]) exitWith
		{
			[_curTarget,0] spawn EMonkeys_fnc_menu_pInteractionCiv;
		};
		if(side player in [west]) exitWith
		{
			[_curTarget,0] spawn EMonkeys_fnc_menu_pInteractionCop;
		};
		if(side player in [independent]) exitWith
		{
			[_curTarget] call EMonkeys_fnc_medSysMenu;
		};
	}
		else
	{
		if(side player in [civilian,east]) exitWith
		{
			[_curTarget,1] spawn EMonkeys_fnc_menu_pInteractionCiv;
		};
		if(side player in [west]) exitWith
		{
			[_curTarget,1] spawn EMonkeys_fnc_menu_pInteractionCop;
		};
		if(side player in [independent]) exitWith
		{
			[_curTarget] call EMonkeys_fnc_medSysMenu;
		};
	};
}
	else 
{
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (typeof _curTarget  in _boxType) OR  (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	if(_isVehicle) then 
	{
		if(!dialog) then 
		{
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then 
			{
				[_curTarget] spawn EMonkeys_fnc_menu_vInteraction;
			};
		};
	} 
		else 
	{
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then 
		{
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then 
			{
				private["_handle"];
				_handle = [_curTarget] spawn EMonkeys_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else 
			{
				private["_handle"];
				_handle = [_curTarget] spawn EMonkeys_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		}
			else 
		{
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then 
			{
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn EMonkeys_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			}
				else 
			{
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn EMonkeys_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				}
					else 
				{

					If (_curTarget == fed_bank && (side player in [east,civilian])) then 
					{
						if (fed_bank getVariable["safe_open",false]) then 
						{
							[_curTarget] spawn EMonkeys_fnc_safeOpen;	
						}
							else 
						{
							[_curTarget] spawn EMonkeys_fnc_blastingCharge;
						};
					}
						else 
					{
					
						If (_curTarget == fed_bank && playerSide == west) then 
						{
							[_curTarget] spawn EMonkeys_fnc_safeFix;
						};
					};
				};
			};
		};
	};
};