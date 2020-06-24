function [] = HW6Q3(p1,eps)
  f = @(x) sin(x)*(x-sqrt(5))^4;
  df = @(x) (4*sin(x) + (x-sqrt(5))*cos(x))*(x-sqrt(5))^3;
  ddf = @(x) (-sqrt(5) + x)^2*(-8*(sqrt(5) - x)*cos(x) + (7 + 2*sqrt(5)*x - x^2)*sin(x));
  g = @(x) x -( f(x)*df(x) )/( df(x)^2 - ddf(x)*f(x) );
  p(1) = p1;
  n = 1;
  ErrorEst = 10 * eps;
  
  while ErrorEst > eps
    n = n+1;
    p(n) = g( p(n-1) );
    ErrorEst(n-1) = abs( p(n) - p(n-1) );
  end
  
  subplot(2,1,1);
  fprintf('The root is %0.9f with error %0.9f\n', p(n), ErrorEst(n-1));
  fprintf('The number of iterates necessary was %d\n', n);
  plot(1:n,p, '-k');
  xlabel('n');
  ylabel('p(n)');
  title('Modified NM Approach 1: n vs. p(n)');
  grid on;
  
  subplot(2,1,2);
  semilogy(1:n-1,ErrorEst(n-1), '-b')
  xlabel('n');
  ylabel('Error Estimate');
  title('n vs. Error Estimate');
  grid on;
  
  end