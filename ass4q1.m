function ass4q1
    syms t w
    x = input('Enter the function :');
    y = int(x*exp(-1j*w*t),t,[0 inf]);
    disp(y);
    
end
