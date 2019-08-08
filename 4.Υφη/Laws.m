function Laws
    % Create 4 vectors for implementation of Laws masks
    L=[1,4,6,4,1];         % Centered local mean
    E=[-1,-2,0,2,1];       % Edge detection
    S=[-1,0,2,0,-1];       % Spot detection
    R=[1,-4,6,-4,1];       % Ripple detection
    
    % Estimate of the mask
    LE=L'*E;
    EL=E'*L;
    LR=L'*R;
    RL=R'*L;
    ES=E'*S;
    SE=S'*E;
    SS=S'*S;
    RR=R'*R;
    LS=L'*S;
    SL=S'*L;
    EE=E'*E;
    ER=E'*R;
    RE=R'*E;
    SR=S'*R;
    RS=R'*S;
   
    Image = imread('fabric.jpg');  % Read the image

    Image = rgb2gray(Image);            % Convert to gray image
    
    subplot(4,4,1);                     % Divide image into 16 cells
    imshow(Image);                      % Display of image
    d = 5;                              % Width of window
    X = Preprocess(Image, d);
    for kernel = 1:15
        disp(kernel);
        switch kernel
            case 1
                fk = conv2(double(X),double(LE));
            case 2
                fk = conv2(double(X),double(EL));
            case 3
                fk = conv2(double(X),double(LR));
            case 4
                fk = conv2(double(X),double(RL));
            case 5
                fk = conv2(double(X),double(SS));
            case 6
                fk = conv2(double(X),double(RR));
            case 7
                fk = conv2(double(X),double(LS));
            case 8
                fk = conv2(double(X),double(SL));
            case 9
                fk = conv2(double(X),double(EE));
            case 10
                fk = conv2(double(X),double(ER));
            case 11
                fk = conv2(double(X),double(RE));
            case 12
                fk = conv2(double(X),double(SR));
            case 13
                fk = conv2(double(X),double(RS));
            case 14
                fk = conv2(double(X),double(ES));
            case 15
                fk = conv2(double(X),double(SE));
        end
        [m ,n] = size(fk);
        energyMap = Ek(fk, m, n);

        % Display of images
        subplot(4, 4, kernel + 1);
        imshow(energyMap, []);
    end
    return;
    
end