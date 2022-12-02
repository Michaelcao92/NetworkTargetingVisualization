%% Ref 
% Cao, Z.#, Xiao, X.#, Zhao, Y., Jiang, Y., Xie, C., Paille?re-Martinot, M-L., Artiges, E., Li. Z., Daskalakis, Z., Yang, Y., * & Zhu, C.* (2022). 
% Targeting the pathological network: feasibility of network-based optimization of transcranial magnetic stimulation coil placement for treatment of psychiatric disorders.
% Preprint: https://www.biorxiv.org/content/10.1101/2022.10.23.513193v1

function plotParaCPC(m, cpc, loca)

%%
view_angle3 = -129;
view_angle4 = 22;

shrink_f = 1.043;

h = figure('Color',[1 1 1]);

warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');	
jFrame = get(h,'JavaFrame');
pause(0.1);				
set(jFrame,'Maximized',1);	
pause(0.1);				
warning('on','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');

%% plot brain
Tr=m.triangles;
Nodes=m.nodes;

TR_Index=m.triangle_regions;
scalp_trIndex=find(TR_Index==1002); % brain triangular

face_color = [0.6 0.6 0.6];
trisurf(double(Tr(scalp_trIndex,:)),Nodes(:,1),Nodes(:,2),Nodes(:,3), ...
     'FaceColor',face_color,'FaceAlpha',0.9,'EdgeColor','none');
axis equal
hold on  


%% plot scalp
TR_Index=m.triangle_regions;
scalp_trIndex=find(TR_Index==1005); % scalp triangular

face_color = [255 125 64]/255;

hold on;
Nodes2 = Nodes./shrink_f;
trisurf(double(Tr(scalp_trIndex,:)),Nodes2(:,1),Nodes2(:,2),Nodes2(:,3), ...
     'FaceColor',face_color,'FaceAlpha',0.04,'EdgeColor','none');
axis equal
hold on  


%% plot cpc
face_color = [0.9 0.9 0.9];

hold on;
trisurf(cpc.F+1,cpc.V(:,1),cpc.V(:,2),cpc.V(:,3), ...
     'FaceColor',face_color,'FaceAlpha',0.6,'EdgeColor','k','EdgeAlpha',0);
 
%% plot head locations
origin_loca = cpc.V(loca.Origin_cpcID,:);
interp_loca = cpc.V(loca.Interp_cpcID,:);

hold on;
h2 = scatter3(origin_loca(:,1),origin_loca(:,2),origin_loca(:,3),'ko','MarkerFaceColor','k');
hold on;
h5 = scatter3(interp_loca(:,1),interp_loca(:,2),interp_loca(:,3),'Marker','.','MarkerEdgeColor',[0.5 0.5 0.5]);
h5.SizeData = 1;

%% lighting around
grid off; 
box off;
axis off;

lighting gouraud
hlight=camlight('headlight');
set(gca,'UserData',hlight);
hrot = rotate3d;
set(hrot,'ActionPostCallback',@(~,~)camlight(get(gca,'UserData'),'headlight'));

view(view_angle3,view_angle4)
lightangle(view_angle3,view_angle4);


end