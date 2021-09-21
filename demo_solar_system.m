clear all;
close all;
clc;

AU = 149.6e6*1000;

% Sun
Sun = Planet;
Sun.name = 'Sun';
Sun.mass = 1.99e30;
Sun.radii = 6.96e8;
Sun.x = [5.5850e+08 5.5850e+08 5.5850e+08];
Sun.v = [-1.4663 11.1238 4.8370];

% Mercury
Mercury = Planet;
Mercury.name = 'Mercury';
Mercury.mass =3.30e23;
Mercury.radii = 2.44e6;
Mercury.x = [5.1979e+10 7.6928e+09 -1.2845e+09];
Mercury.v = [-1.5205e+04 4.4189e+04 2.5180e+04];

% Venus
Venus = Planet;
Venus.name = 'Venus';
Venus.mass = 4.87e24;
Venus.radii = 6.05e6;
Venus.x = [-1.5041e+10 9.7080e+10 4.4635e+10];
Venus.v = [-3.4770e+04 -5.5933e+03 -316.8994];

% Earth
Earth = Planet;
Earth.name = 'Earth';
Earth.mass = 5.97e24;
Earth.radii = 6.05e6;
Earth.x = [-1.1506e+09 -1.3910e+11 -6.0330e+10];
Earth.v = [2.9288e+04 -398.5759 -172.5873];

% Mars
Mars = Planet;
Mars.name = 'Mars';
Mars.mass = 6.42e23;
Mars.radii = 3.39e6;
Mars.x = [-4.8883e+10 -1.9686e+11 -8.8994e+10];
Mars.v = [2.4533e+04 -2.7622e+03 -1.9295e+03];

% Jupiter
Jupiter = Planet;
Jupiter.name = 'Jupiter';
Jupiter.mass = 1.90e27;
Jupiter.radii = 6.99e7;
Jupiter.x = [-8.1142e+11 4.5462e+10 3.9229e+10];
Jupiter.v = [-1.0724e+03 -1.1422e+04 -4.8696e+03];

% Saturn
Saturn = Planet;
Saturn.name = 'Saturn';
Saturn.mass = 5.68e26;
Saturn.radii = 5.82e7;
Saturn.x = [-4.2780e+5 -1.3353e+12 -5.3311e+11];
Saturn.v = [5.7288e+8 -2.4369e+03 -1.3824e+03];

% Uranus
Uranus = Planet;
Uranus.name = 'Uranus';
Uranus.mass = 8.68e26;
Uranus.radii = 2.54e7;
Uranus.x = [2.7878e+12 9.9509e+11 3.9639e+08];
Uranus.v = [-2.4913e+03 5.5197e+03 2.4527e+03];

% Neptune
Neptune = Planet;
Neptune.name = 'Neptune';
Neptune.mass = 1.02e26;
Neptune.radii = 2.46e7;
Neptune.x = [4.2097e+12 -1.3834e+12 -6.7105e+11];
Neptune.v = [1.8271e+03 4.7731e+03 1.9082e+03];

% Earth1
Earth1 = Planet;
Earth1.name = 'Earth1';
Earth1.mass = 5.97e26;
Earth1.radii = 8.05e6;
Earth1.x = [-4.2780e+11 -1.3353e+12 -5.3311e+11];
Earth1.v = [8.7288e+03 -2.4369e+03 -1.3824e+03];

% Earth2
Earth2 = Planet;
Earth2.name = 'Earth2';
Earth2.mass = 1.07e27;
Earth2.radii = 8.88e7;
Earth2.x = [-4.2780e+11 -1.3353e+12 -5.3311e+11];
Earth2.v = [5.4913e+03 -5.5197e+03 -2.4527e+03];

% Earth3
Earth3 = Planet;
Earth3.name = 'Earth3';
Earth3.mass = 9.66e26;
Earth3.radii = 5.65e6;
Earth3.x = [-9.1506e+09 -11.3910e+11 -6.0330e+10];
Earth3.v = [-1.0724e+03 -1.1422e+04 -4.8696e+03];


S = SolarSystem;
S = S.AddPlanet(Sun);
S = S.AddPlanet(Mercury);
S = S.AddPlanet(Venus);
S = S.AddPlanet(Earth);
S = S.AddPlanet(Mars);
S = S.AddPlanet(Jupiter);
S = S.AddPlanet(Saturn);
S = S.AddPlanet(Uranus);
S = S.AddPlanet(Neptune);
S = S.AddPlanet(Earth1);
S = S.AddPlanet(Earth2);
S = S.AddPlanet(Earth3);

h = figure;
hold on;

for i = 2:12
    %htxtplanets{i} = text(S.planets(i).x(1), S.planets(i).x(2), S.planets(i).x(3), S.planets(i).name);
    %hplanets{i} = plot(0,0,'or','MarkerFaceColor','r');
    c1 = S.planets(i).mass*10e-29*5;
    c2 = S.planets(i).mass*10e-29*5;
    c3 = S.planets(i).mass*10e-29*5;
    hplanets{i} = plot(0,0,'.','Markersize',30,'color',[0 c2 c3]);
end
hplanets{1} = plot(0,0,'.','Markersize',50,'color',[1 0 0]);

grid on;
view([1 1 2]);

xlabel('x');
ylabel('y');
zlabel('z');

xlim([-5e12 5e12]);
ylim([-5e12 5e12]);
zlim([-5e12 5e12]);

for k = 0 : 50*365 % 10 years!
    
    S = S.Update();
    
    for i = 1 : 12
        %set(htxtplanets{i}, 'Position', S.planets(i).x)
        set(hplanets{i}, 'XData', S.planets(i).x(1), 'YData', S.planets(i).x(2), 'ZData', S.planets(i).x(3))
    end
    
    drawnow;
end