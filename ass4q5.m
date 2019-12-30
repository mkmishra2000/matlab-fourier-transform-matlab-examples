function ass4q5
    %time range
    t = 0:0.01:10;
    
    %define the expression
    x1 = exp(-t);
    x2 = exp(-9*t);
    x  = x1+x2;     % for linearity check
    
     % positive side calculation
     for wpos =1:1:100
        Apos1(wpos)=trapz(t,x1.*exp(-1i*wpos*0.1*t));
        Apos2(wpos)=trapz(t,x2.*exp(-1i*wpos*0.1*t));
     end
    
     %define the positive [index] for drawing the graphs
     wpos = 1:1:100;
     
     %defining frequencies level according to fourier transform nature.
     w1=0.1*wpos;
    
     % negative side calculation 
    for wneg= 1:1:100
        Aneg1(wneg)=trapz(t,x1.*exp(1i*wneg*0.1*t));
        Aneg2(wneg)=trapz(t,x2.*exp(1i*wneg*0.1*t));
    end
    
    %define the negative[index] for drawing the graphs
    wneg=-1:-1:-100;
    
    %defining frequencies level according to fourier transform nature.
    w2=0.1*wneg;
    
     %joining the neg and pos indexes here basically solving the issue of 
    % invalid negative nos in indexes.
    w=[w2,w1];
    
     %joining the fourier transform values
    A1 =[Aneg1,Apos1];
    A2 =[Aneg2,Apos2];
    A  = A1 + A2;
    
    %plot the data.
    subplot(6,1,1);
    plot(t,x1);
    grid on;
    subplot(6,1,2);
    plot(t,x2);   
    grid on;
    subplot(6,1,3);
    stem(w,abs(A1));     %for ploting the discrete values
    grid on;
    subplot(6,1,4);
    stem(w,abs(A2));     %for ploting the discrete values
    grid on;
    subplot(6,1,5);
    plot(t,x);
    grid on;
    subplot(6,1,6);
    stem(w,abs(A));      %for ploting the discrete values 
    grid on;
    
end
