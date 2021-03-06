function output_handle = plotInputPoint(input_point,filesavedir,filename_prefix,sampleNumber,input_class)
DrawPoint='.';
check_cond=((sampleNumber>-320) && (sampleNumber<323));
%check_cond=1;

    if input_class==1
        output_handle= plot(input_point(1),input_point(2),DrawPoint,'Color',[1 0 0]);
        tmp_handle=text(input_point(1),input_point(2),['input ',num2str(sampleNumber) ],'fontsize',8);
        hold on;
    else
        output_handle= plot(input_point(1),input_point(2),DrawPoint,'Color',[0 0 1]);
        tmp_handle=text(input_point(1),input_point(2),['input ',num2str(sampleNumber) ],'fontsize',8);
        hold on;
    end
    axis equal
    axis tight
    axis([-.1 1.1 -.1 1.1]);

    %     if ((sampleNumber>470) && (sampleNumber<478))
    %         input('Press Enter');
    %     end

      ginput(1);
  
    delete(tmp_handle)


% else
%
%     output_handle ='';
% end


