
function ass4q3
    %Take "a" from outside so that we can generalised the question for any 
    %user define function as like given in question.
    a= input('Enter the constant value of a: ');
    
    %define arbitary time (any time limit we can choose)
    t=-30:0.01:30;
    
    %define the expression first denomenator
    if a ~=0
        p=((a.*a)+(t.*t));
    end
    %take power as -1 so that it will in denomenator.
    x=p.^(-1);
    
    %calculation of integration for only positive frequencies, any limit we
    %choose ideally it should be infinity. 
    for wpos =1:1:1000
        Apos(wpos)=trapz(t,x.*exp(-1i*wpos*0.01*t));%trapeziodal apporaximation
                                                   % instead of normal
                                                   % integration
    end
    
    %define the positive [index] for drawing the graphs
    wpos = 1:1:1000;
    
    w1=0.01*wpos;
    
    %calculation of integration for only negative frequencies.
    for wneg= 1:1:1000
        Aneg(wneg)=trapz(t,x.*exp(1i*wneg*0.01*t));%trapeziodal apporaximation
                                                   % instead of normal
                                                   % integration
    end
    
    %define the negative[index] for drawing the graphs
    wneg=-1:-1:-1000;
    
    %defining frequencies level according to fourier transform nature.
    w2=0.01*wneg;
    
    %joining the neg and pos indexes here basically solving the issue of 
    % invalid negative nos in indexes.
    w=[w2,w1];
    
    %joining the fourier transform values
    A=[Aneg,Apos];
    
    subplot(3,1,1);
    plot(t,x);
    grid on;
    
    subplot(3,1,2);
    stem(w,abs(A));
    grid on;
    
    subplot(3,1,3);
    stem(w,angle(A));
    grid on;
    
end