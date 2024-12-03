clc
clear
k = 0;
a = [];
x_k = [1;1];
Q_k = [1,0;0,1];
g_k = [4*x_k(1) - 1; 2*x_k(2)];
x = x_k - Q_k*g_k;
g = [4*x(1) - 1; 2*x(2)]; 
while(abs(x - x_k)>10^-6)
  a = [a,x];
  s_k = x - x_k;
  y_k = g - g_k;
  Q_k = Q_k + (1+(y_k'*Q_k*y_k)/(y_k'*s_k))*(s_k*s_k')/(s_k'*y_k) - ((Q_k*y_k*s_k')+(Q_k*y_k*s_k')')/(y_k'*s_k);
  x_k = x;
  g_k = g;
  x = x_k - Q_k*g_k;
  g = [4*x(1) - 1; 2*x(2)];
  k = k+1;
end