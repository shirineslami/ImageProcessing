function state_out = mix_columns (state_in, poly_mat)
%MIX_COLUMNS  Transform each column of the state matrix.
%
%   STATE_OUT = MIX_COLUMNS (STATE_IN, POLY_MAT) 
%   operates on the state matrix STATE_IN column-by-column
%   using POLY_MAT as the transformation matrix.

% Define the irreducible polynomial 
% to be used in the modulo operation in poly_mult
mod_pol = bin2dec ('100011011');

% Loop over all columns of the state matrix
for i_col_state = 1 : 4
        
    % Loop over all rows of the state matrix
    for i_row_state = 1 : 4

        % Initialize the scalar product accumulator
        temp_state = 0;
        
        for i_inner = 1 : 4
        
            % Multiply (GF(2^8) polynomial multiplication)
            % the current element of the current row vector of poly_mat with
            % the current element of the current column vector of the state matrix
            temp_prod = poly_mult (...
                        poly_mat(i_row_state, i_inner), ...
                        state_in(i_inner, i_col_state), ...
                        mod_pol);
            
            % Add (XOR) the recently calculated product
            % to the scalar product accumulator
            temp_state = bitxor (temp_state, temp_prod);
                        
        end
        
        % Declare (save and return) the final scalar product accumulator
        % as the current state matrix element
        state_out(i_row_state, i_col_state) = temp_state;
        
    end
    
end