/*---------------------------------------------------------------------------
	File: fn_placeablePlace.sqf
	Description:
		Indique qu'un objet est bien placé et fixé
---------------------------------------------------------------------------*/
private[];
disableSerialization;
if (count life_bar_placey >= life_bar_limit) exitWith {hint "Vous ne pouvez plus placer d'objets";};
_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
_className = lbData[20001, lbCurSel (20001)];
closeDialog 0;
life_barrier_active = true;
_allowMoveDistance = 15;
_attachPos = [0, 3, 0.5];
_object = _className createVehicle (position player);

switch (_className) do {
	case "Flag_FR_F": {
		_object setFlagTexture "textures\panneaux\flag_fr.paa";
	};

	case "Land_DataTerminal_01_F": {
		if (playerSide == west) then {
			_object addAction ["<t color='#ff0000'>Activer la caméra</t>", {
				_this spawn {
					_terminal = (_this select 0);
					[_terminal,1] call BIS_fnc_dataTerminalAnimate;
					sleep 2;
					[_terminal,2] call BIS_fnc_dataTerminalAnimate;
					sleep 2;
					[_terminal,3] call BIS_fnc_dataTerminalAnimate;
					_terminal setObjectTextureGlobal [1, ""];
					sleep 6;
					/* Camera 0 */
					life_fed_terminal = "camera" camCreate [0,0,0];
					life_fed_terminal camSetFov 0.5;
					life_fed_terminal camCommit 0;
					"rendertarget0" setPiPEffect [0];
					life_fed_terminal cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
					_terminal setObjectTexture [0, "#(argb,256,256,1)r2t(rendertaget0,1.0)"];

					life_fed_terminal camSetPos [20884.762,19209.096,10];
					life_fed_terminal camSetTarget [20896.18,19230.814,3.182];
					life_fed_terminal camCommit 0;

					/* Camera 1 */
					life_fed_terminal1 = "camera" camCreate [0,0,0];
					life_fed_terminal1 camSetFov 0.5;
					life_fed_terminal1 camCommit 0;
					"rendertarget0" setPiPEffect [0];
					life_fed_terminal1 cameraEffect ["INTERNAL", "BACK", "rendertarget1"];
					_terminal setObjectTexture [1, "#(argb,256,256,1)r2t(rendertaget1,1.0)"];

					life_fed_terminal1 camSetPos [20951.594,19182.852,19];
					life_fed_terminal1 camSetTarget [20922.768,19205.939,10.068];
					life_fed_terminal1 camCommit 0;
				};
			}, "",100,false,false,"",'(vehicle player == player) && _target animationPhase "Lid_stripes_2_3_move_1" == 0'];

			_object addAction ["<t color='#ff0000'>Desactiver la caméra</t>",{
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
			}, "",100,false,false,"",'(vehicle player == player) && _target animationPhase "Lid_stripes_2_3_move_1" == 3'];
		};

		if(playerSide == independent) then {
			_object addAction ["<t color='#ff0000'>Activer Terminal</t>",{[_this select 0,3] call BIS_fnc_dataTerminalAnimate;},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 0'];

			_object addAction ["<t color='#ff0000'>Désactiver Terminal</t>",{[_this select 0,0] call BIS_fnc_dataTerminalAnimate;},"",100,false,false,"",'(vehicle player == player) && _target  animationPhase "Lid_stripes_2_3_move_1" == 3'];
		};
	};

	case "Land_BarGate_F": {
		_object addEventHandler["HandleDamage",{false}];
	};
};

life_barrier_activeObj = _object;
_object attachTo[player, _attachPos];
_object setVariable ["placed", true, true];
if (!(_className in ["Land_Medevac_house_V1_F","Land_Pod_Heli_Transport_04_medevac_F","Land_BarGate_F"])) then {
	_object enableSimulation false;
};
if (_className in ["Land_Pod_Heli_Transport_04_medevac_F"]) then {
	_object setDir -90;
};
_originalPos = position _object;
_playerOriginalPos = position player;
waitUntil {
	if (life_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call life_fnc_placeableCancel;
	};
	sleep 1;
	!life_barrier_active;
};
