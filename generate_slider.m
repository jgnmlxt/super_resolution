function slider=generate_slider(larger_pixel,compressing_factor)
    % Define sizes
    small_pixels=larger_pixel*compressing_factor;
    slider=cell(compressing_factor,compressing_factor);
    
    % Generate base
    base=zeros(small_pixels^2,(larger_pixel+compressing_factor-1)^2);
    counter=0;

    % image_index1=images required after image_index1 shift vertically.
    for image_index1=1:compressing_factor
        disp(image_index1);
        % images required after image_index2 shift horizontally.
        for image_index2=1:compressing_factor
            counter=counter+1;
            temp_slider=cell(larger_pixel,larger_pixel);
            counter_inside=0;
            % for each large pixel in obtained image
            for i=1:larger_pixel
                for j=1:larger_pixel
                    temp=base;
                    temp((i-1)*compressing_factor+1+image_index1-1:i*compressing_factor+image_index1-1,(j-1)*compressing_factor+1+image_index2-1:j*compressing_factor+image_index2-1)=1;
                    temp_slider{i,j}=reshape(temp',1,[]);
                    counter_inside=counter_inside+1;
                end
            end
            slider{1+(counter-1)*larger_pixel^2+(larger_pixel+compressing_factor-1)*(counter_inside-1):1+(counter-1)*larger_pixel^2+(larger_pixel+compressing_factor-1)*counter_inside}=temp_slider;
        end
        
    end
end
