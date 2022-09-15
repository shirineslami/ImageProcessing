function plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat, ~)
%INV_CIPHER  Convert 16 bytes of ciphertext to 16 bytes of plaintext.
%
%   PLAINTEXT = INV_CIPHER (CIPHERTEXT, W, INV_S_BOX, INV_POLY_MAT) 
%   converts CIPHERTEXT (back) to the plaintext PLAINTEXT,
%   using the expanded cipher key W, 
%   the inverse byte substitution table INV_S_BOX, and
%   the inverse transformation matrix INV_POLY_MAT.

% If the input vector is a cell array or does not have 16 elements
if iscell (ciphertext) || numel (ciphertext) ~= 16

    % Inform user and abort
    error ('Ciphertext has to be a vector (not a cell array) with 16 elements.');
    
end

% If any element of the input vector cannot be represented by 8 bits
if any (ciphertext < 0 | ciphertext > 255)
    
    % Inform user and abort
    error ('Elements of ciphertext vector have to be bytes (0 <= ciphertext(i) <= 255).');
    
end

% If the expanded key array is a cell arrray or does not have the correct size
if iscell (w) || any (size (w) ~= [44, 4])

    % Inform user and abort
    error ('w has to be an array (not a cell array) with [44 x 4] elements.');
    
end

% If any element of the expanded key array can not be represented by 8 bits
if any (w < 0 | w > 255)
    
    % Inform user and abort
    error ('Elements of key array w have to be bytes (0 <= w(i,j) <= 255).');
    
end
% Copy the 16 elements of the input vector column-wise into the 4 x 4 state matrix
state = reshape (ciphertext, 4, 4);
   
% Copy the last 4 rows (4 x 4 elements) of the expanded key 
% into the current round key.
% Transpose to make this column-wise
round_key = (w(41:44, :))';

% Add (xor) the current round key (matrix) to the state (matrix)
state = add_round_key (state, round_key);

% Loop over 9 rounds backwards
for i_round = 9 : -1 : 1
    % Cyclically shift the last three rows of the state matrix
    state = inv_shift_rows (state);
    
    % Substitute all 16 elements of the state matrix
    % by shoving them through the S-box
    state = sub_bytes (state, inv_s_box);
    
    % Extract the current round key (4 x 4 matrix) from the expanded key
    round_key = (w((1:4) + 4*i_round, :))';

    % Add (XOR) the current round key (matrix) to the state (matrix)
    state = add_round_key (state, round_key);
    
    % Transform the columns of the state matrix via a four-term polynomial.
    % Use the same function (mix_columns) as in cipher,
    % but with the inverse polynomial matrix
    state = mix_columns (state, inv_poly_mat);
    
end

% Cyclically shift the last three rows of the state matrix
state = inv_shift_rows (state);
  
% Substitute all 16 elements of the state matrix
% by shoving them through the inverse S-box
state = sub_bytes (state, inv_s_box);

% Extract the "first" (final) round key (4 x 4 matrix) from the expanded key
round_key = (w(1:4, :))';
   
% Add (xor) the current round key (matrix) to the state (matrix)
state = add_round_key (state, round_key);

% reshape the 4 x 4 state matrix into a 16 element row vector
plaintext = reshape (state, 1, 16);