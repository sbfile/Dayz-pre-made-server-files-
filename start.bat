@echo off
:start
::Server name
set serverName=shez offline
::Server files location
set serverLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::BEC location
set BECLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer\BEC"
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Logical CPU cores to use (Equal or less than available)
set serverCPU=2
::Sets title for terminal (DONT edit)
title %serverName% batch

::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% "-profiles=config" "-mod=@AdvancedBanking;@AdvancedBankingTraderAddin;@AmmunitionExpansion;@Banking;@BaseBuildingPlus;@Better Ammo Stacking;@BetterSmalleritems_2.0;@BetterVendingMachines_Expansion;@BITCOIN MINING FARM CLIENT;@Blackouts Custom Cannabis;@Blackout's Expansive DayZ Overhaul;@BodyBags;@Breachingcharge;@BulletStacksPlusPlusEnhanced;@CannabisPlus;@Care Packages V2;@CF;@Code Lock;@Community-Online-Tools;@Crocos Quadbike;@Dabs Framework;@DayZ Epoch UI;@DayZ-Expansion;@DayZ-Expansion-AI;@DayZ-Expansion-Animations;@DayZ-Expansion-BaseBuilding;@DayZ-Expansion-Book;@DayZ-Expansion-Chat;@DayZ-Expansion-Core;@DayZ-Expansion-Groups;@DayZ-Expansion-Hardline;@DayZ-Expansion-Licensed;@DayZ-Expansion-Map-Assets;@DayZ-Expansion-Market;@DayZ-Expansion-Missions;@DayZ-Expansion-Name-Tags;@DayZ-Expansion-Navigation;@DayZ-Expansion-Personal-Storage;@DayZ-Expansion-Quests;@DayZ-Expansion-Spawn-Selection;@DayZ-Expansion-Vehicles;@DayZ-Expansion-Weapons;@DNA Keycards;@Drone Grenade MMG Base Storage Fix;@DroneBatteryOverride;@Drones;@GCassettes;@Harks Custom Inventory UI;@Hunter Mega Pack;@KOTH;@MMG - Mightys Military Gear;@Mortys Weapons;@MuchStuffPack;@Notifications;@PristineRepair;@Radio;@RedFalcon Flight System Heliz;@RedFalcon Flight System Heliz - Core;@SNAFU Weapons;@Stack bullets to 1000;@Stacking_BaseBuilding_Items;@Steady Scope V2;@Towing Service;@Trader;@TraderPlus;@TruckFixV2;@Ultimate MedicalStacking;@Unlimited Stamina;@VanillaPlusPlusMap;@VanillaRoadPartsPack;@Vehicle3PP;@VPPAdminTools;@VPPNotifications" -port=%serverPort% -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
::Time in seconds before starting BEC
timeout 25
cd /d "%BECLocation%"
start "" "bec.exe"
::Time in seconds before kill server and BEC process (14400 = 4 hours)
timeout 14390
taskkill /im DayZServer_x64.exe /F
taskkill /im bec.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start