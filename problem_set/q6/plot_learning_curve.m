
% A log plot may show the convergence better, as the learning curve is
% typically jagged even on convergence.
figure;
hold on;

log2_tstf = log2(time_steps_to_failure);
% 画出迭代次数和可运行次数的曲线图。
plot(log2_tstf,'k');
 
% compute simple moving average
window = 50;
i = 1:window;
w = ones(1,window) ./ window;
% 这一步要干嘛我不是很清楚。
weights = filter(w,1,log2_tstf); 
    
x1 = window/2:size(log2_tstf,2)-(window/2);
h = plot(x1,weights(window:size(log2_tstf,2)), 'r--'); 
set(h, 'LineWidth', 2);

