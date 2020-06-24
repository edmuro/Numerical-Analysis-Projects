function [] = HW12Q2(A, b, x1, epsilon)
  x(:,1) = x1;
  r(:,1) = A*x(:,1) - b;
  d(:,1) = -r(:,1);
  k = 1;
  
  while norm(x(:,k)) > epsilon
    lambda(k) = (-d(:,k).'*r(:,k))*inv(d(:,k).'*A*d(:,k));
    x(:,k+1) = x(:,k) + lambda(k)*d(:,1)
    r(:,k+1) = A*x(:,k+1) - b;
    alpha(k) = (r(:,k+1).'*A*d(:,k))*inv(d(:,k).'*A*d(:,k));
    d(:,k+1) = -r(:,k+1)+alpha(k)*d(:,k);
    k = k+1;
  end
end