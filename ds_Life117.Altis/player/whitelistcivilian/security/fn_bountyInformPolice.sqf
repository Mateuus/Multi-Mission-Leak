/*
	File: fn_bountyInformPolice.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Informs police when a bounty hunter sends a criminal to a station
*/
private["_hunter","_criminal","_location"];

if((playerside) != west) exitwith {};

systemchat "A Security Contractor is sending a criminal to the Kavala Police HQ for processing, he will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)";
hint "A Bounty Hunter is sending a criminal to the Kavala Police HQ for processing, he will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)";
player say3D "dingDong";
player say3D "dingDong";
titleText ["A Security Contractor is sending a criminal to the Kavala Police HQ for processing, he will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)","PLAIN DOWN"];
