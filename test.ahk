#maxThreadsPerHotkey, 1 ;������߳���Ϊ1
#IfWinActive, ahk_class D3 Main Window Class ;����D3����Ч

SetKeyDelay,50
SetMouseDelay,50

X:=0
Y:=0
Width:=1440
Height:=900
Return

v_E=0 ;�ű����п��ر���

$1:: 
{
v_E=1
WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���
Mylabel1:
PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;Ѱ���㡰4������ͼ��λ��
scolor := SubStr(color, 3, 1) ;��4������λ��û��ͼ���ʱ����ɫ����������ַ���1

If (scolor=1 AND v_E=1)
{
??send {1}
??sleep 600 ;����״̬1���ͷż������λms�������޸ģ�������600-700֮�䣬������ù��̻��а����ͷ�
??Goto, MyLabel1
}
Else
{
??send {1} ;�ҰѺ���������1�����԰�1�ǿ�������
??sleep 200
??PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;�ж������1�����ǲ��ǿ����ɹ�
??scolor := SubStr(color, 3, 1)
??If (scolor=1 AND v_E=1)
??{
??Goto, MyLabel1 ;��������ɹ����Զ�ѭ�������˵�1
??}
??
??
}
}
Return

~Enter:: 
~T:: 
~S:: 
~I:: 
~M:: 
~D::
~4::
;�س����֡���T�سǡ���S�鿴���ܡ���I�鿴װ������M�����������ܲ鿴���͹رպ꣬����������ֹ�������������
{
v_E=0
}
Return

https://nga.178.com/read.php?&tid=17263853

https://nga.178.com/read.php?&tid=17263853

https://nga.178.com/read.php?&tid=17263853