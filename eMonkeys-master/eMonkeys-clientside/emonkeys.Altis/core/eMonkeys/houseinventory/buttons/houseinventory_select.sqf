private ["_playergear","_dbgear","_dbselected","_playerweapons","_playermagazines","_playeritems","_playeruniforms","_playervests","_playerbackpacks","_playerheadgear","_playerselected"];
// Aktiver Reiter aus dem Dialog
selected_tab = _this select 0;
_playergear = _this select 1;
_dbgear = _this select 2;
// Objekte aus dem Mainarray auslesen und den lokalen Variablen die entsprechenden Arrays zuweisen
_playerweapons = _playergear select 0;
_playermagazines = _playergear select 1;
_playeritems = _playergear select 2;
_playeruniforms = _playergear select 3;
_playervests = _playergear select 4;
_playerbackpacks = _playergear select 5;
_playerheadgear = _playergear select 6;
_dbweapons = _dbgear select 0;
_dbmagazines = _dbgear select 1;
_dbitems = _dbgear select 2;
_dbuniforms = _dbgear select 3;
_dbvests = _dbgear select 4;
_dbbackpacks = _dbgear select 5;
_dbheadgear = _dbgear select 6;

switch (selected_tab) do
	{
		case 0: {	
					_playerselected = _playerweapons;
					_dbselected = _dbweapons;
				
				};
		case 1: {
					_playerselected = _playermagazines;
					_dbselected = _dbmagazines;
				
				};
		case 2: {
					_playerselected = _playeritems;
					_dbselected = _dbitems;
					
				};
		case 3: {
					_playerselected = _playeruniforms;
					_dbselected = _dbuniforms;
		
				};
		case 4: {
					_playerselected = _playervests;
					_dbselected = _dbvests;
				};
		case 5: {
					_playerselected = _playerbackpacks;
					_dbselected = _dbbackpacks;
				};
		case 6: {
					_playerselected = _playerheadgear;
					_dbselected = _dbheadgear;
				};
		default {
					_playerselected = _playerweapons;
					_dbselected = _dbweapons;
				};
	};


lbClear 4503;
lbClear 4502;
if (selected_tab == 1) then
{
	{
		_name = getText(configFile >> "cfgmagazines" >> _x >> "displayName");
		_index = lbAdd [4503, _name];
		lbSetData [4503, _index, _x];
		
	} forEach _playerselected;
	
	{
		_name = getText(configFile >> "cfgmagazines" >> _x >> "displayName");
		_index = lbAdd [4502, _name];
		lbSetData [4502, _index, _x];
		
	} forEach _dbselected;
}
else
{
	if (selected_tab ==5) then
	{
		{
			_name = getText(configFile >> "cfgvehicles" >> _x >> "displayName");
			_index = lbAdd [4503, _name];
			lbSetData [4503, _index, _x];
			
		} forEach _playerselected;
		
		{
			_name = getText(configFile >> "cfgvehicles" >> _x >> "displayName");
			_index = lbAdd [4502, _name];
			lbSetData [4502, _index, _x];
			
		} forEach _dbselected;
	}
	else
	{
		{
			_name = getText(configFile >> "cfgweapons" >> _x >> "displayName");
			_index = lbAdd [4503, _name];
			lbSetData [4503, _index, _x];
			
		} forEach _playerselected;
		
		{
			_name = getText(configFile >> "cfgweapons" >> _x >> "displayName");
			_index = lbAdd [4502, _name];
			lbSetData [4502, _index, _x];
			
		} forEach _dbselected;
	};
};