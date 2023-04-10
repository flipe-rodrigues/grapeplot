# grapeplot
 MATLAB function for creating scatter plots that resemble bunches of grapes (see example below).
 ```matlab
% generate data
m = 3e3;
x = randn(m,1);
y = randn(m,1);

% built-in scatter (default settings)
subplot(1,4,1);
scatter(x,y);

% grapeplot (default settings)
subplot(1,4,2);
grapeplot(x,y);

% grapeplot (graded marker sizes)
subplot(1,4,3);
sz = sqrt(x.^2 + y.^2);
sz = (sz - min(sz)) / range(sz);
sz = (1 - sz) * 5 + 1;
grapeplot(x,y,...
   'markeredgecolor',[0,0,0],...
   'markerfacecolor',[1,1,1],...
   'markersize',sz);

% grapeplot (graded marker sizes & colors)
subplot(1,4,4);
c = sz;
grapeplot(x,y,...
   'markeredgecolor',[0,0,0],...
   'markerfacecolor',c,...
   'markersize',sz);
 ```
![demo](https://user-images.githubusercontent.com/20165837/230928088-d032f2c4-f8ae-4593-8c73-24d1dd340981.png)
