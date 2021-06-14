function DataCapture(wcam, axes)  
    x= 0;
    y=0;
    height = 200;
    width=200;
    bboxes = [x y height width];
    temp = 0;
    
    while temp <= 300
        temp = temp+1;
        e = wcam.snapshot;
        %IFaces = insertObjectAnnotation(e,'rectangle',bboxes,'Processing Area');
        %IFaces= image(IFaces)
        im = image(axes, zeros(size(e), 'uint8'));
        axis(axes, 'image');
        preview(wcam,im);
        filename = strcat("C:\Users\Sravya Yepuri\Desktop\project_finalll", num2str(temp));
        filename = strcat(filename,'.bmp');
        es = imcrop(e,bboxes);
        es = imresize(es,[227,227])
        imwrite(es, filename);
        drawnow;
    end

end 


%{
            frame = snapshot(app.cam);
            im = image(app.UIAxes, zeros(size(frame), 'uint8'));
            axis(app.UIAxes, 'image');
            preview(app.cam,im);
%}