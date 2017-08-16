//File:fn_bus.sqf Author:[midgetgrimm] 
private["_question","_dest"];

if(!alive player) exitWith {hint"Du bist tot.. dafuq";};
if(vehicle player != player) exitWith {hint "Please store your vehicle, there will be a garage on the other side";};
//if(life_inv_transporter < 1) exitWith {hint "You need a bus ticket to ride the bus";};

_dest = [_this,0,0,[0]] call BIS_fnc_param;

_question = ["Bist du sicher das du den Bus nehmen willst?","Bus Ride","Yes","No"] call BIS_fnc_guiMessage;

if(_question) then
{
    switch(_dest) do
    {
	    //[false,"transporter",1] call life_fnc_handleInv;
	    case 0: //Kavala
	    {
		    titleText ["Du bist auf der Busfahrt eingeschlafen","BLACK",2];
		    sleep 2;
		    player setPos (getMarkerPos "einwanderung1");
		    _handle = [] spawn life_fnc_busTimer;
		    waitUntil {scriptDone _handle};
		    player setPos (getMarkerPos "busstation_kavala");
		    disableUserInput false;
	        titleText ["Du hast fast den Ausstieg verschlafen","BLACK IN"];
	    };
	    case 1: //Athira
	    {
		    titleText ["Du bist auf der Busfahrt eingeschlafen ","BLACK",2];
		    sleep 2;
		    player setPos (getMarkerPos "einwanderung1");
		    _handle = [] spawn life_fnc_busTimer;
		    waitUntil {scriptDone _handle};
		    player setPos (getMarkerPos "busstation_athira");
		    disableUserInput false;
		    titleText ["Du hast fast den Ausstieg verschlafen","BLACK IN"];
	    };
	    case 2: //Pyrgos
	    {
		    titleText ["Du bist auf der Busfahrt eingeschlafen ","BLACK",2];
		    sleep 2;
		    player setPos (getMarkerPos "einwanderung1");
		    _handle = [] spawn life_fnc_busTimer;
		    waitUntil {scriptDone _handle};
		    player setPos (getMarkerPos "busstation_pyrgos");
		    disableUserInput false;
		    titleText ["Du hast fast den Ausstieg verschlafen","BLACK IN"];
	    };
	    case 3: //Sofia
	    {
		    titleText ["Du bist auf der Busfahrt eingeschlafen ","BLACK",2];
		    sleep 2;
		    player setPos (getMarkerPos "einwanderung1");
		    _handle = [] spawn life_fnc_busTimer;
		    waitUntil {scriptDone _handle};
		    player setPos (getMarkerPos "busstation_sofia");
		    disableUserInput false;
		    titleText ["Du hast fast den Ausstieg verschlafen","BLACK IN"];
	    };
	    case 4: //Airport
	    {
		    titleText ["Du bist auf der Busfahrt eingeschlafen ","BLACK",2];
		    sleep 2;
		    player setPos (getMarkerPos "einwanderung1");
		    _handle = [] spawn life_fnc_busTimer;
		    waitUntil {scriptDone _handle};
		    player setPos (getMarkerPos "busstation_airport");
		    disableUserInput false;
		    titleText ["Du hast fast den Ausstieg verschlafen","BLACK IN"];
	    };
	};
} else {
    hint "Was machst du sonst hier??";
};

true;
