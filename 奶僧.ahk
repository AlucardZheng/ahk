#IfWinActive,ahk_class D3 Main Window Class 

;ʥ�̾���Ǵ���ֶ��ּ׳��AHK��
;��F2��������ͣ��
;������������޸ģ�ע����ע���ɸĶ��ĵط���Ҫ�ģ������ط����ֲ��伴��
;������Щ�������ò�����1��Ǵ2����3�ɷ�4��ʿxǿ���ƶ���������Ҽ��ּ׵���ң������Ϸ��esc-ѡ��-�����󶨣��ɿ���������ָ�����1������2������1��Ӧ��ָ������Լ���ϰ�߰���������2��Ӧ��ָ�����1234x���У�������Ǵ�겻Ӱ����������ְҵҲ��Ӱ����֮ǰ�İ���ϰ��
;�ֶ��Ҽ��ּף�һ�´���
;��Ǯ���㹥��
;��ɮ��Ҫ��·�ĺ�
;���޸�˼·�����а�������һ�����������ڲ�ʹ��goto������ֱ�ִ�в�ͬ���Ӻ�����goto��
;������������ڲ���ʹ�ò�ͬ�Ĺ��ܿ����޷���ã��������ͻ

SetKeyDelay,20
SetMouseDelay,20

global flag=0
global v_Jufeng=0
;���������Զ�����ѭ��
main()

$F2:: ;bossվר��
{
	send {x up}
	send {G down}
	flag=2
}
Return

$LCtrl:: ;��ȭ
{
	send {x up}
	send {G down}
	flag=1
}
Return


$F11:: ;쫷��ƿ���
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
	;ÿ��һ��ѭ�����꣬��Ҫ�жϽ����������Ǹ�ѭ�����߽���
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
;�س����֡���T�سǡ���S�鿴���ܡ���I�鿴װ������M�鿴���͹رպ�
{
Send {x up}   
Send {G up}    ;�ɿ�ǿ���ƶ���x��
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
