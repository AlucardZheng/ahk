#IfWinActive,ahk_class D3 Main Window Class 

;圣教军天谴流手动钢甲冲层AHK宏
;按F2启动或暂停宏
;关于哪里可以修改，注释里注明可改动的地方需要改，其他地方保持不变即可
;对于那些按键设置并不是1天谴2挑衅3律法4勇士x强制移动左键回能右键钢甲的玩家，请进游戏按esc-选项-按键绑定，可看到界面上指令、按键1、按键2，按键1对应的指令设成自己的习惯按键，按键2对应的指令设成1234x就行，这样天谴宏不影响你玩其他职业也不影响你之前的按键习惯
;手动右键钢甲，按一下触发
;蛮子需要自动释放盾墙

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;宏开关变量
v_Tab=0     ;按Tab查看小地图暂停宏变量 
global vIndex=0

$F2::   ;开关键，鼠标有侧键的玩家，可以将F2换成鼠标侧键对应的代码XButton1、XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable=0) 
{
SetTimer, Label1, off  ;关闭技能1连点计时器
SetTimer, Label2, off  ;关闭技能2连点计时器
SetTimer, Label3, off  ;关闭技能3连点计时器
SetTimer, Label4, off  ;关闭技能4连点计时器
SetTimer, LBtn, off  ;关闭左键连点计时器
SetTimer, MouseRButton, off     ;关闭右键连点计时器
Send {x up}    ;松开强制移动键x，
}
Else 
{
	
	;开局先来一发
	send {3}
	send {4}
	send {click right}
	send {click}
	;结束
;SetTimer, Label1, 1000  ;动作条技能1键600毫秒连点，对应天谴技能，600可改动
;SetTimer, Label2, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, Label3, 3800  ;动作条技能3键600毫秒连点，对应律法技能，600可改动
SetTimer, Label4, 1900  ;动作条技能4键600毫秒连点，对应勇士技能，600可改动
SetTimer, LBtn, 5500  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
SetTimer, MouseRButton, 7800     ;鼠标右键600毫秒连点，钢甲手动触发，自动钢甲off换成600，off可改动
Send {x down}   ;自动按住强制移动键x，关闭强制移动down换up，down可改动
}
} 
Return 

$`::
{
	
	vIndex:=!vIndex
	if(vIndex==0)
	{
		Send {x up}
	}
	else{
		Send {x down}
	}
}
return

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
SetTimer, LBtn, off  
SetTimer, MouseRButton, off     
Send {x up}   
v_Enable=0
}
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


Sound1:
{
SoundPlay, .\dunqiang.wav
Return
}

LBtn()
{
	send {g down}
Click    ;点击鼠标左键，对应主要技能
	send {g up}
}
Return

MouseRButton:
{
Click Right ;点击鼠标右键，对应钢甲技能
}
Return



global v_Met=0
global v_SH=0



$F3::
{
	v_Met=1
	labelMet:
	sleep 12000
	sleep 16000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 16000
	sleep 16000
	sleep 16000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 4000
	if(v_Met!=0)
	{
	}
	else{
		goto labelMetEnd
	}
	goto labelMet
	labelMetEnd:
}
return

$F4::
{
	v_Met=0
}
return
/*
$F5::
{
	v_SH=1
	labelSH:
	if(v_SH!=0)
	{
		SoundSH()
	}
	else{
		goto labelSHEnd
	}
	sleep 11000
	goto labelSH
	labelSHEnd:
}
return

$F6::
{
	v_SH=0
}
return
*/

SoundMet()
{
	SoundPlay, .\yunshizhunbei.wav
	Return
}


SoundSH()
{
	SoundPlay, .\dunqiang.wav
	Return
}