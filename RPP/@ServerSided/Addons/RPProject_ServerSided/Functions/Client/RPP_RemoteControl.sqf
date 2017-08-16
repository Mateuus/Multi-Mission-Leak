/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_RemoteControl.sqf

Description:
Remote controls stuff
*/
["RPP_RemoteControl_PoliceGate",{
	[] spawn {
		private ["_msg","_color","_command"];
		if (RPP_PDGateOpen) exitWith {
			_msg = "The Police Gate is still open.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		RPP_PDGateOpen = true;
		publicVariable "RPP_PDGateOpen";

		_msg = "Opening Police Gate in 3 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 3;

		_command = "OPEN";
		[[_command],"RPP_RemoteControl_OpenPDGate",true] call BIS_FNC_MP; //RUN GLOBAL so it's not only hiden for me :D

		_msg = "Police Gate Open, Closing in 15 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 10;

		_msg = "Closing Police Gate in 5 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 5;

		_command = "CLOSE";
		[[_command],"RPP_RemoteControl_OpenPDGate",true] call BIS_FNC_MP; //RUN GLOBAL so it's not only unhiden for me :D

		_msg = "Police Gate Closed again.";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 0.5;
		RPP_PDGateOpen = false;
		publicVariable "RPP_PDGateOpen";
	};
}] call RPP_Function;
publicVariable "RPP_RemoteControl_PoliceGate";

["RPP_RemoteControl_OpenPDGate",{
	private ["_do"];
	_Do = _This select 0;
	switch (_do) do { 
		case "OPEN": {
			RPP_PD_Gate hideObject true;
		}; 
		case "CLOSE": {
			RPP_PD_Gate hideObject false;
		}; 
	};
}] call RPP_Function;
publicVariable "RPP_RemoteControl_OpenPDGate";

["RPP_Repo_RemoteKey", {
	[] spawn {
		private ["_msg","_color","_command"];
		if (RPP_ImpoundLotOpen) exitWith {
			_msg = "The Impound lot is still open.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			["Impound lot Remote Key",1] call RPP_Inventory_Add;
		};

		RPP_ImpoundLotOpen = true;
		publicVariable "RPP_ImpoundLotOpen";

		_msg = "Opening Impound lot in 3 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 3;

		_command = "OPEN";
		[[_command],"RPP_Repo_OpenImpoundLot",true] call BIS_FNC_MP; //RUN GLOBAL so it's not only hiden for me :D

		_msg = "Impound lot Open, Closing in 15 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 10;

		_msg = "Closing Impound lot in 5 Seconds...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 5;

		_command = "CLOSE";
		[[_command],"RPP_Repo_OpenImpoundLot",true] call BIS_FNC_MP; //RUN GLOBAL so it's not only unhiden for me :D

		_msg = "Impound lot Closed again.";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep 0.5;
		RPP_ImpoundLotOpen = false;
		publicVariable "RPP_ImpoundLotOpen";
		["Impound lot Remote Key",1] call RPP_Inventory_Add;
	};
}] call RPP_Function;
publicVariable "RPP_Repo_RemoteKey";

["RPP_Repo_OpenImpoundLot",{
	private ["_do"];
	_Do = _This select 0;
	switch (_do) do { 
		case "OPEN": {
			RPP_ImpoundDoor hideObject true;
		}; 
		case "CLOSE": {
			RPP_ImpoundDoor hideObject false;
		}; 
	};
}] call RPP_Function;
publicVariable "RPP_Repo_OpenImpoundLot";