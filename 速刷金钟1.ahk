#IfWinActive,ahk_class D3 Main Window Class 

;圣教军天谴流手动钢甲冲层AHK宏
;按F2启动或暂停宏
;关于哪里可以修改，注释里注明可改动的地方需要改，其他地方保持不变即可
;对于那些按键设置并不是1天谴2挑衅3律法4勇士x强制移动左键回能右键钢甲的玩家，请进游戏按esc-选项-按键绑定，可看到界面上指令、按键1、按键2，按键1对应的指令设成自己的习惯按键，按键2对应的指令设成1234x就行，这样天谴宏不影响你玩其他职业也不影响你之前的按键习惯
;手动右键钢甲，按一下触发

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;宏开关变量
v_Enable1=0 
v_Enable2=0 
v_Tab=0     ;按Tab查看小地图暂停宏变量 

$F2::   ;开关键，鼠标有侧键的玩家，可以将F2换成鼠标侧键对应的代码XButton1、XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable==0) 
{
Send {click up} 
SetTimer, Label2, off  ;关闭技能2连点计时器
SetTimer, Label3, off  ;关闭技能3连点计时器
SetTimer, Label4, off  ;关闭技能4连点计时器
}
Else 
{
Send {click down}
SetTimer, Label2, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, Label3, 600  ;动作条技能3键600毫秒连点，对应律法技能，600可改动
SetTimer, Label4, 600  ;动作条技能4键600毫秒连点，对应勇士技能，600可改动
}
} 
Return 

$Z:: ;拾取物品
{
v_Enable1:=0
v_Enable2:=!v_Enable2
If(v_Enable2==0)
{
SetTimer, MouseLButton, off  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
Send {click down}
Send {x down}   ;自动按住强制移动键x，关闭强制移动down换up，down可改动
}
Else
{
SetTimer, Label1, off  ;关闭技能1连点计时器
SetTimer, MouseLButton, 150  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
Send {x down}   ;自动按住强制移动键x，关闭强制移动down换up，down可改动
}
} 
Return

$LCtrl:: ;释放金钟罩
{
v_Enable1:=!v_Enable1
v_Enable2:=0
If (v_Enable1==0) 
{
Send {click down}
SetTimer, Label1, off  ;关闭技能1连点计时器
Send {x up}    ;松开强制移动键x，
}
Else
{
SetTimer, MouseLButton, off  ;关闭左键连点计时器
Send {click up} 
SetTimer, Label1, 150  ;动作条技能1键600毫秒连点，对应天谴技能，600可改动
Send {x down}   ;自动按住强制移动键x，关闭强制移动down换up，down可改动
}
}
Return

$MouseRButton:
{

Send {click down}
SetTimer, MouseLButton, off  ;关闭左键连点计时器
SetTimer, Label1, off  ;关闭技能1连点计时器
Send {x up}    ;松开强制移动键x，

Click Right ;点击鼠标右键，对应钢甲技能

SetTimer, Label1, 150  ;动作条技能1键600毫秒连点，对应天谴技能，600可改动
Send {x down}   ;自动按住强制移动键x，关闭强制移动down换up，down可改动
}
Return
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