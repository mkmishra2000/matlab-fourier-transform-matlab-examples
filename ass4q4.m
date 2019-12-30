
function ass4q4
    %choose any arbitary time range.
    t=-10:0.01:10;
    
    %define the expression
    x1(t>0&t<3)=1;
    
    %Expression length is not equal to the time range which should be same
    %for that we add extra length by zero padding method.
    x=[x1,zeros(1,length(t)-length(x1))]; %zero padding add extra length in
                                          %smaller ones.

    % positive side calculation
    for wpos =1:1:100
        Apos(wpos)=trapz(t,x.*exp(-1i*wpos*0.1*t));
    end
    
    %define the positive [index] for drawing the graphs
    wpos = 1:1:100;
    
    %defining frequencies level according to fourier transform nature.
    w1=0.1*wpos;

    % negative side calculation 
    for wneg= 1:1:100
        Aneg(wneg)=trapz(t,x.*exp(1i*wneg*0.1*t));
    end
    
    %define the negative[index] for drawing the graphs
    wneg=-1:-1:-100;
    
    %defining frequencies level according to fourier transform nature.
    w2=0.1*wneg;
    
    %joining the neg and pos indexes here basically solving the issue of 
    % invalid negative nos in indexes.
    w=[w2,w1];
    
     %joining the fourier transform values
    A=[Aneg,Apos];
    
    %plot the data.
    subplot(4,1,1);
    plot(t,x);
    grid on;
    subplot(4,1,2);
    stem(w,abs(A));     %for ploting the discrete values
    grid on;
    subplot(4,1,3);
    stem(w,angle(A));   %for ploting the discrete values
    grid on;
    subplot(4,1,4);
    stem(w,A);          %for ploting the discrete values
    grid on;
end