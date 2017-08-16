/*
	File: fn_targetName.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Adds nametag for cursorTarget if a player/vehicle.
*/
scopeName "main";
["targetTag", "onEachFrame",
{
	if (life_targetTag) then
	{
		if (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") then
		{
			_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
			if(!_vis) then
			{
				_pos = visiblePosition cursorTarget;
				_pos set[2,(getPosATLVisual cursorTarget select 2) + 2.2];
				if (surfaceIsWater (position cursorTarget)) then
				{
					_pos = visiblePositionASL cursorTarget;
					_pos set[2,(getPosASLVisual cursorTarget select 2) + 2.2];
				};
				_height = 1;
				_color = [1,1,1,1];
				_name = "";
				_crew = crew cursorTarget;
				if (count _crew > 0 && vehicle player != cursorTarget) then
				{
					{if(_name == "") then {_name = name _x } else {_name = _name + ", " + name _x }} forEach _crew;
					drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04,"PuristaMedium"];
				};
			};
		};
		if (cursorTarget isKindOf "Man") then
		{
			_hidden = ((goggles cursorTarget) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
			_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
			if(!_vis) then
			{
				_pos = visiblePosition cursorTarget;
				_pos set[2,((getPosATLVisual cursorTarget) select 2) + 2.2];
				if (surfaceIsWater (position cursorTarget)) then
				{
					_pos = visiblePositionASL cursorTarget;
					_pos set[2,((getPosASLVisual cursorTarget) select 2) + 2.2];
				};
				_color = [1,1,1,1];
				if (!alive cursorTarget ) then { _color = [1,0,0,1]; };
				if (count life_gang_wars > 0) then
				{
					if ((cursorTarget getVariable ["gang","0"]) in life_gang_wars) then { _color = [1,0,0,1]; };
				};
				_name = name cursorTarget;
				switch (cursorTarget getVariable["copLevel", 0]) do
				{
					case (1) : {_name = format["Police Cadet %1", name cursorTarget];};
					case (2) : {_name = format["Police Constable %1", name cursorTarget];};
					case (3) : {_name = format["Police Corporal %1", name cursorTarget];};
					case (4) : {_name = format["Police Sergeant %1", name cursorTarget];};
					case (5) : {_name = format["Police Lieutenant %1", name cursorTarget];};
					case (6) : {_name = format["Police Captain %1", name cursorTarget];};
					default {
						_gang = cursorTarget getVariable["gangName",""];
						if (_hidden && player distance cursorTarget > 20) then { _name = "Unknown" };
						if (_gang != "") then {
							_pos2 = +_pos;
							_pos2 set[2,((getPosATL cursorTarget) select 2) + 2];

							drawIcon3D ["",_color,_pos2,0,0,0,format["[%1]", _gang],0.25,0.01,"PuristaMedium"];
						};
					};
				};

				if (cursorTarget getVariable ["life_title",""] != "") then
				{
					_title = cursorTarget getVariable "life_title";
					_color = switch (_title) do
					{
						case "The Prominent %1": { [0.6,0.6,0,1] };
						case "Tycoon %1": { [0.8,0.8,0,1] };
						case "The Eminent %1": { [1,1,0,1] };
						default { _color };
					};
					_name = format[_title, _name];
				};
				systemChat format["_name = %1", _name];
				drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04,"PuristaMedium"];
			};
		};
    };
}] call BIS_fnc_addStackedEventHandler;
