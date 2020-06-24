function [] = HW6Q4(p1,eps)
  f = @(x) sin(x)*(x-sqrt(5))^4;
  df = @(x) (4*sin(x) + (x-sqrt(5))*cos(x))*(x-sqrt(5))^3;
  gsquiggle = @(x) x - ( 4*f(x) )/( df(x) );
  p(1) = p1;
  n = 1;
  ErrorEst = 10 * eps;
  
  while ErrorEst > eps
    n = n+1;
    p(n) = gsquiggle(n-1);
    ErrorEst = abs( p(n) - p(n-1) );
  end
  
  fprintf('The root is %0.9f with error %0.9f\n', p(n), ErrorEst(n-1));
  fprintf('The number of iterates necessary was %d\n', n);
  plot(1:n,p, '-k');
  xlabel('n');
  ylabel('p(n)');
  title('Modified NM Approach 2: n vs. p(n)');
  grid on;
  semilogy(1:n,ErrorEst(n-1), '-r')
  end