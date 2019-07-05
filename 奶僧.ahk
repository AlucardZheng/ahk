#IfWinActive,ahk_class D3 Main Window Class 

;圣教军天谴流手动钢甲冲层AHK宏
;按F2启动或暂停宏
;关于哪里可以修改，注释里注明可改动的地方需要改，其他地方保持不变即可
;对于那些按键设置并不是1天谴2挑衅3律法4勇士x强制移动左键回能右键钢甲的玩家，请进游戏按esc-选项-按键绑定，可看到界面上指令、按键1、按键2，按键1对应的指令设成自己的习惯按键，按键2对应的指令设成1234x就行，这样天谴宏不影响你玩其他职业也不影响你之前的按键习惯
;手动右键钢甲，一下触发
;打钱，搞攻速

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;宏开关变量
v_Enable1=0 
v_Tab=0     ;按Tab查看小地图暂停宏变量 
global v_E=0

$F2:: ;boss站专用
{
	v_E=1
mainBOSS()
}
Return

$LCtrl:: ;打拳
{
	v_E=1
main()
}
Return

$F3::
{
	v_Enable1:=!v_Enable1
	if(v_Enable1 == 0)
	{
		send {g up}
	}
	else
	{
		send {g down}
	}
	
}

main()
{
	send {x up}
	send {G down}
	MYLbael:
	i=0
	;sleep 300
	;send {2}
	while(i<17)
	{
		i++
		send {1}
		send {3}
		send {4}
		Send {click}
		send {click right}
		sleep 150
		if(v_E==0)
		{
			goto MYLbae2
		}
	}
	if(v_E==1)
	{
		goto MYLbael
	}
	MYLbae2:
	send {G up}
	send {x down}
}
return

mainBOSS()
{
	send {x up}
	send {G down}
	MYLbae3:
	i=0
	;sleep 300
	;send {2}
	while(i<17)
	{
		i++
		send {3}
		send {4}
		Send {click}
		send {click right}
		sleep 150
		if(v_E==0)
		{
			goto MYLbae4
		}
	}
	if(v_E==1)
	{
		goto MYLbae3
	}
	MYLbae4:
	send {G up}
	send {x down}
}
return
~wheeldown::
~Enter::  
~T::     
~S::      
~I::      
~M::      
;回车打字、按T回城、按S查看技能、按I查看装备、按M查看悬赏关闭宏
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off  
SetTimer, Label4, off  
SetTimer, MouseLButton, off  
SetTimer, MouseRButton, off     
Send {x up}   
Send {G up}    ;松开强制移动键x，
v_Enable=0
v_E=0
}
Return

~Tab::
;按Tab查看地形暂停宏和自动恢复
{
If (v_Enable) 
{
v_Tab:=!v_Tab
If (v_Tab)
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off  
SetTimer, Label4, off  
SetTimer, MouseLButton, off  
SetTimer, MouseRButton, off     
Send {x up} 
Send {G up}    ;松开强制移动键x，
}
Else 
{
SetTimer, Label1, 600 ;600可改动  
SetTimer, Label2, 600 ;600可改动  
SetTimer, Label3, 600 ;600可改动 
SetTimer, Label4, 600 ;600可改动  
SetTimer, MouseLButton, 150 ;150可改动  
SetTimer, MouseRButton, off ;钢甲右键手动    
Send {x down}  
Send {G down}    ;松开强制移动键x，
}
}   
}
Return

~*LButton::  ;按住左键停止强制移动
If (v_Enable)
Send {x up}
Return

*LButton Up::  ;松开左键恢复强制移动
If (v_Enable)
Send {x down}
Return

Label1:
{
Send {1} ;动作条技能1键对应按键
Return
}

Label2:
{
Send {2} ;动作条技能2键对应按键
Return
}

Label3:
{
Send {3} ;动作条技能3键对应按键
Return
}

Label4:
{
Send {4}  ;动作条技能4键对应按键
Return
}

MouseLButton:
{
Click    ;点击鼠标左键，对应主要技能
IfWinNotActive,暗黑破坏神III ;国服简体游戏端窗口切换关闭宏
{
SetTimer, Label1, off 
SetTimer, Label2, off 
SetTimer, Label3, off 
SetTimer, Label4, off 
SetTimer, MouseLButton, off 
SetTimer, MouseRButton, off 
Send {x up} 
v_Enable=0
}
}
Return

MouseRButton:
{
Click Right ;点击鼠标右键，对应钢甲技能
IfWinNotActive,暗黑破坏神III ;国服简体游戏端窗口切换关闭宏
{
SetTimer, Label1, off 
SetTimer, Label2, off 
SetTimer, Label3, off 
SetTimer, Label4, off 
SetTimer, MouseLButton, off 
SetTimer, MouseRButton, off 
Send {x up} 
v_Enable=0
}
}
Return
