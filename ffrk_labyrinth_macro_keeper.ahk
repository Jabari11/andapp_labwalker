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

IniRead, redolaby, %iniurl%, baguette, redolaby , 0
IniRead, rngesuschest, %iniurl%, baguette, rngesuschest , 0
IniRead, ffrkaggro, %iniurl%, and, ffrkaggro , 1
IniRead, ffrkheight, %iniurl%, and, ffrkheight , 39
IniRead, ffrkwidth, %iniurl%, and, ffrkwidth , 16
IniRead, delaystart, %iniurl%, knuckles, delaystart , 100
IniRead, intromessage, %iniurl%, knuckles, intromessage , 1

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

If (intromessage = 1)
	{
	MsgBox, 48,FFRK Labyrinth Macro Keeper Beta 1 by LosBaguettor, Hello`nTo properly use this macro,`nPlease check the README !`n`nPress F1 to START the macro`nPress F2 to CLOSE the macro`nPress F3 to RELOAD the macro`n`nPress OK to continue`n`nHave fun farming !!
	}

F2::ExitApp

F3::Reload

F8::
FFRK_state(1)
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
	If ( FFRKblue = 0 or FFRKpurple = 0)
		{
		p0 := FFRK_ConfirmImage("p0",imagevar,2) ; test priorité
		p1 := FFRK_ConfirmImage("p1",imagevar,2)
		p2 := FFRK_ConfirmImage("p2",imagevar,2)
		p3 := FFRK_ConfirmImage("p3",imagevar,2)
		p4 := FFRK_ConfirmImage("p4",imagevar,2)
		p5 := FFRK_ConfirmImage("p5",imagevar,2)
		p6 := FFRK_ConfirmImage("p6",imagevar,2)
		p7 := FFRK_ConfirmImage("p7",imagevar,2)
		p8 := FFRK_ConfirmImage("p8",imagevar,2)
		p9 := FFRK_ConfirmImage("p9",imagevar,2)
		;msgbox 	%FFRKblue% %FFRKpurple% %p0% %p1% %p2% %p3% %p4% %p5% %p6% %p7% %p8% %p9% 
		}
	If (p2 = 0 or p4 = 0 or p5 = 0) 
		{
		Sleep 5000
		FFRK_ConfirmImage("fight_enter",imagevar,1)
		}
	
	FFRKchest := FFRK_ConfirmImage("treasure_wait",imagevar,0)  	
	if (FFRKchest = 0)
		{
		if (rngesuschest = 1)
			{
			Loop, 10
				{
				Sleep 100
				varleft := FFRK_ConfirmImage("chest_rngesus_left",imagevar,1)
				Sleep 100
				varconfirm := FFRK_ConfirmImage("chest_rngesus_confirm",imagevar,1)		
				if (varconfirm = 0)
					{
					FileAppend , Auto opening chest`n , %logurl%
					}
				;msgbox %varleft% %varmid% %varright% %varconfirm% %varkey1%
				}
			}
		else if (rngesuschest = 2)
			{
			Loop, 10
				{
				Sleep 100
				varleft := FFRK_ConfirmImage("chest_rngesus_left",imagevar,1)
				Sleep 100
				varmid := FFRK_ConfirmImage("chest_rngesus_mid",imagevar,1)
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
				;msgbox %varleft% %varmid% %varright% %varconfirm% %varkey1%
				}
			}
		else if (rngesuschest = 3)
			{
			Loop, 10
				{
				Sleep 100
				varleft := FFRK_ConfirmImage("chest_rngesus_left",imagevar,1)
				Sleep 100
				varmid := FFRK_ConfirmImage("chest_rngesus_mid",imagevar,1)
				Sleep 100
				varright := FFRK_ConfirmImage("chest_rngesus_right",imagevar,1)			
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
				;msgbox %varleft% %varmid% %varright% %varconfirm% %varkey1%
				}
			}
		else
			{
			Loop, 3
				{
				SoundPlay, %Chest_alert%, 1
				Sleep 2000
				}
			goto, FFRK_farming_process
			}
		}

	FFRK_ConfirmImage("corridor_confirmreward",imagevar,1)	
	FFRK_ConfirmImage("corridor_door_yes",imagevar,1)	

	FFRK_ConfirmImage("heal_confirm",imagevar,1)	


	FFRK_ConfirmImage("buff_confirm",imagevar,1)	
	FFRK_ConfirmImage("buff_enter",imagevar,1)	


	FFRK_ConfirmImage("fight_skip",imagevar,1)	
	FFRK_ConfirmImage("fight_confirmend",imagevar,1)	
	FFRK_ConfirmImage("fight_go",imagevar,1)	
	FFRK_ConfirmImage("fight_enter",imagevar,1)	



	FFRK_ConfirmImage("core_ok_dungeon",imagevar,1)
	FFRK_ConfirmImage("core_ok_stamina",imagevar,1)
	FFRK_ConfirmImage("core_selectteam",imagevar,1)
	FFRK_ConfirmImage("core_enterlaby",imagevar,1)
	FFRK_ConfirmImage("core_missionconfirm",imagevar,1)		
	dungeonreward := FFRK_ConfirmImage("core_dungeonreward",imagevar,0)	
	If (redolaby = 1 and dungeonreward = 0)
		{
		FFRK_ConfirmImage("core_dungeonreward",imagevar,1)	
		}
	If (redolaby = 0 and dungeonreward =0)
		{
		Loop, 2
			{
			SoundPlay, %FinalBoss_alert%, 1
			Sleep 2000
			}
		Reload
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


; Clic 1 fois
FFRK_click(X,Y)
	{
	MouseMove, X, Y, 5
	Sleep, 200
	Click, X ,Y Down Left
	Sleep, 300
	Click, X ,Y Up Left
	emptyloop = 0
	Sleep 2000
	}

; Clic 3 fois (à modifier avec un param plus tard)
FFRK_click2(X,Y)
	{
	MouseMove, X, Y, 5
	Loop, 3
		{
		Sleep, 200
		Click, X ,Y Down Left
		Sleep, 300
		Click, X ,Y Up Left
		}
	emptyloop = 0
	Sleep 2000
	}

; Clic via pixel , non utilisé
FFRK_clickM(X,Y)
	{
	X := X + ffrk_clic_width
	Y := Y + ffrk_clic_height
	MouseMove, X, Y, 5
	Sleep, 200
	Click, X ,Y Down Left
	Sleep, 300
	Click, X ,Y Up Left
	emptyloop = 0
	Sleep 2000
	}
	
; Confirme une image et clic si toggle
FFRK_ConfirmImage(image,imagevar,toggle)
	{
	FFRK_state(ffrkaggro)
	Loop, 3
		{
		imageurl := A_ScriptDir "\image_laby\" image ".png"
		imagevarb := "*" imagevar
		ImageSearch, X, Y, 0, 0, %ffrk_window_width%, %ffrk_window_height%, %imagevarb% %imageurl%
		if ErrorLevel = 0
			{
			if (toggle = 2)
				{
				FFRK_click2(X,Y)
				}
			if (toggle = 1)
				{
				FFRK_click(X,Y)
				}
			}
			Return ErrorLevel
		Sleep %SLP2%
		}
	Return ErrorLevel
	}
