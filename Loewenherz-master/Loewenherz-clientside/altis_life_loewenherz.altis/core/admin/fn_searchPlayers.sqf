

private ["_mode","_display","_lb_AllPlayers","_lb_switch","_lb_Mode","_lb_gespeicherte_skripts","_bckgrnd_left","_bckgrnd_right","_strText_allPlayers","_strText_chosen_mode_header","_strText_Mode_menu","_strText_saved_skripts","_strText_INFO","_strText_header_konsole","_strText_Insignia","_BTN_refresh_players","_BTN_local_exec","_BTN_Server_exec","_BTN_remote_exec","_BTN_clear_console","_BTN_save_skript","_search_for_player","_Code_input","_found","_selPlayer","_player","_b","_data"];
disableSerialization;


if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if(isnull (findDisplay 9858)) exitWith {};
_mode = param[0,"",[""]];
if(_mode isEqualTo "") exitWith {hint "Kein Mode übergeben worden!"};

_display = findDisplay 9858;
//Listboxes
_lb_AllPlayers = _display displayCtrl 1500;
_lb_switch = _display displayCtrl 1501;
_lb_Mode = _display displayCtrl 1502;
_lb_gespeicherte_skripts = _display displayCtrl 1503;
// Backgrounds
_bckgrnd_left = _display displayCtrl 1000;
_bckgrnd_right = _display displayCtrl 1001;
//Structured Texts
_strText_allPlayers = _display displayCtrl 1100;
_strText_chosen_mode_header = _display displayCtrl 1101;
_strText_Mode_menu = _display displayCtrl 1102;
_strText_saved_skripts = _display displayCtrl 1103;
_strText_INFO = _display displayCtrl 1104;
_strText_header_konsole = _display displayCtrl 1105;
_strText_Insignia = _display displayctrl 1106;
// Buttons
_BTN_refresh_players = _display displayCtrl 2400;
_BTN_local_exec = _display displayCtrl 2401;
_BTN_Server_exec = _display displayCtrl 2402;
_BTN_remote_exec = _display displayCtrl 2403;
_BTN_clear_console = _display displayCtrl 2404;
_BTN_save_skript = _display displayctrl 2405;
// Edit Fields
_search_for_player = _display displayCtrl 1400;
_Code_input = _display displayCtrl 1401;

_found = false;










switch (_mode) do
{
	case "Search_Player":
	{
		_selPlayer = lbCurSel _lb_AllPlayers;
		if(_selPlayer isEqualTo -1) exitWith {hint "Du musst dafür einen Spieler auswählen!"};
		_name = _lb_AllPlayers lbData _selPlayer;
		if(_name isEqualTo "") exitWith {hint "Ist das ein Spieler?"};
		{
			if(name _x == _name) then {
				_found = true;
				_player = _x;
			};

		} foreach playableUnits;
		if(!_found) exitWith {hint format["Der Spieler %1 konnte nicht gefunden werden!",_name];};
		if(!alive _player) exitWith {hint "Der Spieler ist aktuell tot"};

		lbClear _lb_switch;

		_lb_switch lbadd "Untersuche Spieler (select Player)";
		_lb_switch lbsetdata[0,"Search_Player"];
		_lb_switch lbSetColor[0,[0.18,0.996,0.18,1]];

		_lb_switch lbadd "Untersuche ALLE Spieler";
		_lb_switch lbsetdata[1,"All_Players"];
		_lb_switch lbSetColor[1,[0.18,0.996,0.18,1]];

		_lb_switch lbadd format["Dursuche Spieler %1.....",_name];
		_lb_switch lbSetColor[(lbsize _lb_switch - 1),[0,1,0,1]];
		_lb_switch lbSetData[(lbsize _lb_switch - 1),""];

		[[player,"easy"],"lhm_fnc_searchClient",[_player],false] call lhm_fnc_mp;

	};

	case "All_Players":
	{

		lbClear _lb_switch;

		_lb_switch lbadd "Untersuche Spieler (select Player)";
		_lb_switch lbsetdata[0,"Search_Player"];
		_lb_switch lbSetColor[0,[0.18,0.996,0.18,1]];

		_lb_switch lbadd "Untersuche ALLE Spieler";
		_lb_switch lbsetdata[1,"All_Players"];
		_lb_switch lbSetColor[1,[0.18,0.996,0.18,1]];

		_lb_switch lbadd format["Dursuche %1 Spieler, kann dauern :D",count(playableUnits)];
		_lb_switch lbSetColor[(lbsize _lb_switch - 1),[0,1,0,1]];
		_lb_switch lbSetData[(lbsize _lb_switch - 1),""];

		[] spawn lhm_fnc_searchAllClients;

	};
};
