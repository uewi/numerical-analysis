function epsa = rounda(a)
epsa = a;
a_p_epsa = a + epsa;
while a_p_epsa > a
    epsa = epsa / 2;
    a_p_epsa = a + epsa;
end
epsa = 2* epsa;
end