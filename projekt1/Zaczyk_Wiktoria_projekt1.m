classdef Zaczyk_Wiktoria_projekt1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        TextArea  matlab.ui.control.TextArea
        Image     matlab.ui.control.Image
        Button    matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
        function ButtonPushed(app, event)
            
            %initializing images
            koloNaukowe = imread('img/koloNaukowe.jpg');
            bozon = imread('img/bozon.jpg');
            kernel = imread('img/vr.jpg');
            kerma = imread('img/kerma.jpg');
            cat = imread('img/cat.jpg');
            newBuilding = imread('img/newBuilding.jpg');
            oldBuilding = imread('img/oldBuilding.jpg');

            %change size of images
            bozon = imresize(bozon,[400 400]);
            kernel = imresize(kernel,[400 400]);
            kerma = imresize(kerma,[400 400]);
            cat = imresize(cat,[400 400]);
            newBuilding = imresize(newBuilding,[182 274]);


            z3=bozon;
            s=size(bozon,1);

            image(koloNaukowe);
            axis off;
            axis image;
            title('We have great science clubs');
            pause(3)

            image(z3);
            axis off;
            axis image;
            title(sprintf('You must not miss the physical experiments at the Bozon science club'));
            pause(4)

            for i=1:1:s(1)
                hold on;
                title(sprintf('VR ready, join the kernel science club'));
                z3(1:i,:)=kernel((s-i+1):s,:);
                image(z3);
                axis off;
                axis image;
                pause(0.003)  
            end

            for i=1:1:s(1)
                hold on;
                title(sprintf('There are also workshops for physical medics at the Kerma'));
                z3(1:i,:)=kerma((s-i+1):s,:);
                image(z3);
                axis off;
                axis image;
                pause(0.003)  
            end
            
            image(cat);
            axis off;
            axis image;
            title(sprintf('We have a department cat'));
            pause(4)
            close
            
            image(oldBuilding);
            axis off;
            axis image;
            title(sprintf('Our faculty building'));
            pause(3)
            
            image(newBuilding);
            axis off;
            axis image;
            title(sprintf('The new building of our faculty'));
            pause(3.5)
            
            %subplot for comparison 
            subplot(1,2,1);
            image(oldBuilding);
            axis off;
            axis image;

            subplot(1,2,2); 
            image(newBuilding);
            axis off;
            axis image;
            pause(3)
            close
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TextArea
            app.TextArea = uitextarea(app.UIFigure);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontName = 'Times New Roman';
            app.TextArea.FontSize = 16;
            app.TextArea.FontWeight = 'bold';
            app.TextArea.Position = [35 263 568 105];
            app.TextArea.Value = {'The faculty conducts studies full-time: 1st and 2nd degree:'; '- medical physics,'; '- technical physics '; '- applied computer science, '; '-micro- and nanotechnologies in biophysics'};

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.VerticalAlignment = 'top';
            app.Image.Position = [35 367 568 104];
            app.Image.ImageSource = 'img/wfiis.png';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [271 169 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Zaczyk_Wiktoria_projekt1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end