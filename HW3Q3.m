function [] = HW3Q3(p1, epsilon)
  f = @(x) x/2 + 1/x;
  p(1) = p1;
  ErrorEst = 10 * epsilon;
  n = 1;
  while ErrorEst > epsilon
    n = n+1;
    p(n) = f( p(n-1) );
    ErrorEst( n-1 ) = abs( p(n) - p(n-1) );
  end
      
      fprintf('The root is %f with error %0.9f\n',p(n), ErrorEst(n-1));
      fprintf('The number of iterates necessary was %d\n', n);
      plot(1:n,p,'-b');
      xlabel('n');
      ylabel('p(n)');
      title('n vs. p(n)');
      grid on;
end