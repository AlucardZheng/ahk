;魔偶马戏团的OPED时间
global xAD = 0.0598
global xOP = 0.125
global xED = 0.0312
global width
global height
	WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率


$x::	;跳过广告
{
	WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
	xRay := width * xAD
	yRay := height*0.983
	MouseMove xRay,yRay
	Oporation()
}
return

$C::	;跳过片头
{
	WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
	xRay := width *xOP 
	yRay := height*0.983
	MouseMove xRay,yRay
	Oporation()
}
return

$v::	;下一集
{	
	WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
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