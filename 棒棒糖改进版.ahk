#maxThreadsPerHotkey, 1 ;最大开启线程数为1
#IfWinActive, ahk_class D3 Main Window Class ;仅在D3下有效

;黑人的问题在于按下变身之后有1秒延迟才能判断是否为黑人，导致非黑人代码也能触发

SetKeyDelay,50
SetMouseDelay,50

X:=0
Y:=0
Width:=1440
Height:=900
Return

v_E=0 ;脚本运行开关变量
v_Enable = 0

$F2:: 
{
v_E:=!v_E
v_Enable := 0
send {2}
send {4}
i=0
WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;寻找你“4”技能图标位置
scolor := SubStr(color, 3, 1) ;“4”技能位置没有图标的时候，颜色坐标第三个字符是1

SetTimer, Label1, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, MouseLButton, 150  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动

If (scolor=1 )
{	
	SetTimer, Label3, off   ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
	send {2}
	send {G up}
}
else
{
	SetTimer, Label3, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
	send {G down}
}
}

Return

Enter::  
T::     
~S::      
~I::      
~M::      
~D::
~4::
;回车打字、按T回城、按S查看技能、按I查看装备、按M、按其他技能查看悬赏关闭宏，如需其他终止按键，自行添加
{
Shundown()
}
Return

Shundown()
{
	SetTimer, Label1, off  
	SetTimer, Label2, off  
	SetTimer, Label3, off  
	SetTimer, Label4, off  
	SetTimer, MouseLButton, off  
	SetTimer, MouseRButton, off     
	Send {G up} 
	return
}

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