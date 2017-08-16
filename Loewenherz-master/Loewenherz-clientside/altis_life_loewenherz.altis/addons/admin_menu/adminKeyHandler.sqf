
/*
	File: adminKeyHandler.sqf
	Author: Blackd0g

	Description:
	Admin key handler for event 'keyDown'
*/
private ["_ctrl","_code","_ctrlKey","_speed","_handled","_interruptionKeys","_ct"];

_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorObject;
_handled = false;
_ct = cursorObject;

//hint str _code;
_interruptionKeys = [17,30,31,32,1,2,3,57]; //A,S,W,D,1,2,3,Space

// F Tasten = 59 - 68
if(_code in _interruptionKeys) exitWith {
	_handled;
};

switch (_code) do
{
	case 68: // F10 Enable & Disable Admin Actions
	{
		if (call lhm_adminlevel > 0) then {
				if(player_isAdmin) then {
					if(_shift && player_isAdmin) then {
						hint parseText format ["
						<t size='1.10' font='puristaLight' align='left' color='#ffcb85'>LEVEL [%1] </t><t size='1.10' font='puristaLight' align='right' color='#00cc00'>ACTIONS ENABLED</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F1]</t><t size='0.95' font='puristaLight' align='right'>Attach/Detach</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F2]</t><t size='0.95 'font='puristaLight' align='right'>Repair Object</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F3]</t><t size='0.95 'font='puristaLight' align='right'>Clear Cargo</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F4]</t><t size='0.95' font='puristaLight'align='right'>Remove Object</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F5]</t><t size='0.95' font='puristaLight'align='right'>Flip Vehicle</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F6]</t><t size='0.95' font='puristaLight' align='right'>Debug Monitor</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F7]</t><t size='0.95' font='puristaLight' align='right'>Open Menu</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F8]</t><t size='0.95' font='puristaLight' align='right'>Telefon</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F9]</t><t size='0.95' font='puristaLight' align='right'>Switch Day/Night</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#ff2500'>[F10]</t><t size='0.95' font='puristaLight' align='right' color='#FAFAD2'>Disable Admin Actions</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#ff2500'>[SHIFT+F10]</t><t size='0.95' font='puristaLight' align='right' color='#FAFAD2'>This Help</t>
						",(call lhm_adminlevel)
						];
					} else {
						// Remove Admin Stuff
						closeDialog 0;
						player_isAdmin = false;
						AttachedObj = nil;
						bInvisibleOn = nil;
						spectate = nil;
						lhmGodMode = false;
						If (!isNil "mapm") then {
							moptions = nil;mapm = nil;maphalf = nil;plist = [];vList = [];cList = [];aList = [];sList = [];dList = [];bList = [];img = nil;musekeys = nil;drawic = nil;
						};

						hint "";
						0=[[["ADMIN ACTIONS, ","align = 'left' size = '0.7' font='PuristaBold'"],["DISABLED","align = 'left' size = '0.7'","#00cc00"],["","<br/>"]]] spawn BIS_fnc_typeText2;
					};
				} else {
					// Give Admin Stuff
					player_isAdmin = true;
						hint parseText format ["
						<t size='1.10' font='puristaLight' align='left' color='#ffcb85'>LEVEL [%1] </t><t size='1.10' font='puristaLight' align='right' color='#00cc00'>ACTIONS ENABLED</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F1]</t><t size='0.95' font='puristaLight' align='right'>Attach/Detach</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F2]</t><t size='0.95 'font='puristaLight' align='right'>Repair Object</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F3]</t><t size='0.95 'font='puristaLight' align='right'>Clear Cargo</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F4]</t><t size='0.95' font='puristaLight'align='right'>Remove Object</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F5]</t><t size='0.95' font='puristaLight'align='right'>Flip Vehicle</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00cc00'>[F6]</t><t size='0.95' font='puristaLight' align='right'>Debug Monitor</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F7]</t><t size='0.95' font='puristaLight' align='right'>Open Menu</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F8]</t><t size='0.95' font='puristaLight' align='right'>Telefon</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#00ffff'>[F9]</t><t size='0.95' font='puristaLight' align='right'>Switch Day/Night</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#ff2500'>[F10]</t><t size='0.95' font='puristaLight' align='right' color='#FAFAD2'>Disable Admin Actions</t><br/>
						<t size='1.10' font='puristaLight' align='left' color='#ff2500'>[SHIFT+F10]</t><t size='0.95' font='puristaLight' align='right' color='#FAFAD2'>This Help</t>
						",(call lhm_adminlevel)
						];

						0=[[["ADMIN ACTIONS, ","align = 'left' size = '0.7' font='PuristaBold'"],["ENABLED","align = 'left' size = '0.7'","#FF0000"]]] spawn BIS_fnc_typeText2;
				};
		};
	};

	// F1 Attach / Detach Object
	case 59:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\attachObj.sqf");
		};
	};

	// F2 Repair Object
	case 60:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\repairObj.sqf");
		};
	};

	// F3 Clear Cargo Object
	case 61:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\ClearCargoObj.sqf");
		};
	};

	// F4 Remove Object
	case 62:
	{

		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\removeObj.sqf");
		};
	};

	// F5 Flip Vehicle
	case 63:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\flipVehicle.sqf");
		};
	};

	// F6 Debug Monitor
	case 64:
	{
		if (call lhm_adminlevel > 0 && player_isAdmin) then {
			[_ct] execVM (lhm_adminPath + "onKeyScripts\debugMonitor.sqf");
		};
	};

	// F7 Admin GUI
	case 65:
	{
		if (call lhm_adminlevel >= 1 && player_isAdmin) then {
			closeDialog 0;
			[] execVM (lhm_adminPath + "admin_menu_fill.sqf");
		};
	};

	// F8 Tele/ESP
	case 66:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {

			[] execVM (lhm_adminPath + "Admin_Menu_scripts\teleesp.sqf");
		};
	};
	// F9 ChangeTime
	case 67:
	{
		if (call lhm_adminlevel > 1 && player_isAdmin) then {
			[] execVM (lhm_adminPath + "Admin_Menu_scripts\changetime.sqf");
		};
	};
};

_handled;