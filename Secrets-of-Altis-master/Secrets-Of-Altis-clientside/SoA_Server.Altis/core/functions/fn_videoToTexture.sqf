/*
		fn_videoToTexture.sqf
		Author: G00golplexian
		
		Description: Sets Video on global texture.
*/

private["_pos","_obj","_scr","_videofile"];

_pos = _this select 0;
_videofile = _this select 1;
_obj = _this select 2;
with uiNamespace do 
{
	_obj setObjectTextureGlobal [_pos,_videofile]; 
	1100 cutRsc ["RscMissionScreen","PLAIN"];
	_scr = BIS_RscMissionScreen displayCtrl 1100;
	_scr ctrlSetPosition [-10,-10,0,0];
	_scr ctrlSetText _videofile;
	_scr ctrlAddEventHandler ["VideoStopped",{(uiNamespace getVariable "BIS_RscMissionScreen");}];
	_scr ctrlCommit 0;
};