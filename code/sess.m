[speech , fs]=audioread('amy.wav') ;
 plot(speech),title ('speech') 
speech1=speech(:,1);
%sound(speech1,fs);
plot(speech1),title('Original Signal')

fd=0.050;
fsize=round(fd*fs);
s=zeros(fsize+1,199);

for j=1:192
 s(:,j)=speech1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';
end 

noise=(0.02).*randn(2206,199);
sum_noise=0;
j=1;k=1;
for j=1:199
    for k=1:2206
        sum_noise = sum_noise +  noise(k,j);
    end
end
sum_noise

j=1;k=1;
for j=1:199
    for k=1:2206
        s(k,j) = s(k,j) +  noise(k,j);
    end
end

for l=1:199
    p( ((2206.*l)+ 1): (2206.*(l+1) ) , 1)= s(:,l);
end
p
%sound(p,fs)
plot(p),title('Noisy Signal')

j=1;k=1;
for j=1:199
    for k=1:2206
        y_fft(k,j)= fft(s(k,j));
        d_fft(k,j)=fft(noise(k,j));
    end
end

j=1;k=1;
for j=1:199
    for k=1:2206
       phase(k,j)=angle(y_fft(k,j));
       mag_y(k,j)=abs(y_fft(k,j));
       mag_d(k,j)=abs(d_fft(k,j));
    end
end

Y = mag_y.*mag_y;
D = mag_d.*mag_d;

sum_Y=0;
sum_D=0;
j=1;k=1;
for j=1:199
    for k=1:2206
        sum_Y=sum_Y + Y(k,j);
        sum_D=sum_D + D(k,j);
    end
end
sum_Y
sum_D

snr=(sum_Y/sum_D)
snr=20.*log10(snr)
snr_diff=20
alpha = 4- (3/20).*(snr)
beta=0.00040
c= 1 ./(alpha+ beta)

S=zeros(2206,199);
j=1;k=1;
for j=1:199
    for k=1:2206
    if( (D(k,j)/Y(k,j)) < c)
        S(k,j) =( Y(k,j) - alpha.*D(k,j));
    else
        S(k,j) = beta.*D(k,j);
    end
    end
end

j=1;k=1;
for j=1:199
    for k=1:2206
        S(k,j)=sqrt(S(k,j));
    end
end
i=sqrt(-1)

j=1;k=1;
for j=1:199
    for k=1:2206
        S(k,j)=ifft( S(k,j).*(exp(i*phase(k,j))) , 'symmetric');
    end
end

for l=1:199
    req( ((2206.*l)+ 1): (2206.*(l+1) ) , 1)= S(:,l);
end
req
sound(req,fs)
plot(req),title('Recovered signals')