/*
	File: fn_gathertrash.sqf
	Author: Cifon
	E-Monkeys.com
*/
private["_itemv","_item","_itemva","_red"];
_itemv ="";
_item ="";
_itemva = 0;
_ma = 0;

_trasharrayra = trasharray select floor random count trasharray;
_call = _trasharrayra select 0;

switch(true) do
{	
	case (_call == 1) : 
	{
		_item = _trasharrayra select 1;
		if(player canAdd _item) then 
		{
			titleText["Durchsuche Müll","PLAIN"];
			player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			uisleep 3;
			
			_itemInfo = [_item] call EMonkeys_fnc_fetchCfgDetails;
	
			[_item,true] call EMonkeys_fnc_handleItem;

			titleText[format["Du hast ein %1 gefunden",_itemInfo select 1],"PLAIN"];
			eM_leveladd = ["trash","sammeln"];
		}
			else
		{
			["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
		};
	};
	case (_call == 2) : 
	{
		_itemv =_trasharrayra select 1;
		_itemva = _trasharrayra select 2;
		if(_itemva > 0) then 
		{
			titleText["Durchsuche Müll","PLAIN"];
			player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			uisleep 3;
			if(([true,_itemv,_itemva] call EMonkeys_fnc_handleInv)) then
			{
				_name = [([_itemv,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;
				titleText[format["Du hast %2 %1 gefunden",_name,_itemva],"PLAIN"];
				eM_leveladd = ["trash","sammeln"];
			};
		}
			else
		{
			["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
		};
    };
	case (_call == 3) : 
	{
		_ma =_trasharrayra select 1;
		titleText["Durchsuche Müll","PLAIN"];
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		uisleep 3;
		EMonkeys_c164 = EMonkeys_c164 + _ma;
		titleText[format["Du hast %1€ gefunden",_ma],"PLAIN"];
		eM_leveladd = ["trash","sammeln"];
    };
};

uisleep 5;
eM_action_gather = false;