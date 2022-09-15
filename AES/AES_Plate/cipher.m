function ciphertext = cipher (plaintext, w, s_box, poly_mat, ~)
%CIPHER  Convert 16 bytes of plaintext to 16 bytes of ciphertext.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT, W, S_BOX, POLY_MAT) 
%   converts PLAINTEXT to CIPHERTEXT,
%   using the expanded cipher key W, 
%   the byte substitution table S_BOX, and
%   the transformation matrix POLY_MAT.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT, W, S_BOX, POLY_MAT, 1) 
%   switches verbose mode on, which displays intermediate results.
%
%   PLAINTEXT has to be a vector of 16 bytes (0 <= PLAINTEXT(i) <= 255).
%   W has to be a [44 x 4]-matrix of bytes (0 <= W(i,j) <= 255).

if iscell (plaintext) || numel (plaintext) ~= 16
    % Inform user and abort
    error ('Plaintext has to be a vector (not a cell array) with 16 elements.');
    
end

% If any element of the input vector cannot be represented by 8 bits
if any (plaintext < 0 | plaintext > 255)    
    % Inform user and abort
    error ('Elements of plaintext vector have to be bytes (0 <= plaintext(i) <= 255).');
    
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
    
% Copy the 16 elements of the input vector 
% column-wise into the 4 x 4 state matrix
state = reshape (plaintext, 4, 4);
 
% Copy the first 4 rows (4 x 4 elements) of the expanded key 
% into the current round key.
% Transpose to make this column-wise
round_key = (w(1:4, :))';

% Add (xor) the current round key (matrix) to the state (matrix)
state = add_round_key (state, round_key);

% Loop over 9 rounds
for i_round = 1 : 9
    
    % Substitute all 16 elements of the state matrix
    % by shoving them through the S-box
    state = sub_bytes (state, s_box);
    
    % Cyclically shift the last three rows of the state matrix
    state = shift_rows (state);   
   
    % Transform the columns of the state matrix via a four-term polynomial
    state = mix_columns (state, poly_mat);
    
    % Extract the current round key (4 x 4 matrix) from the expanded key
    round_key = (w((1:4) + 4*i_round, :))';
   
    % Add (XOR) the current round key (matrix) to the state (matrix)
    state = add_round_key (state, round_key);
    
end

% Substitute all 16 elements of the state matrix
% by shoving them through the S-box
state = sub_bytes (state, s_box);

% Cyclically shift the last three rows of the state matrix
state = shift_rows (state);
    
% Extract the last round key (4 x 4 matrix) from the expanded key
round_key = (w(41:44, :))';
   
% Add (xor) the current round key (matrix) to the state (matrix)
state = add_round_key (state, round_key);

% reshape the 4 x 4 state matrix into a 16 element row vector
ciphertext = reshape (state, 1, 16);