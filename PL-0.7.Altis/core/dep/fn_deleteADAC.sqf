/*---------------------------------------------------------------------------
	File: fn_deleteADAC.sqf
	Auteur: Skrow & Skyfezzer
---------------------------------------------------------------------------*/
if(life_job > 0)then{
	_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_index = -1;
	if((count life_adacMarker) < 2) then {
		life_adacMarker  = [];
	}else{
		{
			_index = _index +1;
				if(_x select 0 == _vehicle)then{
					life_adacMarker set [_index,objNull];
					life_adacMarker = life_adacMarker - [objNull];
				};
		}foreach life_adacMarker;
	};
};