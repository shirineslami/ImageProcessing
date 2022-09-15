function inv_ip_box = ip_box_inversion(ip_box)
% This function genarates the inverse of ip_box that is the last step of
% encryption.
%   [INV_IP_BOX] = IP_BOX_INVERSION (IP_BOX) 
%   creates the inverse ip-box
%   from the previously created ip-box.

%inv_ip_box = zeros(64);

% Loop over all byte values
for i = 1 : 64

    % Create the inverse IP-box by taking the values 
    % of the elements of the IP-Box as indices:
    % e.g.: ip_box(0) = 58   ==>   inv_ip_box(58) = 0
    % (except the fact, that Matlab vectors start at 1...)
    inv_ip_box(ip_box(i) ) = i ;
    
end