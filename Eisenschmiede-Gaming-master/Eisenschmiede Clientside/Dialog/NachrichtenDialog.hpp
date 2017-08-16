class ES_NachrichtenDialog
{
	idd = 1337;
	name = "ES_NachrichtenDialog";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn ES_fnc_NachrichtenDialog";
	onUnLoad = "_display = _this select 0; (_display displayCtrl 1212) ctrlSetFade 1; (_display displayCtrl 1313) ctrlSetFade 1; (_display displayCtrl 1414) ctrlSetFade 1; (_display displayCtrl 1212) ctrlCommit 0.5; (_display displayCtrl 1313) ctrlCommit 0.5; (_display displayCtrl 1414) ctrlCommit 0.5;";

	class controlsBackground
	{
		class NachrichtenText: ES_RscHTML
		{
			idc = 1338;
			x = -0.175;
			y = 0.44;
			w = 1.3375;
			h = 0.4;
		};
	};

	class Controls
	{
	};
};
