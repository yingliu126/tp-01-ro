###############################  Model ###############################


###############################  Sets  ###############################

set VOITURES;

################### Variables ###################

var X{i in VOITURES}, integer, >=0;

###################  Constants: Data to load   #########################

param benefparvoiture{i in VOITURES}; 

param surface{i in VOITURES};

param heurestravail{i in VOITURES};

################### Constraints ###################

s.t. Constraint{i in VOITURES}:

###### Objective ######

maximize BeneficeTotal: 
		sum{i in VOITURES} X[i]* benefparvoiture[i]; 


end;
