/*
 Author: Maximum
 Description: Placeables for the cop\medic sides.
Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE...
 Credits: Killerty69 for a second pare of eyes when mine got to sleepy

P.S. - Don't be a faggot like i know some of you all will be.
*/
private["_display","_placeables","_className","_allowMoveDistance","_object","_attachPos","_originalPos","_playerOriginalPos"];
disableSerialization;
if (count life_bar_placey >= life_bar_limit) exitWith { hint "Du hast bereits zu viele Objekte platziert."; };
_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
_className = lbData[20001, lbCurSel (20001)];
closeDialog 0;
life_barrier_active = true;
_allowMoveDistance = 15;
_attachPos = [0, 3, 0.5];
_object = _className createVehicle (position player);

switch _className do {
	case "Flag_UK_F": {
		// set play germany flag
		_object setFlagTexture "textures\flag.paa";
	};
	
	case "Land_DataTerminal_01_F": {
		if(playerSide == west) then {
			_object addAction ["<t color='#ff0000'>Kameras aktivieren</t>",{
				_this spawn {
					_terminal = (_this select 0);
					[_terminal,1] call BIS_fnc_dataTerminalAnimate;
					_terminal setObjectTextureGlobal[1,"textures\signs\pg_cam.paa"];
					sleep 2;
					[_terminal,2] call BIS_fnc_dataTerminalAnimate;
					sleep 2;
					[_terminal,3] call BIS_fnc_dataTerminalAnimate;
					_terminal setObjectTextureGlobal[1,""];
					sleep 6;
					life_fed_terminal = "camera" camCreate [0,0,0];
					life_fed_terminal camSetFov 0.5;
					life_fed_terminal camCommit 0;
					"rendertarget0" setPiPEffect [0];
					life_fed_terminal cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
					_terminal setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
					
					life_fed_terminal camSetPos [16773.9,13587.1,11.9509];
					life_fed_terminal camSetTarget [16764,13627.6,0];
					life_fed_terminal camCommit 0;
					
					life_fed_terminal1 = "camera" camCreate [0,0,0];
					life_fed_terminal1 camSetFov 0.5;
					life_fed_terminal1 camCommit 0;
					"rendertarget1" setPiPEffect [0];life_fed_terminal1 cameraEffect ["INTERNAL", "BACK", "rendertarget1"];
					_terminal setObjectTexture [1,"#(argb,256,256,1)r2t(rendertarget1,1.0)"];
					
					life_fed_terminal1 camSetPos [16747.6,13633.1,3.96898];
					life_fed_terminal1 camSetTarget [16755.6,13641.6,1.28785];
					life_fed_terminal1 camCommit 0;
				};
			},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 0'];
		
			_object addAction ["<t color='#ff0000'>Kameras deaktivieren</t>",{
				_terminal = (_this select 0);
				life_fed_terminal cameraEffect ["terminate", "back"];
				camDestroy life_fed_terminal;
				_terminal setObjectTexture [0,""];
				life_fed_terminal = nil;
				life_fed_terminal1 cameraEffect ["terminate", "back"];
				camDestroy life_fed_terminal1;
				_terminal setObjectTexture [1,""];
				life_fed_terminal1 = nil;
				[_terminal,0] call BIS_fnc_dataTerminalAnimate;
			},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 3'];
		};
		
		if(playerSide == independent) then {
			_object addAction ["<t color='#ff0000'>Terminal aktivieren</t>",{[_this select 0,3] call BIS_fnc_dataTerminalAnimate;},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 0'];
		
			_object addAction ["<t color='#ff0000'>Terminal deaktivieren</t>",{[_this select 0,0] call BIS_fnc_dataTerminalAnimate;},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 3'];
		};
	};
	
	case "Land_BarGate_F": {
		_object addEventHandler["handleDamage",{false}];
	};
	
	case "Land_Pod_Heli_Transport_04_medevac_F": {
		_object setObjectTextureGlobal[0,"textures\THW\THW_Taru_2.paa"];
		_object setObjectTextureGlobal[1,"textures\THW\THW_Taru_3.paa"];
		[[_object], "PG_fnc_vehicleAddEVH", independent, true] spawn life_fnc_MP;
		_attachPos = [0, 3, 1.5];
	};
	
};
	
life_barrier_activeObj = _object;
_object attachTo[player, _attachPos];
_object setVariable ["placed",true,true];
if(!(_className in ["Land_Medevac_house_V1_F","Land_Pod_Heli_Transport_04_medevac_F","Land_BarGate_F"])) then {_object enableSimulationGlobal false;};
if(_className in ["Land_Pod_Heli_Transport_04_medevac_F"]) then {_object setDir -90};
_originalPos = position _object;
_playerOriginalPos = position player;
waitUntil
{
	if (life_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call PG_fnc_placeableCancel;
	};
	sleep 1;
	!life_barrier_active;
};