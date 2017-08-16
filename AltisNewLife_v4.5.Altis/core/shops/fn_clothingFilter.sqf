disableSerialization;
private["_control","_selection","_list","_filter"];
_control = _this select 0;
_selection = _this select 1;
life_clothing_filter = _selection;
switch (_selection) do {
	case 4: {
		life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
		life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
		life_shop_cam camCommit 1;
	};
	case 0: {
		life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
		life_shop_cam camSetPos (player modelToWorld [1,4,2]);
		life_shop_cam camCommit 1;
	};	
	case 3: {
		life_shop_cam camSetTarget (player modelToWorld [0,0,1.4]);
		life_shop_cam camSetPos (player modelToWorld [-.1,2,1.4]);
		life_shop_cam camCommit 1;
	};	
	default {
		life_shop_cam camSetTarget (player modelToWorld [0,0,1.6]);
		life_shop_cam camSetPos (player modelToWorld [-.5,1,1.6]);
		life_shop_cam camCommit 1;
	};
};
if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;
_clothes = switch (life_clothing_store) do
{
	case "bruce": {[_selection] call life_fnc_clothing_bruce;};
	case "cop": {[_selection] call life_fnc_clothing_cop;};
	case "reb": {[_selection] call life_fnc_clothing_reb;};
	case "dive": {[_selection] call life_fnc_clothing_dive;};
	case "kart": {[_selection] call life_fnc_clothing_kart;};
	case "medic": {[_selection] call life_fnc_clothing_med;};
};
if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
		else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;