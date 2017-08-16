private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_player_damage", "_house_inventory", "_item", "_count", "__illegal_value", "__i_item", "__i_value","__idx", "_item_name", "_isillegal","_illegalItems"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems");

//hint _house_data;

/*hint _house_data;
uisleep 3;*/

//_house_data = call compile format["%1", _house_data]; //compile data

//////////////////Parse data
_house_data call EMonkeys_fnc_houseExtractData;
_exdata = EMonkeys_housetest;
if (count _exdata == 0) exitWith { hint "Konnte zugehoriges Haus nicht laden."; };

//Set player variable house_current_exdata
missionNameSpace setVariable ["house_current_exdata", _exdata];

_house_name =  [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal; //TO BE SAFE

//////////////////TODO
//Check if house belongs to player



/*hint format ["DEBUG: Haus gehört %1", [_exdata, "owner"] call EMonkeys_fnc_houseExtractDataVal];
uisleep 1;*/

_canview = true;
if( [_exdata, "owned"] call EMonkeys_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call EMonkeys_fnc_houseExtractDataVal) != getPlayerUID player) then //if player not owner
	{
		_canview = false;
	};
};

if(_canview) exitWith
{
	hint "Du kannst das Haus nicht durchsuchen!";
	};

////////////////////////////////////////////////////////////////////////////////////
///////////////////SHOW RESULT DLG
////////////////////////////////////////////////////////////////////////////////////

///Check if in use


if( [_house_name] call EMonkeys_fnc_houseIsInuse ) exitWith
{
	hint "Jemand anderes greift bereits auf das Haus zu!";
};



////


//Show dialog house_houseSearchDlg
if(dialog) exitWith {hint "Already using a dialog.";};

//Allg. action inuse
if(eM_action_inUse) exitWith {hint "Du machst gerade was anderes.";};

if(!createDialog "house_houseSearchDlg") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;


////

_house_inventory = [_exdata, "inventory"] call EMonkeys_fnc_houseExtractDataVal; //load inventory

//illegal items in EMonkeys_illegal_items = [ [SHORTNAME, PRICE] ]
__illegal_value = 0;

{
	_item = _x select 0;
	_count = _x select 1;
	_isillegal = false;
	
	if(_count > 0) then //check if count > 0
	{
		//Check if illegal and add illegal value
		{
			__i_item = _x select 0;
			__i_value = _x select 1;
		
			if(__i_item == _item) exitWith //illegal item found
			{
				__illegal_value = __illegal_value + (_count * __i_value); //add to illegal value
				_isillegal = true;
			};
		}
		foreach _illegalItems;
	
		//add money and item [if illegal] to listbox
		if(_item == "money") then
		{
			__idx = lbAdd [1500, format ["%1€",[_count] call EMonkeys_fnc_numberText]];		
		}
		else
		{
			if(_isillegal) then
			{
				_item_name = [_item,0] call EMonkeys_fnc_varHandle; //long name
				_item_name = [_item_name] call EMonkeys_fnc_varToStr; //get name
		
				__idx = lbAdd [1500, format ["%1x %2", _count, _item_name] ];	
			};
		};	
	};
}
foreach _house_inventory;

if(__illegal_value == 0) then
{
	//disable impound button
	ctrlEnable [2402, false];
	
	//message
	ctrlSetText [1000, "Keine illegalen Gegenstände gefunden."];
}
else
{
	//disable impound button
	ctrlEnable [2402, true];
	
	//message
	ctrlSetText [1000, format ["Wert: %1€! Besitzer: %2", __illegal_value, [_exdata, "ownername"] call EMonkeys_fnc_houseExtractDataVal ]];
};

//Set variable illegal value
missionNamespace setVariable ["house_cop_illegal_value", __illegal_value];

//!IMP set use variable
[_house_name, true] call EMonkeys_fnc_houseSetInuse;

waitUntil{isNull (findDisplay 38400)}; //Wait until done
//!IMP set use variable
[_house_name, false] call EMonkeys_fnc_houseSetInuse;
