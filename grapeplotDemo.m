%% initialization
close all;
clear;
clc;

%% generate "data"
m = 3e3;
x = randn(m,1);
y = randn(m,1);

%% figure initialization
figure(...
    'name',mfilename,...
    'numbertitle','off',...
    'color','w');

%% axes initialization

% axes layout
n_rows = 1;
n_cols = 4;
n_sps = n_rows * n_cols;
sps = gobjects(n_sps,1);
for ii = 1 : n_sps
    sps(ii) = subplot(n_rows,n_cols,ii);
end

% axes settings
set(sps,...
    'xlim',[min(x),max(x)]+[-1,1]*.05*range(x),...
    'ylim',[min(y),max(y)]+[-1,1]*.05*range(y),...
    'xtick',[],...
    'ytick',[],...
    'linewidth',2,...
    'fontsize',10,...
    'plotboxaspectratio',[1,1,1],...
    'colormap',gray(2^8-1),...
    'xlimspec','tight',...
    'ylimspec','tight',...
    'color','none',...
    'xcolor','k',...
    'ycolor','k',...
    'nextplot','add',...
    'layer','bottom',...
    'tickdir','out',...
    'clipping','on',...
    'box','off');

% axes labels
title(sps(1),'built-in scatter (default)');
title(sps(2),'grapeplot (default)');
title(sps(3),'grapeplot (graded size)');
title(sps(4),'grapeplot (graded size & color)');
arrayfun(@(ax)xlabel(ax,'x (a.u.)'),sps);
arrayfun(@(ax)ylabel(ax,'y (a.u.)'),sps);

% axes linkage
linkaxes(sps);

%% scatter plots

% default scatter
scatter(sps(1),x,y,'k',...
    'parent',sps(1));

% default grapeplot
grapeplot(x,y,...
    'parent',sps(2));

% grapeplot with graded marker sizes
sz = sqrt(x.^2 + y.^2);
sz = (sz - min(sz)) / range(sz);
sz = (1 - sz) * 5 + 1;
grapeplot(x,y,...
    'markersize',sz,...
    'parent',sps(3));

% grapeplot with graded marker colors
c = sz;
grapeplot(x,y,...
    'markersize',sz,...
    'markerfacecolor',c,...
    'parent',sps(4));