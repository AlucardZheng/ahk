;ħż��Ϸ�ŵ�OPEDʱ��
global xAD = 0.0598
global xOP = 0.125
global xED = 0.0312
global width
global height
	WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���


$x::	;�������
{
	WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���
	xRay := width * xAD
	yRay := height*0.983
	MouseMove xRay,yRay
	Oporation()
}
return

$C::	;����Ƭͷ
{
	WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���
	xRay := width *xOP 
	yRay := height*0.983
	MouseMove xRay,yRay
	Oporation()
}
return

$v::	;��һ��
{	
	WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���
	xRay := width *xED 
	yRay := height*0.983
	MouseMove xRay,yRay
	Oporation()
	sleep 150
	
}
return
Oporation()
{
	click
	MouseMove width*0.9,height*0.7
}
return