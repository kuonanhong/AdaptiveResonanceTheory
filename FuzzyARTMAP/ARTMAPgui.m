function varargout = ARTMAPgui(varargin)
% MYGUI Brief description of GUI.
%       Comments displayed at the command line in response
%       to the help command.

% (Leave a blank line following the help.)

%  Initialization tasks

guiValues = struct('name', {'Fuzzy ARTMAP'}, ... % Number of GUI
    'position', {[5 35 650 650]}, ... % Position of GUI on screen
    'resize',{'on'},... % Attention gain parameter
    'icon_location',{'fuzzy_ARTMAP.png'}); % Attention gain parameter


fh = figure('Visible','off','Name',guiValues.name,'Position',guiValues.position,'Resize',guiValues.resize);

set(fh,'MenuBar','none') %Hides standard menu bar
mh_1=uimenu(fh,'Label','Model','Callback',{@mh1_callback});

mh_2=uimenu(fh,'Label','Articles');

mh_2_1=uimenu(mh_2,'Label','Adaptive pattern classification and universal recording I (1976)','Callback',{@mh2_1_callback});
mh_2_2=uimenu(mh_2,'Label','Adaptive pattern classification and universal recording II (1976)','Callback',{@mh2_2_callback});
mh_2_3=uimenu(mh_2,'Label','Category learning and adaptive pattern recognition (1985)','Callback',{@mh2_3_callback});
mh_2_4=uimenu(mh_2,'Label','ART 2 (1987)','Callback',{@mh2_4_callback});
mh_2_5=uimenu(mh_2,'Label','The ART of adaptive pattern recognition (1988)','Callback',{@mh2_5_callback});
mh_2_6=uimenu(mh_2,'Label','Fuzzy ART: Fast stable learning and categorization of analog patterns by an adaptive resonance system (1991)','Callback',{@mh2_6_callback});
mh_2_7=uimenu(mh_2,'Label','Fuzzy ARTMAP: A neural network architecture for incremental supervised learning of analog multidimensional maps (1992)','Callback',{@mh2_7_callback});


mh_3=uimenu(fh,'Label','Tutorial');

mh_3_1=uimenu(mh_3,'Label','Abstract','Callback',{@mh3_1_callback});
mh_3_2=uimenu(mh_3,'Label','Tutorial','Callback',{@mh3_2_callback});

%mh_4=uimenu(fh,'Label','Examples','Callback',{@mh4_callback});
mh_4=uimenu(fh,'Label','Examples','Callback',{@mh5_callback});


mh_5=uimenu(fh,'Label','Run','Callback',{@mh5_callback});

%mh_6=uimenu(fh,'Label','Code','Callback',{@mh6_callback});
%mh_7=uimenu(fh,'Label','Help','Callback',{@mh7_callback});

mh_6=uimenu(fh,'Label','Code');
mh_7=uimenu(fh,'Label','Help');


mh_7_1=uimenu(mh_7,'Label','How To Run','Callback',{@mh7_1_callback});
mh_7_2=uimenu(mh_7,'Label','Contact','Callback',{@mh7_2_callback});
mh_7_3=uimenu(mh_7,'Label','License','Callback',{@mh7_3_callback});
mh_7_4=uimenu(mh_7,'Label','Credit','Callback',{@mh7_4_callback});


mh_8=uimenu(fh,'Label','Exit','Callback',{@mh8_callback});

% IMAGE: Set size depending on scale image
ah_1 = axes('Parent',fh,'Units','pixels','Position',[10 10 600 600]);
im=double(imread(guiValues.icon_location))/255;
imshow(im);

%LEGEND: Set name of GUI
uch_1=uicontrol('Parent',fh,'Style','text','String',guiValues.name,...
    'Position',[200 702-120 450 60],'fontsize',36,'fontName','Helvetica','fontweight','bold',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[183 46 14]/255,'horizontalalignment','left');
%get(uch_1)

%INPUTS PANEL:

ph_1=uipanel('Parent',fh,'Title','Model Parameters',...
    'units','pixels','Position',[10 702-575 300 300],'fontsize',16,'fontName','Helvetica','fontweight','bold',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[14 46 153]/255,'visible','off');
%set(ah_1,'Position',[10 702-180 180 180]);


%INPUT PARAMETERS:


%=========
desch_2 = uicontrol('Parent',ph_1,'Style','text','String','vigilance rhobar : range [0,1]',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'fontweight','bold','horizontalalignment','right');
set(desch_2,'Position',get(desch_2,'position').*[1 1 0 1]+[0 0 160 0]);

%get(desch_2)

%rho%
%uch_2=uicontrol('Parent',ph_1,'Style','slider',...
 %   'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],...
  %  'min',0,'max',1,'sliderstep',[.01 .05],'value',0,'position',get(desch_2,'position').*[ 1 1 0 0]+[100 0 120 20]);

uch_2=uicontrol('Parent',ph_1,'Style','edit','String','0',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_2,'position').*[ 1 1 0 0]+[170 0 35 20]);


%========



%=========
desch_3 = uicontrol('Parent',ph_1,'Style','text','String','alpha : range (0,inf)',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*1 160 20]);
%alpha%
uch_3=uicontrol('Parent',ph_1,'Style','edit','String','10^-8',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_3,'position').*[ 1 1 0 0]+[170 0 35 20]);
%=========


%=========
desch_4 = uicontrol('Parent',ph_1,'Style','text','String','beta : range [0,1]',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*2 160 20]);
%beta%
uch_4=uicontrol('Parent',ph_1,'Style','edit','String','1',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_4,'position').*[ 1 1 0 0]+[170 0 35 20]);
%=========

%=========
desch_5 = uicontrol('Parent',ph_1,'Style','text','String','gamma : range (-1,1)',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*3 160 20]);

%gamma%
uch_5=uicontrol('Parent',ph_1,'Style','edit','String','10^-7',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_5,'position').*[ 1 1 0 0]+[170 0 35 20]);
%=========

%=========
desch_6 = uicontrol('Parent',ph_1,'Style','text','String','epsilon : range (-1 1)',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*4 160 20]);



% deschText_6 = text('Parent',fh,'String','\epsilon',...
%     'horizontalalignment','right','fontweight','bold',...
%     'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*4 100 20]);


%epsilon%
uch_6=uicontrol('Parent',ph_1,'Style','edit','String','0',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_6,'position').*[ 1 1 0 0]+[170 0 35 20]);
%=========


%=========
desch_7 = uicontrol('Parent',ph_1,'Style','text','String','epochs',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*5 160 20]);
%epochs%
uch_7=uicontrol('Parent',ph_1,'Style','edit','String','1',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_7,'position').*[ 1 1 0 0]+[170 0 35 20]);
%=========


%=========
desch_8 = uicontrol('Parent',ph_1,'Style','text','String','Data Source',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'horizontalalignment','right','fontweight','bold',...
    'position',get(desch_2,'position').*[ 1 1 0 0]+[0 35*6 160 20]);

uch_8=uicontrol('Parent',ph_1,'Style','popup','String',...
    {'Circle in Square (sparse)','Circle in Square (dense)',...
    'Stripes (sparse)','Stripes (dense)',...
    'Checkerboard (sparse)','Checkerboard (dense)',...
    'Boston (Test on strip 1)','Boston (Test on strip 2)','Boston (Test on strip 3)','Boston (Test on strip 4)',...
    'Netflix Genre Prediction (training time ~10 minutes on a 2 gigahertz/ 2 GB RAM machine )'},...
    'value',1,'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(desch_8,'position').*[ 1 1 0 0]+[250 0 100 20]);
%=========



align([desch_2 desch_3 desch_4 desch_5 desch_6 desch_7 desch_8],'right','none');
align([uch_2 uch_4 uch_5 uch_6 uch_2 uch_7 uch_8],'left','none');


%========RUN PANEL=======

ph_2=uipanel('Parent',fh,'Title','',...
    'units','pixels','Position',[10 702-675 300 60],'fontsize',16,'fontName','Helvetica','fontweight','bold',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[14 46 153]/255,'visible','off');


uch_2_1=uicontrol('Parent',ph_2,'Style','radio','String',...
    'Step through each input presentation',...
    'value',0,'backgroundColor',[1 1 1],'foregroundColor',[0 0 0]);
set(uch_2_1,'Position',get(uch_2_1,'position').*[1 1 0 1]+[0 0 200 0]);


uch_2_2=uicontrol('Parent',ph_2,'Style','push','String',...
    'Run',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'position',get(uch_2_1,'position').*[ 1 1 0 0]+[220 0 40 20],'callback',{@uch_2_2_callback});
%=========

get(uch_2_1);

align([uch_2_1 uch_2_2],'top','none');


%========OUTPUT FIGURE PANEL=======

ph_3=uipanel('Parent',fh,'Title','Output',...
    'units','pixels','Position',[10 10 500 500],'fontsize',16,'fontName','Helvetica','fontweight','bold',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[14 46 153]/255,'visible','off');

desch_3_2 = uicontrol('Parent',ph_3,'Style','text','String','Left click to step through network training',...
    'backgroundColor',[.8 .8 .8],'foregroundColor',[0 0 0],'fontweight','bold','horizontalalignment','right');
set(desch_3_2,'Position',get(desch_3_2,'position').*[0 0 0 1]+[10 455 280 0]);
set(desch_3_2,'Visible','off')

ah_3_1 = axes('Parent',ph_3,'Position',[.1 .1 .82 .82]);

uch_3_1=uicontrol('Parent',ph_3,'Style','push','String',...
    'Continue',...
    'backgroundColor',[1 1 1],'foregroundColor',[0 0 0],'Callback',{@uch_3_1_callback});







%========OUTPUT FIGURE PANEL=======

set(fh,'Visible','on');
set(ph_1,'Visible','off');
set(ph_2,'Visible','off');
set(ph_3,'Visible','off');
%  Construct the components

%  Initialization tasks

%  Callbacks for ARTMAPgui


%RUN (MENU)%


    function mh1_callback(hObject,eventdata)
        set(ah_1,'Position',[10 702-220 180 180]);
        set(ph_1,'Visible','on');
        set(ph_2,'Visible','on');
        set(ph_3,'Visible','off');
    end



%========ARTICLES (MENU) :=======%

    function mh2_1_callback(hObject,eventdata)
        open('Articles/Gro1976BiolCyb_I.pdf')
    end

    function mh2_2_callback(hObject,eventdata)
        open('Articles/Gro1976BiolCyb_II.pdf')
    end

    function mh2_3_callback(hObject,eventdata)
        open('Articles/CarpGrossARO.pdf')
    end

    function mh2_4_callback(hObject,eventdata)
        open('Articles/carpgrossART2.pdf')
    end

    function mh2_5_callback(hObject,eventdata)
        open('Articles/carpenter_grossberg_SRT_2003.pdf')
    end


    function mh2_6_callback(hObject,eventdata)
        open('Articles/carp_gross_rosen1991.pdf')
    end


    function mh2_7_callback(hObject,eventdata)
        open('Articles/CarpGrossReyn1993.pdf')
    end

%========ARTICLES (MENU) :=======%



%========TUTORIAL (MENU) :=======%

    function mh3_1_callback(hObject,eventdata)
        open('Articles/Abstract.pdf')
    end

    function mh3_2_callback(hObject,eventdata)
        open('Articles/Tutorial.pdf')
    end

%========TUTORIAL (MENU) :=======%


%========HELP (MENU) :=======%

    function mh7_1_callback(hObject,eventdata)
        open('Readme.html')
    end

    function mh7_2_callback(hObject,eventdata)
        open('Contact.html')
    end

    function mh7_3_callback(hObject,eventdata)
        open('License.html')
    end

    function mh7_4_callback(hObject,eventdata)
        open('Credits.html')
    end


%========HELP (MENU) :=======%

%RUN (MENU)%
    function mh5_callback(hObject,eventdata)
        set(ah_1,'Position',[10 702-220 180 180]);
        set(ph_1,'Visible','on');
        set(ph_2,'Visible','on');
        set(ph_3,'Visible','off');

    end

%EXIT%
    function mh8_callback(hObject,eventdata)
        display Goodbye
        close(gcbf)
    end

%RUN (MENU)%
    function uch_2_2_callback(hObject,eventdata)
        cla(ah_3_1);
        set(ph_1,'Visible','off');
        set(ph_2,'Visible','off');
        set(ph_3,'Visible','on');
        set(uch_3_1,'Visible','on')
        set(desch_3_2,'String','training and testing....')
        set(desch_3_2,'Visible','on')

        init_vals.rho=str2num(get(uch_2,'String'));
        init_vals.alpha=str2num(get(uch_3,'String'));
        init_vals.beta=str2num(get(uch_4,'String'));
        init_vals.gamma=str2num(get(uch_5,'String'));
        init_vals.epsilon=str2num(get(uch_6,'String'));
        init_vals.epochs=str2num(get(uch_7,'String'));
        init_vals.datasrc=get(uch_8,'Value');
        init_vals.plot_steps=get(uch_2_1,'Value');
        set(uch_3_1,'Visible','off')
        if (init_vals.plot_steps==1)

            set(desch_3_2,'Visible','on')
        end

        fuzzyARTMAP_examplesWrapper(init_vals);
        set(desch_3_2,'Visible','off')
        set(desch_3_2,'String','Left click to step through network training')
        figure(fh)
    end


%========OUTPUT FIGURE PANEL : CONTINUE (MENU)=======%
    function uch_3_1_callback(hObject,eventdata)
        %Make axes for output as current axes%
        disp('Here');
        axes(ah_3_1);
        if strcmp(get(uch_3_1,'string'),'continue')
            set(uch_3_1,'string','pause');
        else
            set(uch_3_1,'string','continue');
        end

        %Add text here%
        ax_val=axis;
        text(.5*(ax_val(1)+ax_val(2)),1.05*(ax_val(3)+ax_val(4)),'Adding caption here for educational purposes.'...
            ,'horizontalalignment','center','fontweight','bold');
    end
%========OUTPUT FIGURE PANEL : CONTINUE (MENU)=======%

%  Utility functions for ARTMAPgui

end