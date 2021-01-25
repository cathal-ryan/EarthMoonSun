function [F] = TwoBodyProblem_Equations(vec, P)

if (P==18)
G=1.488136116e-34;
F = zeros(P,1); % set aside storage space
mm=7.34767309e22;
me=5.9722e24;
ms=1.98847e30;
rse = sqrt((vec(1,1)-vec(7,1))^2+(vec(2,1)-vec(8,1))^2+(vec(3,1)-vec(9,1))^2);
rsm = sqrt((vec(1,1)-vec(13,1))^2+(vec(2,1)-vec(14,1))^2+(vec(3,1)-vec(15,1))^2);
rme = sqrt((vec(7,1)-vec(13,1))^2 + (vec(8,1)-vec(14,1))^2 + (vec(9,1)-vec(15,1))^2) ;
F(1:3,1) = vec(4:6,1);
F(7:9,1) = vec(10:12,1);
F(13:15,1) = vec(16:18,1);
F(4:6,1) = G*((me*(vec(7:9,1)-vec(1:3,1))/rse^3)+(mm*(vec(13:15,1)-vec(1:3,1))/rsm^3));
F(10:12,1) = G*((mm*(vec(13:15,1)-vec(7:9,1))/rme^3)+(ms*(vec(1:3,1)-vec(7:9,1))/rse^3));
F(16:18,1) = G*((ms*(vec(1:3,1)-vec(13:15,1))/rsm^3)+(me*(vec(7:9,1)-vec(13:15,1))/rme^3));
end
