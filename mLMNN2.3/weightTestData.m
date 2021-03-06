% This program is used to process training data for weight learning.
load('weightPerm.mat');
load('multiExpert.mat');

load('data/viper_features.mat');
load('finalFeature_5.mat');
%load('multiExpert.mat')
newFeature = [ux;feature];

test = {};
a = [2 14 16 17 22 24 26 27 28];
selectSet = selectSet(a);
for i = 1:size(selectSet,2)
	myselect = selectSet{i}.rand;
	selectFeature = [];
	for j = 1:24
		st = myselect(j);
		selectFeature = [selectFeature;newFeature(st:(st+50),:)];
	end
	%sample.test1 = selectFeature(:,perm(317:417));
	%sample.test2 = selectFeature(:,perm(317:417)+632);
    sample.test1 = selectFeature(:,perm(418:632));
	sample.test2 = selectFeature(:,perm(418:632)+632);
	test{i} = sample;
	clear sample;
end

save('weightTest2.mat','test','selectSet');