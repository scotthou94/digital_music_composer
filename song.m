%song:produce a sound of given frequency and given time duration

function[x]=song(f,t)          %use note function to get sounds of different frequency

fs = 8000;
t = t*0.6;
f0 = f;
if f==0
    x=zeros(1,t*fs);

else
    N = round((fs/f0-1)/2);
    kp = linspace(1,N,N);
    kn = linspace(-N,-1,N);
    ap = (1-exp(-1i.*kp*pi)).*(sin(0.5.*kp*pi))./(kp*pi);
    an = (1-exp(-1i*kn*pi)).*(sin(0.5*kn*pi))./(kn*pi);
    a = [an 0 ap];            %a is the coefficience of the CTFS of the squraewave

    %calculating x[n] with the  given parameters

    x=nan(1,t*fs);
    for n=1:t*fs+1
        x(n) = a(1)*exp(1i*(-N)*(2*pi*f0/fs)*(n-1));
        for m=2:2*N+1
            x(n) = a(m)*exp(1i*(m-N-1)*(2*pi*f0/fs)*(n-1)) + x(n);
        end
    end
    x=real(x);
    %soundsc(x,fs);
end
