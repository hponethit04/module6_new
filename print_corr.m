function print_corr(name, x, y)
    [r, p] = corr(double(x), double(y));

    if abs(r) >= 0.5
        strength = 'Strong';
    elseif abs(r) >= 0.3
        strength = 'Moderate';
    elseif abs(r) >= 0.1
        strength = 'Weak';
    else
        strength = 'Negligible';
    end

    if r > 0
        direction = 'positive';
    else
        direction = 'negative';
    end

    if p < 0.05
        sig = 'Significant';
    else
        sig = 'Not significant';
    end

    fprintf('%s: r = %.3f (%s %s) | %s (p = %.4f)\n', ...
        name, r, strength, direction, sig, p);
end