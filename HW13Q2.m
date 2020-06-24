function [] = HW13Q2(x1,epsilon)
  
  x(:,1) = x1;
  f = @(x) [ x(1).^2 + -x(2).^2 ; -x(1)*x(2)+1 ];
  Jf = @(x) [ 2*x(1), -2*x(2) ; -x(2), -x(1) ];
  k = 0;
  
  while norm(f( x(:,k+1) )) > epsilon
    k = k+1
    v(:,k) = -1*inv(Jf( x(:,k) ))*f( x(:,k) );
    x(:,k+1) = x(:,k) + v(:,k)
  end
  
  %The solution vector is [ 1 ; 1 ], with k = 5 iterations
  
  
  %figure( 1 );
  %clf;
  %hold on;
  %plot( 1:k, x( 1, 1:k ) );
  %plot( 1:k, x( 2, 1:k ) );
  
  subplot(2,1,1)
  plot(1:k,x(1,k),'-k')
  hold on;
  plot(1:k,x(2,k),'-g')
  xlabel('k')
  ylabel('x(1)')
  title('SNLE Newtons Method: k versus x vector graph')
  grid on;
  
  %plot( 1:k, ResidualNorms )
  
  subplot(2,1,2)
  plot(1:k,norm( f(x(:,k)) ),'-b')
  xlabel('k')
  ylabel('norm(f(:,k))')
  title('SNLE Newtons Method: k versus residual graph')
  grid on;
end