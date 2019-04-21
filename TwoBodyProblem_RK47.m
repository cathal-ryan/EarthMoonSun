function Storage = TwoBodyProblem_RK4(vec0,h,N,P)
% TwoBodyProblem_RK4(vec0,h,N): Use fourth order Runge-Kutta
% to solve two-body problem with initial state vector vec0
% Time step = h.
% Number of step taken = N.
Storage = zeros(P,N); % assign storage for N time steps of data
v = vec0; % initial conditions
Storage(:,1) = v; % store initial time/position in Storage
for count = 2:N
    tv = v; % set temporary variable, tv
    k1 = h*TwoBodyProblem_Equations(tv,P); 
    tv = v+((1/2)*k1); % update tv
    k2 = h*TwoBodyProblem_Equations(tv,P);
    tv = v+((1/2)*k2); % update tv
    k3 = h*TwoBodyProblem_Equations(tv,P);
    tv = v+k3; % update tv
    k4 = h *TwoBodyProblem_Equations(tv,P);
    v = v + ((1/6)*(k1+(2*k2)+(2*k3)+k4)); % update v
    Storage(:,count) = [v]; % store new position
end
end
