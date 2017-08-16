/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_number = param [0,-1,[0]];
if(_number isEqualTo -1) exitWith {};
disableSerialization;
_display = findDisplay 700;
switch(_number)do {
  case 0: {
    PlayerUniform = [uniform player,uniformItems player,goggles player,headgear player];
    _idc = [1200,2400,2401,2402,1000,2403,1100];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow false;
    } forEach _idc;
    _idc = [2000,2001,2500,2100,3400,3401];
     {
      _control = _display displayCtrl _x;
      _control ctrlShow true;
    } forEach _idc;
    _list = (findDisplay 700) displayCtrl 2500;
    _filter = (findDisplay 700) displayCtrl 2100;
    lbClear _filter;
    lbClear _list;
    _filter lbAdd "Clothing";
    _filter lbAdd "Hats";
    _filter lbAdd "Glasses";
    _filter lbSetCurSel 0;
    INTRO_CAM cameraEffect ["Internal", "Back"];
    showCinemaBorder false;
    INTRO_CAM camSetTarget (player modelToWorld [0,0,1]);
    INTRO_CAM camSetPos (player modelToWorld [1,4,2]);
    INTRO_CAM camSetFOV .33;
    INTRO_CAM camSetFocus [50,0];
    INTRO_CAM camCommit 1;
    if(isNil "intro_cam_degree") then {intro_cam_degree = 0;};
    intro_cam_degree = 0;
    (findDisplay 700) displayAddEventHandler ["MouseButtonDown",
    	{
    		if(_this select 1 isEqualTo 0) then {life_mouseHolding = true;};
    	}
    ];
    (findDisplay 700) displayAddEventHandler ["MouseButtonUp",
    	{
    		if(_this select 1 isEqualTo 0) then {life_mouseHolding = false;};
    	}
    ];
    (findDisplay 700) displayAddEventHandler["MouseMoving",
    	{
    		if(life_mouseHolding) then {
    			_x = _this select 1;
    			_y = _this select 2;
    			_x = (_x * 8);
    			_dir = getDir player;
    			player setDir (_dir + _x);
    			intro_cam_degree = intro_cam_degree + _y;
    		};
    	}
    ];
  };
  case 1: {
    (findDisplay 700) displayRemoveAllEventHandlers "MouseButtonDown";
    (findDisplay 700) displayRemoveAllEventHandlers "MouseButtonUp";
    (findDisplay 700) displayRemoveAllEventHandlers "MouseMoving";
    _idc = [2000,2001,2500,2100,3400,3401];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow false;
    } forEach _idc;
    _idc = [1200,2400,2401,2402,1000,2403,1100];
     {
      _control = _display displayCtrl _x;
      _control ctrlShow true;
    } forEach _idc;
    INTRO_CAM cameraEffect ["Internal", "Back"];
    showCinemaBorder false;
    INTRO_CAM camSetTarget (player modelToWorld [1.5,0,1]);
    INTRO_CAM camSetPos (player modelToWorld [0,4,1]);
    INTRO_CAM camSetFOV .65;
    INTRO_CAM camSetFocus [50, 0];
    INTRO_CAM camCommit 1;
    player forceAddUniform (PlayerUniform select 0);
    player addHeadgear (PlayerUniform select 3);
	  player addGoggles (PlayerUniform select 2);
    if(count (PlayerUniform select 1) > 0) then {
		    {
          [_x,true,false,false,true] call life_fnc_waxecruwuka;
        } forEach (PlayerUniform select 0);
	  };
    PlayerUniform = [];
    saveProfileNamespace;
  };
};
