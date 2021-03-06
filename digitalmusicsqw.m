%Q1:produce squarewaves with different frequency

N = 9;
kp = linspace(1,N,N);
kn = linspace(-N,-1,N);
k=[kn 0 kp];
ap = (1-exp(-1i*kp*pi)).*(sin(0.5*kp*pi))./(kp*pi);
an = (1-exp(-1i*kn*pi)).*(sin(0.5*kn*pi))./(kn*pi);
a = [an 0 ap];            %a is the coefficience of the CTFS of the squraewave

%calculating x[n] fs=8000Hz f0=210Hz n=0:2*fs:1

fs=8000;
f0=420;
t=2;
x=nan(1,t*fs);
for n=1:t*fs+1
    x(n) = a(1)*exp(1i*(-N)*(2*pi*f0/fs)*(n-1));
    for m=2:2*N+1
        x(n) = a(m)*exp(1i*(m-N-1)*(2*pi*f0/fs)*(n-1)) + x(n);
    end
end
plot(real(x));
soundsc(real(x),fs);
