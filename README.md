# mms-bounty 

- Bounty System for VorpCore

# Features
 
- Bounty System With Feather Menu
- You can change the Rewards for Bountys
- You can Change Language in Config
- You can change the Time when a New Bounty should be Created After x Min
- you can Cahnge max Bountys that are Shown
- you can add more Bountys in Config
- by Default 10 Locations Pre Configured
- Heist System Added you can now rob stores or banks or whatever you wanna rob
- Can be configured in Config

# Changelog

- Initial Release Version 1.1.2
- 1.1.3
- Added Blips for Enemys
- Fixed Bug with Middle Bountys 
- 1.1.4
- Added Heist System you can now Rob Saves with the lockpickitem
- 1.1.5 
- Changed Lockpick Settings to random (Not Always the Same MiniGame)
- You now can Configure if Items will be in the Tresor Too 
- You now can Configure if heist missions should be shown or not
- Sheriffs can now Add Coustom Missions to Board to Get Bounty on Players 
- Need to Run The mms_sheriffbounty.sql  
- New Depency ox_lib
- 1.1.6
- Config.HeistNpcs = true  --- true / false If NPC Police is Spawning or Not
- Config.HeistAlerts = true  --- true / false Alert sheriff is heist is active  Jobs Defined in Config.Jobs
- Added Alerts if heist ist active 
- Added Blip if Heist is active
- 1.1.7
- Added Diffrent Blips for heist Sheriff Alert and Bounty
- Changed Blip Size to Find Mission Area Easier on Map.
- Added Config to Enable or Disable Prints in Server Console
- 1.1.8
- Fixed Spawn Enemy Bug
- Added More Enemys to Make it Harder now its more Fun
- 1.1.9
- Added RandomGuns to Enemys or you can give them 1 Specific Gun ( Special Thanks to Jannings for Help me)
- Added Translation deafault = de_lang (Credits:Translation system from bcc used Copyd shared/locales.lua)
- 1.2.0 
- Fixed Database Bug Thanks for Reporting
- 1.2.1
- Fixed Translation Bug thanks for Reporting
- 1.2.2
- Added Gps Route to Easy Find Location
- 1.2.3 
- Added Distance the Bounty will Abort at if you run too far away
- 1.2.4 
- Added Sheriff Missions 
- Added Feature to Add Sheriff Mission Rewards to the Databse of your Society. ( Beta Testing ) Can be Disabled to False
- Seperated Heist Board and Bounty Board
- 1.2.5
- Added Cooldown for Heists
- Added Progressbar in Lockpick
- Fixed Lockpick Randomizer
- If you Run Aways you dont Get Reward now It was too Easy if you Always Run Away.
- 1.2.6
- Abort Bounty Timer If you abourt a Bounty you need to Wait now till the TImer is Over. ( SPAM PROTECTION )
- Fixed Blinking Tresor Bug for Some PPL.
- Added Security Webhooks you see if someone Gets Reward
- 1.2.7 
- Added Battlepass Support for MMS-Battlepass
- 1.2.9 Added Group Support
- Added Group Rewards
- Added Webhook for Group
- 1.3.0 Small Bug Fix
- Added Config.Debug Turn Off on Live Servers.

# installation 

- Run the SQL files to add Tables in your DB
- To Change Language just copy Everything from installation/enlang and Replace the -de lang in Config


# Required
- Vorp_Core 
- Feather Menu by BCC https://github.com/FeatherFramework/feather-menu/releases/latest
- bcc-utils
- bcc-minigames
- ox-lib

# CREDITS
- Vorp_Outlaws ( For Ped Creations )
- Discord markusmueller 
- https://github.com/RetryR1v2 