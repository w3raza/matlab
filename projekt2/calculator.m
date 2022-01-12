function varargout = calculator(varargin)
% CALCULATOR MATLAB code for calculator.fig
%      CALCULATOR, by itself, creates a new CALCULATOR or raises the existing
%      singleton*.
%
%      H = CALCULATOR returns the handle to a new CALCULATOR or the handle to
%      the existing singleton*.
%
%      CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR.M with the given input arguments.
%
%      CALCULATOR('Property','Value',...) creates a new CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calculator

% Last Modified by GUIDE v2.5 12-Jan-2022 14:04:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @calculator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before calculator is made visible.
function calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculator (see VARARGIN)

% Choose default command line output for calculator
handles.output = hObject;
format long g;
handles.temp=0;
handles.op='none';
handles.dot=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function screen_Callback(hObject, eventdata, handles)
% hObject    handle to screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of screen as text
%        str2double(get(hObject,'String')) returns contents of screen as a double


% --- Executes during object creation, after setting all properties.
function screen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plus.
function plus_Callback(hObject, eventdata, handles)
% hObject    handle to plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.temp=str2double(get(handles.screen,'String'));
handles.op='plus';
handles.dot=0;
set(handles.screen,'String','0');
guidata(hObject,handles);

% --- Executes on button press in minus.
function minus_Callback(hObject, eventdata, handles)
% hObject    handle to minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.temp=str2double(get(handles.screen,'String'));
handles.op='minus';
handles.dot=0;
set(handles.screen,'String','0');
guidata(hObject,handles);

% --- Executes on button press in multiply.
function multiply_Callback(hObject, eventdata, handles)
% hObject    handle to multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.temp=str2double(get(handles.screen,'String'));
handles.op='multiply';
handles.dot=0;
set(handles.screen,'String','0');
guidata(hObject,handles);

% --- Executes on button press in divide.
function divide_Callback(hObject, eventdata, handles)
% hObject    handle to divide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.temp=str2double(get(handles.screen,'String'));
handles.op='divide';
handles.dot=0;
set(handles.screen,'String','0');
guidata(hObject,handles);

% --- Executes on button press in root.
function root_Callback(hObject, eventdata, handles)
% hObject    handle to root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
if(stackVariable>0)
    stackVariable=sqrt(stackVariable);
else
    stackVariable='E';
end;
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.temp=str2double(get(handles.screen,'String'));
% handles.op='power';
% if rem(stackVariable,1)==0
%     handles.dot=0;
% else
%     handles.dot=1;
% end;
set(handles.screen,'String',num2str(str2num(get(handles.screen, 'String'))^2));
guidata(hObject,handles);

% --- Executes on button press in e.
function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dot=1;
set(handles.screen,'String','2.71828183');
guidata(hObject,handles);

% --- Executes on button press in pi.
function pi_Callback(hObject, eventdata, handles)
% hObject    handle to pi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dot=1;
set(handles.screen,'String','3.14159265');
guidata(hObject,handles);

% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
if(stackVariable>0)
    stackVariable=log10(stackVariable);
else
    stackVariable='E';
end;
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in ePower.
function ePower_Callback(hObject, eventdata, handles)
% hObject    handle to ePower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dot=0;
stackVariable=str2double(get(handles.screen,'String'));
stackVariable=power(2.7182818,stackVariable);
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in factorial.
function factorial_Callback(hObject, eventdata, handles)
% hObject    handle to factorial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
stackVariable=factorial(stackVariable);
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in ln.
function ln_Callback(hObject, eventdata, handles)
% hObject    handle to ln (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
if(stackVariable>0)
    stackVariable=log(stackVariable);
else
    stackVariable='E';
end;
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in sin.
function sin_Callback(hObject, eventdata, handles)
% hObject    handle to sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
stackVariable=sin(stackVariable);
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in cos.
function cos_Callback(hObject, eventdata, handles)
% hObject    handle to cos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
stackVariable=cos(stackVariable);
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in tan.
function tan_Callback(hObject, eventdata, handles)
% hObject    handle to tan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
stackVariable=tan(stackVariable);
if rem(stackVariable,1)==0
    handles.dot=0;
else
    handles.dot=1;
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number7.
function number7_Callback(hObject, eventdata, handles)
% hObject    handle to number7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'7');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number8.
function number8_Callback(hObject, eventdata, handles)
% hObject    handle to number8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'8');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number9.
function number9_Callback(hObject, eventdata, handles)
% hObject    handle to number9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'9');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number4.
function number4_Callback(hObject, eventdata, handles)
% hObject    handle to number4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'4');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number5.
function number5_Callback(hObject, eventdata, handles)
% hObject    handle to number5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'5');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number6.
function number6_Callback(hObject, eventdata, handles)
% hObject    handle to number6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'6');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number1.
function number1_Callback(hObject, eventdata, handles)
% hObject    handle to number1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'1');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);


% --- Executes on button press in number2.
function number2_Callback(hObject, eventdata, handles)
% hObject    handle to number2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'2');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number3.
function number3_Callback(hObject, eventdata, handles)
% hObject    handle to number3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'3');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in number0.
function number0_Callback(hObject, eventdata, handles)
% hObject    handle to number0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
stackVariable=strcat(stackVariable,'0');
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in dot.
function dot_Callback(hObject, eventdata, handles)
% hObject    handle to dot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if strcmp(stackVariable,'')
    stackVariable='0.';
else
    if(handles.dot==0)
        handles.dot=1
        stackVariable=strcat(stackVariable,'.');
    end;
    
end;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in equals.
function equals_Callback(hObject, eventdata, handles)
% hObject    handle to equals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=str2double(get(handles.screen,'String'));
switch handles.op
    case 'none'
        stackVariable=handles.temp;
    case 'plus'
        stackVariable=stackVariable+handles.temp;
    case 'minus'
        stackVariable=handles.temp-stackVariable;
    case 'multiply'
        stackVariable=handles.temp*stackVariable;
    case 'divide'
        stackVariable=handles.temp/stackVariable;
    case 'power'
        stackVariable=handles.temp^stackVariable;
        
end;
handles.dot=0;
set(handles.screen,'String',stackVariable);
guidata(hObject,handles);

% --- Executes on button press in once.
function once_Callback(hObject, eventdata, handles)
% hObject    handle to once (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stackVariable=get(handles.screen,'String');
if(strcmp(stackVariable,'0')||strcmp(stackVariable,'E'))stackVariable=''; 
end;
if(strcmp(stackVariable(end-1:end),'.'))
    handles.dot=0;
end;
stackVariable=stackVariable(1:end-1);
set(handles.screen , 'String', stackVariable);
guidata(hObject,handles);

% --- Executes on button press in rand.
function rand_Callback(hObject, eventdata, handles)
% hObject    handle to rand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dot=1;
set(handles.screen,'String',rand(1));
guidata(hObject,handles);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dot=0;
handles.op='none';
handles.temp=0;
set(handles.screen,'String','0');
guidata(hObject,handles);
