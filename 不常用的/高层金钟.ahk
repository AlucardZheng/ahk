#IfWinActive,ahk_class D3 Main Window Class 

;鼠标滚轮往上瞬移，往下停止宏，滚轮按下白人阶段移动走位


SetKeyDelay,20
SetMouseDelay,20

global v_Enable=0  ;宏开关变量
global v_Enable1=0 
global v_Enable2=0 
global v_Tab=0     ;按Tab查看小地图暂停宏变量 
global v_E=0

$wheelup:: ;拾取物品
{
	v_E=1
	main()
}	
Return


main()
{
	MYLbael:
	i=0
	sleep 300
	send {1}
	while(i<19)
	{
		i++
		send {2}
		send {3}
		send {4}
		Send {click}
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
}
return


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
	v_E=0
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
}
Return


MouseRButton:
{
Click Right ;点击鼠标右键，对应钢甲技能
}
Return