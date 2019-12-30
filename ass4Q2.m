
function ass4Q2
    %define the time according to question
    t=0:0.01:10;
    
    %define the pi/3 for future computation
    p=pi/3;
    
    %define the expression
    x= 0.9*exp(1i*t*p);
    
    %calculation of integration for only positive frequencies.
    for wpos =1:1:100
        Apos(wpos)=trapz(t,x.*exp(-1i*wpos*0.1*t));%trapeziodal apporaximation
                                                   % instead of normal
                                                   % integration
    end
    
    %define the positive [index] for drawing the graphs
    wpos = 1:1:100;
    
    %defining frequencies level according to fourier transform nature.
    w1=0.1*wpos;
    
    %calculation of integration for only negative frequencies.
    for wneg= 1:1:100
        Aneg(wneg)=trapz(t,x.*exp(1i*wneg*0.1*t));%trapeziodal apporaximation
                                                   % instead of normal
                                                   % integration
    end
    
    %define the negative[index] for drawing the graphs
    wneg=-1:-1:-100;
    
    %defining frequencies level according to fourier transform nature.
    w2=0.1*wneg;
    
    %joining the neg and pos indexes here basically solving the issue of 
    % invalid negative nos in indexes.
    w=[w2,w1];
    
    %similarly joining the fourier transforms of neg and pos sides.
    A=[Aneg,Apos];
    
    %rest of the part is plot the graphs on singal templete.
    subplot(3,1,1);
    plot(t,x);
    grid on;
    subplot(3,1,2);
    
    %stem is use for discrete graphs.
    stem(w,abs(A));
    grid on;
    subplot(3,1,3);
    stem(w,angle(A));
    grid on;

end
%thank you -----> : )