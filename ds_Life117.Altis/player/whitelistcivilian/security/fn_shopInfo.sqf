/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Job money info for security guards
*/
private["_closedShops","_telHosp","_sopHosp","_gasKav","_gasAgi","_gasZar","_gasLak","_gasAth","_gasGra","_gasPyr","_gasCha","_gasPar","_gasSof","_telHospRobbed","_sopHospRobbed","_1Robbed","_2Robbed","_3Robbed","_4Robbed","_5Robbed","_6Robbed","_7Robbed","_8Robbed","_9Robbed","_10Robbed"];

if((DS_infoArray select 19) < 6)exitwith{};
_closedShops = "Closed Shops<br/>";
if(gasdesk1 getVariable ["closed",false])then{_closedShops = _closedShops + "Kore Gas<br/>";};
if(gasdesk2 getVariable ["closed",false])then{_closedShops = _closedShops + "Lakka Gas<br/>";};
if(gasdesk3 getVariable ["closed",false])then{_closedShops = _closedShops + "Zaros Gas<br/>";};
if(gasdesk4 getVariable ["closed",false])then{_closedShops = _closedShops + "Neochori Gas<br/>";};
if(gasdesk5 getVariable ["closed",false])then{_closedShops = _closedShops + "Athira Gas<br/>";};
if(gasdesk6 getVariable ["closed",false])then{_closedShops = _closedShops + "Gravia Gas<br/>";};
if(gasdesk7 getVariable ["closed",false])then{_closedShops = _closedShops + "Pyrgos Gas<br/>";};
if(gasdesk8 getVariable ["closed",false])then{_closedShops = _closedShops + "Chalkia Gas<br/>";};
if(gasdesk9 getVariable ["closed",false])then{_closedShops = _closedShops + "Paros Gas<br/>";};
if(gasdesk10 getVariable ["closed",false])then{_closedShops = _closedShops + "Sofia Gas<br/>";};
if(hosp1 getVariable ["closed",false])then{_closedShops = _closedShops + "Telos Hospital<br/>";};
if(hosp2 getVariable ["closed",false])then{_closedShops = _closedShops + "Sofia Hospital<br/>";};

_telHosp = round(((gasMoneyArray select 12)/20000)*100);
_sopHosp = round(((gasMoneyArray select 13)/20000)*100);
_gasKav = round(((gasMoneyArray select 1)/20000)*100);
_gasAgi = round(((gasMoneyArray select 2)/20000)*100);
_gasZar = round(((gasMoneyArray select 3)/20000)*100);
_gasLak = round(((gasMoneyArray select 4)/20000)*100);
_gasAth = round(((gasMoneyArray select 5)/20000)*100);
_gasGra = round(((gasMoneyArray select 6)/20000)*100);
_gasPyr = round(((gasMoneyArray select 7)/20000)*100);
_gasCha = round(((gasMoneyArray select 8)/20000)*100);
_gasPar = round(((gasMoneyArray select 9)/20000)*100);
_gasSof = round(((gasMoneyArray select 10)/20000)*100);
if((DS_securityArray select 12) == 1)then{_telHospRobbed = "Recently Robbed"}else{_telHospRobbed = ""};
if((DS_securityArray select 13) == 1)then{_sopHospRobbed = "Recently Robbed"}else{_sopHospRobbed = ""};
if((DS_securityArray select 1) == 1)then{_1Robbed = "Recently Robbed"}else{_1Robbed = ""};
if((DS_securityArray select 2) == 1)then{_2Robbed = "Recently Robbed"}else{_2Robbed = ""};
if((DS_securityArray select 3) == 1)then{_3Robbed = "Recently Robbed"}else{_3Robbed = ""};
if((DS_securityArray select 4) == 1)then{_4Robbed = "Recently Robbed"}else{_4Robbed = ""};
if((DS_securityArray select 5) == 1)then{_5Robbed = "Recently Robbed"}else{_5Robbed = ""};
if((DS_securityArray select 6) == 1)then{_6Robbed = "Recently Robbed"}else{_6Robbed = ""};
if((DS_securityArray select 7) == 1)then{_7Robbed = "Recently Robbed"}else{_7Robbed = ""};
if((DS_securityArray select 8) == 1)then{_8Robbed = "Recently Robbed"}else{_8Robbed = ""};
if((DS_securityArray select 9) == 1)then{_9Robbed = "Recently Robbed"}else{_9Robbed = ""};
if((DS_securityArray select 10) == 1)then{_10Robbed = "Recently Robbed"}else{_10Robbed = ""};

_str = parseText format ["<t color='#4CCF00' size='1.5'>Shop Funds Information</t><br/><br/>
<t color='#FFFFF'>Bank bags of money: %2</t><br/><br/>
<t color='#FFFFF'>Telos Hospital: %3%1 | %15</t><br/>
<t color='#FFFFF'>Sofia Hospital: %4%1 | %16</t><br/><br/>
<t color='#FFFFF'>Kore Gas: %5%1 | %17</t><br/>
<t color='#FFFFF'>Lakka Gas: %6%1 | %18</t><br/>
<t color='#FFFFF'>Zaros Gas: %7%1 | %19</t><br/>
<t color='#FFFFF'>Neochori Gas: %8%1 | %20</t><br/>
<t color='#FFFFF'>Athira Gas: %9%1 | %21</t><br/>
<t color='#FFFFF'>Gravia Gas: %10%1 | %22</t><br/>
<t color='#FFFFF'>Pyrgos Gas: %11%1 | %23</t><br/>
<t color='#FFFFF'>Chalkia Gas: %12%1 | %24</t><br/>
<t color='#FFFFF'>Paros Gas: %13%1 | %25</t><br/>
<t color='#FFFFF'>Sofia Gas: %14%1 | %26</t><br/><br/>
%27
"
,"%"
,(gasMoneyArray select 14)
,_telHosp
,_sopHosp
,_gasKav
,_gasAgi
,_gasZar
,_gasLak
,_gasAth
,_gasGra
,_gasPyr
,_gasCha
,_gasPar
,_gasSof
,_telHospRobbed
,_sopHospRobbed
,_1Robbed
,_2Robbed
,_3Robbed
,_4Robbed
,_5Robbed
,_6Robbed
,_7Robbed
,_8Robbed
,_9Robbed
,_10Robbed
,_closedShops
];

hint _str;






































