%MAT 4020 Spring 2019 project
function [] = MAT4020trapezoidal()
  a = -1;
  b = 1;
  n = 10; %Number of subdivisions n
  
  h = zeros(1,n); %step size h for log-log graph
  eps1 = zeros(1,n); %epsilon for first Tn for log-log graph
  eps2 = zeros(1,n); %epsilon for second Tn for log-log graph
  
  f = @(x) x; %initial function f
  g = @(x) (6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2)); %composite function (f o g)g'
  f1 = @(x) exp(x);
  g1 = @(x) exp(6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2));
  f2 = @(x) log(x);
  g2 = @(x) log(6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2));
  
  gextra1 = @(x) (6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2)).*(60.*(2.*x.^3-3.*x.^2+x)).*(60.*(6.*x.^2-6.*x+1)).*(360.*(2.*x-6)).*(720);
  gextra2 = @(x) exp(6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2)).*(60.*(2.*x.^3-3.*x.^2+x)).*(60.*(6.*x.^2-6.*x+1)).*(360.*(2.*x-6)).*(720);
  gextra3 = @(x) log(6.*x.^5-15.*x.^4+10.*x.^3).*(30.*(x.^4-2.*x.^3+x.^2)).*(60.*(2.*x.^3-3.*x.^2+x)).*(60.*(6.*x.^2-6.*x+1)).*(360.*(2.*x-6)).*(720);
  
  % h = exp(-1./x)
  % h' = exp(-1./x)./x.^2
  gbetter = @(x) exp(-1./x)./(exp(-1./x) + exp(-1./(1-x))) .* ((2.*(exp(-1./x)./x.^2).*exp(-1./x)) + (exp(-1./x)./x.^2).*exp(-1./(1-x))-exp(-1./x).*exp(-1./(1-x))./(1-x).^2)./(exp(-1./x).*exp(-1./(1-x))).^2;
  
  x = linspace(a,b,n);
  
  
  for i = 1:n
    h(i) = (b-a)/i;
    trap1 = 0.5*(f(a)+f(b));  %Trapezoidal sum of f
    trap2 = 0.5*(g(a)+g(b));  %Trapezoidal sum of composite function (f o g)g'
    trap3 = 0.5*(f1(a)+f1(b));
    trap4 = 0.5*(g1(a)+g1(b));
    trap5 = 0.5*(f1(a)+f1(b));
    trap6 = 0.5*(g1(a)+g1(b));
    trapextra1 = 0.5*(gextra1(a)+gextra1(b));
    trapextra2 = 0.5*(gextra2(a)+gextra2(b));
    trapextra3 = 0.5*(gextra3(a)+gextra3(b));
    for j = 2:(n-1)
      trap1 = trap1 + f(a+j.*h);
      trap2 = trap2 + g(a+j.*h);
      trap3 = trap3 + f1(a+j.*h);
      trap4 = trap4 + g1(a+j.*h);
      trap5 = trap5 + f2(a+j.*h);
      trap6 = trap6 + g2(a+j.*h);
      trapextra1 = trapextra1 + gextra1(a+j.*h);
      trapextra2 = trapextra2 + gextra2(a+j.*h);
      trapextra3 = trapextra3 + gextra3(a+j.*h);
    end
    eps1 = abs(quadcc(f,a,b) - h.*trap1); %absolute value of the error in f
    eps2 = abs(quadcc(g,a,b) - h.*trap2); %absolute value of the error in (f o g)g'
    eps3 = abs(quadcc(f,a,b) - h.*trap3);
    eps4 = abs(quadcc(g,a,b) - h.*trap4);
    eps5 = abs(quadcc(f,a,b) - h.*trap5);
    eps6 = abs(quadcc(g,a,b) - h.*trap6);
    epsextra1 = abs(quadcc(gextra1,a,b) - h.*trapextra1);
    epsextra2 = abs(quadcc(gextra2,a,b) - h.*trapextra2);
    %epsextra3 = abs(quadcc(gextra3,a,b) - h.*trapextra3);
  end
  
  for i = 1:n
    trapbetter = 0;
    for j = 2:(n-1)
      if (a+j.*h <= 0)
        trapbetter = trapbetter + 0;
      end
      trapbetter = trapbetter + gbetter(a+j.*h);
    end
    epsbetter = abs(quadcc(gbetter,a,b) - h.*trapbetter);
  end
  
  %graph two lines on the same graph to compare both the function and the composite function
  figure 1
  loglog(h,eps1,'b-')
  hold on
  loglog(h,eps2,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of linear functions')

  figure 2
  loglog(h,eps3,'b-')
  hold on
  loglog(h,eps4,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of exponential functions')

  figure 3
  loglog(h,eps5,'b-')
  hold on
  loglog(h,eps6,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of logarithmic functions')
  
  figure 4
  loglog(h,eps1,'b-')
  hold on
  loglog(h,epsbetter,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of linear functions with improved g')
  
  figure 5
  loglog(h,eps1,'b-')
  hold on
  loglog(h,epsextra1,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of linear extra function')
  figure 6
  loglog(h,eps3,'b-')
  hold on
  loglog(h,epsextra2,'k-')
  xlabel('step size h')
  ylabel('abs(error)')
  title('error vs. h of linear extra function')
  #figure 7
  #loglog(h,eps5,'b-')
  #hold on
  #loglog(h,epsextra3,'k-')
  #xlabel('step size h')
  #ylabel('abs(error)')
  #title('error vs. h of linear extra function')
end