function sample_plot(n)
hold on
for i = 1:n
    plot([0, i - n - 1], [i, 0],'b')
    plot([0, -i + n + 1], [i, 0],'b')
    plot([i , 0], [0, i - n - 1],'b')
    plot([-i , 0], [0, i - n - 1],'b')
end
plot([0, 10], [0, 0],'b')
plot([0, 0], [0, 10],'b')
plot([0, -10], [0, 0],'b')
plot([0, 0], [0, -10],'b')
hold off
end