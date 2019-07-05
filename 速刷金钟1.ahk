#IfWinActive,ahk_class D3 Main Window Class 

;鼠标滚轮往上瞬移，往下停止宏，滚轮按下白人阶段移动走位


SetKeyDelay,20
SetMouseDelay,20

global v_Enable=0  ;宏开关变量
global v_Enable1=0 
global v_Enable2=0 
global v_Tab=0     ;按Tab查看小地图暂停宏变量 

$F2::   ;开关键，鼠标有侧键的玩家，可以将F2换成鼠标侧键对应的代码XButton1、XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable==0) 
{
SetTimer, Label2, off  ;关闭技能2连点计时器
SetTimer, Label3, off  ;关闭技能3连点计时器
SetTimer, Label4, off  ;关闭技能4连点计时器
}
Else 
{
SetTimer, Label2, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, Label3, 600  ;动作条技能3键600毫秒连点，对应律法技能，600可改动
SetTimer, Label4, 600  ;动作条技能4键600毫秒连点，对应勇士技能，600可改动
}
} 
Return 

$wheelup:: ;拾取物品
{
v_Enable1:=0
v_Enable2:=!v_Enable2
SetTimer, Label1, off  ;关闭技能1连点计时器
SetTimer, MouseLButton, 150  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
SetTimer, Label2, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, Label3, 600  ;动作条技能3键600毫秒连点，对应律法技能，600可改动
SetTimer, Label4, 600  ;动作条技能4键600毫秒连点，对应勇士技能，600可改动
} 
Return


wheeldown::
{
	send {T}
}
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
Send {click up} 
v_Enable=0
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