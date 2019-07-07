#IfWinActive,ahk_class D3 Main Window Class 

;圣教军天谴流手动钢甲冲层AHK宏
;按F2启动或暂停宏
;关于哪里可以修改，注释里注明可改动的地方需要改，其他地方保持不变即可
;对于那些按键设置并不是1天谴2挑衅3律法4勇士x强制移动左键回能右键钢甲的玩家，请进游戏按esc-选项-按键绑定，可看到界面上指令、按键1、按键2，按键1对应的指令设成自己的习惯按键，按键2对应的指令设成1234x就行，这样天谴宏不影响你玩其他职业也不影响你之前的按键习惯
;手动右键钢甲，一下触发
;打钱，搞攻速
;奶僧需要赶路的宏
;宏修改思路，所有按键调用一个主函数，内部使用goto语句来分别执行不同的子函数，goto语
;句放在主函数内部，使得不同的功能可以无缝调用，不会骑冲突

SetKeyDelay,20
SetMouseDelay,20

global flag=0
global v_Jufeng=0
;开启程序自动进入循环
main()

$F2:: ;boss站专用
{
	send {x up}
	send {G down}
	flag=2
}
Return

$LCtrl:: ;打拳
{
	send {x up}
	send {G down}
	flag=1
}
Return


$F11:: ;飓风破开关
{
	;v_Jufeng:=!v_Jufeng
	v_Jufeng=0
}
Return

$wheelup::
{
	send {G up}
	send {X down}
	flag=3
}

main()
{
	MyLabelJudge:
	if(flag=1)
	{
		goto MyLabelCS
	}
	if(flag==2)
	{
		goto MyLabelCN
	}
	if(flag==3)
	{
		goto MyLabelMR
	}
	if(flag==0)
	{
		goto MyLabelNull
	}
	;每当一个循环跑完，需要判断接下来是跑那个循环或者结束
	MyLabelCS:
	cureSor(flag)
	goto MyLabelJudge
	MyLabelCN:
	curenec(flag)
	goto MyLabelJudge
	MyLabelMR:
	monkRun(flag)
	goto MyLabelJudge
	MyLabelNull:
	sleep 1000
	goto MyLabelJudge
}
return

cureSor(flag)
{
	i=0
	if(v_Jufeng==0)
	{
		;sleep 300
		send {2}
	}
	;while(i<17)
	while(i<5)
	{
		i++
		;send {1}
		send {3}
		send {4}
		Send {click}
		send {click right}
		sleep 150
		if(flag!=1)
		{
			i+=5
		}
	}
}
return

curenec(flag)
{
	i=0
	if(v_Jufeng==0)
	{
		;sleep 300
		send {2}
	}
	;while(i<17)
	while(i<4)
	{
		i++
		send {3}
		send {4}
		;Send {click}
		send {1}
		send {click right}
		sleep 150
		if(flag!=2)
		{
			i+=5
		}
	}
}
return

monkRun(flag)
{
	i=0
	if(v_Jufeng==0)
	{
		;sleep 300
		send {2}
	}
	while(i<12)
	{
		i++
		send {3}
		send {click right}
		sleep 150
		if(flag!=3)
		{
			i+=12
		}
	}
}

return

~WheelDown::
~Enter::  
~T::     
~S::      
~I::      
~M::      
;回车打字、按T回城、按S查看技能、按I查看装备、按M查看悬赏关闭宏
{
Send {x up}   
Send {G up}    ;松开强制移动键x，
flag=0
}
Return




global v_Met=0
global v_SH=0



$F3::
{
	v_Met=1
	labelMet:
	sleep 12000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 4000
	sleep 16000
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
	if(v_Met!=0)
	{
		SoundMet()
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
