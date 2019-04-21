% declare initial positions and velocities relative to the barycentre of
% solar system
pos_sun = [ -7.558735329017875E-04 ;7.428856011015974E-03 ;-5.737173235978428E-05];
vel_sun = [-7.859449720803353E-06 ;1.979914352132652E-06 ;2.008516510572875E-07];
pos_earth =[-1.715115335386781e-01; 9.758005151474849E-01 ;0.036379644680106E-04];
vel_earth = [-1.723595211516194E-02 ;-3.045322548971216E-03 ;0.346408248909461E-07];
pos_moon = [-1.734238606952717E-01 ; 9.740726777725756E-01 ; 1.255227657142639E-04];
vel_moon = [-1.686465147855430E-02 ;-3.498039880324010E-03 ;-1.136004747701177E-05];


vec = [pos_sun;vel_sun;pos_earth;vel_earth;pos_moon;vel_moon]; % combine into 1 vector

numpoint=40000;
division=0.01;

initial4 = TwoBodyProblem_RK47(vec,0.01,4,18);
[Storage] = TwoBodyProblem_ABM4(initial4, division,numpoint,18); %call function

%plot3(Storage(1,:),Storage(2,:),Storage(3,:)) % plot
%hold on
plot3(Storage(7,:),Storage(8,:),Storage(9,:))
hold on
%plot3(Storage(13,:),Storage(14,:),Storage(15,:))
%hold on

vec_iss_pos = [3.109250386928604E-05 ;-2.167209309304857E-05 ;-2.493247423727741E-05]
vec_iss_vel = [-3.263902646263806E-04 ; 3.119408833497260E-03 ;-3.120606117154515E-03]
vec_iss = [vec_iss_pos;vec_iss_vel];
Storage_iss = TwoBodyProblem_RK47(vec_iss,0.0001,3704,6);
Storage_earthiss = Storage_iss(1:3,:) + Storage(7:9,:);
plot3(Storage_earthiss(1,:),Storage_earthiss(2,:),Storage_earthiss(3,:))


point = Storage(7:9,4)-Storage(1:3,4); % initial position of earth, relative to sun
point2 = Storage(7:9,5)-Storage(1:3,5); 
tolerance = (point-point2)*0.8;

for N=5:numpoint
    if abs((Storage(7,N)-Storage(1,N))-point(1,1)) <= tolerance(1,1)
        if abs((Storage(8,N)-Storage(2,N))-point(2,1)) <= tolerance(2,1)
            j=(N-4)*(division)
            break
        end
    end
end

moon_first_point = Storage(13:15,4)-Storage(7:9,4); % initial position of earth, relative to sun
moon_second_point = Storage(13:15,5)-Storage(7:9,5); % initial position of earth, relative to sun





xlabel('X_J (AU)') , ylabel('Y_J (AU)') , zlabel('Z_J (AU)')