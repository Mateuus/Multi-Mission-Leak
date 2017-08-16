disableSerialization;
_resource = uiNameSpace getVariable ["RscANLoadingScreen", displayNull];
if (!isNull _resource) then
{
	(_resource displayCtrl 20002) ctrlSetText (_this select 0);
};
true
