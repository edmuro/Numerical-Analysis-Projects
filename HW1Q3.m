function [] = HW1Q3(x1,a,nMax)
  x(1) = x1;
  roota = ones(1,nMax) * sqrt(a);
  for i = 1 : nMax
    e(i) = abs(x(i) - sqrt(a));
    x(i+1) = (1/2)*(x(i) + a/x(i));
  endfor
    figure 1
    plot(1:nMax,x,'-k', 1:nMax,roota,'--b');
    xlabel('n');
    ylabel('xn');
    title('Iterates vs. True value');
    legend('n','xn');
    
    figure 2
    plot(1:nMax,e,'-.r');
    xlabel('n');
    ylabel('error');
    title('Error of xn');
    legend('n','error');
end