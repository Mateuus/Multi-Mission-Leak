if (isNil "ANMeme") exitWith {};

INTRO_CAM cameraEffect ["terminate","back"];
camDestroy INTRO_CAM;
deleteVehicle ANMeme;
closeDialog 0;

tf_no_auto_long_range_radio = true;
TF_terrain_interception_coefficient = 1;
enableRadio false;
enableSentences false;
player disableConversation true;
player setVariable ["tf_sendingDistanceMultiplicator", 10];

private _randomPos = ["drop_1","drop_2","drop_3","drop_4","drop_5","drop_6","drop_7"];
player allowdamage false;
showHUD false;
showChat false;
cutText ["","BLACK FADED", 1];
0 cutFadeOut 9999999;
[
	"<t size='1' color='#FCC362' align='center'>ArmA.Network</t><br/><t size='0.8' color='#FCC362' align='center'>Presents</t>",
	[safezoneX + safezoneW - 1.7,1], //DEFAULT: 0.5,0.35
	[safezoneY + safezoneH - 1,0.7], //DEFAULT: 0.8,0.7
	3,
	0.5,
	0,
	2
] spawn BIS_fnc_dynamicText;
//[[["ArmA.Network presents","align = 'center' shadow = '1' size = '1.0'"],["","<br/>"],["Tanoa Life","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],["","<br/>"],["Chapter 1: A New Start","align = 'center' shadow = '1' font='PuristaBold' size = '0.7'","#ff1000"]]] spawn BIS_fnc_typeText2;
sleep 3;
[
	"<t size='0.9' color='#FCC362' align='center'>Tanoa Life</t>",
	[safezoneX + safezoneW - 1.7,1], //DEFAULT: 0.5,0.35
	[safezoneY + safezoneH - 1,0.7], //DEFAULT: 0.8,0.7
	5,
	0.5,
	0,
	2
] spawn BIS_fnc_dynamicText;
player switchCamera "External";
player addBackpack "B_Parachute";
private _markerSelect = selectRandom _randomPos;
playSound "plane";
sleep 5;
player setPos [(markerPos _markerSelect select 0),(markerPos _markerSelect select 1),3000];
sleep 0.5;
setViewDistance 8000;
cutText ["","BLACK IN", 1];
sleep 40;
player action ["OpenParachute", player];
WaitUntil{isTouchingGround player};
player allowdamage true;
showHUD true;
showChat true;
life_newPlayer = false;
[8] call life_fnc_maphuwres;
[0] call life_fnc_cruswutaq;
[true] call life_fnc_notificationInit;
setViewDistance 1250;
if(UpdateThread isEqualTo -1) then
{
	UpdateThread = [300,life_fnc_kecedretr,[],true] call life_fnc_phefakefe;
};

if(FullThread isEqualTo -1) then
{
	FullThread = [1,life_fnc_phoaroefroegoe,[],true] call life_fnc_phefakefe;
};

if(MedicThread isEqualTo -1) then
{
	MedicThread = [1,life_fnc_houklamoustiup,[],true] call life_fnc_phefakefe;
};

if(PayCheckThread isEqualTo -1) then
{
	PayCheckThread = [300,life_fnc_hazephap,[],true] call life_fnc_phefakefe;
};
