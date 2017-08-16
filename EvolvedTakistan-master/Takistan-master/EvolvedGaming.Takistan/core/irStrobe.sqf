// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Player IR script
// Version 5.01
// Date: 2014.05.18
// Authors: Lala14, Tajin
// Feel free to edit, would appreciate it if you also post your own strobe setups ;)
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

// init line:
// nul=[] execVM "irstrobe.sqf";

/*DEFINABLE*/
Player_IR_SF = 1; //Position for IR strobe Position, either 1 for on the head or 0 for on the vest
Player_IR_Debug = 0; //See which vehicles are moving their strobes and what positions
IR_Item_Restric = 0; //Restrict IR to military uniform only (uses blacklist instead of whitelist) if set to 0 still requires at least something in the slot
Player_IR_Mark_Sides = 0; //If set to one on radar Units will come up as friendly when using IR strobe if set to 0 they come up as empty on radar

/*Don't touch unless you know what your doing*/
/*Don't touch unless you know what your doing*/
if (isDedicated) exitWith {};
if (playerSide != blufor) exitWith {};

{_x setVariable ["strobes",false,true];}forEach vehicles; //Used for irstrobe.sqf attaching strobes to vehicles

waitUntil {!isNull player};

HelmetsM = ["","H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk","H_ShemagOpen_tan","H_StrawHat","H_StrawHat_dark","H_TurbanO_blk","H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg","H_MilCap_blue","H_MilCap_dgtl","H_MilCap_gry","H_MilCap_mcamo","H_MilCap_ocamo","H_MilCap_oucamo","H_MilCap_rucamo","H_Beret_02","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_brn_SF","H_Beret_grn","H_Beret_grn_SF","H_Beret_ocamo","H_Beret_red","H_Booniehat_dgtl","H_Booniehat_dirty","H_Booniehat_grn","H_Booniehat_indp","H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_mcamo","H_Booniehat_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_blk_ION","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_grn_BI","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_oli_hs","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US","H_Bandanna_camo","H_Bandanna_cbr","H_Bandanna_gry","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_surfer","H_BandMask_blk","H_BandMask_demon","H_BandMask_khk","H_BandMask_reaper"];
VestsM = ["","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"];

LALA_fnc_Strobe_addActions = {
	player setVariable ["strobeplayer","none",true];
	IRstrobeOn = player addAction ["<t color='#FF0000'>IR Strobe On</t>", {(_this select 0) spawn LALA_fnc_IRStrobeOn;},"",-99,false,true,"",'typeName (_target getVariable "strobeplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3) &&  if (IR_Item_Restric == 1) then { if (Player_IR_SF == 1) then { !(headgear _this in HelmetsM) } else { !(vest _this in VestsM) }; } else { if (Player_IR_SF == 1 ) then { (headgear _this != "") } else { (vest _this != "") } };'];
	IRstrobeOff = player addAction ["<t color='#FF0000'>IR Strobe Off</t>", {(_this select 0) spawn LALA_fnc_IRStrobeOff;},"",-99,false,true,"",'typeName (_target getVariable "strobeplayer") == "OBJECT" && ( _target == _this)'];
	AttachIRAction = player addAction ["<t color='#FF0000'>Attach IR Strobe</t>", {(_this select 0) spawn LALA_fnc_AttachIR;},"",-99,false,true,"",'(("B_IR_Grenade" in magazines _this) OR ("O_IR_Grenade" in magazines _this) OR ("I_IR_Grenade" in magazines _this)) && typeName (nearestvehicle) == "OBJECT" && (_target == _this) && typeName (nearestvehicle getVariable "strobes") != "OBJECT" && [_target] call LALA_fnc_Refresh'];
	TakeIRAction = player addAction ["<t color='#FF0000'>Take IR Strobe</t>", {(_this select 0) spawn LALA_fnc_TakeIR;},"",-99,false,true,"",'typeName (nearestvehicle) == "OBJECT" && typeName (nearestvehicle getVariable "strobes") == "OBJECT" && (_target == _this)'];
	player addAction ["<t color='#FF0000'>UGV Strobe On</t>", {(playeruav) spawn LALA_fnc_CreateIR;},"",-99,false,true,"",'typeName (playeruav getVariable "strobe") != "OBJECT" && (daytime > 18.7 OR daytime < 5.3) && playeruav isKindOf "LandVehicle" && (_target == _this) && [_target] call LALA_fnc_UavRefresh']; //UGV or any other land typed Uav
	player addAction ["<t color='#FF0000'>UAV Strobe On</t>", {(playeruav) spawn LALA_fnc_CreateIRAir;},"",-99,false,true,"",'typeName (playeruav getVariable "strobe") != "OBJECT" && (daytime > 18.7 OR daytime < 5.3) && playeruav isKindOf "Air" && (_target == _this) && [_target] call LALA_fnc_UavRefresh']; //UAV or any other Air type UAV
	player addAction ["<t color='#FF0000'>UGV Strobe Off</t>", {(playeruav) spawn LALA_fnc_DeleteIR;},"",-99,false,true,"",'typeName (playeruav getVariable "strobe") == "OBJECT" && playeruav isKindOf "LandVehicle" && (_target == _this) && [_target] call LALA_fnc_UavRefresh'];
	player addAction ["<t color='#FF0000'>UAV Strobe Off</t>", {(playeruav) spawn LALA_fnc_DeleteIRAir;},"",-99,false,true,"",'typeName (playeruav getVariable "strobe") == "OBJECT" && playeruav isKindOf "Air" && (_target == _this) && [_target] call LALA_fnc_UavRefresh'];
};

LALA_fnc_IRStrobeOn = {
if (Player_IR_Mark_Sides == 1) then {
	if (side _this == EAST) then {
	_strobe = "NVG_TargetW" createVehicle getPos _this; 
	_strobe attachTo [_this,[0,0,0.4],"head"]; 
	_this setVariable ["strobeplayer",_strobe,true];
	};
	
	if (side _this == WEST) then {
	_strobe = "NVG_TargetE" createVehicle getPos _this; 
	_strobe attachTo [_this,[0,0,0.4],"head"]; 
	_this setVariable ["strobeplayer",_strobe,true];
	};
	
	if (side _this == resistance) then {
	_strobe = "NVG_TargetC" createVehicle getPos _this; 
	_strobe attachTo [_this,[0,0,0.4],"head"]; 
	_this setVariable ["strobeplayer",_strobe,true];
	};
} else {
	_strobe = "NVG_TargetC" createVehicle getPos _this;
	_strobe attachTo [_this,[0,0,0.4],"head"]; 
	_this setVariable ["strobeplayer",_strobe,true];
	};
	
	waitUntil {typeName (_this getVariable "strobeplayer") == "OBJECT"};
	
	_pos = [0,0,0];
	_muzzle = "";
	
	if (Player_IR_SF == 1) then { _pos = [0,0,0.4]; _muzzle = "head"; } else { _pos = [-0.1,0.3,0.4]; _muzzle = "Pelvis" };
	
	if (Player_IR_Debug == 1) then {_this groupChat format ["strobe attachto %1",[getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName"),_pos,_muzzle]];};
	if (Player_IR_Debug == 1) then {
		if (str _pos != "[0,0,0]") then {
			hintSilent format ["%1 has moved the strobe into the defined position",getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName")];
			} else {
			hintSilent format ["%1 has no _pos defined",typeOf _this];
		};
	};
	
	(_this getVariable "strobeplayer") attachTo [_this,_pos,_muzzle];
};

LALA_fnc_IRStrobeOff = {
	deleteVehicle (_this getVariable "strobeplayer"); 
	_this setVariable ["strobeplayer","none",true];
};

	
LALA_fnc_AttachIR = {
	if ("B_IR_Grenade" in magazines _this && typeName (nearestvehicle getVariable "strobes") == "BOOL") then {
		_this removeMagazine "B_IR_Grenade"; 
		nearestvehicle setVariable ["TypeIR","B_IR_Grenade",true];
		_this playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		_attachstrobe = "NVG_TargetW" createVehicle [0,0,0];
		_attachstrobe attachTo [_this,[0,0,0],"leftHand"];
		sleep 1; 
		_attachstrobe attachTo [nearestvehicle]; 
		nearestvehicle setVariable ["strobes",_attachstrobe,true];
	};
	
	if ("O_IR_Grenade" in magazines _this && typeName (nearestvehicle getVariable "strobes") == "BOOL") then {
		_this removeMagazine "O_IR_Grenade"; 
		nearestvehicle setVariable ["TypeIR","O_IR_Grenade",true];
		_this playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		_attachstrobe = "NVG_TargetE" createVehicle [0,0,0];
		_attachstrobe attachTo [_this,[0,0,0],"leftHand"];
		sleep 1; 
		_attachstrobe attachTo [nearestvehicle]; 
		nearestvehicle setVariable ["strobes",_attachstrobe,true];
	};
	
	if ("I_IR_Grenade" in magazines _this && typeName (nearestvehicle getVariable "strobes") == "BOOL") then {
		_this removeMagazine "I_IR_Grenade"; 
		nearestvehicle setVariable ["TypeIR","I_IR_Grenade",true];
		_this playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		_attachstrobe = "NVG_TargetC" createVehicle [0,0,0];
		_attachstrobe attachTo [_this,[0,0,0],"leftHand"];
		sleep 1; 
		_attachstrobe attachTo [nearestvehicle]; 
		nearestvehicle setVariable ["strobes",_attachstrobe,true];
	};
};

LALA_fnc_TakeIR = {
	_this playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"; 
	sleep 1; 
	deleteVehicle (nearestvehicle getVariable "strobes"); 
	_this addMagazine (nearestvehicle getVariable "TypeIR");
	nearestvehicle setVariable ["TypeIR",nil,true];
	nearestvehicle setVariable ["strobes",false,true];
};

LALA_fnc_Refresh = {
	_unit = _this select 0;
	_nearvehicle = nearestObjects [_unit,["Air","Ship","LandVehicle"],7];
	nearestvehicle = _nearvehicle select 0;
	
	attachirname = format ["<t color='#FF0000'>Attach IR Strobe to %1</t>",getText (configFile >> "cfgVehicles" >> typeOf nearestvehicle >> "displayName")];
	takeirname = format ["<t color='#FF0000'>Take IR Strobe from %1</t>",getText (configFile >> "cfgVehicles" >> typeOf nearestvehicle >> "displayName")];
	
	_unit setUserActionText [AttachIRAction,attachirname];
	_unit setUserActionText [TakeIRAction,takeirname];

	_return = (count _nearvehicle > 0 && alive _unit);
	_return
};

LALA_fnc_UavRefresh = {
	_unit = _this select 0;
	playeruav = getConnectedUav _unit;
	_UavReturn = (typeName (playeruav) == "OBJECT");
	_UavReturn
};

[] spawn LALA_fnc_Strobe_addActions;
player addEventHandler ["Respawn", {
	[] spawn LALA_fnc_Strobe_addActions;
}];

sleep 0.1;

if (Player_IR_SF == 1) then {
	player setUserActionText [IRstrobeOn,"<t color='#FF0000'>IR Strobe On</t>"]; 
	player setUserActionText [IRstrobeOff,"<t color='#FF0000'>IR Strobe Off</t>"];
} else {
	player setUserActionText [IRstrobeOn,"<t color='#FF0000'>IR Strobe On</t>"]; 
	player setUserActionText [IRstrobeOff,"<t color='#FF0000'>IR Strobe Off</t>"];
};