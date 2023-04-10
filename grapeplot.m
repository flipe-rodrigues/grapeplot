function h = grapeplot(x,y,params)
    %GRAPEPLOT Summary of this function goes here
    %   Detailed explanation goes here

    arguments
        x (:,:) double
        y (:,:) double
        params.marker (1,1) string {...
            mustBeMember(params.marker,{'o','s','v','^','p'})} = 'o'
        params.markersize (:,:) double = 5
        params.markeredgecolor (:,:) double = [0,0,0]
        params.markerfacecolor (:,:) double = [1,1,1]
        params.linewidth (1,1) {mustBeNumeric} = 1
        params.labels (:,:) cell = repmat({''},max(numel(x),numel(y)),1)
        params.parent (1,1) matlab.graphics.axis.Axes = gca
    end

    % store the value of the "next plot" property of the parent axes
    nextplotopt = get(params.parent,'nextplot');

    % switch the "next plot" behavior to "add" (equivalent to "hold on")
    set(params.parent,'nextplot','add');

    % graphical object preallocation
    h = gobjects(2,1);

    % plot marker edges
    h(1) = scatter(x,y,...
        (params.markersize+params.linewidth).^2,...
        params.markeredgecolor,...
        'marker',params.marker,...
        'markeredgecolor','flat',...
        'markerfacecolor','none',...
        'linewidth',params.linewidth,...
        'hittest','off',...
        'parent',params.parent);

    % plot marker faces
    h(2) = scatter(x,y,...
        params.markersize.^2,...
        params.markerfacecolor,...
        'marker',params.marker,...
        'markeredgecolor','none',...
        'markerfacecolor','flat',...
        'linewidth',params.linewidth,...
        'parent',params.parent);

    % label each marker if labels were specified
    if any(cellfun(@(lbl)~isempty(lbl),params.labels))
        dtt = h(2).DataTipTemplate;
        dtt.DataTipRows(end+1) = dataTipTextRow('label',params.labels);
    end

    % reset the "next plot" property to its original value
    set(params.parent,'nextplot',nextplotopt);
end