function bytes_out = sub_bytes (bytes_in, s_box)
%SUB_BYTES  Nonlinear byte substitution using a substitution table.
%
%   BYTES_OUT = SUB_BYTES (BYTES_IN, S_BOX) 
%   transforms the input array BYTES_IN 
%   into the output array BYTES_OUT
%   using the substitution table S_BOX.
%
%   BYTES_IN has to be an array of bytes (0 <= BYTES_IN(i) <= 255).

%applies the S-box to one or more input bytes bytes_in and truly manifests
bytes_out = s_box (bytes_in + 1);
