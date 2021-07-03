# FFRK Labyrinth macro keeper

### Introduction

Hi everyone,

**Make sure to read everything before starting.**   

This macro will only run if **FFRK** run in simplified mode, make sure to activate that in game settings.  
This macro doesn't select team, it will only use your 1st one, make sure that this team can handle all fights.   
This macro use image to work, if you have any permanent special settings activated (like forced AA) in your graphic card, this macro may not work, make sure to desactivate them if you do.  

as a reminder, **FFRK AndApp** version only exist for the **Japanese version** of the game.  

##

### Version

**Beta 1**    

This version is a reworked and massively stripped version of my other (old) macro [FFRK macro Keeper](https://github.com/LosBaguettor/ffrkmacrokeeper).  
It only works with Labyrinth.  
**It has no failover nor error handler** (except for the infamous network error 101).  
Contrary to the original one, this own **doesn't do any stamina check** which means it can hang.  
It's very unlikely that i ever update it but feel free to branch and update it if you want.  

##

### What does this macro do ?

- Start a Labyrinth and do it from start to finish.  
- Emit sound when inside a chest room.  
- Emit sound after beating a Laby.  
- If selected, Automatically restart the same Laby.  
- If selected, Automatically select 1 or more Chests.  
- Delay the start of the farm.  

##

### How to use this Macro ? 

**Important note** : image_laby folder include a set of image that should work perfectly if your screen is in 1080p with standard 100% DPI on Windows 10.  
**Important note** : This is a beta, this macro shouldn't be left unattended.  

- Install **AutoHotKey**.  
- Install **FFRK AndApp version**.  
- Configure the **INI file** if needed.  
- Launch **FFRK AndApp version** and select your Labyrinth and team.  
- Launch **ffrk_labyrinth_macro_keeper.ahk** , read the instructions and press F1 to start.  

##

### Configuration

There's 3 categories of settings in the INI file.  
To edit them open **include** folder then edit **ffrk_macro.ini**.  

Format used below is the following :  

[Category]  
Name - effect  

**[baguette]** : Related to Labyrinth.  
- **redolaby** - Set to **1** and the macro will automatically restart the same laby once done (will hang or behave unexpectedly if no enough stamina). Default = 0  
- **rngesuschest** - Set to **1 , 2 or 3** and the macro will automatically open this amount of chest from left to right (should behave properly if no enough keys but untested). Default = 0  

**[and]** : Related to the Macro itself.  
- **ffrkaggro** - Before doing any action, the macro will always re-enforce the focus on FFRK window, highly recommanded. Default = 1  
- **ffrkheight** - Difference between Outside and Inside Window, Default = 39  
- **ffrkwidth** - Difference between Outside and Inside Window. Default = 16  

**[knuckles]** : Extra settings.  
- **delaystart** - Value in msec before the macro really start, ex : 1 800 000 = start 30min after pressing F1. Default = 100  
- **intromessage** - Set to **0** to hide startup message. Default = 1  

##

### Image Calibration

**Step 1**  

If you use an non-standard DPI or not Windows 10, make sure to add the proper ffrkwidth and ffrkheight.  

To get your ffrkwidth and ffrkheight :  
- Launch FFRK AndApp  
- Launch "Window Spy" or "Active Window Info" (it's a tool installed with AutoHotKey)  
- Select FFRK window  
- Look **Active window Position** (ATP) w & h value.  
- ffrkwidth : substract ATP top w value with ATP bottom w value.  
- ffrkheight : substract ATP top h value with ATP bottom h value.  

**Step 2**  

if the macro doesn't do anything after adding the proper ffrkwidth and ffrkheight, you will need to recalibrate every image in this macro.  

- Launch **FFRK AndApp version** and select your Labyrinth and team.  
- Launch **ffrk_labyrinth_macro_keeper.ahk**, press OK then press **F8** to make the FFRK window autoresize.  

Do not change the window size, if you change it by accident, press **F3** -> OK -> **F8** again.  

For **all png files** in image_laby:  

- Go to the appropriate screen, press ALT+PRINTSCREEN.  
- Open corresponding image in image_laby in Paint.  
- Paste in Paint.  
- Crop to the appropriate area.  
- Overwrite the original file.  

##

### Credit

Macro by LosBaguettor  

