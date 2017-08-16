/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_EMT_Interact.sqf

Description:
Interact with other players

UPDATE:
Added Hospital Run
Fixed some small errors
just some edit here and there
*/
["RPP_EMT_Variables", {
	Injurd_List = 
	[
		["Head","RPP_Head"],
		["Left Leg","RPP_LeftLeg"],
		["Right Leg","RPP_RightLeg"],
		["Shoulder","RPP_Shoulder"],
		["Right Arm","RPP_RightArm"],
		["Left Arm","RPP_LeftArm"],
		["Penis Head","RPP_PenisHead"],
		["Torso","RPP_Torso"],
		["Hospital","RPP_Hospital"]
	];
	publicVariable "Injurd_List";
	Treatment_List =
	[
		"Splint",
		"Bandage",
		"Morphine",
		"Defibrillator",
		"CPR",
		"Revive",
		"Hospital Run"
	];
	publicVariable "Treatment_List";
}] call RPP_Function;
publicVariable "RPP_EMT_Variables";

[] call RPP_EMT_Variables;

["RPP_EMT_CreateDialog", {
	private ["_DeadGuy","_Treatment","_data1","_data2","_data3","_data4","_data5","_data6","_data7","_data8","_text","_data9","_dataTreatment"];
	createDialog "RPP_EMTMenuMain";

	buttonSetAction [1600, "[] call RPP_EMT_ApplyTreatment;"];
	buttonSetAction [1601, "[] call RPP_EMT_Process;"];

	_DeadGuy = cursorTarget;

	{	
		_Treatment = _x;
		_dataTreatment = lbAdd [1501, format ["%1",_Treatment]];
		lbSetData [1501, _dataTreatment, _Treatment];
	} foreach Treatment_List;

	if (_DeadGuy getVariable "RPP_Head") then {
		_data1 = lbAdd [1500, format ["Head"]];
		lbSetData [1500, _data1, "RPP_Head"];
	};
	if (_DeadGuy getVariable "RPP_LeftLeg") then {
		_data2 = lbAdd [1500, format ["Left Leg"]];
		lbSetData [1500, _data2, "RPP_LeftLeg"];
	};
	if (_DeadGuy getVariable "RPP_RightLeg") then {
		_data3 = lbAdd [1500, format ["Right Leg"]];
		lbSetData [1500, _data3, "RPP_RightLeg"];
	};
	if (_DeadGuy getVariable "RPP_Shoulder") then {
		_data4 = lbAdd [1500, format ["Shoulder"]];
		lbSetData [1500, _data4, "RPP_Shoulder"];
	};
	if (_DeadGuy getVariable "RPP_RightArm") then {
		_data5 = lbAdd [1500, format ["Right Arm"]];
		lbSetData [1500, _data5, "RPP_RightArm"];
	};
	if (_DeadGuy getVariable "RPP_LeftArm") then {
		_data6 = lbAdd [1500, format ["Left Arm"]];
		lbSetData [1500, _data6, "RPP_LeftArm"];
	};
	if (_DeadGuy getVariable "RPP_PenisHead") then {
		_data7 = lbAdd [1500, format ["Penis Head"]];
		lbSetData [1500, _data7, "RPP_PenisHead"];
	};
	if (_DeadGuy getVariable "RPP_Torso") then {
		_data8 = lbAdd [1500, format ["Torso"]];
		lbSetData [1500, _data8, "RPP_Torso"];
	};
	if (_DeadGuy getVariable "RPP_Hospital") then {
		_data9 = lbAdd [1500, "Hospital"];
		lbSetData [1500, _data9, "RPP_Hospital"];
	};

	{
		_text = _x select 0;
		_call = _x select 1;
		_data9 = lbAdd [1502, format ["%1",_text,_call]];
		lbSetData [1502, _data9, _call];
	} foreach RPP_EMT_Interacting;
}] call RPP_Function;
publicVariable "RPP_EMT_CreateDialog";

["RPP_EMT_Process", {
	private ["_msg","_color","_array","_call","_data"];
	if (lbCurSel 1502 == -1) exitWith {
		_msg = "Please Select an Command.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1502, ( lbCurSel 1502 ) ];
	if (_data == "") exitWith {};
	_array = RPP_EMT_Interacting select (lbCurSel 1502);
	_call = _array select 1;

	closeDialog 1;
	call compile format ["[] call %1;",_call];
}] call RPP_Function;
publicVariable "RPP_EMT_Process";

["RPP_EMT_ApplyTreatment", {
	private ["_dataTreat","_msg","_color","_checkVarList","_DeadGuy","_spiltArray","_BandageArray","_MorphineArray","_DefibrillatorArray","_CPRArray","_successTreat","_injurd","_dataInjurd"];
	_dataTreat = lbData [ 1501, ( lbCurSel 1501 ) ];
	if (!(_DataTreat == "Revive")) then {
		_dataInjurd = lbData [ 1500, ( lbCurSel 1500 ) ];
	} else {
		_dataInjurd = "Revive";
	};
	if (_dataTreat == "") exitWith {
		_msg = "Please Select an Treatment in the Treatment list.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_dataInjurd == "") exitWith {
		_msg = "Please Select an Injurd to give Treatment to.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 1501 == -1) exitWith {
		_msg = "Please Select an Treatment";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_DeadGuy = cursorTarget;
	_spiltArray = ["RPP_LeftArm","RPP_RightArm","RPP_RightLeg","RPP_LeftLeg","RPP_Shoulder"];
	_BandageArray = ["RPP_PenisHead","RPP_Torso","RPP_Head"];
	_MorphineArray = ["RPP_LeftArm","RPP_RightArm","RPP_RightLeg","RPP_LeftLeg","RPP_Shoulder","RPP_Head"];
	_DefibrillatorArray = ["RPP_Torso"];
	_CPRArray = ["RPP_Torso"];
	_checkVarList = ["RPP_LeftArm","RPP_RightArm","RPP_RightLeg","RPP_LeftLeg","RPP_Shoulder","RPP_Head","RPP_Torso","RPP_PenisHead"];

	if (_dataTreat == "Splint") exitWith {
		player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
		_successTreat = false;
		{
			if (_DeadGuy getVariable format ["%1",_dataInjurd]) exitWith {
				_injurd = _dataInjurd;
				if (_injurd in _spiltArray) then {
					_DeadGuy setVariable [format ["%1",_injurd],false,true];
					_successTreat = true;
					_msg = "You Successfully gave him the right Treatment.";
					_color = RPP_Green;
					[_msg,_color] call RPP_MessageSystem;
					closeDialog 1;
					[] call RPP_EMT_CreateDialog;
				} else {
					_successTreat = false;
				};
			};
		} foreach _spiltArray;
		if (!(_successTreat)) exitWith {
			_msg = "You Failed to Revive, You may take him to the hostpital!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			_DeadGuy setVariable ["RPP_Revive",false,true];
			Anti_Hackpos1 = 0;
			Anti_Hackpos2 = 0;
			[[], "RPP_EMT_ReviveFailed", _DeadGuy] call BIS_fnc_MP;
			closeDialog 1;
		};
	};

	if (_dataTreat == "Bandage") exitWith {
		player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
		_successTreat = false;
		{
			if (_DeadGuy getVariable format ["%1",_dataInjurd]) exitWith {
				_injurd = _dataInjurd;
				if (_injurd in _BandageArray) then {
					_DeadGuy setVariable [format ["%1",_injurd],false,true];
					_successTreat = true;
					_msg = "You gave him the right treatment.";
					_color = RPP_Green;
					[_msg,_color] call RPP_MessageSystem;
					closeDialog 1;
					[] call RPP_EMT_CreateDialog;
				} else {
					_successTreat = false;
				};
			};
		} foreach _BandageArray;
		if (!(_successTreat)) exitWith {
			_msg = "You failed to revive, You may take him to the hospital!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			Anti_Hackpos1 = 0;
			Anti_Hackpos2 = 0;
			_DeadGuy setVariable ["RPP_Revive",false,true];
			[[], "RPP_EMT_ReviveFailed", _DeadGuy] call BIS_fnc_MP;
			closeDialog 1;
		};
	};

	if (_dataTreat == "Morphine") exitWith {
		player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
		_successTreat = false;
		{
			if (_DeadGuy getVariable format ["%1",_dataInjurd]) exitWith {
				_injurd = _dataInjurd;
				if (_injurd in _MorphineArray) then {
					_DeadGuy setVariable [format ["%1",_injurd],false,true];
					_successTreat = true;
					_msg = "You successfully gave him the right Treatment.";
					_color = RPP_Green;
					[_msg,_color] call RPP_MessageSystem;
					closeDialog 1;
					[] call RPP_EMT_CreateDialog;
				} else {
					_successTreat = false;
				};
			};
		} foreach _MorphineArray;
		if (!(_successTreat)) exitWith {
			_msg = "You failed to revive, You may take him to the hospital!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			_DeadGuy setVariable ["RPP_Revive",false,true];
			Anti_Hackpos1 = 0;
			Anti_Hackpos2 = 0;
			[[], "RPP_EMT_ReviveFailed", _DeadGuy] call BIS_fnc_MP;
			closeDialog 1;
		};
	};

	if (_dataTreat == "Defibrillator") exitWith {
		player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
		_successTreat = false;
		{
			if (_DeadGuy getVariable format ["%1",_dataInjurd]) exitWith {
				_injurd = _dataInjurd;
				if (_injurd in _DefibrillatorArray) then {
					_DeadGuy setVariable [format ["%1",_injurd],false,true];
					_successTreat = true;
					_msg = "You successfully gave him the right Treatment.";
					_color = RPP_Green;
					[_msg,_color] call RPP_MessageSystem;
					closeDialog 1;
					[] call RPP_EMT_CreateDialog;
				} else {
					_successTreat = false;
				};
			};
		} foreach _DefibrillatorArray;
		if (!(_successTreat)) exitWith {
			_msg = "You failed to revive, You may take him to the hospital!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			Anti_Hackpos1 = 0;
			Anti_Hackpos2 = 0;
			_DeadGuy setVariable ["RPP_Revive",false,true];
			[[], "RPP_EMT_ReviveFailed", _DeadGuy] call BIS_fnc_MP;
			closeDialog 1;
		};
	};

	if (_dataTreat == "CPR") exitWith {
		player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
		_successTreat = false;
		{
			if (_DeadGuy getVariable format ["%1",_dataInjurd]) exitWith {
				_injurd = _dataInjurd;
				if (_injurd in _CPRArray) then {
					_DeadGuy setVariable [format ["%1",_injurd],false,true];
					_successTreat = true;
					_msg = "You successfully gave him the right treatment.";
					_color = RPP_Green;
					[_msg,_color] call RPP_MessageSystem;
					closeDialog 1;
					[] call RPP_EMT_CreateDialog;
				} else {
					_successTreat = false;
				};
			};
		} foreach _CPRArray;
		if (!(_successTreat)) exitWith {
			_msg = "You failed to revive, You may take him to the hospital!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			_DeadGuy setVariable ["RPP_Revive",false,true];
			Anti_Hackpos1 = 0;
			Anti_Hackpos2 = 0;
			[[], "RPP_EMT_ReviveFailed", _DeadGuy] call BIS_fnc_MP;
			closeDialog 1;
		};
	};

	_Allow = true;
	{
		if (_DeadGuy getVariable format ["%1",_x]) exitWith {
			_Allow = false;
		};
	} foreach _checkVarList;

	if (!(_Allow)) exitWith {
		_msg = "You are still missing some treatments.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_dataTreat == "Revive") exitWith {
		if (_DeadGuy getVariable "RPP_Revive") then {
			closeDialog 1;
			[] call RPP_EMT_ReviveStart;
		};
	};

	if (_dataTreat == "Hospital") exitWith {
		if (_DeadGuy getVariable "RPP_Hospital") then {
			[] call RPP_EMT_Drag;
			RPP_Takingto_Hostpital = _DeadGuy;
			_msg = "Hospital Run Activated!";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;

			player setVariable ["RPP_EMT_HostpitalGo",true,true];
			[] call RPP_EMT_Hostpital_runTimer;
		} else {
			_msg = "No Hospital Run needed!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_EMT_ApplyTreatment";

["RPP_EMT_Hostpital_runTimer", {
	[] spawn {
		private ["_Seconds"];
		_Seconds = 400;
		while {RPP_EMT_HostpitalGo} do {
			titleText [format ["Time Left: %1 Second(s)",_Seconds], "PLAIN"];
			if (_Seconds <= 0) exitWith {
				player setVariable ["RPP_EMT_HostpitalGo",false,true];
				_msg = "You failed the hospital run!";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				detach player;
				[[], "RPP_EMT_Hostpital_RunFail", RPP_Takingto_Hostpital] call BIS_fnc_MP;
			};
			if (player distance (getMarkerPos "RPP_Main_Hostpital") <= 15) exitWith {
				player setVariable ["RPP_EMT_HostpitalGo",false,true];
				[[], "RPP_EMT_ReviveGet",RPP_Takingto_Hostpital] call BIS_fnc_MP;

				_msg = "Hospital run success!";
				_color = RPP_Green;
				[_msg,_color] call RPP_MessageSystem;
			};
			sleep 1;
			_Seconds = _Seconds - 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_EMT_Hostpital_runTimer";

["RPP_EMT_Hostpital_RunFail", {
	detach player;
	removeAllActions player;
	removeBackpack player;

	if (RPP_isCiv) then {
		[] call RPP_Login_Civilian;
	};
	if (RPP_isCop) then {
		[] call RPP_Login_Police;
	};
	if (RPP_isEMT) then {
		[] call RPP_Login_EMT;
	};

	player allowDamage true;
	player enableSimulation true;
	player setDamage 0;

	["Normal","switchmove"] call RPP_SwitchAnim_Global;

	_msg = "You died because the EMT failed to revive you.";
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;

	player setVariable ["RPP_Head",false,true];
	player setVariable ["RPP_LeftLeg",false,true];
	player setVariable ["RPP_RightLeg",false,true];
	player setVariable ["RPP_Shoulder",false,true];
	player setVariable ["RPP_RightArm",false,true];
	player setVariable ["RPP_LeftArm",false,true];
	player setVariable ["RPP_PenisHead",false,true];
	player setVariable ["RPP_Torso",false,true];
}] call RPP_Function;
publicVariable "RPP_EMT_Hostpital_RunFail";

["RPP_EMT_SelectInjurd", {
	private ["_InjurdGive","_setInjurd"];
	_InjurdGive = 
	[
		"RPP_Head",
		"RPP_LeftLeg",
		"RPP_RightLeg",
		"RPP_Shoulder",
		"RPP_RightArm",
		"RPP_LeftArm",
		"RPP_PenisHead",
		"RPP_Torso"
	];
	_setInjurd = _InjurdGive call BIS_fnc_selectRandom;
	player setVariable [format ["%1",_setInjurd],true,true];
	_setInjurd = [];
	_setInjurd = _InjurdGive call BIS_fnc_selectRandom;
	player setVariable [format ["%1",_setInjurd],true,true];
	_setInjurd = [];
	_setInjurd = _InjurdGive call BIS_fnc_selectRandom;
	player setVariable [format ["%1",_setInjurd],true,true];
}] call RPP_Function;
publicVariable "RPP_EMT_SelectInjurd";

["RPP_Inventory_Drop_Revive", {
	private ['_data','_drop','_weight','_candrop','_dropclass','_amount','_ItemDrop'];
	_data = _x select 0;
	_amount = _x select 1;
	_drop = false;
	_weight = '';
	_candrop = true;
	_dropclass = '';
	{
		if (_data == _x select 1) exitWith {
			_drop = true;
			_weight = _x select 2;
			_candrop = _x select 7;
			_dropclass = _x select 9;
		};
	} count RPP_Items_Config;

	if (!(_Drop)) exitWith {};
	if (!(_candrop)) exitWith {};

	[_data,_amount] call RPP_Inventory_Remove;
	_ItemDrop = createVehicle [ _dropclass, [ getPos player, 2, getDir player] call BIS_fnc_relPos, [], 0, 'CAN_COLLIDE' ];  
	[[_ItemDrop,_data,_amount], 'RPP_Inventory_DropGlobal', true] call BIS_FNC_MP;
	
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Inventory_Drop_Revive";

["RPP_Cash_Drop_Revive", {
	private ['_data','_drop','_weight','_candrop','_dropclass','_amount','_ItemDrop'];
	_amount = RPP_Cash;

	[_amount] call RPP_AntiCheat_RemoveMoney;
	_ItemDrop = createVehicle [ "Land_Suitcase_F", [ getPos player, 2, getDir player] call BIS_fnc_relPos, [], 0, 'CAN_COLLIDE' ];  
	[[_ItemDrop,"Cash",_amount], 'RPP_Inventory_DropGlobal', true] call BIS_FNC_MP;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Cash_Drop_Revive";

["RPP_EMT_DeadLoop", {
	[] spawn {

	};
}] call RPP_Function;
publicVariable "RPP_EMT_DeadLoop";

["RPP_EMT_Die", {
	[] spawn {
		player setVariable ["RPP_Revive",true,true];
		sleep 1.5;
		systemChat "dead";
		{
			deleteVehicle _x;
		} foreach allDeadMen;
		if (player getVariable "RPP_Revive") exitWith {
			["AinjPpneMstpSnonWrflDnon_injuredHealed","switchmove"] call RPP_SwitchAnim_Global;
		};
		if (vehicle player != player) then {
			player action ["eject", (vehicle player)];
		};
		RPP_Hunger = RPP_Hunger + 25;
		RPP_Thirst = RPP_Thirst + 25;
		if (RPP_Hunger > 100) then {
			RPP_Hunger = 100;
		};
		if (RPP_Thirst > 100) then {
			RPP_Thirst = 100;
		};

		//Drop inventory
		{
			_item = _x select 0;
			_itemAmount = [_x select 0] call RPP_Inventory_Count;
			[_item,_itemAmount] call RPP_Inventory_Drop_Revive;
		} foreach RPP_Inventory;

		player allowDamage false;
		player enableSimulation false;
		["AinjPpneMstpSnonWrflDnon_injuredHealed","switchmove"] call RPP_SwitchAnim_Global;
		removeAllActions player;
		removeAllWeapons player;
		removeBackpack player;

		LifeTimer_Minute = 0;
		LifeTimer_Seconds = 10;
		titleCut [format ["",name player], "PLAIN",4];
		{
			deleteVehicle _x;
		} foreach allDeadMen;
		[] call RPP_EMT_SelectInjurd;
		player setVariable ["RPP_Revive",true,true];
		while {player getVariable "RPP_Revive"} do {
			player allowDamage false;
			player enableSimulation false;
			titleText [format ["Life Timer: Minute(s): %1  Second(s): %2",LifeTimer_Minute,LifeTimer_Seconds], "PLAIN"];
			if (LifeTimer_Seconds <= 0 && LifeTimer_Minute <= 0) exitWith {
				removeAllActions player;
				removeBackpack player;

				player allowDamage true;
				player enableSimulation true;
				player setDamage 0;
				player switchmove "Normal";
				{
					deleteVehicle _x;
				} foreach allDeadMen;
				_msg = "You just died.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_AntiCheat_Bypass = true;
				if (RPP_isCiv) then {
					[] call RPP_Login_Civilian;
				};
				if (RPP_isCop) then {
					[] call RPP_Login_Police;
				};
				if (RPP_isEMT) then {
					[] call RPP_Login_EMT;
				};
				sleep 2;
				RPP_AntiCheat_Bypass = false;
				RPP_DeadLoop_Start = false;
				
				player setVariable ["RPP_Revive",false,true];
				player setVariable ["RPP_Head",false,true];
				player setVariable ["RPP_LeftLeg",false,true];
				player setVariable ["RPP_RightLeg",false,true];
				player setVariable ["RPP_Shoulder",false,true];
				player setVariable ["RPP_RightArm",false,true];
				player setVariable ["RPP_LeftArm",false,true];
				player setVariable ["RPP_PenisHead",false,true];
				player setVariable ["RPP_Torso",false,true];

				removeBackpack player;
				removeUniform player;
				removeVest player;
				removeHeadgear player;
				removeGoggles player;
				removeBackpack player;
				removeAllWeapons player;
				player unassignItem "NVGoggles"; 
				player removeItem "NVGoggles";

				_Random = ["RPP_BetaShirt_Polo","RPP_ILoveRPP_Polo"];
				_select = _Random call bis_fnc_selectrandom;

				player forceAddUniform _select;
			};
			if (LifeTimer_Seconds <= 0 && LifeTimer_Minute >= 1) then {
				LifeTimer_Minute = LifeTimer_Minute - 1;
				LifeTimer_Seconds = 59;
			};
			if (!(player getVariable "RPP_Revive")) exitWith {};
			LifeTimer_Seconds = LifeTimer_Seconds - 1;
			["AinjPpneMstpSnonWrflDnon_injuredHealed","switchmove"] call RPP_SwitchAnim_Global;
			removeAllActions player;
			removeAllWeapons player;
			removeBackpack player;
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_EMT_Die";

["RPP_EMT_ReviveStart", {
	[] spawn {
		_target = cursorTarget;
		if (player distance _target > 5) exitWith {
			_msg = "Too far away from the Target.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(_target getVariable "RPP_Revive")) exitWith {
			_msg = "This player is not waiting for a revive.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_target getVariable "RPP_Revive") then {
			player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 3;
			player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 3;
			[[], "RPP_EMT_ReviveGet", _target] call BIS_fnc_MP;

			_msg = "You successfully revived him.";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_EMT_ReviveStart";

["RPP_EMT_ReviveGet", {
	player setVariable ["RPP_Revive",false,true];
	removeAllActions player;
	removeBackpack player;
				
	if (RPP_isCiv) then {
		[] call RPP_S_Actions;
		[] call RPP_Client_Actions;
		player allowDamage true;
		player enableSimulation true;
		[] call RPP_Hud;

		RPP_AntiCheat_Bypass = false;
	};
	if (RPP_isCop) then {
		[] call RPP_S_Actions;
		[] call RPP_Client_Actions;
		player allowDamage true;
		player enableSimulation true;
		[] call RPP_Hud;
		player setVariable ["Coplevel",1,true];

		RPP_AntiCheat_Bypass = false;
	};
	if (RPP_isEMT) then {
		[] call RPP_S_Actions;
		[] call RPP_Client_Actions;
		player allowDamage true;
		player enableSimulation true;
		[] call RPP_Hud;

		RPP_AntiCheat_Bypass = false;
	};

	player allowDamage true;
	player enableSimulation true;
	player setDamage 0;

	_msg = "You have been revived.";
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	player setVariable ["RPP_Head",false,true];
	player setVariable ["RPP_LeftLeg",false,true];
	player setVariable ["RPP_RightLeg",false,true];
	player setVariable ["RPP_Shoulder",false,true];
	player setVariable ["RPP_RightArm",false,true];
	player setVariable ["RPP_LeftArm",false,true];
	player setVariable ["RPP_PenisHead",false,true];
	player setVariable ["RPP_Torso",false,true];
	detach player;
	RPP_DeadLoop_Start = false;
	["Normal","switchmove"] call RPP_SwitchAnim_Global;
}] call RPP_Function;
publicVariable "RPP_EMT_ReviveGet";

["RPP_EMT_ReviveFailed", {
	private ["_Random"];
	_Random = round(random 100);
	if (_Random >= 50) then {
		detach player;
		removeAllActions player;
		removeBackpack player;

		if (RPP_isCiv) then {
			[] call RPP_Login_Civilian;
		};
		if (RPP_isCop) then {
			[] call RPP_Login_Police;
		};
		if (RPP_isEMT) then {
			[] call RPP_Login_EMT;
		};

		player allowDamage true;
		player enableSimulation true;
		player setDamage 0;

		["Normal","switchmove"] call RPP_SwitchAnim_Global;

		_msg = "You just died because the EMT Failed to revive you.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;

		player setVariable ["RPP_Head",false,true];
		player setVariable ["RPP_LeftLeg",false,true];
		player setVariable ["RPP_RightLeg",false,true];
		player setVariable ["RPP_Shoulder",false,true];
		player setVariable ["RPP_RightArm",false,true];
		player setVariable ["RPP_LeftArm",false,true];
		player setVariable ["RPP_PenisHead",false,true];
		player setVariable ["RPP_Torso",false,true];
		RPP_DeadLoop_Start = false;
	} else {
		player setVariable ["RPP_Hospital",true,true];
		_msg = "You are now behing taken to the Hospital!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_EMT_ReviveFailed";

["RPP_EMT_Drag", {
	[] spawn {
		private ["_unit"];
		_unit = cursorTarget;
		if (_unit getVariable "EMT_Drag") exitWith {
			detach _unit;
			_unit setVariable ["EMT_Drag",false,true];
		};
		
		if (!(_unit getVariable "RPP_Revive")) exitWith {
			systemChat "You can only drag players that are waiting for revive.";
		};
		if (!isPlayer _unit) exitWith {
			systemChat "Not a player.";
		};
		if (!(_unit isKindOf "man")) exitWith {
			systemChat "Not a unit.";
		};
		if (player distance cursorTarget >= 7) exitWith {
			systemChat "To far away.";
		};
		
		_unit attachto [player,[0.1,1.1,0]];
		_unit setVariable ["EMT_Drag",true,true];
		_msg = "Successfully Dragging.";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_EMT_Drag";