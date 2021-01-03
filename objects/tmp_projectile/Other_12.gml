/// @description Movement Resolution
// You can write your code in this editor
xprev = x;
yprev = y;

x += xslop;
y += yslop;

x += h;
y += v;

xslop = x mod 1;
yslop = y mod 1;
x = x div 1;
y = y div 1;
