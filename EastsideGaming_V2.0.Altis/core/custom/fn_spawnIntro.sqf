if(ESG_Neu) then {
		setviewdistance 5000;
		disableuserInput true;
		1 fadesound 1;
		playsound "intromusik";
		2 cutText ["","BLACK OUT",2];
		sleep 2;
		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1.2' align='center'>Willkommen auf<br/><t font='PuristaBold' color='#c02525'>Eastside-Gaming.de</t><br/><t font='PuristaBold' align='center' size='0.7'>Dein Altis Life Server</t></t>", 0 , 0.5, 10,2, 0,5] spawn bis_fnc_dynamicText;
		_camera1 = "camera" camCreate [-470.684,24649.1,98.1024];
		showCinemaBorder true;
		_camera1 cameraEffect ["internal", "BACK"];
		_camera1 camCommand "inertia on";
		_camera1 camPrepareTarget [115.224,24659.2,-0.283405];
		_camera1 camPrepareFOV 0.3;
		_camera1 camCommitPrepared 0;

		_camera1 camPreparePos [-155.49,24654.3,10.5198];
		_camera1 camPrepareTarget [115.224,24659.2,-0.283405];
		_camera1 camPrepareFOV 0.3;
		_camera1 camCommitPrepared 15;
		sleep 12;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera1;
		sleep 1;


		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1.1' align='left' color='#c02525'>Wir hoffen...<br/><t font='PuristaBold' color='#FFFFFF'>...dass du gut ankommst!</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 7,2, 0,5] spawn bis_fnc_dynamicText;
		_camera2 = "camera" camCreate [15555.2,6202.4,3.43475];
		showCinemaBorder true;
		_camera2 cameraEffect ["internal", "BACK"];
		_camera2 camCommand "inertia on";
		_camera2 camPrepareTarget [14297.5,6199.32,35.8851];
		_camera2 camPrepareFOV 0.7;
		_camera2 camCommitPrepared 0;

		_camera2 camPreparePos [14785.8,6201.37,17.5346];
		_camera2 camPrepareTarget [14297.5,6199.32,35.8851];
		_camera2 camCommitPrepared 12;
		sleep 10;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera2;
		_camera2 cameraEffect ["terminate", "BACK"];
		sleep 1;


		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1' align='left' color='#c02525'>Im Namen des gesamten Serverteams...<br/><t font='PuristaBold' color='#FFFFFF'>...wünschen wir dir einen angenehmen Aufenthalt!</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 6,2, 0,5] spawn bis_fnc_dynamicText;
		_camera3 = "camera" camCreate [1718.26,22525.9,46.3223];
		showCinemaBorder true;
		_camera3 cameraEffect ["internal", "BACK"];
		_camera3 camCommand "inertia on";
		_camera3 camPrepareTarget [1801.36,22462.4,16.5781];
		_camera3 camPrepareFOV 0.3;
		_camera3 camCommitPrepared 0;

		_camera3 camPreparePos [1839.46,22373.2,37.0024];
		_camera3 camPrepareTarget [1996.97,22241.4,41.5284];
		_camera3 camPrepareFOV 0.3;
		_camera3 camCommitPrepared 10;

		_camera3 camPreparePos [2084.47,22022.1,87.5873];
		_camera3 camPrepareTarget [2233.01,22024.6,105.83];
		_camera3 camPrepareFOV 0.3;
		_camera3 camCommitPrepared 10;
		sleep 8;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera3;
		_camera3 cameraEffect ["terminate", "BACK"];
		sleep 1;


		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1' align='left' color='#c02525'>Bitte halte dich ans Regelwerk du findest es unter<br/><t font='PuristaBold' color='#FFFFFF'>www.Eastside-Gaming.de</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 6,2, 0,5] spawn bis_fnc_dynamicText;
		_camera4 = "camera" camCreate [3648.13,13378,75];
		showCinemaBorder true;
		_camera4 cameraEffect ["internal", "BACK"];
		_camera4 camCommand "inertia on";
		_camera4 camPrepareTarget [3647.25,13112.8,0];
		_camera4 camPrepareFOV 0.7;
		_camera4 camCommitPrepared 0;

		_camera4 camPreparePos [3613.3,13027.4,60];
		_camera4 camPrepareTarget [3647.25,13112.8,0];
		_camera4 camPrepareFOV 0.7;
		_camera4 camCommitPrepared 7;
		sleep 8;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera4;
		_camera4 cameraEffect ["terminate", "BACK"];
		sleep 1;


		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1' align='left' color='#c02525'>Rebellen City<br/><t font='PuristaBold' color='#FFFFFF'>Für die bösen Jungs und Mädchen</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 4,1, 0,5] spawn bis_fnc_dynamicText;
		_camera5 = "camera" camCreate [20876.418,6607.087,80];
		showCinemaBorder true;
		_camera5 cameraEffect ["internal", "BACK"];
		_camera5 camCommand "inertia on";
		_camera5 camPrepareTarget [20786.305,6765.907,0];
		_camera5 camPrepareFOV 0.7;
		_camera5 camCommitPrepared 0;

		_camera5 camPreparePos [20948.951,6900.139,70];
		_camera5 camPrepareTarget [20786.305,6765.907,0];
		_camera5 camPrepareFOV 0.7;
		_camera5 camCommitPrepared 7;
		sleep 5;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera5;
		_camera5 cameraEffect ["terminate", "BACK"];
		sleep 1;

		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1' align='left' color='#c02525'>Polizei Hauptquartier Kavala<br/><t font='PuristaBold' color='#FFFFFF'>Das Zuhause der Ordnungshüter</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 4,2, 0,5] spawn bis_fnc_dynamicText;
		_camera6 = "camera" camCreate [3144.277,12796.256,85.856];
		showCinemaBorder true;
		_camera6 cameraEffect ["internal", "BACK"];
		_camera6 camCommand "inertia on";
		_camera6 camPrepareTarget [3254.411,12938.251,4.434];
		_camera6 camPrepareFOV 0.7;
		_camera6 camCommitPrepared 0;

		_camera6 camPreparePos [3409.538,12880.89,71.264];
		_camera6 camPrepareTarget [3254.411,12938.251,4.434];
		_camera6 camPrepareFOV 0.7;
		_camera6 camCommitPrepared 7;
		sleep 6;
		2 cutText ["","BLACK OUT"];
		sleep 1;
		camdestroy _camera6;
		_camera6 cameraEffect ["terminate", "BACK"];
		sleep 1;


		2 cutText ["","BLACK IN",2];
		["<t font='PuristaBold' size='1' align='left' color='#c02525'>Nun ab in das Geschehen...<br/><t font='PuristaBold' color='#FFFFFF'>...viel Spaß dabei!</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 10,2, 0,5] spawn bis_fnc_dynamicText;
		_camera7 = "camera" camCreate [(position player select 0)+(75 - floor(random 200)), (position player select 1)+(75 - floor(random 200)),(position player select 2)+100];
		_camera7 cameraEffect ["internal","back"];
		_camera7 camSetFOV 2.000;
		_camera7 camCommit 0;
		waitUntil {camCommitted _camera7};
		_camera7 camSetTarget vehicle player;
		_camera7 camSetRelPos [0,0,2];
		_camera7 camCommit 3;
		waitUntil {camCommitted _camera7};
		_camera7 cameraEffect ["terminate","back"];
		sleep 2;
		camdestroy _camera7;
		disableuserInput false;
		setviewdistance 1000;
} else {
	playMusic "";
	1 fadesound 1;
	playsound "esg";
	["<t font='PuristaBold' size='1' align='left' color='#c02525'>Herzlich Willkommen auf Eastside-Gaming<br/><t font='PuristaBold' color='#FFFFFF'>Fragen ? Antwort: Z-Inventar >> Infomenü</t></t>", [safezoneX + safezoneW - 2.3,1] , 0.7, 10,2, 0,5] spawn bis_fnc_dynamicText;
	_camera8 = "camera" camCreate [(position player select 0)+(75 - floor(random 200)), (position player select 1)+(75 - floor(random 200)),(position player select 2)+100];
	_camera8 cameraEffect ["internal","back"];
	_camera8 camSetFOV 2.000;
	_camera8 camCommit 0;
	waitUntil {camCommitted _camera8};
	_camera8 camSetTarget vehicle player;
	_camera8 camSetRelPos [0,0,2];
	_camera8 camCommit 3;
	waitUntil {camCommitted _camera8};
	_camera8 cameraEffect ["terminate","back"];
	sleep 2;
	camdestroy _camera8;
};