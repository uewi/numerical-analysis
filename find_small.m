function [small_positive, m] = find_small()
small_positive = 1;
small_positive_divided_by_two = small_positive/2;
m = 1;
while small_positive_divided_by_two ~= 0
    small_positive = small_positive_divided_by_two;
    small_positive_divided_by_two = small_positive/2;
    m = m + 1;
end
m = -m
end
