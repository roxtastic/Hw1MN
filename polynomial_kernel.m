function retval = polynomial_kernel(x, y, d)
    % Această funcție implementează funcția pentru kernelul polinomial.
    retval = (1 + y * x') ^ d;
end
