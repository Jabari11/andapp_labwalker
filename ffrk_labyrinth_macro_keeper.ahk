#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance Force
#WinActivateForce
SetTitleMatchMode 2
SetControlDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetWinDelay 0
SetBatchLines -1
CoordMode, Pixel, relative

global redolaby
global rngesuschest
global ffrkaggro
global ffrkheight
global ffrkwidth
global delaystart
global iniurl := A_ScriptDir  "\include\ffrk_macro.ini"
global logurl := A_ScriptDir  "\log\" A_YYYY "_" A_MM "_" A_DD ".txt"
global emptyloop = 0
global intromessage
global debugfinalboss
global SLP3


IniRead, redolaby, %iniurl%, baguette, redolaby , 0
IniRead, rngesuschest, %iniurl%, baguette, rngesuschest , 0
IniRead, ffrkaggro, %iniurl%, and, ffrkaggro , 1
IniRead, SLP3, %iniurl%, and, seekspeed , 300
IniRead, ffrkheight, %iniurl%, and, ffrkheight , 39
IniRead, ffrkwidth, %iniurl%, and, ffrkwidth , 16
IniRead, delaystart, %iniurl%, knuckles, delaystart , 100
IniRead, intromessage, %iniurl%, knuckles, intromessage , 1
IniRead, debugfinalboss, %iniurl%, knuckles, debugfinalboss , 0

global ffrk_window_height := 498 + ffrkheight
global ffrk_window_width := 280 + ffrkwidth
global ffrk_clic_width := ffrkwidth / 2
global ffrk_clic_height := ffrkheight - ffrk_clic_width
global imagevar = 80
global SLP1 = 100
global SLP2 = 10
global failoverreset = 2000
global failovermodulo = 100
global Chest_alert := A_WinDir	"\Media\Alarm07.wav"
global FinalBoss_alert := A_WinDir	"\Media\Ring05.wav"
global Calibration := A_WinDir	"\Media\tada.wav"


If (intromessage = 1)
	{
	MsgBox, 48,FFRK Labyrinth Macro Keeper Beta 2 by LosBaguettor, Hello`nTo properly use this macro,`nPlease check the README !`n`nPress F1 to START the macro`nPress F2 to CLOSE the macro`nPress F3 to RELOAD the macro`n`nPress OK to continue`n`nHave fun farming !!
	}

F2::ExitApp

F3::Reload

F8::
FFRK_state(1)
SoundPlay, %Calibration%, 1
Pause

F1::
FileAppend , Macro started at %A_Hour%h %A_Min%min`n , %logurl%
FileAppend , Script will start in %delaystart%msec`n , %logurl%
Sleep, delaystart
Loop
	{
FFRK_farming_process:

	FFRK_grey()

	FFRK_state(1)
	
	FFRKblue := FFRK_ConfirmImage("check_blue",imagevar,0)  
	FFRKpurple := FFRK_ConfirmImage("check_purple",imagevar,0) 
	;msgbox %FFRKblue% %FFRKpurple%
	If ( FFRKblue = 0 or FFRKpurple = 0)
		{
		p0 := FFRK_ConfirmImage("p0",imagevar,3) ; test priorité
		If ( p0 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_chest
			}
				
		p1 := FFRK_ConfirmImage("p1",imagevar,3)
		If ( p1 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_fight
			}
		
		p2 := FFRK_ConfirmImage("p2",imagevar,3)
		If ( p2 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_corridor
			}

		p3 := FFRK_ConfirmImage("p3",imagevar,3) ; double test sur orange
		If ( p3 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_fight
			}

		p4 := FFRK_ConfirmImage("p4",imagevar,3) ; "      "    "   "
		If ( p4 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_fight
			}

		p5 := FFRK_ConfirmImage("p5",imagevar,3)
		If ( p5 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_fight
			}

		p6 := FFRK_ConfirmImage("p6",imagevar,3)
		If ( p6 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_buff
			}

		p7 := FFRK_ConfirmImage("p7",imagevar,3)
		If ( p7 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_heal
			}

		p8 := FFRK_ConfirmImage("p8",imagevar,3)
		If ( p8 = 0 ) 
			{
			Sleep, %SLP3%
			goto, FFRK_fight
			}


		If ( debugfinalboss = 1)
			{
			p9 := FFRK_ConfirmImage("p9",imagevar,0)
			If ( p9 = 0)
				{
				Loop,
					{
					SoundPlay, %FinalBoss_alert%, 1
					Sleep, %SLP3%
					}
				}
			}
		Else
			{
			p9 := FFRK_ConfirmImage("p9",imagevar,3)
			If ( p9 = 0 ) 
				{
				Sleep, %SLP3%
				goto, FFRK_fight
				}
			}
		goto, FFRK_farming_process
		}
	
	FFRK_chest:
	FFRKchest := FFRK_ConfirmImage("treasure_wait",imagevar,0)  	
	;msgbox %FFRKchest%
	if (FFRKchest = 0)
		{
		if (rngesuschest >= 1)
			{
			Loop, 10
				{
				Sleep 100
				varleft := FFRK_ConfirmImage("chest_rngesus_left",imagevar,1)
				if (rngesuschest >= 2 and varleft != 0)
					{
					Sleep 100
					varmid := FFRK_ConfirmImage("chest_rngesus_mid",imagevar,1)	
					if (rngesuschest >= 3 and varmid != 0)
						{
						Sleep 100						
						varright := FFRK_ConfirmImage("chest_rngesus_right",imagevar,1)							
						}
					}
				Sleep 100
				varconfirm := FFRK_ConfirmImage("chest_rngesus_confirm",imagevar,1)		
				if (varconfirm = 0)
					{
					FileAppend , Auto opening chest`n , %logurl%
					}
				Sleep 100
				varkey := FFRK_ConfirmImage("chest_keycheck",imagevar,1)
				varnokey := FFRK_ConfirmImage("chest_keycheck_nokey",imagevar,0)
				if (varkey != 0 and varnokey = 0)
					{
					FFRK_ConfirmImage("chest_keycheck_nokey",imagevar,1)
					}
				}
			FFRK_ConfirmImage("corridor_confirmreward",imagevar,1)		
			}			
		else
			{
			Loop, 3
				{
				SoundPlay, %Chest_alert%, 1
				Sleep 2000
				}
			}
		goto, FFRK_farming_process
		}

	FFRK_corridor:
	FFRK_ConfirmImage("corridor_confirmreward",imagevar,1)	
	FFRK_ConfirmImage("corridor_door_yes",imagevar,1)	

	FFRK_heal:
	FFRK_ConfirmImage("heal_confirm",imagevar,1)	

	FFRK_buff:
	FFRK_ConfirmImage("buff_confirm",imagevar,1)	
	FFRK_ConfirmImage("buff_enter",imagevar,1)	

	FFRK_fight:
	FFRK_ConfirmImage("fight_skip",imagevar,1)	
	FFRK_ConfirmImage("fight_confirmend",imagevar,1)	
	FFRK_ConfirmImage("fight_quickgo",imagevar,1)	
	FFRK_ConfirmImage("fight_go",imagevar,1)	
	FFRK_ConfirmImage("fight_enter",imagevar,1)
	FFRK_ConfirmImage("core_ok_dungeon",imagevar,1)
	FFRK_ConfirmImage("core_ok_stamina",imagevar,1)
	FFRK_ConfirmImage("core_selectteam",imagevar,1)
	
	missionclear := FFRK_ConfirmImage("core_missioncleared",imagevar,0)
	If (missionclear = 0)
		{
		FFRK_ConfirmImage("core_missionconfirm",imagevar,1)
		FFRK_ConfirmImage("core_dungeonreward",imagevar,1)
		FFRK_ConfirmImage("core_dungeonreward2",imagevar,1)
		goto, FFRK_farming_process
		}
	dungeonend := FFRK_ConfirmImage("core_dungeonend",imagevar,0)	
	dungeonend2 := FFRK_ConfirmImage("core_dungeonend2",imagevar,0)	
	;msgbox %dungeonend% %dungeonend2%
	If (dungeonend = 0 or dungeonend2 = 0)
		{
		FFRK_ConfirmImage("core_missionconfirm",imagevar,1)
		FFRK_ConfirmImage("core_dungeonreward",imagevar,1)
		FFRK_ConfirmImage("core_dungeonreward2",imagevar,1)
		SoundPlay, %FinalBoss_alert%, 1
		goto, FFRK_farming_process
		}	

	FFRK_endboss:
	If (redolaby = 1)
		{
		FFRK_ConfirmImage("core_enterlaby",imagevar,1)
		goto, FFRK_farming_process
		}
	
	}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Vérif si présence de l'erreur 101 (saloperie) et la ferme
FFRK_grey()
	{
	If WinExist("ahk_class #32770")
		{
		WinActivate, ahk_class #32770
		Sleep, 300
		MouseMove, 82, 128 , 5
		Sleep, 200
		Click, 82, 128 Left, 1
		Sleep, 100
		}
	}


; Vérif le focus pour FFRK AndApp
FFRK_state(aggro)
	{
	IfWinNotExist FINAL FANTASY Record Keeper ahk_class KickmotorMain
		{
		Sleep, %SLP1%
		Return 0
		}
	else
		{
		If ( aggro = 1)
			{
			WinActivate
			WinMove, FINAL FANTASY Record Keeper ,,,,%ffrk_window_width%,%ffrk_window_height%
			}
		Sleep, %SLP1%
		Return 1
		}
	}


; Clic toggle fois
FFRK_click(X,Y,toggle)
	{
	MouseMove, X, Y, 5
	Loop, %toggle%
		{
		Sleep, 100
		Click, X ,Y Down Left
		Sleep, 200
		Click, X ,Y Up Left
		}
	Sleep 1500
	}


; Confirme une image et clic toggle fois
FFRK_ConfirmImage(image,imagevar,toggle)
	{
	FFRK_state(ffrkaggro)
	Loop, 3
		{
		imageurl := A_ScriptDir "\image_laby\" image ".png"
		imagevarb := "*" imagevar
		ImageSearch, X, Y, 0, 0, %ffrk_window_width%, %ffrk_window_height%, %imagevarb% %imageurl%
		if ( ErrorLevel = 0 and toggle != 0)
			{
			FFRK_click(X,Y,toggle)
			}
			Return ErrorLevel
		Sleep %SLP2%
		}
	Return ErrorLevel
	}
