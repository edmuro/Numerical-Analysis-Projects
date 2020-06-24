function [] = HW5Q2(p1, p2, epsilon)
  f = @(x) x.^2 - 5;
  p(1) = p1; p(2) = p2;
  ErrorEst = 10*epsilon;
  n = 2;
  while ErrorEst > epsilon
    n = n+1;
    p(n) = p(n-1) - ( f( p(n-1) ) * ( p(n-1) - p(n-2) ) ) / ( f( p(n-1) ) - f( p(n-2) ) );
   if n >= 3
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