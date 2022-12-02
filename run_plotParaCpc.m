%% Ref 
% Cao, Z.#, Xiao, X.#, Zhao, Y., Jiang, Y., Xie, C., Paille?re-Martinot, M-L., Artiges, E., Li. Z., Daskalakis, Z., Yang, Y., * & Zhu, C.* (2022). 
% Targeting the pathological network: feasibility of network-based optimization of transcranial magnetic stimulation coil placement for treatment of psychiatric disorders.
% Preprint: https://www.biorxiv.org/content/10.1101/2022.10.23.513193v1
%%

clear
close all

load('Demo_Msh_Data') %% Generate the msh with SimNIBS, load msh file and save msh file (please see the codes below)
% %%%  Segment subject head nii to msh
% command2 = ['headreco all --cat demo demo_t1.nii.gz'];
% system(command2);
% 
% %%%  Extract and save msh
% m = mesh_load_gmsh4(['demo.msh']);
% save(['Demo_Msh_Data'],'m'); 

cpc_data = load('Demo_CPC_Data'); %% Generate the cpc data with private code, please contact Prof.zhu
% %%% 
% cpc: Continuous proportional coordinates system, ref  Xiao, X., Yu, X., Zhang, Z., Zhao, Y., Jiang, Y., Li, Z., Yang, Y., & Zhu, C. (2018). Transcranial brain atlas. Science Advances, 4(9).
% V: The vertices of cpc.
% F: The connection relationships of the vertices.
% %%%

mask_loca = load('Demo_Mask_ID');
% %%%
% select positions from cpc
% %%%

%% demo 1
%%

plotParaCPC(m, cpc_data, mask_loca)

saveas(gcf,'Fig_Demo.png')







