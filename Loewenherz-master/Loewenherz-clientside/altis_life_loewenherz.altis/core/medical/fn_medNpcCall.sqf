/*
	Description:
	Ruft einen Medic zu einem Krankenhaus

	Author: O. Jemineh (Teebaron)
*/
private["_object","_distance","_rnd","_sound","_time","_msg_cooldown","_receiver"];


//Sound auswählen
_rnd = floor random 2;
_sound = "med_dcall_1";

switch (_rnd) do
{
    case 0:
    {
        _sound = "med_dcall_1";
    };
    case 1:
    {
        _sound = "med_dcall_2";
    };
};

// --------------------------------------------------------------------------------
// Ausrufen
// --------------------------------------------------------------------------------
_time = round time;
if(isNil "medNpcCallLastTime") then {medNpcCallLastTime = 0};

if (_time < medNpcCallLastTime) then
{
    hint "Ich habe bereits einen Arzt für Sie gerufen.\nBitte warten Sie, bis ein Arzt Sie aufruft ...";
}
else
{
    medNpcCallLastTime = _time + 600;
    hint "Einen kleinen Moment, ich\nrufe einen Arzt für Sie ...";
    sleep 2;
	//Msg an die Medics
    [["MedicalRequestEmerg",[format["'%1' benötigt eine Behandlung im Krankenhaus Kavala!",name player]]],"BIS_fnc_showNotification",independent,nil,false] call lhm_fnc_mp;
	//Sound
	[[player,_sound],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
    sleep 5;
    [[player,_sound],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
    hint "Bitte gehen Sie links in den\nWartebereich. Ein Arzt wird\nsich dann um Sie kümmern.";
}

