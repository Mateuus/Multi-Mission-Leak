_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = _this select 1;

switch (_mode) do
{
	case "open":
	{
		_curTarget setVariable ["lock_trunk",false,true];
		hint parseText "<img size='1' color='#FFFFFF' image='core\textures\icons\unlock.paa'/> <t size='1'>Du hast den Kofferraum aufgeschlossen!</t>";
	};
	case "close":
	{
		_curTarget setVariable ["lock_trunk",true,true];
		hint parseText "<img size='1' color='#FFFFFF' image='core\textures\icons\lock.paa'/> <t size='1'>Du hast den Kofferraum abgeschlossen!</t>";
	};
};