function [] = HW3Q2(a, b, e)
f = @(x) x.^2 - 5;
an = a; bn = b;
Error_Est = inf;
n = 0;

while Error_Est > e
  n = n+1;
  p(n) = ( an*f(bn) - bn*f(an) ) / ( f(bn) - f(an) );

  if( sign( f(p(n)) ) == sign( f(an) ) )
  an = p(n);
  else
  bn = p(n);
  end
  
  if (n >= 3)
    lamb = ( p(n) - p(n-1) ) / ( p(n-1) - p(n-2) );
    Error_Est = abs( lamb/(lamb-1) ) * abs( p(n) - p(n-1) );
  end
  
end
  
  fprintf('The root is approximately %f\n', p(n));
  fprintf('The max number of iterates is %d\n', n);
  plot(1:n, p, '-k');
  xlabel('n');
  ylabel('p(n)');
  title('n vs. p(n)');
  grid on;
  
end