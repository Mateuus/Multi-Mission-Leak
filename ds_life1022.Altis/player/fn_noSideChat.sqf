/*
	File: fn_noSideChat.sqf
	Author: Unknown

	Description:
	When a player uses side-chat VoN they will be given 3 warnings.
	If they continue they will be kicked from the server.
*/

if(isNil "DS_donorLevel")then{DS_donorLevel = 0;};

[] spawn {
	disableSerialization;
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {_randomnr = selectRandom [2,-1];(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir (vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};

	while {true} do {
		waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
		{
			if (ctrlText ((findDisplay 63) displayCtrl 101) == "Law Enforcement Chat" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Help Channel" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Global channel" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Side channel" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Command channel" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Trade Channel" OR
				ctrlText ((findDisplay 63) displayCtrl 101) == "Rebel Side Channel") then
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 90;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;
						warn_three = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						systemChat ("Please do not use voice on this channel, this is your first warning.");
						player say3D "flashbang";
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 1) then {
					if (isNil "warn_two") then {
						warn_two = true;
						systemChat ("Please do not use voice on this channel, this is your second warning and last warning..");
						player say3D "flashbang";
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 2) then {

					if((player getVariable["restrained",FALSE])||(player getVariable["escorted",FALSE])||(DS_jailed))then
						{
						DS_jailed = true;
						};
					if([player,20,west] call DS_fnc_nearbyPlayers)then
						{
						DS_jailed = true;
						};

					if (isNil "warn_last") then {

					[0,format["%1 is being kicked from the server for using voice in a restricted channel (Autokick)",name player],false,2] remoteExecCall ["DS_fnc_globalMessage",-2];
					player say3D "flashbang";
					warn_last = true;
					player setDamage 1;
					[] call DS_fnc_compileData;
					["You were warned about using voice on this channel!"] spawn DS_double_cut;
					1 fademusic 10;
					1 fadesound 10;
					disableUserInput true;
					startLoadingScreen ["You are being disconnected"];
					progressLoadingScreen 0.4;sleep 2.25;
					progressLoadingScreen 0.8;sleep 2.25;
					endLoadingScreen;sleep 0.5;
					disableUserInput false;
					disableUserInput true;
					disableUserInput false;
					endMission "LOSER";
					};
				};
			};
		};
		sleep 5;
	};
};

[] spawn {
	disableSerialization;
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {_randomnr = selectRandom [2,-1];(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir (vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};

	while {true} do {
		waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 46) && (player distance (getMarkerPos "auctionHouse") < 200) && (DS_donorLevel == 0))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
		{
			if (ctrlText ((findDisplay 63) displayCtrl 101) == "Direct communication") then
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 90;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;
						warn_three = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						systemChat ("Please do not use voice at the auctions, this is your first warning.");
						player say3D "flashbang";
						["NO VOICE ON DIRECT"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 1) then {
					if (isNil "warn_two") then {
						warn_two = true;
						systemChat ("Please do not use voice at the auctions, this is your second warning and last warning..");
						player say3D "flashbang";
						["NO VOICE ON DIRECT"] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 2) then {

					if((player getVariable["restrained",FALSE])||(player getVariable["escorted",FALSE])||(DS_jailed))then
						{
						DS_jailed = true;
						};
					if([player,20,west] call DS_fnc_nearbyPlayers)then
						{
						DS_jailed = true;
						};

					if (isNil "warn_last") then {

					[0,format["%1 is being kicked from the server for using voice at the auctions (Autokick)",name player],false,1] remoteExecCall ["DS_fnc_globalMessage",-2];
					player say3D "flashbang";
					warn_last = true;
					removeAllWeapons player;
					player setPos (getMarkerPos "chopDrop");
					player setDamage 1;
					[] call DS_fnc_compileData;
					["You were warned about using voice at the auctions!"] spawn DS_double_cut;
					1 fademusic 10;
					1 fadesound 10;
					disableUserInput true;
					startLoadingScreen ["You are being disconnected"];
					progressLoadingScreen 0.4;sleep 2.25;
					progressLoadingScreen 0.8;sleep 2.25;
					endLoadingScreen;sleep 0.5;
					disableUserInput false;
					disableUserInput true;
					disableUserInput false;
					endMission "LOSER";
					};
				};
			};
		};
		sleep 5;
	};
};