#include <macro.h>
private ["_unit","_side","_setVariable","_dogRevive","_dogWhistle","_dogFollow","_dogSeek","_dogHeel","_dogHide","_dogStop","_dogGrowl","_playSound","_dogReturnIdle","_actions","_dogVehicle","_loop","_var1"];
if(playerSide == civilian) exitWith {hint "Seul des personnes responsables sont habilités a posseder un chien !"};
if((player getVariable ["pet_owner",FALSE])) exitWith {hint"Vous ne pouvez plus acheter de chien, ne soyez pas irresponsable !";};
if(argent_liquide < 5000) exitWith {hint"Vous n'avez pas assez ! Un chien a besoin de beaucoup d'attention... et d'argent !";};
argent_liquide = argent_liquide - 5000;
hint 'Vous avez acheté un chien\n\nPrenez soin de lui !';
_unit = _this select 0;
_side = side _unit;
uiSleep 2;
player setvariable ["pet_owner",true,true];

_setVariable =
	{
		_unit setvariable ["order","nil"];
		_unit setvariable ["step","wait"];
		_unit setvariable ["action","true"];
		_unit setvariable ["seek","false"];
		_unit setvariable ["actions",[]];		
	};
_dogRevive = 
	{
		_unit = _this select 0;
		_dog = _unit getvariable "dog";
		uiSleep 5;
		_side = side _unit;
		_unit setvariable ["follow",'false'];
		_tempPos = getpos _unit;
		_group1 = createGroup _side;
		"Alsatian_Random_F" createUnit [_tempPos,_group1,"_unit setvariable ['dog',format['%1',this]]", 1.0, "private"];
		uiSleep 0.5;
		_dog = _unit getvariable "dog";
		_unit setvariable ["step","go"];
	};
	
_dogWhistle =
    {
        _unit 		= (_this select 3) select 0;
		_growl 		= (_this select 3) select 1;
		play 		= (_this select 3) select 2;
		_idle 		= (_this select 3) select 3;
		_vehicle 	= (_this select 3) select 4;
		_sound = ["whistle",_unit, 20] spawn play;
        hint "Rex, viens ici mon chien !";
        uiSleep 1;
        _unit setvariable ["follow",'false'];
        _tempPos = [(getpos _unit) select 0,((getpos _unit) select 1) + 1,0];
        _side = side _unit;
        _group1 = createGroup _side;   
        _dog = "Alsatian_Random_F" createUnit [_tempPos,_group1,"dog = this", 1.0, "private"];
        _unit setvariable ["order","idle"];
        _unit setvariable ["step","go"];
        _unit setvariable ["dog", dog];
        (_unit getvariable "dog") setvariable ["player",_unit];
		_vehicle	= [_unit,play] spawn _vehicle;
		_return		= [_unit,play] spawn _idle;
        _growl 		= [_unit,play] spawn _growl;
        killed =
            {
				_unit1 = (_this select 0) getvariable "player";
				_unit1 setvariable ["order","dead"];
				_unit setvariable ["action","false"];
				_unit1 setvariable ["step","go"];
				deleteVehicle _dog;
            };
		shot_at =
            {
				_dog = _this select 0;
				_firer = _this select 1;
				_unit1 = _dog getvariable "player";
				_side = civilian;
				
				if (((side _firer) == civilian)&&((_unit1 getvariable "seek")=="true")) then
					{
						_unit1 SVAR ["order","idle"];
						_unit1 SVAR ["step","go"];
						_unit1 SVAR ["seek","false"];
						_dog doMove (getpos _unit1);
						_sound = ["dog_whine",_dog, 20] spawn play;
					};
           };
        (_unit getvariable "dog") addeventhandler
            [
            "killed",
				{ 
				    _script = [(_this select 0)] call killed;
				}
            ];

        (_unit getvariable "dog") addeventhandler
            [
            "FiredNear",
				{
					_script = [(_this select 0),(_this select 1)] call shot_at;
				}
            ];			

    };
_dogFollow =
	{
		_unit 	= (_this select 3) select 0;
		_dog	= _unit getvariable "dog";
		_play	= (_this select 3) select 1;
		_sound 	= ["dog_one",_dog, 20] spawn _play;
		hint "Rex, suis-moi !";
		_unit setvariable ["order","active"];
		_unit setvariable ["step","go"];
		_unit setvariable ["follow",'true'];

		while {(_unit getvariable "follow") == 'true'} do 
		{
			uiSleep 0.5;
			if ((_dog distance _unit) < 4) then 
				{
				_dog domove getpos _dog;
				} 
				else 
					{
					_dog domove getpos _unit;	
					};
			uiSleep 1;
		};
	};
_dogSeek = 
	{
		_unit 	= (_this select 3) select 0;
		_unit setvariable ["follow",'false'];
		_unit setvariable ["seek","true"];
		_dog 	= _unit getvariable "dog";
		_play 	= (_this select 3) select 1;
		hint "Rex, va chercher !";
		_unit setvariable ["order","active"];
		_unit setvariable ["step","go"];
		_dog = _unit getvariable "dog";
		//_side = civilian;
		_radius = 300;
	
		_nearestunits = nearestObjects [_dog,["Man"],_radius];
	
		_nearestunitofside = [];

		//if(_side countSide _nearestunits > 0) then
		if (civilian countSide _nearestunits > 0 || west countSide _nearestunits > 0) then
		{
		_sound = ["dog_one",_dog, 50] spawn _play;
			{
				_unit = _x;
				//if (side _unit == _side) then 
				if (side (group _unit) in [civilian,west] && isPlayer _unit) then 
					{
						_nearestunitofside = _nearestunitofside + [_unit]
					};
			} foreach _nearestunits;
		} else {
		_sound = ["dog_whine",_dog, 50] spawn _play;
		_unit setvariable ["order","idle"];
		};
		

		_dog domove getpos (_nearestunitofside select 0);
		
		waituntil {(_dog distance (_nearestunitofside select 0))<10};
		_sound = ["dog_ruff",_dog, 50] spawn _play;

	};
_dogHeel =
	{

		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getvariable "dog";
		_play 	= (_this select 3) select 1;
		_sound 	= ["dog_one",_dog, 20] spawn _play;
		hint "Rex au pied !";
		_unit setvariable ["follow",'false'];
		_dog = _unit getvariable "dog";

		_dog domove [(getpos _unit) select 0,((getpos _unit) select 1) - 1, 0];
		_unit setvariable ["order","active"];
		_unit setvariable ["step","go"];
	};
_dogHide =
	{
		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getvariable "dog";
		_unit setvariable ["follow",'false'];
	
		_dog 	= _unit getvariable "dog";
		
		hint "Rex, cache toi !";

		_unit setvariable ["order","nil"];
		_unit setvariable ["step","go"];
		uiSleep 3;
		deleteVehicle _dog;
	};
_dogStop =
	{
		
		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getVariable "dog";
		_play 	= (_this select 3) select 1;
		_sound 	= ["dog_one",_dog, 20] spawn _play;
		_unit setvariable ["seek","false"];
		hint "Rex, arretes toi !";
		_unit setvariable ["follow",'false'];
		_dog domove getpos _dog;
		_unit setvariable ["order","idle"];
		_unit setvariable ["step","go"];
	};
_dogGrowl =
    {
	     
    };
_playSound =
	{
	
		_soundPath 	= [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		sound 		= _this select 0;
		dog1 		= _this select 1;
		_volume 	= _this select 2;
		//_soundToPlay = _soundPath + "sounds\" + _sound + ".ogg";
		dog1 say3d sound;
		//publicvariable "sound";
		//publicvariable "dog1";
		//[{dog1 say3d sound},"bis_fnc_spawn",true] spawn bis_fnc_mp;
		//_null = [[_sountToPlay,_dog],"sound_fnc",true,true] spawn BIS_fnc_MP;
		//_sound = ["hey",_unit getvariable "dog"] call _playSound;
	
	};
_dogReturnIdle =
	{
	_unit 	= _this select 0;
	_dog	= _unit getvariable "dog";
	_play 	= _this select 1;
	while {alive _dog} do
		{
		waituntil {(((_dog distance _unit)>30)&&((_unit getvariable "order")=="idle"))};
		_dog domove (getpos _unit);
		_sound = ["dog_whine",_dog, 20] spawn _play;
		waituntil {unitReady _dog};
		};
	};
_dogVehicle =
	{
		_unit 	= _this select 0;
		_dog 	= _unit getvariable "dog";
	
		while {alive _dog} do
			{
				waituntil {(((vehicle _unit)!= _unit)&&((_dog distance _unit)<8))};
				_veh = vehicle _unit;
					_dog attachto [_unit,[0.5,-0.05,-0.2]];
					_dog attachto [_veh];
				waituntil {(vehicle _unit)!= _veh};
				detach _dog;
				_dog setpos [((getpos _unit) select 0) + 2,((getpos _unit) select 1) + 2,0];
			};
	};	
_actions = 
	{
	_unit       	= _this select 0;
	_dogWhistle		= _this select 1;
	_dogFollow  	= _this select 2;
	_dogSeek 	   	= _this select 3;
	_dogHide    	= _this select 4;
	_dogHeel   	 	= _this select 5;
	_dogStop	    = _this select 6;
	_dogGrowl   	= _this select 7;
	_playSound		= _this select 8;
	_dogReturnIdle 	= _this select 9;
	_dogVehicle		= _this select 10;
	_unit setvariable ["actions",[]];
	while {(_unit getvariable "action")=="true"} do
		{
		_unit setvariable ["step","wait"];
			_actions = _unit getvariable "actions";
			{
			_unit removeaction _x;
			} foreach _actions;
		
		_actions = [ ];	
		if ((_unit getvariable "order") == "nil") then
			{
				_whistle = _unit addAction ["Siffler", _dogWhistle, [_unit, _dogGrowl,_playSound,_dogReturnIdle,_dogVehicle]];
				_unit setvariable ["order","whistle"];
				_unit setvariable ["step","wait"];
				_unit setvariable ["actions",[_whistle]];
			};	
		if ((_unit getvariable "order") == "idle") then
			{
				_follow = _unit addAction ["<t color = '#ffff00'>Viens la</t>", _dogFollow, [_unit,_playSound]];
				_find = _unit addAction ["<t color = '#ffff00'>Cherche</t>", _dogSeek, [_unit,_playSound]];
				_rest = _unit addAction ["<t color = '#ff0000'>Cache toi</t>", _dogHide, [_unit,_playSound]];
				_heel = _unit addAction ["<t color = '#ffff00'>Au pied</t>", _dogHeel, [_unit,_playSound]];
				_unit setvariable ["step","wait"];
				
				_unit setvariable ["actions",[_follow,_find,_rest,_heel]];
				
			};
		if ((_unit getvariable "order") == "active") then
			{
				_stop = _unit addAction ["<t color = '#ff0000'>Stop</t>", _dogStop, [_unit,_playSound]];
				_unit setvariable ["step","wait"];
				_unit setvariable ["actions",[_stop]];
			};
		if ((_unit getvariable "dead") == "active") then
			{
				_unit setvariable ["order","nil"];
			};		
		waituntil {((_unit getvariable "step") == "go")};		
		};
	};
_var1 = [_unit] call _setVariable;
_loop = [_unit,_dogWhistle,_dogFollow,_dogSeek,_dogHide,_dogHeel,_dogStop,_dogGrowl,_playSound,_dogReturnIdle, _dogVehicle] call _actions;