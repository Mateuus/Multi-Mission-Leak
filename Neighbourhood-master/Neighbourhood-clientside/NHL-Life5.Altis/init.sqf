enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Neighbourhood-Life 1.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};

enableRadio false; //disable radio messages to be heard and shown in the left lower corner of the screen 
0 fadeRadio 0; //mute in-game radio commands 
player setVariable ["BIS_noCoreConversations", true]; //disable greeting menu
if(!isDedicated) then 

{

	waitUntil {Alive player};



	playableUnitOccupier_PV = player; publicVariableServer "playableUnitOccupier_PV";

	

	player addEventHandler ["Respawn", {

		playableUnitOccupier_PV = _this select 0; publicVariableServer "playableUnitOccupier_PV";

	}];

};


//ALRIGHT SO LETS SAVE SOME FPS
//Performance
setTerrainGrid 50;
setViewDistance 1200;
setObjectViewDistance [800,50];
