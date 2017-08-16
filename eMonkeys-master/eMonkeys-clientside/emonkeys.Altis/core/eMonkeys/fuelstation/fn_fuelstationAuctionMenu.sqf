/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Fuelstation Auction Menu
*/
private["_array","_display","_listbox"];
_array = _this select 0;

createDialog "fuelstation_auction";
disableSerialization;

["Öffentliche Ausschreibung",["Achtung, du kannst nur für eine Tankstelle den Zuschlag erhalten.","Nach Auktionsende bekommt das höchste Gebot den Zuschlag!","Das Geld wird dann vom Konto abgezogen, achte darauf, genug Kontodeckung zu besitzen."],"#85c809"] call EMonkeys_fnc_specialText;

if(!isNull (findDisplay 9000)) then 
{
	_display = findDisplay 9000;
	_listbox = _display displayCtrl 9001;
	{	
		if (!(isNil {_x})) then 
		{
			_type = _listbox lbAdd format ["%1",_x select 1];
			_listbox lbSetData [_type, _x select 0];
			_listbox lbSetPicture [_type, "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
		};
    } foreach _array;
};