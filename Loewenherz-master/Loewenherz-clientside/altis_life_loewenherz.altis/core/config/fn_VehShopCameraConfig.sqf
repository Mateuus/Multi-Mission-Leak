/*
	File: fn_VehShopCameraConfig.sqf
	Author: Barney

	Description:
	Camera Config

	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_vehicle","_camerapos","_cameratarget","_camera","_ret"];
_vehicle = param [0,"",[""]];
if(_vehicle == "") exitWith {closeDialog 0;};



switch (_vehicle) do
{
	//case "B_MRAP_01_F": //Hunter
	//{
	//	_camerapos = [20,6,3];
	//	_cameratarget = [5,1,1];
	//};

	case "B_MRAP_01_hmg_F": //Hunter HMG
	{
		_camera = [19,6,3];
		_cameratarget = [5,1,1];
	};

	case "C_Heli_Light_01_civil_F": //M-900
	{
		_camera = [14,25,3];
		_cameratarget = [1,2,1];
	};

	case "B_Heli_Light_01_F": // Little Bird
	{
		_camera = [14,20,3];
		_cameratarget = [1,2,1];
	};

	case "O_Heli_Light_02_unarmed_F": //orca
	{
		_camera = [14,20,1];
		_cameratarget = [1,2,1];
	};

	case "O_Heli_Transport_04_F":  //Taru
	{
		_camera = [14,20,1];
		_cameratarget = [1,2,0];
	};

	case "B_Heli_Transport_01_F":  // Ghost hawk police
	{
		_camera = [19,20,1];
		_cameratarget = [1,2,0];
	};

	case "I_Heli_light_03_unarmed_F": // Hellcat
	{
		_camera = [20,19,1];
		_cameratarget = [1,2,0];
	};

	case "B_Heli_Transport_01_camo_F": //GH REBELLEN
	{
		_camera = [20,19,1];
		_cameratarget = [1,2,0];
	};

	case "I_Heli_Transport_02_F": //Mohawk
	{
		_camera = [20,22,1];
		_cameratarget = [1,2,0];
	};

	case "I_Truck_02_transport_F": //Zamak open
	{
		_camera = [20,14,1];
		_cameratarget = [1,1,0];
	};

	case "I_Truck_02_covered_F": //Zamak abgedeckt
	{
		_camera = [20,10,1];
		_cameratarget = [2,1,0];
	};

	case "B_Truck_01_transport_F": //hemtt offen
	{
		_camera = [20,14,1];
		_cameratarget = [1,1,0];
	};

	case "O_Truck_03_transport_F": //Tempest Transporter offen
	{
		_camera = [20,14,1];
		_cameratarget = [3,1,0];
	};

	case "O_Truck_03_covered_F": //Tempest Transporter geschlossen
	{
		_camera = [20,14,1];
		_cameratarget = [2,1,0];
	};

	case "O_Truck_03_device_F": //Tempest Gerät
	{
		_camera = [20,14,1];
		_cameratarget = [2,1,0];
	};

	case "I_Truck_02_ammo_F": //Zamak Munition Meth labor
	{
		_camera = [20,14,1];
		_cameratarget = [2,1,0];
	};

	default
	{
		_camera = [15,5,3];
		_cameratarget = [5,1,1];

	};
};

_ret = [_camera,_cameratarget];


_ret;


