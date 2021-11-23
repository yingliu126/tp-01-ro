# Problème des voitures

## Génération du modèle au format `lp`

### Modèle

On définit les variables `X1` et `X2` :

- `X1` : Voitures de luxe
- `X2` : Voitures simples

```lp
Maximize
  Benefice: + 10000 X1 + 9000 X2

Subject To
  MaxSurface: + 10 X1 + 20 X2 <= 15000
  MaxVoituresLuxe: + 1 X1 <= 800
  HeuresTravailMax: + 0.06 X1 + 0.05 X2 <= 60

Integer
  X1
  X2

End
```

### Solution

On exécute la commande :

```console
glpsol --lp ./src/PbVoitures.lp -o ./src/SolVoitures.sol
```

On obtient :

```console
Problem:    
Rows:       3
Columns:    2 (2 integer, 0 binary)
Non-zeros:  5
Status:     INTEGER OPTIMAL
Objective:  Benefice = 10284000 (MAXimum)

   No.   Row name        Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 MaxSurface              14970                       15000 
     2 MaxVoituresLuxe
                                 645                         800 
     3 HeuresTravailMax
                                  60                          60 

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 X1           *            645             0               
     2 X2           *            426             0               

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
```

La commande `glpsol --lp ./src/PbVoitures.lp` donne :

```console
GLPSOL: GLPK LP/MIP Solver, v4.65
Parameter(s) specified in the command line:
 --lp ./src/PbVoitures.lp
Reading problem data from './src/PbVoitures.lp'...
3 rows, 2 columns, 5 non-zeros
2 integer variables, none of which are binary
17 lines were read
GLPK Integer Optimizer, v4.65
3 rows, 2 columns, 5 non-zeros
2 integer variables, none of which are binary
Preprocessing...
2 rows, 2 columns, 4 non-zeros
2 integer variables, none of which are binary
Scaling...
 A: min|aij| =  5.000e-02  max|aij| =  2.000e+01  ratio =  4.000e+02
GM: min|aij| =  8.034e-01  max|aij| =  1.245e+00  ratio =  1.549e+00
EQ: min|aij| =  6.455e-01  max|aij| =  1.000e+00  ratio =  1.549e+00
2N: min|aij| =  4.000e-01  max|aij| =  9.600e-01  ratio =  2.400e+00
Constructing initial basis...
Size of triangular part is 2
Solving LP relaxation...
GLPK Simplex Optimizer, v4.65
2 rows, 2 columns, 4 non-zeros
*     0: obj =  -0.000000000e+00 inf =   0.000e+00 (2)
*     3: obj =   1.028571429e+07 inf =   0.000e+00 (0)
OPTIMAL LP SOLUTION FOUND
Integer optimization begins...
Long-step dual simplex will be used
+     3: mip =     not found yet <=              +inf        (1; 0)
Solution found by heuristic: 10282000
Solution found by heuristic: 10283000
+     4: >>>>>   1.028400000e+07 <=   1.028400000e+07   0.0% (2; 0)
+     4: mip =   1.028400000e+07 <=     tree is empty   0.0% (0; 3)
INTEGER OPTIMAL SOLUTION FOUND
Time used:   0.0 secs
Memory used: 0.1 Mb (62364 bytes)
```
