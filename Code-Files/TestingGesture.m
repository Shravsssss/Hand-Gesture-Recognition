function TestingGesture(wcam, axes, lblOutput) 
    load myNet1;
    x=0;
    y=0;
    height=200;
    width=200;
    bboxes=[x y height width];
    while true
        e=wcam.snapshot;
        im = image(axes, zeros(size(e), 'uint8'));
        axis(axes, 'image');
        preview(wcam,im); 
        es=imcrop(e,bboxes);
        es=imresize(es,[227 227]);
        label=classify(myNet1,es);
        lblOutput.Text = char(label);
        drawnow;
    end

end