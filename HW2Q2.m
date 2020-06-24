%Let f = x^2 - 5 with an anonymous function

function [] = HW2Q2(left,right,epsilon)
  f = @(x) x.^2-5;
  nMax = ceil(log2((right-left)/epsilon));
  a = left;
  b = right;
  for i = 1:nMax
    p(i) = (1/2)*(a(i) + b(i));
    if sign( f(a(i)) ) ~= sign( f(p(i)) )
      a(i+1) = a(i);
      b(i+1) = p(i);
    else
      a(i+1) = p(i);
      b(i+1) = b(i);
    end
  end
  
  fprintf('The root approximation is %f\n', p(i));
  fprintf('The amount of iterations necessary was %d\n', nMax);
  
  plot(1:nMax,p,'-k');
  xlabel('n');
  ylabel('p(n)');
  title('n vs. p(n)');
  
end