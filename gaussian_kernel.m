function retval = gaussian_kernel(x, y, sigma)
    % This function implements the Gaussian kernel function.
    retval = exp((-norm(x - y)^2) / (2*sigma^2));
end
