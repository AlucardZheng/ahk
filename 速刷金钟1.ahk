#IfWinActive,ahk_class D3 Main Window Class 

;����������˲�ƣ�����ֹͣ�꣬���ְ��°��˽׶��ƶ���λ


SetKeyDelay,20
SetMouseDelay,20

global v_Enable=0  ;�꿪�ر���
global v_Enable1=0 
global v_Enable2=0 
global v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 

$F2::   ;���ؼ�������в������ң����Խ�F2�����������Ӧ�Ĵ���XButton1��XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable==0) 
{
SetTimer, Label2, off  ;�رռ���2�����ʱ��
SetTimer, Label3, off  ;�رռ���3�����ʱ��
SetTimer, Label4, off  ;�رռ���4�����ʱ��
}
Else 
{
SetTimer, Label2, 600  ;����������2��600�������㣬��Ӧ���Ƽ��ܣ�600�ɸĶ�
SetTimer, Label3, 600  ;����������3��600�������㣬��Ӧ�ɷ����ܣ�600�ɸĶ�
SetTimer, Label4, 600  ;����������4��600�������㣬��Ӧ��ʿ���ܣ�600�ɸĶ�
}
} 
Return 

$wheelup:: ;ʰȡ��Ʒ
{
v_Enable1:=0
v_Enable2:=!v_Enable2
SetTimer, Label1, off  ;�رռ���1�����ʱ��
SetTimer, MouseLButton, 150  ;������150�������㣬150�ɸĶ���ֻ��������Ҫ�Ķ�
SetTimer, Label2, 600  ;����������2��600�������㣬��Ӧ���Ƽ��ܣ�600�ɸĶ�
SetTimer, Label3, 600  ;����������3��600�������㣬��Ӧ�ɷ����ܣ�600�ɸĶ�
SetTimer, Label4, 600  ;����������4��600�������㣬��Ӧ��ʿ���ܣ�600�ɸĶ�
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
;�س����֡���T�سǡ���S�鿴���ܡ���I�鿴װ������M�鿴���͹رպ�
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
IfWinNotActive,�����ƻ���III ;����������Ϸ�˴����л��رպ�
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
Click Right ;�������Ҽ�����Ӧ�ּ׼���
IfWinNotActive,�����ƻ���III ;����������Ϸ�˴����л��رպ�
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