function [] = HW4Q3(p1, eps)
  f = @(x) x.^2-5;
  g = @(x) 2*x;
  p(1) = p1;
  n = 1;
  ErrorEst = 10*eps;
  
  while ErrorEst > eps
    n = n+1;
    p(n) = p(n-1) - f( p(n-1) ) / g( p(n-1) );
    if n >= 2
      ErrorEst(n-1) = abs( p(n) - p(n-1) );
      end
    end
  
  fprintf('The root is %0.9f with error %0.9f\n', p(n), ErrorEst(n-1));
  fprintf('The number of iterates necessary was %d\n', n);
  plot(1:n,p, '-k');
  xlabel('n');
  ylabel('p(n)');
  title('n vs. p(n)');
  grid on;
  
  end