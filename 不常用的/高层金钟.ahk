#IfWinActive,ahk_class D3 Main Window Class 

;����������˲�ƣ�����ֹͣ�꣬���ְ��°��˽׶��ƶ���λ


SetKeyDelay,20
SetMouseDelay,20

global v_Enable=0  ;�꿪�ر���
global v_Enable1=0 
global v_Enable2=0 
global v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 
global v_E=0

$wheelup:: ;ʰȡ��Ʒ
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
;�س����֡���T�سǡ���S�鿴���ܡ���I�鿴װ������M�鿴���͹رպ�
{
	v_E=0
}
Return


~*LButton::  ;��ס���ֹͣǿ���ƶ�
If (v_Enable)
Send {x up}
Return

*LButton Up::  ;�ɿ�����ָ�ǿ���ƶ�
If (v_Enable)
Send {x down}
Return


Label1:
{
Send {1} ;����������1����Ӧ����
Return
}

Label2:
{
Send {2} ;����������2����Ӧ����
Return
}

Label3:
{
Send {3} ;����������3����Ӧ����
Return
}

Label4:
{
Send {4}  ;����������4����Ӧ����
Return
}

MouseLButton:
{
Click    ;�������������Ӧ��Ҫ����
}
Return


MouseRButton:
{
Click Right ;�������Ҽ�����Ӧ�ּ׼���
}
Return